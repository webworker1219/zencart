<?php
class ProductTypes extends ApiBase {
	/**
	 * get product type list
	 *
	 * @return string
	 */
	public static function producttype_list() {
		$db = parent::prepare_db();
		$return = array();
		
		$product_types = $db->Execute("select * from " . TABLE_PRODUCT_TYPES);
		while (!$product_types->EOF) {
			$item['type_id'] = $product_types->fields['type_id'];
			$item['type_name'] = $product_types->fields['type_name'];
			$item['allow_add_to_cart'] = ($product_types->fields['allow_add_to_cart'] == 'Y') ? 'true' : 'false';
			$return[] = $item;
			$product_types->MoveNext();
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * get a product type's information
	 *
	 * @param string $type_id
	 * @return string
	 */
	public static function producttype_list_id($type_id) {
		$db = parent::prepare_db();
		$type_id = parent::prepare_input($type_id);
		$type_id = $type_id[0];
		$return = array();
		
		$product_types = $db->Execute("select * from " . TABLE_PRODUCT_TYPES . " where type_id = " . $type_id);
		$product_type_products = $db->Execute("select count(*) as products_count
                                             from " . TABLE_PRODUCTS . "
                                             where products_type = '" . (int)$type_id . "'");
		$ptInfo_array = array_merge($product_types->fields, $product_type_products->fields);
		
		$ptInfo = new objectInfo($ptInfo_array);
		
		$return['type_id'] = $ptInfo->type_id;
		$return['type_name'] = $ptInfo->type_name;
		$return['default_image'] = ($ptInfo->default_image != '') ? DIR_WS_CATALOG_IMAGES . $ptInfo->default_image : '';
		$return['type_handler'] = $ptInfo->type_handler;
		$return['allow_add_to_cart'] = ($ptInfo->allow_add_to_cart == 'Y') ? 'true' : 'false';
		$return['type_master_type'] = $ptInfo->type_master_type;

		return parent::prepare_output($return);	
	}
	
	/**
	 * add a product type
	 *
	 * @param string $info
	 * @return string
	 */
	public static function producttype_add($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$type_name = zen_db_prepare_input($info['type_name']);
		$handler = zen_db_prepare_input($info['handler']);
		$allow_add_to_cart =  zen_db_prepare_input((($info['catalog_add_to_cart'] == 'true') ? 'Y' : 'N'));
		
		$sql_data_array = array('type_name' => $type_name,
								'type_handler' => $handler,
								'allow_add_to_cart' => $allow_add_to_cart);
		
		$insert_sql_data = array('date_added' => 'now()');
		
		$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
		
		zen_db_perform(TABLE_PRODUCT_TYPES, $sql_data_array);
		$type_id = $db->Insert_ID();
		
		$sql_data_array = array('type_master_type' => $type_id);
		zen_db_perform(TABLE_PRODUCT_TYPES, $sql_data_array, 'update', "type_id = '" . (int)$type_id . "'");
		
		$type_image = new upload('default_image');
		$type_image->set_destination(DIR_FS_CATALOG_IMAGES . $info['img_dir']);
		if ( $type_image->parse() &&  $type_image->save()) {
			// remove image from database if none
			if ($type_image->filename != 'none') {
				$db->Execute("update " . TABLE_PRODUCT_TYPES . "
							set default_image = '" .  $info['img_dir'] . $type_image->filename . "'
							where type_id = '" . (int)$type_id . "'");
			} else {
				$db->Execute("update " . TABLE_PRODUCT_TYPES . "
							set default_image = ''
							where type_id = '" . (int)$type_id . "'");
			}
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update a product type
	 *
	 * @param string $info
	 * @return string
	 */
	public static function producttype_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$type_id = zen_db_prepare_input($info['type_id']);
		$type_name = zen_db_prepare_input($info['type_name']);
		$handler = zen_db_prepare_input($info['handler']);
		$allow_add_to_cart =  zen_db_prepare_input((($info['catalog_add_to_cart'] == 'true') ? 'Y' : 'N'));
		
		$sql_data_array = array('type_name' => $type_name,
								'type_handler' => $handler,
								'allow_add_to_cart' => $allow_add_to_cart);
		
		$master_type = zen_db_prepare_input($info['master_type']);
		
		$update_sql_data = array('last_modified' => 'now()',
								'type_master_type' => $master_type);
		
		$sql_data_array = array_merge($sql_data_array, $update_sql_data);
		
		zen_db_perform(TABLE_PRODUCT_TYPES, $sql_data_array, 'update', "type_id = '" . (int)$type_id . "'");
		
		$type_image = new upload('default_image');
		$type_image->set_destination(DIR_FS_CATALOG_IMAGES . $info['img_dir']);
		if ( $type_image->parse() &&  $type_image->save()) {
			// remove image from database if none
			if ($type_image->filename != 'none') {
				$db->Execute("update " . TABLE_PRODUCT_TYPES . "
							set default_image = '" .  $info['img_dir'] . $type_image->filename . "'
							where type_id = '" . (int)$type_id . "'");
			} else {
				$db->Execute("update " . TABLE_PRODUCT_TYPES . "
							set default_image = ''
							where type_id = '" . (int)$type_id . "'");
			}
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * delete a product type
	 *
	 * @param string $info
	 * @return string
	 */
	public static function producttype_delete($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$type_id = zen_db_prepare_input($info['type_id']);
		
		if (isset($info['delete_image']) && ($info['delete_image'] == 'true')) {
			$product_type = $db->Execute("select default_image
										from " . TABLE_PRODUCT_TYPES . "
										where type_id = '" . (int)$type_id . "'");
			
			$image_location = DIR_FS_CATALOG_IMAGES . $product_type->fields['default_image'];
			
			if (file_exists($image_location)) @unlink($image_location);
		}
		
		$db->Execute("delete from " . TABLE_PRODUCT_TYPES . "
					where type_id = '" . (int)$type_id . "'");
		//        $db->Execute("delete from " . TABLE_PRODUCT_TYPES_INFO . "
		//                      where manufacturers_id = '" . (int)$manufacturers_id . "'");
		
		if (isset($info['delete_products']) && ($info['delete_products'] == 'true')) {
			$products = $db->Execute("select products_id
									from " . TABLE_PRODUCTS . "
									where products_type = '" . (int)$type_id . "'");
			
			while (!$products->EOF) {
				zen_remove_product($products->fields['products_id']);
				$products->MoveNext();
			}
		} else {
			$db->Execute("update " . TABLE_PRODUCTS . "
						set products_type = '1'
						where products_type = '" . (int)$type_id . "'");
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * get product type layout list
	 *
	 * @param string $product_type_id
	 * @return string
	 */
	public static function producttype_layout_list($product_type_id) {
		$db = parent::prepare_db();
		$product_type_id = parent::prepare_input($product_type_id);
		$product_type_id = $product_type_id[0];
		$return = array();
		
		$where = '';
		if(!empty($product_type_id)) {
			$where = " WHERE product_type_id = {$product_type_id}";
		}
		
		$configuration = $db->Execute('select configuration_id, configuration_title, configuration_key, 
									configuration_value, configuration_description, product_type_id, 
									sort_order, last_modified, date_added, 
									use_function, set_function 
									from ' . TABLE_PRODUCT_TYPE_LAYOUT . 
									$where);
		
		while (!$configuration->EOF) {
			$item['configuration_id'] = $configuration->fields['configuration_id'];
			$item['configuration_title'] = $configuration->fields['configuration_title'];
			$item['configuration_key'] = $configuration->fields['configuration_key'];
			$item['configuration_value'] = $configuration->fields['configuration_value'];
			$item['configuration_description'] = $configuration->fields['configuration_description'];
			$item['product_type_id'] = $configuration->fields['product_type_id'];
			$item['sort_order'] = $configuration->fields['sort_order'];
			$item['last_modified'] = $configuration->fields['last_modified'];
			$item['date_added'] = $configuration->fields['date_added'];
			$item['use_function'] = $configuration->fields['use_function'];
			$item['set_function'] = $configuration->fields['set_function'];
			$return[] = $item;
			$configuration->MoveNext();
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * get a product type config's information
	 *
	 * @param string $configuration_id
	 * @return string
	 */
	public static function producttype_layout_list_id($configuration_id) {
		$db = parent::prepare_db();
		$configuration_id = parent::prepare_input($configuration_id);
		$configuration_id = $configuration_id[0];
		$return = array();
		
		$configuration = $db->Execute('select configuration_id, configuration_title, configuration_key, 
									configuration_value, configuration_description, product_type_id, 
									sort_order, last_modified, date_added, 
									use_function, set_function 
									from ' . TABLE_PRODUCT_TYPE_LAYOUT . 
									" WHERE configuration_id = {$configuration_id}");
		
		if(!$configuration->EOF) {
			$return['configuration_id'] = $configuration->fields['configuration_id'];
			$return['configuration_title'] = $configuration->fields['configuration_title'];
			$return['configuration_key'] = $configuration->fields['configuration_key'];
			$return['configuration_value'] = $configuration->fields['configuration_value'];
			$return['configuration_description'] = $configuration->fields['configuration_description'];
			$return['product_type_id'] = $configuration->fields['product_type_id'];
			$return['sort_order'] = $configuration->fields['sort_order'];
			$return['last_modified'] = $configuration->fields['last_modified'];
			$return['date_added'] = $configuration->fields['date_added'];
			$return['use_function'] = $configuration->fields['use_function'];
			$return['set_function'] = $configuration->fields['set_function'];
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * update a product type config
	 *
	 * @param string $info
	 * @return string
	 */
	public static function producttype_layout_update($info) {
		$info = parent::prepare_input($info);
		$return = array();
		
		$update_sql_data = array('configuration_title'=>$info['configuration_title'],
								'configuration_key' => $info['configuration_key'],
								'configuration_value' => $info['configuration_value'],
								'configuration_description' => $info['configuration_description'],
								'product_type_id' => $info['product_type_id'],
								'sort_order' => $info['sort_order'],
								'last_modified' => 'now()',
								'use_function' => $info['use_function'],
								'set_function' => $info['set_function']);
		zen_db_perform(TABLE_PRODUCT_TYPE_LAYOUT, $update_sql_data, 'update', "configuration_id = '" . (int)$info['configuration_id'] . "'");
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
}
?>