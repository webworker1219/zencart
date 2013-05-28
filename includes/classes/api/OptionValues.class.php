<?php
class OptionValues extends ApiBase {
	/**
	 * get option value list
	 *
	 * @param string $info
	 * @return string
	 */
	public static function option_value_list($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		//设置分页
		$page = 1;
		$perpage = PHP_INT_MAX;
		if(isset($info['page'])) {
			$page = intval($info['page']);
		}
		if(isset($info['perpage'])) {
			$perpage = intval($info['perpage']);
		}
		$limit = " LIMIT " . (($page - 1) * $perpage) . ", {$perpage}";
		$option_values = $db->Execute("select pov.products_options_values_id, pov.products_options_values_name, pov2po.products_options_id, 
									pov.products_options_values_sort_order 
									from " . TABLE_PRODUCTS_OPTIONS_VALUES . " pov left join " . TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS . " pov2po 
									on pov.products_options_values_id = pov2po.products_options_values_id     
									left join " . TABLE_PRODUCTS_OPTIONS . " po 
									on pov2po.products_options_id = po.products_options_id 
									where pov.language_id = '" . (int)$_SESSION['languages_id'] . "' 
									and po.language_id = '" . (int)$_SESSION['languages_id'] . "' 
									and po.language_id = pov.language_id 
									and pov2po.products_options_values_id !='" . PRODUCTS_OPTIONS_VALUES_TEXT_ID . "' 
									order by  po.products_options_name, LPAD(pov.products_options_values_sort_order,11,'0'), pov.products_options_values_name" . 
									$limit);
		while(!$option_values->EOF) {
			$item['products_options_values_id'] = $option_values->fields['products_options_values_id'];
			$item['products_options_values_name'] = $option_values->fields['products_options_values_name'];
			$item['products_options_id'] = $option_values->fields['products_options_id'];
			$item['products_options_values_sort_order'] = $option_values->fields['products_options_values_sort_order'];
			$return[] = $item;
			$option_values->MoveNext();
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * get the next option value id
	 *
	 * @return string
	 */
	public static function option_value_next_id() {
		$db = parent::prepare_db();
		$return = array();
		
		$max_values_id_values = $db->Execute("select max(products_options_values_id) + 1
		                                   as next_id from " . TABLE_PRODUCTS_OPTIONS_VALUES);
		
		$return[] = $max_values_id_values->fields['next_id'];
		
		return parent::prepare_output($return);
	}
	
	/**
	 * get a option value's information
	 *
	 * @param string $products_options_values_id
	 * @return string
	 */
	public static function option_value_list_id($products_options_values_id) {
		$db = parent::prepare_db();
		$products_options_values_id = parent::prepare_input($products_options_values_id);
		$products_options_values_id = $products_options_values_id[0];
		$return = array();
		
		$languages = zen_get_languages();
		$option_values = $db->Execute("select pov.products_options_values_id, pov.products_options_values_name, pov2po.products_options_id, 
									pov.products_options_values_sort_order 
									from " . TABLE_PRODUCTS_OPTIONS_VALUES . " pov left join " . TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS . " pov2po 
									on pov.products_options_values_id = pov2po.products_options_values_id     
									left join " . TABLE_PRODUCTS_OPTIONS . " po 
									on pov2po.products_options_id = po.products_options_id 
									where pov.language_id = '" . (int)$_SESSION['languages_id'] . "' 
									and po.language_id = '" . (int)$_SESSION['languages_id'] . "' 
									and po.language_id = pov.language_id 
									and pov2po.products_options_values_id !='" . PRODUCTS_OPTIONS_VALUES_TEXT_ID . "' 
									order by  po.products_options_name, LPAD(pov.products_options_values_sort_order,11,'0'), pov.products_options_values_name" . 
									$limit);
		if(!$option_values->EOF) {
			$return['products_options_values_id'] = $option_values->fields['products_options_values_id'];
			for ($i = 0, $n = sizeof($languages); $i < $n; $i ++) {
				$value_name = $db->Execute("select products_options_values_name
											from " . TABLE_PRODUCTS_OPTIONS_VALUES . "
											where products_options_values_id = '" . (int)$option_values->fields['products_options_values_id'] . "' and language_id = '" . (int)$languages[$i]['id'] . "'");
				$return['products_options_values_name'][$languages[$i]['id']] = $value_name->fields['products_options_values_name'];
			}
			$return['products_options_id'] = $option_values->fields['products_options_id'];
			$return['products_options_values_sort_order'] = $option_values->fields['products_options_values_sort_order'];
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * add a option value
	 *
	 * @param string $info
	 * @return string
	 */
	public static function option_value_add($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$languages = zen_get_languages();
		$value_name_array = $info['value_name'];
		$value_id = zen_db_prepare_input($info['value_id']);
		$option_id = zen_db_prepare_input($info['option_id']);
		$products_options_values_sort_order = zen_db_prepare_input($info['products_options_values_sort_order']);
		
		for ($i=0, $n=sizeof($languages); $i<$n; $i ++) {
			$value_name = zen_db_prepare_input($value_name_array[$languages[$i]['id']]);
			
			//检查是否重复
			if (!empty($value_name)) {
				$check= $db->Execute("select pov.products_options_values_id, pov.products_options_values_name, pov.language_id
									from " . TABLE_PRODUCTS_OPTIONS_VALUES . " pov
									left join " . TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS . " pov2po on pov.products_options_values_id = pov2po.products_options_values_id
									where pov.language_id= '" . $languages[$i]['id'] . "'
									and pov.products_options_values_name='" . zen_db_input($value_name) . "'
									and pov2po.products_options_id ='" . (int)$option_id .
									"'");
				if ($check->RecordCount() > 1) {
					return ErrCode::error(API_ATTRIBUTE_POSSIBLE_OPTIONS_VALUE_WARNING_DUPLICATE);
				}
			}
			
			$db->Execute("insert into " . TABLE_PRODUCTS_OPTIONS_VALUES . "
						(products_options_values_id, language_id, products_options_values_name, products_options_values_sort_order)
						values ('" . (int)$value_id . "',
						'" . (int)$languages[$i]['id'] . "',
						'" . zen_db_input($value_name) . "',
						'" . (int)$products_options_values_sort_order . "')");
		}
		
		$db->Execute("insert into " . TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS . "
					(products_options_id, products_options_values_id)
					values ('" . (int)$option_id . "', '" . (int)$value_id . "')");
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update option value
	 *
	 * @param string $info
	 * @return string
	 */
	public static function option_value_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$languages = zen_get_languages();
		$value_name_array = $info['value_name'];
		$value_id = zen_db_prepare_input($info['value_id']);
		$option_id = zen_db_prepare_input($info['option_id']);
		$products_options_values_sort_order = zen_db_prepare_input($info['products_options_values_sort_order']);
		
		for ($i=0, $n=sizeof($languages); $i<$n; $i ++) {
			$value_name = zen_db_prepare_input($value_name_array[$languages[$i]['id']]);
			//检查是否重名
			if (!empty($value_name)) {
				$check= $db->Execute("select pov.products_options_values_id, pov.products_options_values_name, pov.language_id
									from " . TABLE_PRODUCTS_OPTIONS_VALUES . " pov
									left join " . TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS . " pov2po on pov.products_options_values_id = pov2po.products_options_values_id
									where pov.language_id= '" . $languages[$i]['id'] . "'
									and pov.products_options_values_name='" . zen_db_input($value_name) . "'
									and pov2po.products_options_id ='" . (int)$option_id .
									"'");
				
				if ($check->RecordCount() > 1) {
					return ErrCode::error(API_ATTRIBUTE_POSSIBLE_OPTIONS_VALUE_WARNING_DUPLICATE);
				}
			}
			
			$db->Execute("update " . TABLE_PRODUCTS_OPTIONS_VALUES . "
						set products_options_values_name = '" . zen_db_input($value_name) . "', products_options_values_sort_order = '" . (int)$products_options_values_sort_order . "'
						where products_options_values_id = '" . zen_db_input($value_id) . "'
						and language_id = '" . (int)$languages[$i]['id'] . "'");
		
		}
		
		$db->Execute("update " . TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS . "
					set products_options_id = '" . (int)$option_id . "'
					where products_options_values_id = '" . (int)$value_id . "'");
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * delete option value
	 *
	 * @param string $value_id
	 * @return string
	 */
	public static function option_value_delete($value_id) {
		$db = parent::prepare_db();
		$value_id = parent::prepare_input($value_id);
		$value_id = zen_db_prepare_input($value_id[0]);
		$return = array();
		
		// remove all attributes from products with value
		$remove_attributes_query = $db->Execute("select products_attributes_id, options_id, options_values_id from " . TABLE_PRODUCTS_ATTRIBUTES . " where options_values_id ='" . (int)$value_id . "'");
		if ($remove_attributes_query->RecordCount() > 0) {
			// clean all tables of option value
			while (!$remove_attributes_query->EOF) {
			
				$db->Execute("delete from " . TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD . "
							where products_attributes_id='" . $remove_attributes_query->fields['products_attributes_id'] . "'");
				
				$remove_attributes_query->MoveNext();
			}
			$db->Execute("delete from " . TABLE_PRODUCTS_ATTRIBUTES . "
						where options_values_id='" . (int)$value_id . "'");
		}
		
		$db->Execute("delete from " . TABLE_PRODUCTS_OPTIONS_VALUES . "
					where products_options_values_id = '" . (int)$value_id . "'");
		
		$db->Execute("delete from " . TABLE_PRODUCTS_OPTIONS_VALUES_TO_PRODUCTS_OPTIONS . "
					where products_options_values_id = '" . (int)$value_id . "'");
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
}
?>