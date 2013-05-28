<?php
/**
 * 借卖网推送服务
 */
include('includes/configure.php');
include('../includes/database_tables.php');
$jmwlogPath = dirname(__FILE__).'/jmwlog';
$logfilename = $jmwlogPath.'/jwm_' . date('YmdHis') . '.log';
$postDate =  file_get_contents("php://input");
if(empty($postDate)) exit;
if(isset($postDate)) jmw_log(print_r($postDate,true)) ;
//验证请求合法,通过请求报文
$postAllheaders = getallheaders();
if(sizeof($postAllheaders)!=0) jmw_log(print_r($postAllheaders,true));
//链接数据库
jmw_db_connect();
$sxml = simplexml_load_string($postDate);
if($sxml===FALSE) {jmw_log('----------xml is wrong!------------'.'\r\n');exit;}
$_sku = $sxml->sku ;
$_type = $sxml->type ; // 1.库存变化 2.产品信息其他信息变化 3.产品下架,4其他
$_status =$sxml->status; // 产品借卖网状态 ON OFF
$_stockNum = $sxml->stockNum; //库存数量
if(!empty($_sku)){
	
	switch ($_type){
		case 1: //库存变化
			$_products_status=1;
			$_products_quantity=$_stockNum;
			settype($_products_quantity,'integer');
			if(strtoupper($_status)=='OFF') {$_products_quantity =0;$_products_status =0;}
			jmw_db_query("UPDATE ".TABLE_PRODUCTS." SET products_quantity = '{$_products_quantity}' , products_status = '{$_products_status}'
				  WHERE products_model = '{$_sku}' LIMIT 1");
			jmw_log('更新了产品,条件 库存变化: products_model = '.$_sku.'\r\n');
			break ;
		case 3: //产品下架
			jmw_db_query("UPDATE ".TABLE_PRODUCTS." SET products_quantity = '0' , products_status = '0'
				  WHERE products_model = '{$_sku}' LIMIT 1");
			jmw_log('更新了产品,条件 产品下架: products_model = '.$_sku.'\r\n');
			break ;
		case 2: //产品信息其他信息变化
		case 4: //其他
			jmw_log('测试产品其它信息更新,条件 产品信息其他信息变化: products_model = '.$_sku.'\r\n');
			break ;
	}
}
//db
function jmw_db_connect($server = DB_SERVER, $username = DB_SERVER_USERNAME, $password = DB_SERVER_PASSWORD, $database = DB_DATABASE, $link = 'db_link') {
    global $$link;
	if (USE_PCONNECT == 'true') {
      $$link = mysql_pconnect($server, $username, $password);
    } else {
      $$link = mysql_connect($server, $username, $password);
    }
    if ($$link) mysql_select_db($database);
	return $$link;
}
function jmw_db_query($query, $link = 'db_link') {
    global $$link;
	$result = mysql_query($query, $$link) or jmw_log($query.'->'.mysql_errno().'->'.mysql_error());
    return $result;
}
//log
function jmw_log($message) {
	global $logfilename;
	if (!is_writable($jmwlogPath)){@chmod($jmwlogPath,0777);}
    $fp = @fopen($logfilename, 'a');
    if ($fp) {
      fwrite($fp, date('M d Y G:i') . ' -- ' . $message . "\n\n");
      fclose($fp);
    }
    return $logfilename;
}
?>