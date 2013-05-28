<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 * @contact 290313271@qq.com / hnsytcg@163.com
 * @version $Id: api.php 15881 2011-03-21 16:32:39Z wilt $
 */
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
	$select_currencies         = $db->Execute("select value from ".TABLE_CURRENCIES." where currencies_id='2'");
	$currencies_value          = number_format($select_currencies->fields['value'],3,'.','');
	$final_price               = $orders_products_query->fields['final_price']*$currencies_value;
	$orders_products_sql       = "select * from ".TABLE_ORDERS_PRODUCTS." where orders_id='".$orders_id."'";
	$orders_products_query     = $db->Execute($orders_products_sql);
	while (!$orders_products_query->EOF) {
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
function send_orders_jmw($orders_id){
  global $db;
  $send_orders_id              = get_orders_products_jmw($orders_id);
  if(empty($send_orders_id)) return false;
  $orders_status=JMW_API_ORDERS_STATUS==""?'':JMW_API_ORDERS_STATUS;
  $select_orders_result        = $db->Execute("select * from ".TABLE_ORDERS." where orders_status='".$orders_status."' and orders_id='".$send_orders_id."'
                                 order by orders_id desc ");
  $send_orders_id              = $select_orders_result->fields['orders_id'];
  if(empty($send_orders_id)) return false;
  $send_orders_id              = is_array($send_orders_id)?$send_orders_id:array($send_orders_id);

  $jmw_wsdl_rul                = JMW_API_WSDL_URL;
  $jmw_login_name              = JMW_API_LOGIN_NAME;
  $jmw_password                = JMW_API_KEY;
  if($jmw_login_name!='JMW_API_LOGIN_NAME' && $jmw_login_name!=''){
		  $NusoapWSDL          = $jmw_wsdl_rul;
          $client              = new SoapClient($NusoapWSDL, array(true));
		  $param               = array('in0'=>$jmw_login_name ,'in1'=>$jmw_password);
		  try{
		  $result              = $client->__call('fetchToken',array($param));
		  }catch(SOAPFault $e){
	        print_r($e);
	      }
		  $user_token          = $result->out->usertoken;
		  $user_status         = strtolower($result->out->status);
		  if(!empty($user_token) && $user_status==='success'){
		     $authorized       = true;
			 $api_token_string = $user_token;
			 $api_result       = $result;
		  }
	}

   for($i=0;$i<sizeof($send_orders_id);$i++){
    $order_info              = get_orders_products_array($send_orders_id[$i]);
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
    $param                   = array('in0'=>$api_token_string,'in1'=>$send_orders_id[$i],'in2'=>$object);
	try{
	$result                  = $client->__call('addShopOrder',array($param));
	}catch(SOAPFault $e){
	  print_r($e);
	}
	$return_status           = strtolower($result->out->status);
	$return_message          = $result->out->message;
	$return_message          = empty($return_message)?'':'&nbsp;&nbsp;失败原因('.$return_message .')  刷新再次提交。';
	$relust_string .=$send_orders_id[$i].':<b style="color:red;">'.$return_status.'&nbsp;&nbsp;&nbsp;&nbsp;'.$return_message.'</b><br />';
	if($return_status=='success'){
	   $db->Execute("update ".TABLE_ORDERS." set jmw_orders_send_status=1 where orders_id='".$send_orders_id[$i]."'");
	}
   }
   return $relust_string;
}
 
 ?>