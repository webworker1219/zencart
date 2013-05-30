<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 * @author Morrowind  
 * @contact 290313271@qq.com / hnsytcg@163.com
 * @version $Id: jmw_api.php 15881 2011-03-21 16:32:39Z wilt $
 */
require('includes/application_top.php');
class SellerAccount{//封装注册参数
  private static $object;
  public $slUsername;
  public $slPassword;
  public $slName;
  public $sxCode;
  public $slTelephone;
  public $slCellphone;
  public $slEmail;
  public $shopName;
  public $shopUrl;
  public $serviceUrl;
  public $shopType;
  public function SellerAccount(){}
  public static function getObject($slUsername,$slPassword,$slName,$sxCode,$slTelephone,$slCellphone,$slEmail,$shopName,$shopUrl,$serviceUrl,$shopType){
   self::$object=new SellerAccount();
   self::$object->slUsername                 = $slUsername;
   self::$object->slPassword                 = $slPassword;
   self::$object->slName                     = $slName;
   self::$object->sxCode                     = $sxCode;
   self::$object->slTelephone                = $slTelephone;
   self::$object->slCellphone                = $slCellphone;
   self::$object->slEmail                    = $slEmail;
   self::$object->shopName                   = $shopName;
   self::$object->shopUrl                    = $shopUrl;
   self::$object->serviceUrl                 = $serviceUrl;
   self::$object->shopType                   = $shopType;
   return self::$object;
  }
}
function zen_get_category_tree_jmw($parent_id = '0', $spacing = '', $exclude = '', $category_tree_array = '',$include_itself = false, $category_has_products = false, $limit = false) {
    global $db;
    if ($limit) {
      $limit_count = " limit 1";
    } else {
      $limit_count = '';
    }

    if (!is_array($category_tree_array)) $category_tree_array = array();
    if ( (sizeof($category_tree_array) < 1) && ($exclude != '0') ) $category_tree_array[] = array('id' => '0', 'text' => TEXT_TOP);

    if ($include_itself) {
      $category = $db->Execute("select cd.categories_name
                                from " . TABLE_CATEGORIES_DESCRIPTION . " cd
                                where cd.language_id = '" . (int)$_SESSION['languages_id'] . "'
                                and cd.categories_id = '" . (int)$parent_id . "'");
      $category_tree_array[] = array('id' => $parent_id, 'text' => $category->fields['categories_name']);
    }
    $categories = $db->Execute("select c.categories_id, cd.categories_name, c.parent_id
                                from " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd
                                where c.categories_id = cd.categories_id
                                and cd.language_id = '" . (int)$_SESSION['languages_id'] . "'
                                and c.parent_id = '" . (int)$parent_id . "' 
                                order by c.sort_order, cd.categories_name");
    while (!$categories->EOF) {
      if ($category_has_products == true and zen_products_in_category_count($categories->fields['categories_id'], '', false, true) >= 1) {
        $mark = '*';
      } else {
        $mark = '&nbsp;&nbsp;';
      }
      if ($exclude != $categories->fields['categories_id']) $category_tree_array[] = 
	      array('id' => $categories->fields['categories_id'], 'text' => $spacing . $categories->fields['categories_name'] . $mark);
      $category_tree_array = zen_get_category_tree($categories->fields['categories_id'], $spacing . '&nbsp;&nbsp;&nbsp;',
                        	  $exclude, $category_tree_array, '', $category_has_products);
      $categories->MoveNext();
    }

    return $category_tree_array;
}

function zen_draw_pull_down_menu_jmw($name, $values, $default = '', $parameters = '', $required = false) {
    $field   = '<select rel="dropdown" name="' . zen_output_string($name) . '"';
    if (zen_not_null($parameters)) $field .= ' ' . $parameters;
    $field  .= '>' . "\n";
    $field  .='<option value="0">All Category</option>';
    if (empty($default) && isset($GLOBALS[$name]) && is_string($GLOBALS[$name]) ) $default = stripslashes($GLOBALS[$name]);
    for ($i=0, $n=sizeof($values); $i<$n; $i++) {
      $field .= '<option value="' . zen_output_string($values[$i]['id']) . '"';
      if ($default == $values[$i]['id']) {
        $field    .= ' selected="selected"';
      }
      $field      .= '>' . zen_output_string($values[$i]['text'], array('"' => '&quot;', '\'' => '&#039;', '<' => '&lt;', '>' => '&gt;'))
              	  . '</option>' . "\n";
    }
    $field .= '</select>' . "\n";

    if ($required == true) $field .= TEXT_FIELD_REQUIRED;

    return $field;
}
if($_GET['action']=='delete_products_id' && !empty($_POST['products_id'])){
   $array_products_id=implode(',',$_POST['products_id']);
   $db->Execute("delete from ".TABLE_PRODUCTS."  where products_id in (".$array_products_id.") ");
   $db->Execute("delete from ".TABLE_PRODUCTS_TO_CATEGORIES."  where products_id in (".$array_products_id.")");
   $db->Execute("delete from ".TABLE_PRODUCTS_DESCRIPTION."  where products_id in (".$array_products_id.") ");
   echo '
    <script type="text/javascript">
	 alert("删除成功！");
	 setTimeout("set_timeout_reload()",2000);
	</script>
   ';die();
}
if($_GET['action']=='update_products_status' && !empty($_GET['update_products_id'])){
   $db->Execute("update ".TABLE_PRODUCTS." set products_status='".$_GET['status']."' where products_id='".$_GET['update_products_id']."'");
}  

$whether_setup_api=$db->Execute("select configuration_value from ".TABLE_CONFIGURATION."  
                                 where configuration_key='JMW_API_SERVICEURL' LIMIT 1");
$wheter_setup_api_query=$whether_setup_api->fields['configuration_value'];
$whether_api_format=API_KEY;
if($whether_api_format==='API_KEY' or $whether_api_format=='' ){
	$whether_api_format='';
}
if(!empty($wheter_setup_api_query) ){
//&& !empty($whether_api_format)
    $whether_setup_api_constant=true;
}else{
	//检测之前是否安装过借卖网插件
	$checkOldJmwPlugInQuery = $db->Execute("select configuration_group_id from ".TABLE_CONFIGURATION_GROUP."  
                                 where  configuration_group_title='API设置' or configuration_group_title='借卖网-API设置 '
								 order by configuration_group_id desc");
	if(!empty($checkOldJmwPlugInQuery->fields['configuration_group_id'])){
		$configuration_group_id = $checkOldJmwPlugInQuery->fields['configuration_group_id'] ;
	   	$db->Execute("update ".TABLE_CONFIGURATION_GROUP." set configuration_group_title = '借卖网:API设置' where configuration_group_id = '{$configuration_group_id}' limit 1");
	   
	    $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('网店名称', 'JMW_API_SHOPNAME', ''
	   , '网店名称','".$configuration_group_id."',18, now(), now(), NULL, NULL)");
	   
	    $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('网店地址', 'JMW_API_SHOPURL', '".HTTP_SERVER.DIR_WS_CATALOG."'
	   , '网店地址','".$configuration_group_id."',19, now(), now(), NULL, NULL)");

	    $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('网店服务地址', 'JMW_API_SERVICEURL', '".HTTP_SERVER.DIR_WS_ADMIN."jmwservice.php'
	   , '此服务地址,当借卖网的产品有库存变化,上下架时,会自动更新网店从借卖网导入的产品,','".$configuration_group_id."',20, now(), now(), NULL, NULL)");
	   $db->Execute("ALTER TABLE ".TABLE_PRODUCTS."  ADD `products_jmw_sku` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `metatags_title_tagline_status`");
	   $db->Execute("ALTER TABLE ".TABLE_ORDERS."  ADD `jmwOrderID` varchar(50) NOT NULL AFTER `jmw_orders_send_status`");
	}else{
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION_GROUP." 
	   (configuration_group_title, configuration_group_description, sort_order, visible) VALUES 
	   ('借卖网:API设置', '借卖网-API相关设置', 744, 1)");
	   $wheter_setup_api_query=mysql_insert_id();
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('API密钥', 'API_KEY', '123456', 'API密钥', '".$wheter_setup_api_query."', 
			   1, now(), now(), NULL, NULL)");
	   	$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('API输入数据格式', 'API_INPUT_FORMAT', 'json', 'API输入数据格式', '".$wheter_setup_api_query."', 
			   1, now(), now(), NULL, 'zen_cfg_select_option(array(''json'', ''xml''), ')");
		$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('API输出数据格式', 'API_OUTPUT_FORMAT', 'json', 'API输出数据格式', '".$wheter_setup_api_query."', 
			   1, now(), now(), null,'zen_cfg_select_option(array(''json'', ''xml''), ')");
		
		$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('API上传图片最大高度', 'PRODUCT_MEDIUM_LARGE_HEIGHT', '800', 'API上传图片最大像素高度', '".$wheter_setup_api_query."', 
			   1, now(), now(), NULL,NULL)");
		$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('API上传图片最小宽度', 'PRODUCT_MEDIUM_LARGE_WIDTH', '700', 'API上传图片最小像素宽度', '".$wheter_setup_api_query."', 
			   1, now(), now(), NULL,NULL)");
		$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('API上传图片中图宽度', 'PRODUCT_MEDIUM_IMAGE_WIDTH', '282', 'API上传图片中图像素宽度', '".$wheter_setup_api_query."', 
			   1, now(), now(), NULL,NULL)");
		$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('图片中图高度', 'PRODUCT_MEDIUM_IMAGE_HEIGHT', '282', 'API上传图片中图像素高度', '".$wheter_setup_api_query."', 
			   1, now(), now(), NULL,NULL)");
		$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('API上传图片小图高度', 'PRODUCT_MEDIUM_SMALL_WIDTH', '150', 'API上传图片最小像素宽度', '".$wheter_setup_api_query."', 
			   1, now(), now(), NULL,NULL)");
		$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
			   (configuration_title, configuration_key, configuration_value,configuration_description, 
			   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
			   ('API上传图片小图高度', 'PRODUCT_MEDIUM_SMALL_HEIGHT', '150', 'API上传图片最小像素高度', '".$wheter_setup_api_query."', 
			   1, now(), now(), NULL,NULL)");
		$db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description, 
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
	   ('借卖网会员登陆名', 'JMW_API_LOGIN_NAME', '', '借卖网会员登陆名', '".$wheter_setup_api_query."', 
	   12, now(), now(), NULL, NULL)");
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION."
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
      ('借卖网会员密码', 'JMW_API_KEY', '', '借卖网会员密码','".$wheter_setup_api_query."', 12, now(), now(), NULL, NULL)");
	    $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('借卖网-API WDSL有效地址', 'JMW_API_WSDL_URL', 'http://www.jiemai.com/services/JieMaiSlService?wsdl',
	   '借卖网-API WDSL有效地址','".$wheter_setup_api_query."',13, now(), now(), NULL, NULL)");
	    
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description, 
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
	   ('借卖网会员Token认证', 'JMW_API_USER_TOKEN', ''
	   , '借卖网会员Token认证','".$wheter_setup_api_query."', 12, now(), now(), NULL, NULL)");
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('借卖网-借卖网产品价格设置', 'JMW_API_PRICE_RATE', '20'
	   , '借卖网-在借卖网产品原价格加*%,默认为 20 ','".$wheter_setup_api_query."',15, now(), now(), NULL, NULL)");
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('借卖网-借卖网产品库存设置', 'JMW_API_PRODUCTS_QUANTITY', '10'
	   , '借卖网-借卖网产品库存设置,默认为 10 ','".$wheter_setup_api_query."',16, now(), now(), NULL, NULL)");
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('借卖网-每页显示产品数', 'JMW_API_PRODUCTS_LIST', '20'
	   , '借卖网-每页显示产品数,默认为 20 ','".$wheter_setup_api_query."',17, now(), now(), NULL, NULL)");
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('根据订单状态发送订单信息', 'JMW_API_ORDERS_STATUS', '2'
	   , '填写订单状态ID，默认为付款后才能发送订单到借卖网','".$wheter_setup_api_query."',17, now(), now(), NULL, NULL)");
	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('人民币汇率值', 'API_CURRENCIES_ID_SETUP', '6.3636'
	   , '请填写人民币相对网店默认币种的汇率值(借卖网产品默认是人民币,默认值为相对美元的汇率:6.3636)','".$wheter_setup_api_query."',17, now(), now(), NULL, NULL)");

	   $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('网店名称', 'JMW_API_SHOPNAME', ''
	   , '网店名称','".$wheter_setup_api_query."',18, now(), now(), NULL, NULL)");
	   
	    $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('网店地址', 'JMW_API_SHOPURL', '".HTTP_SERVER.DIR_WS_CATALOG."'
	   , '网店地址','".$wheter_setup_api_query."',19, now(), now(), NULL, NULL)");

	    $db->Execute("INSERT INTO ".TABLE_CONFIGURATION." 
	   (configuration_title, configuration_key, configuration_value,configuration_description,
	   configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES 
       ('网店服务地址', 'JMW_API_SERVICEURL', '".HTTP_SERVER.DIR_WS_ADMIN."jmwservice.php'
	   , '此服务地址,当借卖网的产品有库存变化,上下架时,会自动更新网店从借卖网导入的产品,','".$wheter_setup_api_query."',20, now(), now(), NULL, NULL)");
	   $db->Execute("ALTER TABLE ".TABLE_PRODUCTS."  ADD `products_jmw_api` INT( 2 ) NOT NULL AFTER `metatags_title_tagline_status`");
	   $db->Execute("ALTER TABLE ".TABLE_PRODUCTS."  ADD `products_updatedate` varchar(20) NOT NULL AFTER `metatags_title_tagline_status`");
	   $db->Execute("ALTER TABLE ".TABLE_PRODUCTS."  ADD `products_jmw_height` INT( 2 ) NOT NULL AFTER `metatags_title_tagline_status`");
	   $db->Execute("ALTER TABLE ".TABLE_PRODUCTS."  ADD `products_jmw_length` INT( 2 ) NOT NULL AFTER `metatags_title_tagline_status`");
	   $db->Execute("ALTER TABLE ".TABLE_PRODUCTS."  ADD `products_jmw_width` INT( 2 ) NOT NULL AFTER `metatags_title_tagline_status`");
	   $db->Execute("ALTER TABLE ".TABLE_PRODUCTS."  ADD `products_jmw_sku` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `metatags_title_tagline_status`");
	   $db->Execute("ALTER TABLE ".TABLE_ORDERS."  ADD `jmw_orders_send_status` INT( 2 ) NOT NULL AFTER `ip_address`");
	   $db->Execute("ALTER TABLE ".TABLE_ORDERS."  ADD `jmwOrderID` varchar(50) NOT NULL AFTER `jmw_orders_send_status`");
	   $db->Execute("DROP TABLE IF EXISTS jmw_products_categories");
	   $db->Execute("
		CREATE TABLE jmw_products_categories (
		  `jmw_id` int(10) NOT NULL auto_increment,
		  `categoryId`  int(10) NOT NULL,
		  `parenId`     int(10) NOT NULL,
		  `name`        varchar(255)NOT NULL,
		  `cnName`      varchar(255)NOT NULL,
		  `sortOrder`   int(10)NOT NULL,
		  PRIMARY KEY  (`jmw_id`)
		)  CHARACTER SET utf8 COLLATE utf8_general_ci
		");
	}
	$whether_setup_api_constant=false;
}
//small bug update 
if(isset($_GET['u']) && !empty($_GET['u'])) {
	if($_GET['u']==1){
		$db->Execute("update ".TABLE_CONFIGURATION." set configuration_title = '人民币汇率值' , configuration_value = '6.3636' ,configuration_description='请填写人民币相对网店默认币种的汇率值(借卖网产品默认是人民币,默认值为相对美元的汇率:6.3636)' where configuration_key ='API_CURRENCIES_ID_SETUP' limit 1");
	}
}
function update_jmw_config_info($username,$password){//更新配置文件中的借卖网用户和密码
  global $db;
  $db->Execute("update ".TABLE_CONFIGURATION." set 	configuration_value='".$username."' where configuration_key='JMW_API_LOGIN_NAME'");
  $db->Execute("update ".TABLE_CONFIGURATION." set 	configuration_value='".$password."' where configuration_key='JMW_API_KEY'");
}


function handle_request_function($function_name,$parameter){//处理请求的接口函数，并返回请求的结果
   try{
	   	$proxyAddress='inet-proxy-a.appl.swissbank.com';
		$proxyPort='8080';
		$proxyUserName='weicl';
		$proxyPass='Ab123456';
   		$jmwWSDLClient              = new SoapClient('http://www.jiemai.com/services/JieMaiSlService?wsdl', array(
											'proxy_host'     => $proxyAddress,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => $proxyUserName,
                                            'proxy_password' => $proxyPass));
		$parameter           = is_array($parameter)?$parameter:array($parameter);
   		$result              = $jmwWSDLClient->__call($function_name,array($parameter));
   }catch(SOAPFault $e) {
     echo '<b style="color:red;">服务器异常报错了:</b>';
     print_r($e);
   }
   return $result;
}

$action = (isset($_GET['action']) ? $_GET['action'] : '');
if (zen_not_null($action)) {
    switch ($action) {
      case 'get_CheckSellerUserName'://检查用户名是否可用
	   $param  = array('username'=>$_POST['sl_username'],'usertoken'=>'f6e976e7-e5b5-45d9-ad91-867b9c5d35b3');
	   $get_checkusername  = handle_request_function('checkSellerUserName',$param);
	   $get_user_status    = $get_checkusername->result->status;
	   if($get_user_status=='Success'){
	     echo '<b style="color:green;">用户名可用</b>';
	   }else{
	     echo '<b style="color:red;">'.$get_checkusername->result->message.'</b>';
	   }
	   die();
	  break;
	  case 'get_checkSellerEmail'://检查邮箱是否可用
	    $param  = array('email'=>$_POST['slEmail'],'usertoken'=>'f6e976e7-e5b5-45d9-ad91-867b9c5d35b3');
	    $get_checkuseremail  = handle_request_function('checkSellerEmail',$param);
		$get_user_email      = $get_checkuseremail->result->status;
	   if($get_user_email=='Success'){
	     echo '<b style="color:green;">邮件可用</b>';
	   }else{
	     echo '<b style="color:red;">'.$get_checkuseremail->result->message.'</b>';
	   }
		die();
	  break;
	  case 'registration_new_user'://提交注册信息到借卖网
	    if(empty($_POST)) break;
	    $slUsername          = $_POST['slUsername'];
        $slPassword          = $_POST['slPassword'];
        $slName              = $_POST['slName'];
        $sxCode              = $_POST['sxCode'];
        $slTelephone         = $_POST['slTelephone'];
        $slCellphone         = $_POST['slCellphone'];
        $slEmail             = $_POST['slEmail'];
        $shopName            = $_POST['shopName'];
        $shopUrl             = $_POST['shopUrl'];
        $serviceUrl          = $_POST['serviceUrl'];
        $shopType            = $_POST['shopType'];
	    $get_package         = SellerAccount::getObject($slUsername,$slPassword,$slName,$sxCode,$slTelephone,$slCellphone,$slEmail,$shopName,$shopUrl,$serviceUrl,$shopType);
		$param  = array('usertoken'=>'f6e976e7-e5b5-45d9-ad91-867b9c5d35b3','sellerAccount'=>$get_package);
	    $get_register_info   = handle_request_function('registerSellerAccount',$param);
		$get_result_status   = $get_register_info->result->status;
		if($get_result_status =='Success'){
		  update_jmw_config_info($slUsername,$slPassword);
		  $messageStack->add_session('您的信息已提交到借卖网，一个工作日内将会审核完！', 'success');
		  zen_redirect(zen_href_link('jmw_api.php','','NONSSL'));
		}else{
		  echo '<b style="color:red;">'.$get_register_info->result->message.'</b>';
		}
	  break;
	  case 'user_tying_action':
	   	$jmw_login_name      =  $_POST['tying_slUsername'];
		$jmw_password  =  $_POST['tying_slPassword'];
		
		$shopUrl        =  $_POST['shopUrl'];
		$shopName       =  !empty($_POST['shopName']) ? $_POST['shopName']:$shopUrl;
		$serviceUrl     =  $_POST['serviceUrl'];
		$shopType       =  $_POST['shopType'];
		
		$param               = array('in0'=>$jmw_login_name ,'in1'=>$jmw_password);
 		try {
 			$jmwWSDLClient = new SoapClient("http://www.jiemai.com/services/JieMaiService?wsdl",array(
											'proxy_host'     => $proxyAddress,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => $proxyUserName,
                                            'proxy_password' => $proxyPass));
 			$result              = $jmwWSDLClient->__call('fetchToken',array($param));
 		}catch (SoapFault  $e){
 			 print_r($e);
 		}
 		if(strtoupper($result->out->status)=='SUCCESS' && !empty($result->out->usertoken)){
 			$api_token_string =$result->out->usertoken;
 			$parameter    = array('usertoken'=>$api_token_string,'shopName'=>$shopName,'shopUrl'=>$shopUrl,'serviceUrl'=>$serviceUrl,'shopType'=>$shopType);
			$get_request  = handle_request_function('bindOnlineShopAPI',$parameter);
			if(strtoupper($get_request->result->status )=='SUCCESS'){
				$db->Execute("update ".TABLE_CONFIGURATION." set configuration_value='".$api_token_string."' where configuration_key='JMW_API_USER_TOKEN'");
				update_jmw_config_info($jmw_login_name,$jmw_password);
				$messageStack->add_session($get_request->result->message, 'success');
				zen_redirect(zen_href_link('jmw_api.php','','NONSSL'));
			}else{
				echo $get_request->result->message;
			}
 		}else{
 			echo $result->out->message;
 		}
	  break;
	}
}


if (preg_match("/(insert|update|setflag)/i", $action)) {
	include_once(DIR_WS_INCLUDES . 'reset_seo_cache.php');
}

if (is_dir(DIR_FS_CATALOG_IMAGES)) {
    if (!is_writeable(DIR_FS_CATALOG_IMAGES)) $messageStack->add(ERROR_CATALOG_IMAGE_DIRECTORY_NOT_WRITEABLE, 'error');
} else {
    $messageStack->add(ERROR_CATALOG_IMAGE_DIRECTORY_DOES_NOT_EXIST, 'error');
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" href="includes/cssjsmenuhover.css" media="all" id="hoverJS">

<link rel="stylesheet" type="text/css" href="ymPrompt/jmw_api_style.css">
<link rel="stylesheet" id='skin' type="text/css" href="ymPrompt/skin/qq/ymPrompt.css">
<script type="text/javascript" src="ymPrompt/ymPrompt.js"></script>
<script type="text/javascript">
function showFaqi(){
   window.location.href="jmw_add_products.php"; 
   /* var html='<iframe name="ifr_html" src="jmw_add_products.php" height="460" width="960" frameborder="0" scrolling="yes" id="shipping_estimator_frm" style="margin-left: 2px;">';
	ymPrompt.win(html,980,"auto",'借卖网产品数据');
	return false;*/
}
function request_jmw_update(){
    window.location.href="jmw_add_products.php?action=request_jmw_update"; 
   /* var html='<iframe name="ifr_html" src="jmw_add_products.php?action=request_jmw_update" height="460" width="960" frameborder="0" scrolling="yes" id="shipping_estimator_frm" style="margin-left: 2px;">';
	ymPrompt.win(html,980,"auto",'借卖网产品更新查询');
	return false;*/
}
function func_delete_products(frm){
    var loadingString     = '<img src="images/loading.gif" border="0" /> loading...';
	var products_ids      = frm.products_id;
	products_ids          = frm.products_id['length']?products_ids:[products_ids];//判断是否为数组
	var len               = products_ids.length;
	var count_input=new Array();
	var j=0;
	for(var i=0;i<len;i++){
		if(products_ids[i].checked){
			count_input[j]=products_ids[i].value;
			j++;
		}
	}
	if(count_input.length==0){
	  alert('产品SKU为空');
	  return false;
	}
	$('#delete_products_loading').html(loadingString);
	$.post("jmw_return.php?action=shelveproductfromshop&isajax=true", {products_id:count_input},
	function(data) {
	  $('#delete_products_loading').html(data);
	});
}
function handle_delete_product(){
    var products_ids      = document.form2.products_id;
	products_ids          = document.form2.products_id['length']?products_ids:[products_ids];//判断是否为数组
	var len               = products_ids.length;
	var count_input=new Array();
	var j=0;
	for(var i=0;i<len;i++){
		if(products_ids[i].checked){
			count_input[j]=products_ids[i].value;
			j++;
		}
	}
	$.post("jmw_api.php?action=delete_products_id&isajax=true", {products_id:count_input},
	    function(data) {
	    $('#delete_products_loading').html(data);
	   });
}
function set_timeout_reload(){
  window.location.reload();
}
function CheckAll(value,obj){
	var form=document.getElementsByTagName("form")
	 for(var i=0;i<form.length;i++){
	    for (var j=0;j<form[i].elements.length;j++){
	    if(form[i].elements[j].type=="checkbox"){ 
	    var e = form[i].elements[j]; 
	    if (value=="selectAll"){e.checked=obj.checked}     
	    else{e.checked=!e.checked;} 
	       }
	    }
	 }
}
function toggle(targetid){//显示影藏注册、绑定信息
     if (document.getElementById){
         target=document.getElementById(targetid);
             if (target.style.display=="block"){
                 target.style.display="none";
             } else {
                 target.style.display="block";
             }
			 if(targetid=='id_show_register_text'){
			   document.getElementById('id_show_tying_text').style.display="none";
			 }else{
			   document.getElementById('id_show_register_text').style.display="none";
			 }
     }
}
function check_seller_user_name(){//检查用户名是否可用
   var sl_username;
   sl_username=$('#slUsername').val();
   if(sl_username==''){
     return false;
   }
   $.post("jmw_api.php?action=get_CheckSellerUserName", {sl_username:sl_username},
	    function(data) {
	   	 $('#show_whether_register').html(data);
	   });
}
function check_seller_email(){//检查邮件是否可用
   var sl_Email,slEmail;
   sl_Email=$('#slEmail').val();
   if(sl_Email==''){
     return false;
   }
   var re = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/; 
   if(re.test(sl_Email)){
     $('#show_whether_email').html('');
     $.post("jmw_api.php?action=get_checkSellerEmail", {slEmail:sl_Email},
	    function(data) {
	   		$('#show_whether_email').html(data);
	   	});
   }else{
    	$('#show_whether_email').html('<b style="color:red;">邮件不可用用</b>');
   }
}
function handle_submit(form_name){//提交新注册信息
   var new_password,old_password,user_name,user_emaile;
   var re = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/; 
   user_name      = $('#slUsername').val();
   new_password   = $('#slPassword').val();
   old_password   = $('#twoslPassword').val();
   user_email     = $('#slEmail').val();
	 slTelephone    = $('#slCellphone').val();
   if(user_name==""){ alert("用户名不能为空！");return false;}
   if(new_password!=old_password || new_password==''){
     alert("两次输入密码不一致");
	 return false;
   }
	 if(slTelephone==""){ alert("手机联系电话有误！");return false;}
   if(!re.test(user_email)){
     alert("输入邮件有误");
	 return false;
   }
   document.getElementById("registration").submit();
}
</script>
<script language="javascript" src="includes/menu.js"></script>
<script language="javascript" src="includes/general.js"></script>
<script language="javascript" src="includes/javascript/common.js"></script>
<script language="javascript" src="includes/javascript/multifile.js"></script>
<script type="text/javascript" src="includes/javascript/jscript_jquery-min.js"></script>
<script type="text/javascript">
String.prototype.toProperCase = function()
{
  return this.toLowerCase().replace(/^(.)|\s(.)/g, 
      function($1) { return $1.toUpperCase(); });
}
</script>
<script type="text/javascript">
<!--
function init(){
    cssjsmenu('navbar');
    if (document.getElementById){
      var kill = document.getElementById('hoverJS');
      kill.disabled = true;
    }
    if (typeof _editor_url == "string") HTMLArea.replaceAll();
 }
function ajax_wsdl_factory($_obj){
	this._action = $_obj._action ; //wsdl方法
	_id = this._id     = '#'+$_obj._id ; //页面id
	this._loadingString = $_obj._loadingString ; //加载时显示的提示内容
	this._arguments = $_obj._arguments!='' ? $_obj._arguments:'{null:null}';//其它的一些参数 ,类型为object
	this._arguments = eval('('+this._arguments+')');
	if(this._action !=''){
		$(this._id).html('<span style="color:#ff0000">'+this._loadingString+'</span>');
		$.post('jmw_return.php?action='+this._action+'&isajax=true',this._arguments,function(data){
			$(_id).html(data);
		});
	}
}
$(document).ready(function(){
	$('#IDsetCallServiceAPI').click(function(){
		_arguments = $(this).attr('rel');
		_argJSON = eval('('+_arguments+')');
		if(_argJSON.shopName=='') {alert("请在借卖网-API设置里配置网店名称!");return false;}
		if(_argJSON.shopUrl =='') {alert("请在借卖网-API设置里配置网店地址!");return false;}
		if(_argJSON.serviceUrl=='') {alert('请在借卖网-API设置里配置网店服务地址');return false ;}
		setTimeout(function(){
			ajax_wsdl_factory({'_action':'setCallServiceAPI','_id':'IDsetCallServiceAPIHTML','_loadingString':'正在处理中...','_arguments':_arguments});
		},1000);
	});
});
// -->
</script>
</head>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="#FFFFFF" onLoad="init()">
<?php 
require(DIR_WS_INCLUDES . 'header.php');
?>
<?php
if(JMW_API_LOGIN_NAME=="" or JMW_API_LOGIN_NAME=='JMW_API_LOGIN_NAME' or JMW_API_USER_TOKEN=='' ){//显示注册信息和绑定信息
echo '<input type="radio" id="radio_show_register" checked="checked"  onclick="toggle(\'id_show_register_text\');"
	  value="" name="show_register_tying_name">
	  <label class="checkboxLabel" for="radio_show_register" style="color:green;">新注册借卖网用户</label>
	  '.zen_draw_form('registration', 'jmw_api.php','action=registration_new_user', 'post', 'id="registration"', true).'
	  <div id="id_show_register_text" style="display:block;line-height:25px;padding:5px;">
	    <span style="width:80px;display:inline-block;">用户名:</span>
		  <input id="slUsername" name="slUsername" value="'.$slUsername.'" onblur="check_seller_user_name();"
		  onKeydown="if(event.keyCode==13){check_seller_user_name();}else{}" >&nbsp;*
		  <span id="show_whether_register"></span><br />
		<span style="width:80px;display:inline-block;">密码:</span>
		 <input id="slPassword" name="slPassword" value="'.$slPassword.'" type="password">&nbsp;*<br />
		<span style="width:80px;display:inline-block;">确认密码:</span>
		  <input id="twoslPassword" name="twoslPassword" value="'.$slPassword.'" type="password">&nbsp;*<br />
		<span style="width:80px;display:inline-block;">真实姓名:</span>
		  <input id="slName"  name="slName" value="'.$slName.'">&nbsp;*<br />
		<span style="width:80px;display:inline-block;">性别:</span>
		   <input type="radio" name="sxCode" value="M" id="sxCode" checked="checked">男
		   <input type="radio" name="sxCode" value="F" id="sxCode">女<br />
		<span style="width:80px;display:inline-block;">固定电话:</span>
		  <input id="slTelephone"  name="slTelephone" value="'.$slTelephone.'"><br />
		<span style="width:80px;display:inline-block;">手机:</span>
		  <input id="slCellphone"  name="slCellphone" value="'.$slCellphone.'">&nbsp;*<br />
		<span style="width:80px;display:inline-block;">邮箱:</span>
		  <input id="slEmail"  name="slEmail" value="'.$slEmail.'" onblur="check_seller_email();"
		  onKeydown="if(event.keyCode==13){check_seller_email();}else{}">&nbsp;*
		  <span id="show_whether_email"></span><br />
		<span style="width:80px;display:inline-block;">网店名称:</span>
		  <input id="shopName"  name="shopName" value="'.$shopName.'">&nbsp;*
		  <input id="shopUrl"  name="shopUrl" value="'.HTTP_SERVER.'" type="hidden">
		  <input id="serviceUrl"  name="serviceUrl" value="'.HTTP_SERVER.'/api.php" type="hidden">
		  <input id="shopType"  name="shopType" value="zencart" type="hidden"><br />
		  <span style="cursor:pointer;">'. 
		  zen_image_button('button_save.gif', IMAGE_SAVE,' onclick="handle_submit(this);"') .'
		  </span>
	  </div>
	  </form>

	  <br />
	  <input type="radio" id="radio_show_tying" value="" name="show_register_tying_name" onclick="toggle(\'id_show_tying_text\')">
	  <label class="checkboxLabel" for="radio_show_tying" style="color:green;">已有用户，商城绑定到借卖网账号</label>
	  <div id="id_show_tying_text" style="display:none;line-height:25px;padding:5px;">
	  '.zen_draw_form('user_tying', 'jmw_api.php','action=user_tying_action', 'post', 'id="user_tying"', true).'
	  	<span style="width:80px;display:inline-block;">用户名:</span>
		<input id="tying_slUsername" name="tying_slUsername" value="'.$user_name.'" >&nbsp;*<br />
		<span style="width:80px;display:inline-block;">密码:</span>
		<input id="tying_slPassword" name="tying_slPassword" value="'.$slPassword.'" type="password">&nbsp;*<br />
	 	<span style="width:80px;display:inline-block;">网店名称:</span>
		<input id="shopName"  name="shopName" value="'.$shopName.'">
		<input id="shopUrl"  name="shopUrl" value="'.HTTP_SERVER.'" type="hidden">
		<input id="serviceUrl"  name="serviceUrl" value="'.HTTP_SERVER.'/api.php" type="hidden">
		<input id="shopType"  name="shopType" value="zencart" type="hidden"><br />
	    <span style="cursor:pointer;">'. 
		zen_image_submit('button_save.gif', IMAGE_SAVE) .'
	  </span>
	  </form>
	  </div>
';
	
require(DIR_WS_INCLUDES . 'footer.php');
require(DIR_WS_INCLUDES . 'application_bottom.php');
echo '<script type="text/javascript" src="includes/javascript/jscript_jquery-min.js"></script>';
die();
}
?>
<?php
$current_category_id  = $_POST['current_category_id']?$_POST['current_category_id']:'';
$post_jmw_searchs_key = trim($_POST['jmw_searchs_key']);

if(!empty($current_category_id) or !empty($post_jmw_searchs_key)){
   $post_categories_id   = $current_category_id>0? " and master_categories_id='".$current_category_id."' ":'';
   $post_searchs_key_str = empty($post_jmw_searchs_key)?'': " and (p.products_model like '%".$post_jmw_searchs_key."%' 
                           or pd.products_name like '%".$post_jmw_searchs_key."%' 
			               or p.products_id like '%".$post_jmw_searchs_key."%') ";
   $jmw_products_sql     = "select p.products_id,p.products_status,p.products_model,p.products_quantity,p.products_price,pd.products_name 
			               from ".TABLE_PRODUCTS." p,".TABLE_PRODUCTS_DESCRIPTION." pd 
			               where p.products_id=pd.products_id AND pd.language_id ='".(int)$_SESSION['languages_id']."'
						   and p.products_jmw_api='1' ".$post_searchs_key_str.$post_categories_id."
			               order by products_id desc";
}else{
   $jmw_products_sql=      "select p.products_id,p.products_status,p.products_model,p.products_quantity,p.products_price,pd.products_name 
			                from ".TABLE_PRODUCTS." p,".TABLE_PRODUCTS_DESCRIPTION." pd where p.products_id=pd.products_id AND
			                pd.language_id = '" . (int)$_SESSION['languages_id'] . "' and p.products_jmw_api='1'
			                order by products_id desc";	
}
$jmw_split = new splitPageResults($_GET['page'],JMW_API_PRODUCTS_LIST, $jmw_products_sql,$jmw_query_numrows);
$jmw_query= $db->Execute($jmw_products_sql);
?>
<div style="padding:10px;width:98%;height:15px;">
	<span class="pageHeading" style="float:left;width:auto;">
	     借卖网产品管理
	</span>
	<span style="float:right;width: auto; margin-right: 5px;text-align:right;">
	     <form action="<?php echo zen_href_link(FILENAME_JMW_API,'');?>" method="post" name="select_products">
	     <?php echo '<table><tr><td>'.HEADING_TITLE_SEARCH_DETAIL.zen_draw_pull_down_menu_jmw('current_category_id',
		 zen_get_category_tree_jmw('', '', '0', '', '', true), '', 'onChange="this.form.submit();"');
	     echo zen_draw_input_field('jmw_searchs_key',$post_jmw_searchs_key);
	     echo '</td><td><input border="0" type="submit"  value="Go" title="Go" alt="Go"></td></tr></table>';
          ?>
         </form>
	</span>
</div>

<div style="padding:10px;width:98%;">
<form name="form2" method="post" id="form2">
<table border="0" width="100%" cellpadding="2" cellspacing="0">
   <tr class="dataTableHeadingRow dataTableHeadingContent" style="height:25px;">
       <td width="80">
	   <?php echo TABLE_HEADER_NUMBER;         ?>
       </td>
       <td>
       <?php echo TABLE_HEADER_PRODUCTS_NAME;  ?>
       </td>
       <td width="160">
       <?php echo TABLE_HEADING_PRODUCTS_MODEL;?>
       </td>
       <td width="80">
       <?php echo TABLE_HEADING_STATUS;        ?>
       </td>
       <td width="80">
       <?php echo TABLE_HEADING_ACTION;        ?>
       </td>
   </tr>
   <?php
   while(!$jmw_query->EOF){
   ?>
   <tr class="dataTableRow" onMouseOut="rowOutEffect(this)" onMouseOver="rowOverEffect(this)">
       <td>
	   <input type="checkbox" name="products_id" id="products_id" value="<?php echo $jmw_query->fields['products_id'];      ?>" />
	   <?php echo $jmw_query->fields['products_id'];      ?>
	   </td>
	   <td>
	   <a href="<?php echo zen_href_link(FILENAME_CATEGORIES, 'action=new_product' . '&cPath=' .
	   zen_get_product_path($jmw_query->fields['products_id']) . '&pID=' .$jmw_query->fields['products_id']. '&product_type='.
	   zen_get_products_type($jmw_query->fields['products_id']));?>">
	   <?php echo $jmw_query->fields['products_name'];    ?>
	   </a>
	   </td>
	   <td>
	   <?php echo $jmw_query->fields['products_model'];   ?>
	   </td>
	   <td>
	   <?php $products_status=$jmw_query->fields['products_status'];      
	       if($products_status==1){
		    echo '<a href="'.zen_href_link(FILENAME_JMW_API,'action=update_products_status&update_products_id='.
			      $jmw_query->fields['products_id']).'&status=0">
			      <img border="0" title="'.TABLE_HEADING_STATUS.'-'.TEXT_FEATURED_PRODUCT_AVAILABLE.'"
				  alt="'.TABLE_HEADING_STATUS.'-'.TEXT_FEATURED_PRODUCT_AVAILABLE.'" src="images/icon_green_on.gif"></a>';
		   }else{
		    echo '<a href="'.zen_href_link(FILENAME_JMW_API,'action=update_products_status&update_products_id='.
			      $jmw_query->fields['products_id']).'&status=1">
			      <img border="0" title=" '.TABLE_HEADING_STATUS.'-'.TEXT_FEATURED_PRODUCT_NOT_AVAILABLE.' "
			      alt="'.TABLE_HEADING_STATUS.'-'.TEXT_FEATURED_PRODUCT_NOT_AVAILABLE.'" src="images/icon_red_on.gif"></a>';	 
		   }
	   ?>
	   </td>
	   <td>
	   <a href="<?php echo zen_href_link(FILENAME_CATEGORIES, 'action=new_product' . '&cPath=' .
	   zen_get_product_path($jmw_query->fields['products_id']) . '&pID=' .$jmw_query->fields['products_id']. '&product_type='.
	   zen_get_products_type($jmw_query->fields['products_id']));?>">
       <img border="0" title="<?php echo TEXT_INFO_EDIT_CAUTION;?> " alt="<?php echo TEXT_INFO_EDIT_CAUTION;?>" src="images/icon_edit.gif">
       </a>
       
	   </td>
   </tr>
   <?php
   $jmw_query->MoveNext();
   }
   ?>
</table>
</form>
<div>
<span class="buttom_page_span">
<INPUT type="checkbox" name="invest" value="checkbox" onClick="CheckAll()">反选 &nbsp;&nbsp;
<?php 
echo $jmw_split->display_count($jmw_query_numrows,JMW_API_PRODUCTS_LIST, $_GET['page'], TEXT_DISPLAY_NUMBER_OF_JMW); 
?>
<?php 
echo $jmw_split->display_links($jmw_query_numrows,JMW_API_PRODUCTS_LIST, MAX_DISPLAY_PAGE_LINKS, $_GET['page'], 
     zen_get_all_get_params(array('page', 'info', 'x', 'y', 'cID'))); 
?>
</span>
<span class="buttom_submit_button">
<?php echo isSetCallServiceAPI() == 0 ? '':'(您已经设置过了,如果有变更,可以重新设定)' ;
	  echo '<span id="IDsetCallServiceAPIHTML"></span>
	<a href="javascript:void(0);" id="IDsetCallServiceAPI" rel=\'{"shopName":"'.JMW_API_SHOPNAME.'","shopUrl":"'.JMW_API_SHOPURL.'","serviceUrl":"'.JMW_API_SERVICEURL.'"}\'>设定借卖网推送服务</a>&nbsp;&nbsp;'; ?>
<input border="0" type="button"  value="新增产品" title="test" alt="test" onClick="showFaqi();">
<input border="0" type="button"  value="删除产品" title="test" alt="test" onclick="return func_delete_products(document.form2);">
</span>
</div>
<br />
</div>
<div id="delete_products_loading"></div>
</div>
<!-- footer //--><?php require(DIR_WS_INCLUDES . 'footer.php'); ?><!-- footer_eof //-->
</body>
</html>
<?php 
function isSetCallServiceAPI(){
	$jmwlogPath = dirname(__FILE__).'/jmwlog';
	$isSetCallServiceAPIFilePath = $jmwlogPath.'/isSetCallServiceAPI.txt';
	if(!file_exists($isSetCallServiceAPIFilePath)) return false;
	$filecontent = file_get_contents($isSetCallServiceAPIFilePath);
	if($filecontent==0) return false;
	if($filecontent==1) return true ;
}
?>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
<?php
/*
class runtime
{
    var $StartTime = 0;
    var $StopTime = 0;
 
    function get_microtime(){
        list($usec, $sec) = explode(' ', microtime());
        return ((float)$usec + (float)$sec);
    }
 
    function start(){
        $this->StartTime = $this->get_microtime();
    }
 
    function stop(){
        $this->StopTime = $this->get_microtime();
    }
 
    function spent(){
        return round(($this->StopTime - $this->StartTime) * 1000, 1);
    }
}


$runtime= new runtime;
$runtime->start();
 
$a = 0;
for($i=0; $i<1000000; $i++)
{
    $a += $i;
}
 
 
$runtime->stop();
echo "页面执行时间: ".$runtime->spent()." 毫秒";


$runtime->start();
$a = 0;
for($i=0; $i<1000000; $i++){
    $a += $i;
}
 
$runtime->stop();
echo "页面执行时间: ".$runtime->spent()." 毫秒";
*/
?>