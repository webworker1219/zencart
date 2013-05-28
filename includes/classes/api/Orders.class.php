<?php
class Orders extends ApiBase {
	const SQL_ORDER_LIST = "select o.orders_id, o.customers_id, o.customers_name, 
							o.payment_method, o.shipping_method, o.date_purchased, 
							o.last_modified, o.currency, o.currency_value, 
							s.orders_status_name, ot.text as order_total, o.customers_company, 
							o.customers_email_address, o.customers_street_address, o.delivery_company, 
							o.delivery_name, o.delivery_street_address, o.billing_company, 
							o.billing_name, o.billing_street_address, o.payment_module_code, 
							o.shipping_module_code, o.ip_address,o.customers_postcode,o.customers_telephone,
							o.billing_country,o.delivery_country,o.billing_postcode,o.delivery_postcode,o.delivery_city,o.delivery_state,o.delivery_suburb
							from (:{orders_status} s, :{orders} o ) left join :{orders_total} ot 
							on (o.orders_id = ot.orders_id and ot.class = 'ot_total') 
							where (o.orders_status = s.orders_status_id and s.language_id = ':{language_id}':{orders_status_id}) 
							order by o.orders_id DESC
							:{limit}";
	
	/**
	 * get the orders list
	 *
	 * @param string $info
	 * @return string
	 */
	public static function order_list($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		//设置分页
		$limit = '';
		$page = 1;
		$perpage = PHP_INT_MAX;
		if(isset($info['page'])) {
			$page = intval($info['page']);
		}
		if(isset($info['perpage'])) {
			$perpage = intval($info['perpage']);
		}
		$limit = "LIMIT ".(($page - 1) * $perpage).", {$perpage}";
		//设置按订单状态搜索
		$orders_status_id = '';
		if(isset($info['orders_status_id'])) {
			$orders_status_id = " and s.orders_status_id = '".intval($info['orders_status_id'])."' ";
		}
		if(isset($info['orders_id']) && !empty($info['orders_id'])){
		    $orders_status_id  .= " and o.orders_id = '".intval($info['orders_id'])."' ";
		}
		if(isset($info['date_purchased']) && !empty($info['date_purchased'])){
			 $orders_status_id .= " and o.date_purchased  BETWEEN ".$info['date_purchased']." ";
		}
		$return      = array();
		$sql         = $db->bindVars(self::SQL_ORDER_LIST, ':{orders_status}', TABLE_ORDERS_STATUS, 'passthru');
		$sql         = $db->bindVars($sql, ':{orders}', TABLE_ORDERS, 'passthru');
		$sql         = $db->bindVars($sql, ':{orders_total}', TABLE_ORDERS_TOTAL, 'passthru');
		$sql         = $db->bindVars($sql, ':{language_id}', $_SESSION['languages_id'], 'integer');
		$sql         = $db->bindVars($sql, ':{orders_status_id}', $orders_status_id, 'passthru');
		$count       = $sql;
		$count       = $db->bindVars($sql, ':{limit}', '', 'passthru');
		$count_q     = $db->Execute($count);
		$count_sting = $count_q->RecordCount();
		$sql         = $db->bindVars($sql, ':{limit}', $limit, 'passthru');
		$rs          = $db->Execute($sql);
		
		while(!$rs->EOF) {
			$item['count_orders']             = $count_sting;
			$item['orders_id']                = $rs->fields['orders_id'];
			$item['customers_id']             = $rs->fields['customers_id'];
			$item['customers_name']           = $rs->fields['customers_name'];
			$item['customers_postcode']       = $rs->fields['customers_postcode'];
			$item['customers_telephone']      = $rs->fields['customers_telephone'];
			$item['payment_method']           = $rs->fields['payment_method'];
			$item['shipping_method']          = $rs->fields['shipping_method'];
			$item['date_purchased']           = $rs->fields['date_purchased'];
			$item['last_modified']            = $rs->fields['last_modified'];
			$item['currency']                 = $rs->fields['currency'];
			$item['currency_value']           = $rs->fields['currency_value'];
			$item['orders_status_name']       = $rs->fields['orders_status_name'];
			$item['order_total']              = $rs->fields['order_total'];
			$item['customers_company']        = $rs->fields['customers_company'];
			$item['customers_email_address']  = $rs->fields['customers_email_address'];
			$item['customers_street_address'] = $rs->fields['customers_street_address'];
			$item['delivery_company']         = $rs->fields['delivery_company'];
			$item['delivery_name']            = $rs->fields['delivery_name'];
			$item['delivery_street_address']  = $rs->fields['delivery_street_address'].'  '.$rs->fields['delivery_suburb'];
			$item['delivery_country']         = $rs->fields['delivery_country'];
			$item['delivery_city']            = $rs->fields['delivery_city'];
			$item['delivery_state']           = $rs->fields['delivery_state'];
			//$item['delivery_suburb']          = $rs->fields['delivery_suburb'];
			$item['delivery_countries_code2'] = parent::countries_code($item['delivery_country']);
			$item['delivery_postcode']        = $rs->fields['delivery_postcode'];
			$item['billing_company']          = $rs->fields['billing_company'];
			$item['billing_name']             = $rs->fields['billing_name'];
			$item['billing_street_address']   = $rs->fields['billing_street_address'];
			$item['billing_country']          = $rs->fields['billing_country'];
			$item['billing_postcode']         = $rs->fields['billing_postcode'];
			$item['payment_module_code']      = $rs->fields['payment_module_code'];
			$item['shipping_module_code']     = $rs->fields['shipping_module_code'];
			$item['ip_address']               = $rs->fields['ip_address'];
			
			
			if(isset($info['orders_products_info']) && $info['orders_products_info']=='yes'){
			$item['orders_products_info']=parent::order_products_info($rs->fields['orders_id']);
			}
			$return[] = $item;
			$rs->MoveNext();
		}
		return parent::prepare_output($return);
	}
	
	/**
	 * delete order(s)
	 *
	 * @param string $info
	 * @return string
	 */
	public static function order_delete($info) {
		$info = parent::prepare_input($info);
		$return = array();
		foreach ($info as $item) {
	        $oID = zen_db_prepare_input($item['orders_id']);
	        zen_remove_order($oID, $item['restock']);
		}
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * get the order status text with a id
	 *
	 * @param integer $status
	 * @return string
	 */
	private static function order_status_text($status) {
		$status = array($status);
		$status = parent::prepare_input($status);
		$text = OrderStatus::order_status_list_id($status);
		$text = parent::prepare_input($text);
		return $text['orders_status_name'][$_SESSION['languages_id']];
	}
	
	/**
	 * update order(s)
	 *
	 * @param string $items
	 * @return string
	 */
	public static function order_update($items) {
		$db = parent::prepare_db();
		$items = parent::prepare_input($items);
		$return = array();
		
		foreach ($items as $item) {
			$oID = zen_db_prepare_input($item['orders_id']);
			$status = zen_db_prepare_input($item['status']);
			$comments = zen_db_prepare_input($item['comments']);
			
			$order_updated = false;
			$check_status = $db->Execute("select customers_name, customers_email_address, orders_status,
										  date_purchased from " . TABLE_ORDERS . "
										  where orders_id = '" . (int)$oID . "'");
			
			if ( ($check_status->fields['orders_status'] != $status) || zen_not_null($comments)) {
				$db->Execute("update " . TABLE_ORDERS . "
							  set orders_status = '" . zen_db_input($status) . "', last_modified = now()
							  where orders_id = '" . (int)$oID . "'");
				
				$customer_notified = '0';
				if (isset($item['notify']) && ($item['notify'] == 'true')) {
			
					$notify_comments = '';
					if (isset($item['notify_comments']) && ($item['notify_comments'] == 'true') && zen_not_null($comments)) {
						$notify_comments = EMAIL_TEXT_COMMENTS_UPDATE . $comments . "\n\n";
					}
					//send emails
					$message =
					EMAIL_TEXT_ORDER_NUMBER . ' ' . $oID . "\n\n" .
					EMAIL_TEXT_INVOICE_URL . ' ' . parent::zen_catalog_href_link_mzt(FILENAME_CATALOG_ACCOUNT_HISTORY_INFO, 'order_id=' . $oID, 'SSL') . "\n\n" .
					EMAIL_TEXT_DATE_ORDERED . ' ' . zen_date_long($check_status->fields['date_purchased']) . "\n\n" .
					strip_tags($notify_comments) .
					EMAIL_TEXT_STATUS_UPDATED . sprintf(EMAIL_TEXT_STATUS_LABEL, self::order_status_text($status) ) .
					EMAIL_TEXT_STATUS_PLEASE_REPLY;
					
					$html_msg['EMAIL_CUSTOMERS_NAME']    = $check_status->fields['customers_name'];
					$html_msg['EMAIL_TEXT_ORDER_NUMBER'] = EMAIL_TEXT_ORDER_NUMBER . ' ' . $oID;
					$html_msg['EMAIL_TEXT_INVOICE_URL']  = '<a href="' . parent::zen_catalog_href_link_mzt(FILENAME_CATALOG_ACCOUNT_HISTORY_INFO, 'order_id=' . $oID, 'SSL') .'">'.str_replace(':','',EMAIL_TEXT_INVOICE_URL).'</a>';
					$html_msg['EMAIL_TEXT_DATE_ORDERED'] = EMAIL_TEXT_DATE_ORDERED . ' ' . zen_date_long($check_status->fields['date_purchased']);
					$html_msg['EMAIL_TEXT_STATUS_COMMENTS'] = nl2br($notify_comments);
					$html_msg['EMAIL_TEXT_STATUS_UPDATED'] = str_replace('\n','', EMAIL_TEXT_STATUS_UPDATED);
					$html_msg['EMAIL_TEXT_STATUS_LABEL'] = str_replace('\n','', sprintf(EMAIL_TEXT_STATUS_LABEL, self::order_status_text($status) ));
					$html_msg['EMAIL_TEXT_NEW_STATUS'] = self::order_status_text($status);
					$html_msg['EMAIL_TEXT_STATUS_PLEASE_REPLY'] = str_replace('\n','', EMAIL_TEXT_STATUS_PLEASE_REPLY);
					
					zen_mail($check_status->fields['customers_name'], $check_status->fields['customers_email_address'], EMAIL_TEXT_SUBJECT . ' #' . $oID, $message, STORE_NAME, EMAIL_FROM, $html_msg, 'order_status');
					$customer_notified = '1';
			
					//send extra emails
					if (SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_STATUS == '1' and SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO != '') {
						zen_mail('', SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO, SEND_EXTRA_ORDERS_STATUS_ADMIN_EMAILS_TO_SUBJECT . ' ' . EMAIL_TEXT_SUBJECT . ' #' . $oID, $message, STORE_NAME, EMAIL_FROM, $html_msg, 'order_status_extra');
					}
				} elseif (isset($item['notify']) && ($item['notify'] == 'hidden')) {
					// hide comment
					$customer_notified = '-1';
				}
			
				$db->Execute("insert into " . TABLE_ORDERS_STATUS_HISTORY . "
							(orders_id, orders_status_id, date_added, customer_notified, comments)
							values ('" . (int)$oID . "',
							'" . zen_db_input($status) . "',
							now(),
							'" . zen_db_input($customer_notified) . "',
							'" . zen_db_input($comments)  . "')");
				$order_updated = true;
			}
			
			// trigger any appropriate updates which should be sent back to the payment gateway:
			require_once(DIR_WS_CLASSES . 'order.php');
			$order = new order((int)$oID);
			if ($order->info['payment_module_code']) {
				if (file_exists(DIR_FS_CATALOG_MODULES . 'payment/' . $order->info['payment_module_code'] . '.php')) {
					require_once(DIR_FS_CATALOG_MODULES . 'payment/' . $order->info['payment_module_code'] . '.php');
					require_once(DIR_FS_CATALOG_LANGUAGES . $_SESSION['language'] . '/modules/payment/' . $order->info['payment_module_code'] . '.php');
					$module = new $order->info['payment_module_code'];
					if (method_exists($module, '_doStatusUpdate')) {
						$response = $module->_doStatusUpdate($oID, $status, $comments, $customer_notified, $check_status->fields['orders_status']);
					}
				}
			}
			
			if ($order_updated == true) {
				if ($status == DOWNLOADS_ORDERS_STATUS_UPDATED_VALUE) {
					// adjust download_maxdays based on current date
					$zc_max_days = zen_date_diff($check_status->fields['date_purchased'], date('Y-m-d H:i:s', time())) + DOWNLOAD_MAX_DAYS;
					
					$update_downloads_query = "update " . TABLE_ORDERS_PRODUCTS_DOWNLOAD . " set download_maxdays='" . $zc_max_days . "', download_count='" . DOWNLOAD_MAX_COUNT . "' where orders_id='" . (int)$oID . "'";
					$db->Execute($update_downloads_query);
				}
			}
		}
		$return[] = '1';
		return parent::prepare_output($return);
	}
}
?>