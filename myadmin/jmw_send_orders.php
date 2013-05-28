<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 *@author Morrowind  
 *@contact 290313271@qq.com / hnsytcg@163.com
 * @version $Id: jmw_api.php 15881 2011-03-21 16:32:39Z wilt $
 */
 require('includes/application_top.php');
 require(DIR_WS_CLASSES . 'currencies.php');
 $currencies = new currencies();
 $api_token_string=JMW_API_USER_TOKEN; //借卖网会员Token认证
class addShopOrder{
	private static $object;
	public $arrItemSKUAndNum;
	public $consigeneeName;
	public $consigeneeAddress;
	public $consigeneeCountryCode;
	public $consigneeCity;
	public $consigneeState;
	public $ebayTrasactionId;
	public $consigeneeEmail;
	public $consigeneePhone;
	public $consigneePostCode;
	public function addShopOrder(){
	}
	public static function getObject($arrItemSKUAndNum,$consigeneeName,$consigeneeAddress,$consigeneeCountryCode,
	$consigneeCity,$consigneeState,$ebayTrasactionId,$consigeneeEmail,$consigeneePhone,$consigneePostCode){
		//if(!self::$object){
			self::$object=new addShopOrder();			
		//}
		self::$object->arrItemSKUAndNum       = $arrItemSKUAndNum;
		self::$object->consigeneeName         = $consigeneeName;
		self::$object->consigeneeAddress      = $consigeneeAddress;
		self::$object->consigeneeCountryCode  = $consigeneeCountryCode;
		self::$object->consigneeCity          = $consigneeCity;
		self::$object->consigneeState         = $consigneeState;
		self::$object->ebayTrasactionId       = $ebayTrasactionId;
		self::$object->consigeneeEmail        = $consigeneeEmail;
		self::$object->consigeneePhone        = $consigeneePhone;
		self::$object->consigneePostCode      = $consigneePostCode;
		return self::$object;
	}
}
class ItemSKUAndNum{
	private static $objects;
	public $productSku;
	public $num;
    public $dealPrice;
	public function ItemSKUAndNum(){
	}
	public static function getObject($productSku,$num,$dealPrice){
		//if(!self::$objects){
			self::$objects=new ItemSKUAndNum();			
		//}
		self::$objects->productSku   = $productSku;
		self::$objects->num          = $num;
		self::$objects->dealPrice    = $dealPrice;
		return self::$objects;
	}
}
function get_orders_products_jmw($order_id){
    global $db;
	$orders_id=$db->Execute("select * from ".TABLE_ORDERS_PRODUCTS." where orders_id='".$order_id."'");
	while (!$orders_id->EOF) {
	   $products_id=$orders_id->fields['products_id'];
	   $true_status=orders_whether_jmw_products($products_id);
	   if(!$true_status){
	    return false; 
		break;
	   }else{
	   $status=true;
	   }
	   $orders_id->MoveNext();
	}
	if($status){
	  return $order_id;
	}
 }
function orders_whether_jmw_products($products_id){
    global $db;
	$products_sql=$db->Execute("select products_jmw_api from ".TABLE_PRODUCTS." where products_id='".$products_id."'");
	$jmw_products_status=$products_sql->fields['products_jmw_api'];
	if($jmw_products_status!=1){
	  return false;
	}else{
	  return true;
	}
 }
include(DIR_WS_CLASSES . 'order.php');
$orders_status=JMW_API_ORDERS_STATUS==""?'':JMW_API_ORDERS_STATUS;
$select_orders_query_sql="select * from ".TABLE_ORDERS." where orders_status='".$orders_status."' order by orders_id desc ";
$select_jmw_query_orders_list=$db->Execute($select_orders_query_sql);
while (!$select_jmw_query_orders_list->EOF) { 
	$return_orders_status=get_orders_products_jmw($select_jmw_query_orders_list->fields['orders_id']);
	if($return_orders_status && !empty($return_orders_status)){
		$orders_id_array[] =$select_jmw_query_orders_list->fields['orders_id'];
	}
   	$select_jmw_query_orders_list->MoveNext();
}
if(!empty($orders_id_array)){ 
	$implode_orders=implode(',',$orders_id_array);
 	$orders_query_sql="select * from ".TABLE_ORDERS." where orders_id in(".$implode_orders.") order by orders_id desc ";
 	$jmw_orders = new splitPageResults($_GET['page'],MAX_DISPLAY_SEARCH_RESULTS_ORDERS, $orders_query_sql,$orders_query_numrows);
 	$jmw_query_orders_list=$db->Execute($orders_query_sql);
}
function get_orders_status_history($orders_id,$key_string=''){
   	global $db;
	$status_history_sql=$db->Execute("select orders_status_id,comments from ".TABLE_ORDERS_STATUS_HISTORY."
    	where orders_id='".$orders_id."' order by 	orders_status_history_id desc");
	if($key_string=='orders_status_id'){
	    $return_string=get_orders_status($status_history_sql->fields['orders_status_id'],$_SESSION['languages_id']);
	}else{
	   $return_string=$status_history_sql->fields[$key_string];
	}
	return $return_string;
}
function get_orders_status($orders_status_id,$languages_id){
    global $db;
	$status_history_sql=$db->Execute("select orders_status_name from ".TABLE_ORDERS_STATUS."
    	where orders_status_id='".$orders_status_id."' and language_id='".$languages_id."'");
	return $status_history_sql->fields['orders_status_name'];
 }
function get_countries_2code($countries_name){
    global $db;
	$countries_name  = $db->prepare_input($countries_name);
	$result = $db->Execute("select countries_iso_code_2 from ".TABLE_COUNTRIES."  where countries_name='".$countries_name."'");
	return $result->fields['countries_iso_code_2'];
 }
function get_orders_products_array($orders_id){
    global $db;
	
	//$select_currencies  = $db->Execute("select value from ".TABLE_CURRENCIES." where currencies_id=".API_CURRENCIES_ID_SETUP."");
	//$currencies_value   = number_format($select_currencies->fields['value'],3,'.','');
	$currencies_value   = number_format(API_CURRENCIES_ID_SETUP,4,'.','');
	$orders_products_sql       = "select * from ".TABLE_ORDERS_PRODUCTS." where orders_id='".$orders_id."'";
	$orders_products_query     = $db->Execute($orders_products_sql);
	while (!$orders_products_query->EOF) {
	  //产品成交价
	  $final_price             = $orders_products_query->fields['final_price']*$currencies_value; 
      $products_array[]        = ItemSKUAndNum::getObject($orders_products_query->fields['products_model'],
	                             $orders_products_query->fields['products_quantity'],
								 $final_price);
      $orders_products_query->MoveNext();
	}
	
    $orders_sql                            = "select * from ".TABLE_ORDERS." where orders_id='".$orders_id."'";
    $orders_query                          = $db->Execute($orders_sql);
	if(!empty($orders_query->fields)){
	$return_array['productsarray']         = $products_array;
	$return_array['consigeneeName']        = $orders_query->fields['delivery_name'];
	$return_array['consigeneeAddress']     = $orders_query->fields['delivery_street_address'].'  '.
                                             $orders_query->fields['delivery_suburb'];
	$return_array['consigeneeCountryCode'] = get_countries_2code($orders_query->fields['delivery_country']);
	$return_array['consigneeCity']         = $orders_query->fields['delivery_city'];
	$return_array['consigneeState']        = $orders_query->fields['delivery_state'];
	$return_array['ebayTrasactionId']      = '';
	$return_array['consigeneeEmail']       = $orders_query->fields['customers_email_address'];
	$return_array['consigeneePhone']       = $orders_query->fields['customers_telephone'];
	$return_array['consigneePostCode']     = $orders_query->fields['delivery_postcode'];
	}
	return $return_array;
 }
//action处理
if(!empty($_POST['send_orders_id']) && $_GET['action']=='send_orders'){
	//验证用户
	$jmw_login_name              = JMW_API_LOGIN_NAME;
  	$jmw_password                = JMW_API_KEY;
  	$api_token_string=JMW_API_USER_TOKEN; //借卖网会员Token认证
  	if(empty($api_token_string) ||  empty($jmw_login_name) || empty($jmw_password)){
  		$param               = array('in0'=>$jmw_login_name ,'in1'=>$jmw_password);
 		try {
 			$jmwWSDLClient = new SoapClient("http://www.jiemaiwang.com/services/JieMaiService?wsdl", array(true));
 			$result              = $jmwWSDLClients->__call('fetchToken',array($param));
 		}catch (SoapFault  $e){
 			 print_r($e);
 		}
		$api_token_string          = $result->out->usertoken;
		//echo $user_token.'fdfd';
		$user_status          = strtoupper($result->out->status);
		if(strtoupper($user_status)==='SUCCESS' && !empty($api_token_string)){
			$db->Execute("update ".TABLE_CONFIGURATION." set configuration_value='".$api_token_string."' where configuration_key='JMW_API_USER_TOKEN'");
		}else{
			echo $result->out->message;exit;
		}
  	}
  	//end
	for($i=0;$i<sizeof($_POST['send_orders_id']);$i++){
    	$order_info              = get_orders_products_array($_POST['send_orders_id'][$i]);
    	$orders_productsArray    = $order_info['productsarray'];
		$consigeneeName          = $order_info['consigeneeName'];
		$consigeneeAddress       = $order_info['consigeneeAddress'];
		$consigeneeCountryCode   = $order_info['consigeneeCountryCode'];
		$consigneeCity           = $order_info['consigneeCity'];
		$consigneeState          = $order_info['consigneeState'];
		$ebayTrasactionId        = $order_info['ebayTrasactionId'];
		$consigeneeEmail         = $order_info['consigeneeEmail'];
		$consigeneePhone         = $order_info['consigeneePhone'];
		$consigneePostCode       = $order_info['consigneePostCode'];
    	$object=addShopOrder::getObject($orders_productsArray,$consigeneeName,$consigeneeAddress,$consigeneeCountryCode,
		$consigneeCity,$consigneeState ,$ebayTrasactionId,$consigeneeEmail,$consigeneePhone,$consigneePostCode);
		
    	$param  = array('usertoken'=>$api_token_string,'orderId'=>$_POST['send_orders_id'][$i],'shopOrderItem'=>$object);
		try{
			$jmwWSDLClient = new SoapClient('http://www.jiemai.com/services/JieMaiSlService?wsdl',array(true));
			$result   = $jmwWSDLClient->__call('addShopOrder',array($param));
		}catch(SOAPFault $e){
			print_r($e);exit;
		}
		$return_status           = strtolower($result->result->status);
		$return_message          = $result->result->message;

		$relust_string .=$_POST['send_orders_id'][$i].':<b style="color:red;">'.$return_status.$return_message.'</b><br />';
		if($return_status=='success'){
	   		$db->Execute("update ".TABLE_ORDERS." set jmw_orders_send_status=1 , jmwOrderID = '{$result->result->orderList->string}' where orders_id='".$_POST['send_orders_id'][$i]."'");
		 	$success_mesages ='<br /><div style="clear:both;"><b>温馨提示</b>:借卖网的产品所产生的订单已经发送至您的借卖网后台，如需借卖网对该订单发货，请登入到您的借卖网管理后台，对该订单确认，并付款。<a href="http://www.jiemaiwang.com/login.html" target="_blank">去借卖网</a></div>';
		}
   	}
   	echo $relust_string.$success_mesages;
   	echo "<script type='text/javascript'>";
   	echo 'function goback(){history.go(-1);}';
   	echo 'setTimeout("goback",3);';
    echo '</script>';
}
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="ymPrompt/jmw_api_style.css">
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" media="print" href="includes/stylesheet_print.css">
<link rel="stylesheet" type="text/css" href="includes/cssjsmenuhover.css" media="all" id="hoverJS">
<script language="javascript" src="includes/menu.js"></script>
<script language="javascript" src="includes/general.js"></script>
<script type="text/javascript"  src="includes/javascript/jscript_jquery-min.js"></script>
<script type="text/javascript">
  <!--
  function init()
  {
    cssjsmenu('navbar');
    if (document.getElementById)
    {
      var kill = document.getElementById('hoverJS');
      kill.disabled = true;
    }
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
function func_delete_products(frm){
    var loadingString     = '<img src="images/loading.gif" border="0" /> loading...';
	var send_orders_id    = frm.send_orders_id;
	send_orders_id        = frm.send_orders_id['length']?send_orders_id:[send_orders_id];//判断是否为数组
	var len               = send_orders_id.length;
	var count_input=new Array();
	var j=0;
	for(var i=0;i<len;i++){
		if(send_orders_id[i].checked){
			count_input[j]=send_orders_id[i].value;
			j++;
		}
	}
	if(count_input.length==0){
	  alert('订单ID为空');
	  return false;
	}
	document.getElementById("form2").submit();
	/*$.post("jmw_send_orders.php?action=send_orders", {send_orders_id:count_input},
	function(data) {$('#delete_products_loading').html(data);});	*/
	//window.location.reload();
}
function ajax_wsdl_factory($_obj){
	this._action = $_obj._action ; //wsdl方法
	_id = this._id     = '#'+$_obj._id ; //页面id
	this._loadingString = $_obj._loadingString ; //加载时显示的提示内容
	this._arguments = $_obj._arguments!='' ? $_obj._arguments:'{null:null}';//其它的一些参数 ,类型为object
	this._arguments = eval('('+this._arguments+')');
	if(this._action !=''){
		$(this._id).html('<span style="color:#ff0000">'+this._loadingString+'</span>');
		$.post('jmw_return.php?action='+this._action,this._arguments,function(data){
			$(_id).html(data);
		});
	}
}
$(document).ready(function(){
	$('.getJMWOrderStatus').click(function(){
		_arguments = $(this).attr('rel');
		_argJSON = eval('('+_arguments+')');
		setTimeout(function(){
			ajax_wsdl_factory({'_action':'getJMWOrderStatus','_id':'IDgetJMWOrderStatus_'+_argJSON.orders_id,'_loadingString':'正在加载借卖网订单状态...','_arguments':_arguments});
		},1000);
	});
});
  // -->
</script>
<script language="javascript" type="text/javascript"><!--
function couponpopupWindow(url) {
  window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=450,height=280,screenX=150,screenY=150,top=150,left=150')
}
//--></script>
</head>
<body onLoad="init()">
<div class="header-area">
<?php
  require(DIR_WS_INCLUDES . 'header.php');
?>
</div>
<div style="padding:5px;line-height:20px;width:100%;">
<div><span class="pageHeading">借卖网产品订单</span></div>

<form name="form2" method="post" id="form2" action="jmw_send_orders.php?action=send_orders">
<table border="0" width="100%" cellpadding="2" cellspacing="0">
   <tr class="dataTableHeadingRow dataTableHeadingContent" style="height:25px;">
       <td width="10%">
	   订单号
       </td>
       <td width="10%">
       付款配送
       </td>
       <td width="10%">
       客户
       </td>
       <td width="10%">
       订单总额 	
       </td>
       <td width="10%">
       购买日期
       </td>
	   <td >
       状态 	
       </td>
	   <td width="10%">
       备注	
       </td>
       <td >
       借卖网订单状态
       </td>
	   <td width="10%">
       操作
       </td>
   </tr>
   <?php  
   function get_orders_total($orders_id){
       global $db;
	   $query=$db->Execute("select text from ".TABLE_ORDERS_TOTAL."  where orders_id='".$orders_id."' and class='ot_total'");
	   return $query->fields['text'];
   }
   if(!empty($orders_id_array)){ 
   while (!$jmw_query_orders_list->EOF) { 
   ?>
   <tr class="dataTableRow" onMouseOut="rowOutEffect(this)" onMouseOver="rowOverEffect(this)">
       <td>
	   <?php  if($jmw_query_orders_list->fields['jmw_orders_send_status']==0){ ?>
	   <input type="checkbox" name="send_orders_id[]" id="send_orders_id" value="<?php echo $jmw_query_orders_list->fields['orders_id'];?>" />
	   <?php }else{echo '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';}  ?>
	   <?php echo $jmw_query_orders_list->fields['orders_id'];?>
       </td>
       <td>
       <?php 
	   echo $jmw_query_orders_list->fields['payment_module_code'].'    '.
	   $jmw_query_orders_list->fields['shipping_module_code'];?>
       </td>
       <td>
       <?php echo $jmw_query_orders_list->fields['customers_name'];?>
       </td>
       <td>
       <?php echo get_orders_total($jmw_query_orders_list->fields['orders_id']);?>
       </td>
       <td>
       <?php echo zen_datetime_short($jmw_query_orders_list->fields['date_purchased']); ?>
       </td>
	   <td>
       <?php echo get_orders_status_history($jmw_query_orders_list->fields['orders_id'],'orders_status_id'); ?>
       </td>
	   <td>
       <?php 
	   $orders_comments = get_orders_status_history($jmw_query_orders_list->fields['orders_id'],'comments'); 
	   echo @mb_substr($orders_comments,0,30,'utf8'); ?>
       </td>
       <td>
       	<?php if($jmw_query_orders_list->fields['jmw_orders_send_status']==1 && !empty($jmw_query_orders_list->fields['jmwOrderID'])){
       		echo '<a href="javascript:void(0);" class="getJMWOrderStatus" rel="{\'orders_id\':\''.$jmw_query_orders_list->fields['orders_id'].'\',\'jmwOrderID\':\''.$jmw_query_orders_list->fields['jmwOrderID'].'\'}">查看状态</a>';
       		echo '<div id="IDgetJMWOrderStatus_'.$jmw_query_orders_list->fields['orders_id'].'"></div>';
       	}?>
       </td>
	   <td>
       <?php echo '<a href="' . zen_href_link(FILENAME_ORDERS, 'oID=' . $jmw_query_orders_list->fields['orders_id'] . '&action=edit', 'NONSSL') . '">' . zen_image(DIR_WS_IMAGES . 'icon_edit.gif', ICON_EDIT) . '</a>'; ?>
       </td>
   </tr>
   
   <?php  
   $jmw_query_orders_list->MoveNext();
	}
	}
   ?>
</table>
</form>
     <div>
	    <span class="buttom_page_span">
		<INPUT type="checkbox" name="invest" value="checkbox" onClick="CheckAll()">反选 &nbsp;&nbsp;
		<?php 
		if(!empty($orders_id_array)){ 
		echo $jmw_orders->display_count($orders_query_numrows,JMW_API_PRODUCTS_LIST, $_GET['page'], TEXT_DISPLAY_NUMBER_OF_JMW); 
		?>
		<?php 
		echo $jmw_orders->display_links($orders_query_numrows,JMW_API_PRODUCTS_LIST, MAX_DISPLAY_PAGE_LINKS, $_GET['page'], 
		     zen_get_all_get_params(array('page', 'info', 'x', 'y', 'cID'))); 
		}
		?>
		</span>
		<span id="delete_products_loading" class="buttom_page_span"></span>
		<span class="buttom_submit_button">
		<input border="0" type="button"  value="发送订单到借卖网" title="test" alt="test" onclick="return func_delete_products(document.form2);">
        </span>
	 </div>
</div>
<br /><div style="clear:both;padding:5px;"><b>温馨提示</b>:借卖网的产品所产生的订单已经发送至您的借卖网后台，如需借卖网对该订单发货，请登入到您的借卖网管理后台，对该订单确认，并付款。<a href="http://www.jiemaiwang.com/login.html" target="_blank">去借卖网</a></div>
<!-- footer //-->
<div style="clear:both;height:1px; width:100%;overflow:hidden;"></div>
<div class="footer-area" style="cleart:both;">
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
</div>
<!-- footer_eof //-->
<br />
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>