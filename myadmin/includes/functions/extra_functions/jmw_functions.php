<?php
function filter_orders_products($order_id){
    global $db;
	$orders_id_query=$db->Execute("select * from ".TABLE_ORDERS_PRODUCTS." where orders_id='".$order_id."'");
	while (!$orders_id_query->EOF) {
	   $products_id=$orders_id_query->fields['products_id'];
	   $true_status=Filter_orders_whether_jmw_products($products_id);
	   if(!$true_status){
	   		return false; 
			break;
	   }
	   $orders_id_query->MoveNext();
	}
	return true ;
 }
 function Filter_orders_whether_jmw_products($products_id){
    global $db;
	$products_sql=$db->Execute("select products_jmw_api from ".TABLE_PRODUCTS." where products_id='".$products_id."'");
	$jmw_products_status=$products_sql->fields['products_jmw_api'];
	if($jmw_products_status!=1){
	  return false;
	}else{
	  return true;
	}
 }
function any2utf8($str){
    $encode = mb_detect_encoding($str,"ASCII,UTF-8,CP936,EUC-CN,BIG-5,EUC-TW");
    return ($encode != 'UTF-8' && $encode != 'ASCII' ? iconv($encode,'UTF-8',$str) : $str);
}

