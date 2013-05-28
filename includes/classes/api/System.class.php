<?php
class System extends ApiBase {
	/**
	 * check if the key right or not
	 *
	 * @param string $key
	 * @return string
	 */
	public static function check_key($key) {
		$return = array();
		$key = parent::prepare_input($key);
		$key = $key[0];
		if($key == md5(API_KEY)) {
			$return[] = '1';
		} else {
			$return[] = '0';
		}
		return parent::prepare_output($return);
	}
	
	/**
	 * list all zencart config
	 *
	 * @return string
	 */
	public static function system_config_list($configuration_group_id) {
		$db = parent::prepare_db();
		$configuration_group_id = parent::prepare_input($configuration_group_id);
		$configuration_group_id = $configuration_group_id[0];
		$return = array();
		
		$where = '';
		if(!empty($configuration_group_id)) {
			$where = " WHERE configuration_group_id = {$configuration_group_id}";
		}
		
		$use_cache = false;
		$configuration = $db->Execute('select configuration_id, configuration_title, configuration_key, 
									configuration_value, configuration_description, configuration_group_id, 
									sort_order, last_modified, date_added, 
									use_function, set_function 
									from ' . TABLE_CONFIGURATION .
									$where, '', $use_cache, 150);
		while (!$configuration->EOF) {
			$item['configuration_id'] = $configuration->fields['configuration_id'];
			$item['configuration_title'] = $configuration->fields['configuration_title'];
			$item['configuration_key'] = $configuration->fields['configuration_key'];
			$item['configuration_value'] = $configuration->fields['configuration_value'];
			$item['configuration_description'] = $configuration->fields['configuration_description'];
			$item['configuration_group_id'] = $configuration->fields['configuration_group_id'];
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
	 * get a config's information
	 *
	 * @param string $configuration_id
	 * @return string
	 */
	public static function system_config_list_id($configuration_id) {
		$db = parent::prepare_db();
		$configuration_id = parent::prepare_input($configuration_id);
		$configuration_id = $configuration_id[0];
		$return = array();
		
		$configuration = $db->Execute('select configuration_id, configuration_title, configuration_key, 
									configuration_value, configuration_description, configuration_group_id, 
									sort_order, last_modified, date_added, 
									use_function, set_function 
									from ' . TABLE_CONFIGURATION .
									' where configuration_id = ' . $configuration_id, '', $use_cache, 150);
		if(!$configuration->EOF) {
			$return['configuration_id'] = $configuration->fields['configuration_id'];
			$return['configuration_title'] = $configuration->fields['configuration_title'];
			$return['configuration_key'] = $configuration->fields['configuration_key'];
			$return['configuration_value'] = $configuration->fields['configuration_value'];
			$return['configuration_description'] = $configuration->fields['configuration_description'];
			$return['configuration_group_id'] = $configuration->fields['configuration_group_id'];
			$return['sort_order'] = $configuration->fields['sort_order'];
			$return['last_modified'] = $configuration->fields['last_modified'];
			$return['date_added'] = $configuration->fields['date_added'];
			$return['use_function'] = $configuration->fields['use_function'];
			$return['set_function'] = $configuration->fields['set_function'];
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * add a config
	 *
	 * @param string $info
	 * @return string
	 */
	public static function system_config_add($info) {
		$info = parent::prepare_input($info);
		$return = array();
		
		$insert_sql_data = array('configuration_title' => $info['configuration_title'],
								'configuration_key' => $info['configuration_key'],
								'configuration_value' => $info['configuration_value'],
								'configuration_description' => $info['configuration_description'],
								'configuration_group_id' => $info['configuration_group_id'],
								'sort_order' => $info['sort_order'],
								'last_modified' => 'now()',
								'date_added' => 'now()',
								'use_function' => $info['use_function'],
								'set_function' => $info['set_function']);
		zen_db_perform(TABLE_CONFIGURATION, $insert_sql_data);
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update a config
	 *
	 * @param string $info
	 * @return string
	 */
	public static function system_config_update($info) {
		$info = parent::prepare_input($info);
		$return = array();
		
		$update_sql_data = array('configuration_title' => $info['configuration_title'],
								'configuration_key' => $info['configuration_key'],
								'configuration_value' => $info['configuration_value'],
								'configuration_description' => $info['configuration_description'],
								'configuration_group_id' => $info['configuration_group_id'],
								'sort_order' => $info['sort_order'],
								'last_modified' => 'now()',
								'use_function' => $info['use_function'],
								'set_function' => $info['set_function']);
		zen_db_perform(TABLE_CONFIGURATION, $update_sql_data, 'update', "configuration_id = '" . (int)$info['configuration_id'] . "'");
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * delete a config
	 *
	 * @param string $configuration_id
	 * @return string
	 */
	public static function system_config_delete($configuration_id) {
		$db = parent::prepare_db();
		$configuration_id = parent::prepare_input($configuration_id);
		$configuration_id = $configuration_id[0];
		$return = array();
		
		$sql = "DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_id = {$configuration_id}";
		$db->Execute($sql);
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * get all directory list under a directory
	 *
	 * @param string $root
	 * @return string
	 */
	public static function system_dir_list($root) {
		$root = parent::prepare_input($root);
		if(count($root) == 0) {
			//默认获取根目录下的images目录下的目录列表
			$root[0] = DIR_FS_CATALOG_IMAGES;
		}
		$root = $root[0];
		$root = rtrim($root, '/') . '/';
		$return = array();
		
		$dir = @dir($root);
		$return[] = array('id' => '', 'text' => "Main Directory");
		while ($file = $dir->read()) {
			if (is_dir($root . $file) && strtoupper($file) != 'CVS' && strtoupper($file) != '.SVN' && $file != "." && $file != "..") {
				$return[] = array('id' => $file . '/', 'text' => $file);
			}
		}
		
		return parent::prepare_output($return);
	}
}
?>