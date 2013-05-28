<?php
class Categories extends ApiBase {
	const SQL_CATEGORY_LIST_PARENT_ID = "select c.`categories_id`, cd.`categories_name`, cd.`categories_description`, c.`categories_image`,
                                         c.`parent_id`, c.`sort_order`, c.`date_added`, c.`last_modified`, c.`categories_status`
		                                  from :categories c, :categories_description cd
		                                  where c.`parent_id` = :pid
		                                  and c.`categories_id` = cd.`categories_id`";
	
	/**
	 * get category list
	 * 
	 * @param string $categories_id
	 * @return string
	 */
	public static function category_list($categories_id=0) {
		$db = parent::prepare_db();
		$categories_id = parent::prepare_input($categories_id);
		$categories_id = $categories_id[0];
		$return = array();
		
		$categories_query =parent::parent_category_list($categories_id);
		 for($i=0;$i<sizeof($categories_query);$i++){
			$item['categories_id']             =  $categories_query[$i]['categories_id'];
			$item['categories_image']          =  $categories_query[$i]['categories_image'];
			$item['parent_id']                 =  $categories_query[$i]['parent_id'];
			$item['sort_order']                =  $categories_query[$i]['sort_order'];
			$item['language_id']               =  $categories_query[$i]['language_id'];
			$item['categories_name']           =  $categories_query[$i]['categories_name'];
			$item['categories_description']    =  $categories_query[$i]['categories_description'];
			$item['categories_status']         =  $categories_query[$i]['categories_status'];
			
//			$categories_son = $db->Execute("select c.categories_id,c.categories_image,c.parent_id,c.sort_order,c.categories_status
//								   ,cd.language_id,cd.categories_name,cd.categories_description  
//								   from " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd
//								   where c.parent_id = '" . (int)$item['categories_id'] . "'
//                                   and c.categories_id = cd.categories_id
//                                   and cd.language_id = '" . (int)$_SESSION['languages_id'] . "'");
			$return[] = $item;
            //if($categories_son->fields['categories_id']!=""){
				// $return[] =parent::parent_category_list($item['categories_id']);
			//}
			
		 }
		 return parent::prepare_output($return);
	}
	
	/**
	 * get a category's information
	 *
	 * @param string $categories_id
	 * @return string
	 */
	public static function category_list_id($categories_id) {
		$db = parent::prepare_db();
		$categories_id = parent::prepare_input($categories_id);
		$categories_id = $categories_id[0];
		$return = array();
		
		$categories = $db->Execute("select c.categories_id, cd.categories_name, cd.categories_description, c.categories_image,
                                         c.parent_id, c.sort_order, c.date_added, c.last_modified,
                                         c.categories_status
                                  from " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd
                                  where c.categories_id = '" . (int)$categories_id . "'
                                  and c.categories_id = cd.categories_id
                                  and cd.language_id = '" . (int)$_SESSION['languages_id'] . "'");
		$cInfo = new objectInfo($categories->fields);
		if (isset($cInfo) && is_object($cInfo) && ($categories->fields['categories_id'] == $cInfo->categories_id) ) {
			$return['categories_id'] = $cInfo->categories_id;
			$languages = zen_get_languages();
			for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
				$return['categories_name'][$languages[$i]['id']] = htmlspecialchars(zen_get_category_name($cInfo->categories_id, $languages[$i]['id']));
				$return['categories_description'][$languages[$i]['id']] = zen_get_category_description($cInfo->categories_id, $languages[$i]['id']);
			}
			$return['categories_image'] = DIR_WS_CATALOG_IMAGES . $cInfo->categories_image;
			$return['sort_order'] = $cInfo->sort_order;
		}
		return parent::prepare_output($return);
	}
	
	/**
	 * get category's meta tags
	 *
	 * @param string $categories_id
	 * @return string
	 */
	public static function category_meta_tags_id($categories_id) {
		$categories_id = parent::prepare_input($categories_id);
		$categories_id = $categories_id[0];
		$return = array();
		
		$return['categories_id'] = $categories_id;
		$languages = zen_get_languages();
		for ($i = 0, $n = sizeof($languages); $i < $n; $i++) {
			$return['metatags_title'][$languages[$i]['id']] = zen_get_category_metatags_title($categories_id, $languages[$i]['id']);
			$return['metatags_keywords'][$languages[$i]['id']] = zen_get_category_metatags_keywords($categories_id, $languages[$i]['id']);
			$return['metatags_description'][$languages[$i]['id']] = zen_get_category_metatags_description($categories_id, $languages[$i]['id']);			
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * get category list under the parent id
	 * 
	 * @param string $pid the parent id
	 * @return string category list
	 */
	public static function category_list_parent_id($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$parent_id = $info['parent_id'];
		$search = $info['search'];
		$sort_order = $info['sort_order'];
		$page = $info['page'];
		$perpage = $info['perpage'];
		
		//设置父类
		if(!isset($parent_id)) {
			$parent_id = 0;
		}
		
		//设置排序
		$order_by = '';
		if(isset($sort_order)) {
			switch ($sort_order) {
				case '0':
					$order_by = " order by c.sort_order, cd.categories_name";
					break;
				case '1':
					$order_by = " order by cd.categories_name";
					break;
			}
		}
		
		//设置分页
		$limit = '';
		if(isset($page) && isset($perpage)) {
			$page = intval($page);
			$perpage = intval($perpage);
			$limit = " LIMIT " . (($page - 1) * $perpage) . ", {$perpage}";
		}
		
		if (isset($search)) {
			$search = zen_db_prepare_input($search);
			
			$categories = $db->Execute("select c.categories_id, cd.categories_name, cd.categories_description, c.categories_image,
										c.parent_id, c.sort_order, c.date_added, c.last_modified,
										c.categories_status
										from " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd
										where c.categories_id = cd.categories_id
										and c.parent_id = '" . (int)$parent_id . "'
										and cd.language_id = '" . (int)$_SESSION['languages_id'] . "'
										and cd.categories_name like '%" . zen_db_input($search) . "%'" .
										$order_by . 
										$limit);
		} else {
			$categories = $db->Execute("select c.categories_id, cd.categories_name, cd.categories_description, c.categories_image,
										c.parent_id, c.sort_order, c.date_added, c.last_modified,
										c.categories_status
										from " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd
										where c.parent_id = '" . (int)$parent_id . "'
										and c.categories_id = cd.categories_id
										and cd.language_id = '" . (int)$_SESSION['languages_id'] . "'" .
										$order_by . 
										$limit);
		}
		while(!$categories->EOF) {
      		$item['categories_id'] = $categories->fields['categories_id'];
      		$item['categories_name'] = $categories->fields['categories_name'];
      		$item['total_products'] = zen_get_products_to_categories($categories->fields['categories_id'], true);
      		$item['total_products_on'] = zen_get_products_to_categories($categories->fields['categories_id'], false);
      		$item['categories_status'] = $categories->fields['categories_status'];
      		$item['sort_order'] = $categories->fields['sort_order'];
      		$item['metatags_keywords'] = zen_get_category_metatags_keywords($categories->fields['categories_id'], (int)$_SESSION['languages_id']);
      		$item['metatags_description'] = zen_get_category_metatags_description($categories->fields['categories_id'], (int)$_SESSION['languages_id']);
      		$return[] = $item;
      		$categories->MoveNext();
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * add a new category
	 *
	 * @param string $info
	 * @return string
	 */
	public static function category_add($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$sort_order = $info['sort_order'];
		$parent_id = $info['parent_id'];
		
		$sort_order = zen_db_prepare_input($sort_order);
		
		$sql_data_array = array('sort_order' => (int)$sort_order);
		
		$insert_sql_data = array('parent_id' => $parent_id,
								'date_added' => 'now()');
		
		$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
		
		zen_db_perform(TABLE_CATEGORIES, $sql_data_array);
		
		$categories_id = zen_db_insert_id();
		// check if parent is restricted
		$sql = "select parent_id from " . TABLE_CATEGORIES . "
				where categories_id = '" . $categories_id . "'";
		
		$parent_cat = $db->Execute($sql);
		if ($parent_cat->fields['parent_id'] != '0') {
			$sql = "select * from " . TABLE_PRODUCT_TYPES_TO_CATEGORY . "
					where category_id = '" . $parent_cat->fields['parent_id'] . "'";
			$has_type = $db->Execute($sql);
			if ($has_type->RecordCount() > 0 ) {
				while (!$has_type->EOF) {
					$insert_sql_data = array('category_id' => $categories_id,
											'product_type_id' => $has_type->fields['product_type_id']);
					zen_db_perform(TABLE_PRODUCT_TYPES_TO_CATEGORY, $insert_sql_data);
					$has_type->moveNext();
				}
			}
		}
		
		$languages = zen_get_languages();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$categories_name_array = $info['categories_name'];
			$categories_description_array = $info['categories_description'];
			$language_id = $languages[$i]['id'];
			
			// clean $categories_description when blank or just <p /> left behind
			$sql_data_array = array('categories_name' => zen_db_prepare_input($categories_name_array[$language_id]),
									'categories_description' => ($categories_description_array[$language_id] == '<p />' ? '' : zen_db_prepare_input($categories_description_array[$language_id])));
			
			$insert_sql_data = array('categories_id' => $categories_id,
									'language_id' => $languages[$i]['id']);
			
			$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
			
			zen_db_perform(TABLE_CATEGORIES_DESCRIPTION, $sql_data_array);
		}
		
		if ($info['categories_image_manual'] != '') {
			// add image manually
			$categories_image_name = $info['img_dir'] . $info['categories_image_manual'];
			$db->Execute("update " . TABLE_CATEGORIES . "
						set categories_image = '" . $categories_image_name . "'
						where categories_id = '" . (int)$categories_id . "'");
		} else {
			if ($categories_image = new upload('categories_image')) {
				$categories_image->set_destination(DIR_FS_CATALOG_IMAGES . $info['img_dir']);
				if ($categories_image->parse() && $categories_image->save()) {
					$categories_image_name = $info['img_dir'] . $categories_image->filename;
				}
				if ($categories_image->filename != 'none' && $categories_image->filename != '') {
					// save filename when not set to none and not blank
					$db->Execute("update " . TABLE_CATEGORIES . "
								set categories_image = '" . $categories_image_name . "'
								where categories_id = '" . (int)$categories_id . "'");
				} else {
					$db->Execute("update " . TABLE_CATEGORIES . "
								set categories_image = ''
								where categories_id = '" . (int)$categories_id . "'");
				}
			}
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update a category
	 *
	 * @param string $info
	 * @return string
	 */
	public static function category_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		if ( isset($info['add_type']) or isset($info['add_type_all']) ) {
			// check if it is already restricted
			$sql = "select * from " . TABLE_PRODUCT_TYPES_TO_CATEGORY . "
					where category_id = '" . zen_db_prepare_input($info['categories_id']) . "'
					and product_type_id = '" . zen_db_prepare_input($info['restrict_type']) . "'";
			
			$type_to_cat = $db->Execute($sql);
			if ($type_to_cat->RecordCount() < 1) {
				//@@TODO find all sub-categories and restrict them as well.
				
				$insert_sql_data = array('category_id' => zen_db_prepare_input($info['categories_id']),
										'product_type_id' => zen_db_prepare_input($info['restrict_type']));
				
				zen_db_perform(TABLE_PRODUCT_TYPES_TO_CATEGORY, $insert_sql_data);
				/*
				// moved below so evaluated separately from current category
				if (isset($_POST['add_type_all'])) {
				zen_restrict_sub_categories($_POST['categories_id'], $_POST['restrict_type']);
				}
				*/
			}
			// add product type restrictions to subcategories if not already set
			if (isset($info['add_type_all'])) {
				zen_restrict_sub_categories($info['categories_id'], $info['restrict_type']);
			}
		}
		$categories_id = zen_db_prepare_input($info['categories_id']);
		$sort_order = zen_db_prepare_input($info['sort_order']);
		
		$sql_data_array = array('sort_order' => (int)$sort_order);
		
		$update_sql_data = array('last_modified' => 'now()');
		
		$sql_data_array = array_merge($sql_data_array, $update_sql_data);
		
		zen_db_perform(TABLE_CATEGORIES, $sql_data_array, 'update', "categories_id = '" . (int)$categories_id . "'");
		
		$languages = zen_get_languages();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$categories_name_array = $info['categories_name'];
			$categories_description_array = $info['categories_description'];
			$language_id = $languages[$i]['id'];
			
			// clean $categories_description when blank or just <p /> left behind
			$sql_data_array = array('categories_name' => zen_db_prepare_input($categories_name_array[$language_id]),
									'categories_description' => ($categories_description_array[$language_id] == '<p />' ? '' : zen_db_prepare_input($categories_description_array[$language_id])));
			
			zen_db_perform(TABLE_CATEGORIES_DESCRIPTION, $sql_data_array, 'update', "categories_id = '" . (int)$categories_id . "' and language_id = '" . (int)$languages[$i]['id'] . "'");
		}
		
		if ($info['categories_image_manual'] != '') {
			// add image manually
			$categories_image_name = $info['img_dir'] . $info['categories_image_manual'];
			$db->Execute("update " . TABLE_CATEGORIES . "
						set categories_image = '" . $categories_image_name . "'
						where categories_id = '" . (int)$categories_id . "'");
		} else {
			if ($categories_image = new upload('categories_image')) {
				$categories_image->set_destination(DIR_FS_CATALOG_IMAGES . $info['img_dir']);
				if ($categories_image->parse() && $categories_image->save()) {
					$categories_image_name = $info['img_dir'] . $categories_image->filename;
				}
				if ($categories_image->filename != 'none' && $categories_image->filename != '' && $info['image_delete'] != "true") {
					// save filename when not set to none and not blank
					$db->Execute("update " . TABLE_CATEGORIES . "
								set categories_image = '" . $categories_image_name . "'
								where categories_id = '" . (int)$categories_id . "'");
				} else {
					// remove filename when set to none and not blank
					if ($categories_image->filename != '' || $info['image_delete'] == "true") {
						$db->Execute("update " . TABLE_CATEGORIES . "
									set categories_image = ''
									where categories_id = '" . (int)$categories_id . "'");
					}
				}
			}
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * delete a category
	 *
	 * @param string $info
	 * @return string
	 */
	public static function category_delete($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		// future cat specific deletion
		$delete_linked = 'true';
		if ($info['delete_linked'] != 'true') {
			$delete_linked = 'false';
		} else {
			$delete_linked = 'true';
		}
		
		// delete category and products
		if (isset($info['categories_id']) && $info['categories_id'] != '' && is_numeric($info['categories_id']) && $info['categories_id'] != 0) {
			$categories_id = zen_db_prepare_input($info['categories_id']);
			
			// create list of any subcategories in the selected category,
			$categories = zen_get_category_tree($categories_id, '', '0', '', true);
			
			zen_set_time_limit(600);
			
			// loop through this cat and subcats for delete-processing.
			for ($i=0, $n=sizeof($categories); $i<$n; $i++) {
				$sql = "select products_id from " . TABLE_PRODUCTS_TO_CATEGORIES . " where categories_id='" . $categories[$i]['id'] . "'";
				$category_products = $db->Execute($sql);
				
				while (!$category_products->EOF) {
					$cascaded_prod_id_for_delete = $category_products->fields['products_id'];
					$cascaded_prod_cat_for_delete = array();
					$cascaded_prod_cat_for_delete[] = $categories[$i]['id'];
					//echo 'processing product_id: ' . $cascaded_prod_id_for_delete . ' in category: ' . $cascaded_prod_cat_for_delete . '<br>';
					
					// determine product-type-specific override script for this product
					$product_type = zen_get_products_type($category_products->fields['products_id']);
					// now loop thru the delete_product_confirm script for each product in the current category
					if (file_exists(DIR_WS_MODULES . $zc_products->get_handler($product_type) . '/delete_product_confirm.php')) {
						require(DIR_WS_MODULES . $zc_products->get_handler($product_type) . '/delete_product_confirm.php');
					} else {
						require(DIR_WS_MODULES . 'delete_product_confirm.php');
					}
					
					// THIS LINE COMMENTED BECAUSE IT'S DONE ALREADY DURING DELETE_PRODUCT_CONFIRM.PHP:
					//zen_remove_product($category_products->fields['products_id'], $delete_linked);
					$category_products->MoveNext();
				}
				
				zen_remove_category($categories[$i]['id']);
			
			} // end for loop
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * move a category
	 *
	 * @param string $info
	 * @return string
	 */
	public static function category_move($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		if (isset($info['categories_id']) && ($info['categories_id'] != $info['move_to_category_id'])) {
			$categories_id = zen_db_prepare_input($info['categories_id']);
			$new_parent_id = zen_db_prepare_input($info['move_to_category_id']);
			
			$path = explode('_', zen_get_generated_category_path_ids($new_parent_id));
			
			if (in_array($categories_id, $path)) {
				return ErrCode::error(API_ERROR_CANNOT_MOVE_CATEGORY_TO_PARENT);
			} else {
			
				$sql = "select count(*) as count from " . TABLE_PRODUCTS_TO_CATEGORIES . " where categories_id='" . (int)$new_parent_id . "'";
				$zc_count_products = $db->Execute($sql);
				
				if ( $zc_count_products->fields['count'] > 0) {
					return ErrCode::error(API_ERROR_CATEGORY_HAS_PRODUCTS);
				}
				
				$db->Execute("update " . TABLE_CATEGORIES . "
							set parent_id = '" . (int)$new_parent_id . "', last_modified = now()
							where categories_id = '" . (int)$categories_id . "'");
				
				// fix here - if this is a category with subcats it needs to know to loop through
				// reset all products_price_sorter for moved category products
				$reset_price_sorter = $db->Execute("select products_id from " . TABLE_PRODUCTS_TO_CATEGORIES . " where categories_id='" . (int)$categories_id . "'");
				while (!$reset_price_sorter->EOF) {
					zen_update_products_price_sorter($reset_price_sorter->fields['products_id']);
					$reset_price_sorter->MoveNext();
				}
			}
		} else {
			return ErrCode::error(API_ERROR_CANNOT_MOVE_CATEGORY_TO_CATEGORY_SELF);
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * add/update/delete a category's meta tags
	 *
	 * @param string $info
	 * @return string
	 */
	public static function category_meta_tags_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		// add or update meta tags
		//die('I SEE ' . $action . ' - ' . $_POST['categories_id']);
		$categories_id = $info['categories_id'];
		$languages = zen_get_languages();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$language_id = $languages[$i]['id'];
			$check = $db->Execute("select *
									from " . TABLE_METATAGS_CATEGORIES_DESCRIPTION . "
									where categories_id = '" . (int)$categories_id . "'
									and language_id = '" . (int)$language_id . "'");
			if ($check->RecordCount() > 0) {
				$action = 'update_category_meta_tags';
			} else {
				$action = 'insert_categories_meta_tags';
			}
			if (empty($info['metatags_title'][$language_id]) && empty($info['metatags_keywords'][$language_id]) && empty($info['metatags_description'][$language_id])) {
				$action = 'delete_category_meta_tags';
			}
			
			$sql_data_array = array('metatags_title' => zen_db_prepare_input($info['metatags_title'][$language_id]),
									'metatags_keywords' => zen_db_prepare_input($info['metatags_keywords'][$language_id]),
									'metatags_description' => zen_db_prepare_input($info['metatags_description'][$language_id]));
			
			if ($action == 'insert_categories_meta_tags') {
				$insert_sql_data = array('categories_id' => $categories_id,
										'language_id' => $language_id);
				$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
				
				zen_db_perform(TABLE_METATAGS_CATEGORIES_DESCRIPTION, $sql_data_array);
			} elseif ($action == 'update_category_meta_tags') {
				zen_db_perform(TABLE_METATAGS_CATEGORIES_DESCRIPTION, $sql_data_array, 'update', "categories_id = '" . (int)$categories_id . "' and language_id = '" . (int)$language_id . "'");
			} elseif ($action == 'delete_category_meta_tags') {
				$remove_categories_metatag = "DELETE from " . TABLE_METATAGS_CATEGORIES_DESCRIPTION . " WHERE categories_id = '" . (int)$categories_id . "' and language_id = '" . (int)$language_id . "'";
				$db->Execute($remove_categories_metatag);
			}
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update category's status
	 *
	 * @param string $info
	 * @return string
	 */
	public static function category_status_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		// disable category and products including subcategories
		if (isset($info['categories_id'])) {
			$categories_id = zen_db_prepare_input($info['categories_id']);
			
			$categories = zen_get_category_tree($categories_id, '', '0', '', true);
			
			for ($i=0, $n=sizeof($categories); $i<$n; $i++) {
				$product_ids = $db->Execute("select products_id
											from " . TABLE_PRODUCTS_TO_CATEGORIES . "
											where categories_id = '" . (int)$categories[$i]['id'] . "'");
				
				while (!$product_ids->EOF) {
					$products[$product_ids->fields['products_id']]['categories'][] = $categories[$i]['id'];
					$product_ids->MoveNext();
				}
			}
			
			// change the status of categories and products
			zen_set_time_limit(600);
			for ($i=0, $n=sizeof($categories); $i<$n; $i++) {
				if ($info['categories_status'] == '1') {
					$categories_status = '0';
					$products_status = '0';
				} else {
					$categories_status = '1';
					$products_status = '1';
				}
				
				$sql = "update " . TABLE_CATEGORIES . " set categories_status='" . $categories_status . "'
						where categories_id='" . $categories[$i]['id'] . "'";
				$db->Execute($sql);
				
				// set products_status based on selection
				if ($info['set_products_status'] == 'set_products_status_nochange') {
					// do not change current product status
				} else {
					if ($info['set_products_status'] == 'set_products_status_on') {
						$products_status = '1';
					} else {
						$products_status = '0';
					}
					
					$sql = "select products_id from " . TABLE_PRODUCTS_TO_CATEGORIES . " where categories_id='" . $categories[$i]['id'] . "'";
					$category_products = $db->Execute($sql);
					
					while (!$category_products->EOF) {
						$sql = "update " . TABLE_PRODUCTS . " set products_status='" . $products_status . "' where products_id='" . $category_products->fields['products_id'] . "'";
						$db->Execute($sql);
						$category_products->MoveNext();
					}
				}
			} // for
		
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
}
?>