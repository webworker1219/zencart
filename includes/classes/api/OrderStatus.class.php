<?php
class OrderStatus extends ApiBase {
	const SQL_ORDER_STATUS_LIST = "select orders_status_id, orders_status_name 
								from :{orders_status} 
								where language_id = ':{languages_id}' 
								order by orders_status_id";
	const SQL_ORDER_STATUS_LIST_ID = "SELECT orders_status_id, language_id, orders_status_name
									FROM :{orders_status}
									WHERE orders_status_id = ':{orders_status_id}'";
	/**
	 * get order status list
	 *
	 * @return string
	 */
	public static function order_status_list() {
		$db = parent::prepare_db();
		$return = array();
		$sql = $db->bindVars(self::SQL_ORDER_STATUS_LIST, ':{orders_status}', TABLE_ORDERS_STATUS, 'passthru');
		$sql = $db->bindVars($sql, ':{languages_id}', (int)$_SESSION['languages_id'], 'integer');
		$rs = $db->Execute($sql);
		while(!$rs->EOF) {
			$item['orders_status_id'] = $rs->fields['orders_status_id'];
			$item['orders_status_name'] = $rs->fields['orders_status_name'];
			$return[] = $item;
			$rs->MoveNext();
		}
		return parent::prepare_output($return);
	}
	
	/**
	 * get a specific order status's information
	 *
	 * @param string $id
	 * @return string
	 */
	public static function order_status_list_id($id) {
		$id = parent::prepare_input($id);
		$id = $id[0];
		$db = parent::prepare_db();
		$return = array();
		$sql = $db->bindVars(self::SQL_ORDER_STATUS_LIST_ID, ':{orders_status}', TABLE_ORDERS_STATUS, 'passthru');
		$sql = $db->bindVars($sql, ':{orders_status_id}', $id, 'integer');
		$rs = $db->Execute($sql);
		$return['orders_status_id'] = $id;
		$orders_status_name_arr = array();
		while(!$rs->EOF) {
			$orders_status_name_arr[$rs->fields['language_id']] = $rs->fields['orders_status_name'];
			$rs->MoveNext();
		}
		$return['orders_status_name'] = $orders_status_name_arr;
		return parent::prepare_output($return);
	}
	
	/**
	 * add a new order status
	 *
	 * @param string $info
	 * @return string
	 */
	public static function order_status_add($info) {
		$info = parent::prepare_input($info);
		$return = array();
		$languages = zen_get_languages();
		$db = parent::prepare_db();
		$orders_status_name_array = $info['orders_status_name'];
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$language_id = $languages[$i]['id'];
			
			$sql_data_array = array('orders_status_name' => zen_db_prepare_input($orders_status_name_array[$language_id]));
			
			if (empty($orders_status_id)) {
				$next_id = $db->Execute("select max(orders_status_id)
										as orders_status_id from " . TABLE_ORDERS_STATUS . "");
				
				$orders_status_id = $next_id->fields['orders_status_id'] + 1;
			}
			
			$insert_sql_data = array('orders_status_id' => $orders_status_id,
									'language_id' => $language_id);
			
			$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
			
			zen_db_perform(TABLE_ORDERS_STATUS, $sql_data_array);
		}
		
		if (isset($info['default']) && ($info['default'] == 'true')) {
			$db->Execute("update " . TABLE_CONFIGURATION . "
						set configuration_value = '" . zen_db_input($orders_status_id) . "'
						where configuration_key = 'DEFAULT_ORDERS_STATUS_ID'");
		}
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update order status's information
	 *
	 * @param string $info
	 * @return string
	 */
	public static function order_status_update($info) {
		$info = parent::prepare_input($info);
		$db = parent::prepare_db();
		$return = array();
		$orders_status_id = zen_db_prepare_input($info['orders_status_id']);
		$orders_status_name_array = $info['orders_status_name'];
		
		$languages = zen_get_languages();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$language_id = $languages[$i]['id'];
			
			$sql_data_array = array('orders_status_name' => zen_db_prepare_input($orders_status_name_array[$language_id]));
			zen_db_perform(TABLE_ORDERS_STATUS, $sql_data_array, 'update', "orders_status_id = '" . (int)$orders_status_id . "' and language_id = '" . (int)$language_id . "'");
		}
		
		if (isset($_POST['default']) && ($_POST['default'] == 'true')) {
			$db->Execute("update " . TABLE_CONFIGURATION . "
						set configuration_value = '" . zen_db_input($orders_status_id) . "'
						where configuration_key = 'DEFAULT_ORDERS_STATUS_ID'");
		}
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * delete order status(s)
	 *
	 * @param string $items
	 * @return string
	 */
	public static function order_status_delete($items) {
		$items = parent::prepare_input($items);
		$db = parent::prepare_db();
		$return = array();
		foreach ($items as $item) {
			$oID = zen_db_prepare_input($item['orders_status_id']);
			
			$orders_status = $db->Execute("select configuration_value
											from " . TABLE_CONFIGURATION . "
											where configuration_key = 'DEFAULT_ORDERS_STATUS_ID'");
			
			if ($orders_status->fields['configuration_value'] == $oID) {
			$db->Execute("update " . TABLE_CONFIGURATION . "
						set configuration_value = ''
						where configuration_key = 'DEFAULT_ORDERS_STATUS_ID'");
			}
			
			$db->Execute("delete from " . TABLE_ORDERS_STATUS . "
						where orders_status_id = '" . zen_db_input($oID) . "'");
		}
		$return[] = '1';
		return parent::prepare_output($return);
	}
}
?>