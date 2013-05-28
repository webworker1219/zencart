<?php
class ProductsApi extends ApiBase {
	/**
	 * get product list under a parent id
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_list_parent_id($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		switch ($info['sort_order']) {
			case '0':
				$order_by = " order by p.products_sort_order, pd.products_name";
				break;
			case '1':
				$order_by = " order by pd.products_name";
				break;
			case '2';
				$order_by = " order by p.products_model";
				break;
			case '3';
				$order_by = " order by p.products_quantity, pd.products_name";
				break;
			case '4';
				$order_by = " order by p.products_quantity DESC, pd.products_name";
				break;
			case '5';
				$order_by = " order by p.products_price_sorter, pd.products_name";
				break;
			case '6';
				$order_by = " order by p.products_price_sorter DESC, pd.products_name";
				break;
		}
		
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
		
		if (isset($info['search']) && !empty($info['search'])) {
			// fix duplicates and force search to use master_categories_id
			/*
			$products_query_raw = ("select p.products_type, p.products_id, pd.products_name, p.products_quantity,
			p.products_image, p.products_price, p.products_date_added,
			p.products_last_modified, p.products_date_available,
			p.products_status, p2c.categories_id,
			p.products_model,
			p.products_quantity_order_min, p.products_quantity_order_units, p.products_priced_by_attribute,
			p.product_is_free, p.product_is_call, p.products_quantity_mixed, p.product_is_always_free_shipping,
			p.products_quantity_order_max, p.products_sort_order
			from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd, "
			. TABLE_PRODUCTS_TO_CATEGORIES . " p2c
			where p.products_id = pd.products_id
			and pd.language_id = '" . (int)$_SESSION['languages_id'] . "'
			and p.products_id = p2c.products_id
			and (
			pd.products_name like '%" . zen_db_input($_GET['search']) . "%'
			or pd.products_description like '%" . zen_db_input($_GET['search']) . "%'
			or p.products_model like '%" . zen_db_input($_GET['search']) . "%')" .
			$order_by);
			*/
			$products_query_raw = ("select p.products_type, p.products_id, pd.products_name, p.products_quantity,
									p.products_image, p.products_price, p.products_virtual, p.products_date_added,
									p.products_last_modified, p.products_date_available, p.products_weight,
									p.products_status, p.products_ordered, p2c.categories_id,
									p.products_model,
									p.products_quantity_order_min, p.products_quantity_order_units, p.products_priced_by_attribute,
									p.product_is_free, p.product_is_call, p.products_quantity_mixed, p.product_is_always_free_shipping,
									p.products_quantity_order_max, p.products_sort_order,
									p.master_categories_id
									from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd, "
									. TABLE_PRODUCTS_TO_CATEGORIES . " p2c
									where p.products_id = pd.products_id
									and pd.language_id = '" . (int)$_SESSION['languages_id'] . "'
									and (p.products_id = p2c.products_id
									and p.master_categories_id = p2c.categories_id)
									and p2c.categories_id = '" . (int)$info['category_id'] . "'
									and (
									pd.products_name like '%" . zen_db_input($info['search']) . "%'
									or pd.products_description like '%" . zen_db_input($info['search']) . "%'
									or p.products_id = '" . zen_db_input($info['search']) . "'
									or p.products_model like '%" . zen_db_input($info['search']) . "%')" .
									$order_by .
									$limit);
		
		} else {
			$products_query_raw = ("select p.products_type, p.products_id, pd.products_name, p.products_quantity,
									p.products_image, p.products_price, p.products_virtual, p.products_date_added,
									p.products_last_modified, p.products_date_available, p.products_weight,
									p.products_status, p.products_ordered, p.products_model,
									p.products_quantity_order_min, p.products_quantity_order_units, p.products_priced_by_attribute,
									p.product_is_free, p.product_is_call, p.products_quantity_mixed, p.product_is_always_free_shipping,
									p.products_quantity_order_max, p.products_sort_order,
									p.master_categories_id
									from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd, " . TABLE_PRODUCTS_TO_CATEGORIES . " p2c
									where p.products_id = pd.products_id
									and pd.language_id = '" . (int)$_SESSION['languages_id'] . "'
									and (p.products_id = p2c.products_id
									and p.master_categories_id = p2c.categories_id)
									and p2c.categories_id = '" . (int)$info['category_id'] . "'" .
									$order_by .
									$limit);
		}
		$products = $db->Execute($products_query_raw);
		while (!$products->EOF) {
			$item['products_id'] = $products->fields['products_id'];
			$item['products_type'] = $products->fields['products_type'];
			$item['products_quantity'] = $products->fields['products_quantity'];
			$item['products_model'] = $products->fields['products_model'];
			$item['products_image'] = DIR_WS_CATALOG_IMAGES . $products->fields['products_image']; 
			$item['products_price'] = $products->fields['products_price'];
			$item['products_virtual'] = $products->fields['products_virtual'] ? 'true' : 'false';
			$item['products_date_added'] = $products->fields['products_date_added'];
			$item['products_last_modified'] = $products->fields['products_last_modified']; 
			$item['products_date_available'] = $products->fields['products_date_available'];
			$item['products_weight'] = $products->fields['products_weight']; 
			$item['products_status'] = $products->fields['products_status'] ? 'true' : 'false';
			$item['products_ordered'] = $products->fields['products_ordered'];
			$item['products_quantity_order_min'] = $products->fields['products_quantity_order_min'];
			$item['products_quantity_order_units'] = $products->fields['products_quantity_order_units'];
			$item['products_priced_by_attribute'] = $products->fields['products_priced_by_attribute'] ? 'true' : 'false';
			$item['product_is_free'] = $products->fields['product_is_free'] ? 'true' : 'false';
			$item['product_is_call'] = $products->fields['product_is_call'] ? 'true' : 'false';
			$item['products_quantity_mixed'] = $products->fields['products_quantity_mixed'] ? 'true' : 'false';
			$item['product_is_always_free_shipping'] = $products->fields['product_is_always_free_shipping'] ? 'true' : 'false';
			$item['products_quantity_order_max'] = $products->fields['products_quantity_order_max']; 
			$item['master_categories_id'] = $products->fields['master_categories_id'];
			
			$item['products_name'] = $products->fields['products_name'];
			$item['products_sort_order'] = $products->fields['products_sort_order'];
			
			$return[] = $item;
			$products->MoveNext();
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * get product's information
	 *
	 * @param string $products_id
	 * @return string
	 */
	public static function product_list_id($products_id) {
		$db = parent::prepare_db();
		$products_id = parent::prepare_input($products_id);
		$products_id = $products_id[0];
		$return = array();
		
		$product = $db->Execute("select pd.products_name, pd.products_description, pd.products_url,
                                      p.products_id, p.products_quantity, p.products_model,
                                      p.products_image, p.products_price, p.products_virtual, p.products_weight,
                                      p.products_date_added, p.products_last_modified,
                                      date_format(p.products_date_available, '%Y-%m-%d') as
                                      products_date_available, p.products_status, p.products_tax_class_id,
                                      p.manufacturers_id,
                                      p.products_quantity_order_min, p.products_quantity_order_units, p.products_priced_by_attribute,
                                      p.product_is_free, p.product_is_call, p.products_quantity_mixed,
                                      p.product_is_always_free_shipping, p.products_qty_box_status, p.products_quantity_order_max,
                                      p.products_sort_order,
                                      p.products_discount_type, p.products_discount_type_from,
                                      p.products_price_sorter, p.master_categories_id
                              from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd
                              where p.products_id = '" . (int)$products_id . "'
                              and p.products_id = pd.products_id
                              and pd.language_id = '" . (int)$_SESSION['languages_id'] . "'");
		$pInfo = new objectInfo($product->fields);
		//$produtc_more_pic=$db->Execute("select products_image from products_addition_image where products_id =".$pInfo->products_id." ");
		$pInfo->products_image1=$produtc_more_pic->fields['products_image'];
		$languages = zen_get_languages();
		
		$return['products_id'] = $pInfo->products_id;
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$return['products_name'][$languages[$i]['id']] = htmlspecialchars(zen_get_products_name($pInfo->products_id, $languages[$i]['id']));
			$return['products_description'][$languages[$i]['id']] = zen_get_products_description($pInfo->products_id, $languages[$i]['id']);
			$return['products_url'][$languages[$i]['id']] = zen_get_products_url($pInfo->products_id, $languages[$i]['id']);
		}
		$return['products_quantity'] = $pInfo->products_quantity;
		$return['products_model'] = $pInfo->products_model;
		$return['products_image'] = DIR_WS_CATALOG_IMAGES . $pInfo->products_image;
		$return['products_image1'] = $pInfo->products_image1;
		$return['products_price'] = $pInfo->products_price;
		$return['products_virtual'] = $pInfo->products_virtual ? 'true' : 'false';
		$return['products_weight'] = $pInfo->products_weight;
		$return['products_date_added'] = $pInfo->products_date_added;
		$return['products_last_modified'] = $pInfo->products_last_modified;
		$return['products_date_available'] = $pInfo->products_date_available;
		$return['products_status'] = $pInfo->products_status ? 'true' : 'false';
		$return['products_tax_class_id'] = $pInfo->products_tax_class_id;
		$return['manufacturers_id'] = $pInfo->manufacturers_id;
		$return['products_quantity_order_min'] = $pInfo->products_quantity_order_min;
		$return['products_quantity_order_units'] = $pInfo->products_quantity_order_units;
		$return['products_priced_by_attribute'] = $pInfo->products_priced_by_attribute ? 'true' : 'false';
		$return['product_is_free'] = $pInfo->product_is_free ? 'true' : 'false';
		$return['product_is_call'] = $pInfo->product_is_call ? 'true' : 'false';
		$return['products_quantity_mixed'] = $pInfo->products_quantity_mixed ? 'true' : 'false';
		$return['product_is_always_free_shipping'] = $pInfo->product_is_always_free_shipping ? 'true' : 'false';
		$return['products_qty_box_status'] = $pInfo->products_qty_box_status ? 'true' : 'false';
		$return['products_quantity_order_max'] = $pInfo->products_quantity_order_max;
		$return['products_sort_order'] = $pInfo->products_sort_order;
		$return['products_discount_type'] = $pInfo->products_discount_type;
		$return['products_discount_type_from'] = $pInfo->products_discount_type_from;
		$return['products_price_sorter'] = $pInfo->products_price_sorter;
		$return['master_categories_id'] = $pInfo->master_categories_id;
		
		return parent::prepare_output($return);
	}
	
	/**
	 * add a new product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_add($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$products_date_available = zen_db_prepare_input($info['products_date_available']);
		
		$products_date_available = (date('Y-m-d') < $products_date_available) ? $products_date_available : 'null';
		
		// Data-cleaning to prevent MySQL5 data-type mismatch errors:
		$tmp_value = zen_db_prepare_input($info['products_quantity']);
		$products_quantity = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		$tmp_value = zen_db_prepare_input($info['products_price']);
		$products_price = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		$tmp_value = zen_db_prepare_input($info['products_weight']);
		$products_weight = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		$tmp_value = zen_db_prepare_input($info['manufacturers_id']);
		$manufacturers_id = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		
		$sql_data_array = array(
			'products_quantity' => $products_quantity,
			'products_type' => zen_db_prepare_input($info['product_type']),
			'products_model' => zen_db_prepare_input($info['products_model']),
			'products_price' => $products_price,
			'products_date_available' => $products_date_available,
			'products_weight' => $products_weight,
			'products_status' => zen_db_prepare_input($info['products_status'] == 'true' ? 1 : 0),
			'products_virtual' => zen_db_prepare_input($info['products_virtual'] == 'true' ? 1 : 0),
			'products_tax_class_id' => zen_db_prepare_input((int)$info['products_tax_class_id']),
			'manufacturers_id' => $manufacturers_id,
			'products_quantity_order_min' => zen_db_prepare_input($info['products_quantity_order_min']),
			'products_quantity_order_units' => zen_db_prepare_input($info['products_quantity_order_units']),
			'products_priced_by_attribute' => zen_db_prepare_input($info['products_priced_by_attribute'] == 'true' ? 1 : 0),
			'product_is_free' => zen_db_prepare_input($info['product_is_free'] == 'true' ? 1 : 0),
			'product_is_call' => zen_db_prepare_input($info['product_is_call'] == 'true' ? 1 : 0),
			'products_quantity_mixed' => zen_db_prepare_input($info['products_quantity_mixed'] == 'true' ? 1 : 0),
			'product_is_always_free_shipping' => zen_db_prepare_input($info['product_is_always_free_shipping'] == 'true' ? 1 : 0),
			'products_qty_box_status' => zen_db_prepare_input($info['products_qty_box_status'] == 'true' ? 1 : 0),
			'products_quantity_order_max' => zen_db_prepare_input($info['products_quantity_order_max']),
			'products_sort_order' => (int)zen_db_prepare_input($info['products_sort_order']),
			'products_discount_type' => zen_db_prepare_input($info['products_discount_type']),
			'products_discount_type_from' => zen_db_prepare_input($info['products_discount_type_from']),
			'products_price_sorter' => zen_db_prepare_input($info['products_price_sorter']),
			'products_jmw_api' => zen_db_prepare_input($info['products_jmw_api'])
		);
		
		// when set to none remove from database
		// is out dated for browsers use radio only
		$sql_data_array['products_image'] = parent::products_urlimage_handle(zen_db_prepare_input($info['products_image']));
		
		$new_image= 'true';
		
		if ($info['image_delete'] == 'true') {
			$sql_data_array['products_image'] = '';
			$new_image= 'false';
		}
		
		$insert_sql_data = array( 
			'products_date_added' => 'now()',
			'master_categories_id' => (int)$info['master_categories_id'],
		);
		
		$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
		
		zen_db_perform(TABLE_PRODUCTS, $sql_data_array);
		$products_id = mysql_insert_id();
		

		// reset products_price_sorter for searches etc.
		zen_update_products_price_sorter($products_id);
		
		$db->Execute("insert into " . TABLE_PRODUCTS_TO_CATEGORIES . "
					(products_id, categories_id)
					values ('" . (int)$products_id . "', '" . (int)$info['master_categories_id'] . "')");
		//$db->Execute("insert into products_addition_image
		//			(products_id, products_image)
		//			values ('" . (int)$products_id . "', '" . zen_db_prepare_input($info['products_image1']) . "')");
		
		
		
		$languages = parent::zen_get_languages_mzt();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$language_id = $languages[$i]['id'];
			
			$sql_data_array = array(
				'products_name' => $db->prepare_input($info['products_name'][$language_id]),
				'products_description' => $db->prepare_input($info['products_description'][$language_id]),
				'products_url' => zen_db_prepare_input($info['products_url'][$language_id])
			);
			
			$insert_sql_data = array(
				'products_id' => $products_id,
				'language_id' => $language_id
			);
			
			$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
			
			zen_db_perform(TABLE_PRODUCTS_DESCRIPTION, $sql_data_array);
		}
		
		// add meta tags
		/*$languages = zen_get_languages();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$language_id = $languages[$i]['id'];
			
			$sql_data_array = array(
				'metatags_title' => zen_db_prepare_input($_POST['metatags_title'][$language_id]),
				'metatags_keywords' => zen_db_prepare_input($_POST['metatags_keywords'][$language_id]),
				'metatags_description' => zen_db_prepare_input($_POST['metatags_description'][$language_id])
			);
			
			
			$insert_sql_data = array(
				'products_id' => $products_id,
				'language_id' => $language_id
			);
			
			$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
			
			zen_db_perform(TABLE_META_TAGS_PRODUCTS_DESCRIPTION, $sql_data_array);
		}*/
		
		
		// future image handler code
		/*define('IMAGE_MANAGER_HANDLER', 0);
		define('DIR_IMAGEMAGICK', '');
		if ($new_image == 'true' and IMAGE_MANAGER_HANDLER >= 1) {
			$src= DIR_FS_CATALOG . DIR_WS_IMAGES . zen_get_products_image((int)$products_id);
			$filename_small= $src;
			preg_match("/.*\/(.*)\.(\w*)$/", $src, $fname);
			list($oiwidth, $oiheight, $oitype) = getimagesize($src);
			
			$small_width= SMALL_IMAGE_WIDTH;
			$small_height= SMALL_IMAGE_HEIGHT;
			$medium_width= MEDIUM_IMAGE_WIDTH;
			$medium_height= MEDIUM_IMAGE_HEIGHT;
			$large_width= LARGE_IMAGE_WIDTH;
			$large_height= LARGE_IMAGE_HEIGHT;
			
			$k = max($oiheight / $small_height, $oiwidth / $small_width); //use smallest size
			$small_width = round($oiwidth / $k);
			$small_height = round($oiheight / $k);
			
			$k = max($oiheight / $medium_height, $oiwidth / $medium_width); //use smallest size
			$medium_width = round($oiwidth / $k);
			$medium_height = round($oiheight / $k);
			
			$large_width= $oiwidth;
			$large_height= $oiheight;
			
			$products_image = zen_get_products_image((int)$products_id);
			$products_image_extension = substr($products_image, strrpos($products_image, '.'));
			$products_image_base = preg_replace('/'.$products_image_extension.'/', '', $products_image);
			
			$filename_medium = DIR_FS_CATALOG . DIR_WS_IMAGES . 'medium/' . $products_image_base . IMAGE_SUFFIX_MEDIUM . '.' . $fname[2];
			$filename_large = DIR_FS_CATALOG . DIR_WS_IMAGES . 'large/' . $products_image_base . IMAGE_SUFFIX_LARGE . '.' . $fname[2];
			
			// ImageMagick
			if (IMAGE_MANAGER_HANDLER == '1') {
				copy($src, $filename_large);
				copy($src, $filename_medium);
				exec(DIR_IMAGEMAGICK . "mogrify -geometry " . $large_width . " " . $filename_large);
				exec(DIR_IMAGEMAGICK . "mogrify -geometry " . $medium_width . " " . $filename_medium);
				exec(DIR_IMAGEMAGICK . "mogrify -geometry " . $small_width . " " . $filename_small);
			}
		}*/
		
		$return[] = '1';
		$return[] =$products_id;
		return parent::prepare_output($return);
	}
	
	/**
	 * update a product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$products_id = zen_db_prepare_input($info['products_id']);
		$products_date_available = zen_db_prepare_input($info['products_date_available']);
		
		$products_date_available = (date('Y-m-d') < $products_date_available) ? $products_date_available : 'null';
		
		// Data-cleaning to prevent MySQL5 data-type mismatch errors:
		$tmp_value = zen_db_prepare_input($info['products_quantity']);
		$products_quantity = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		$tmp_value = zen_db_prepare_input($info['products_price']);
		$products_price = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		$tmp_value = zen_db_prepare_input($info['products_weight']);
		$products_weight = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		$tmp_value = zen_db_prepare_input($info['manufacturers_id']);
		$manufacturers_id = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		
		$sql_data_array = array(
			'products_quantity' => $products_quantity,
			'products_type' => zen_db_prepare_input($info['product_type']),
			'products_model' => zen_db_prepare_input($info['products_model']),
			'products_price' => $products_price,
			'products_date_available' => $products_date_available,
			'products_weight' => $products_weight,
			'products_status' => zen_db_prepare_input($info['products_status'] == 'true' ? 1 : 0),
			'products_virtual' => zen_db_prepare_input($info['products_virtual'] == 'true' ? 1 : 0),
			'products_tax_class_id' => zen_db_prepare_input((int)$info['products_tax_class_id']),
			'manufacturers_id' => $manufacturers_id,
			'products_quantity_order_min' => zen_db_prepare_input($info['products_quantity_order_min']),
			'products_quantity_order_units' => zen_db_prepare_input($info['products_quantity_order_units']),
			'products_priced_by_attribute' => zen_db_prepare_input($info['products_priced_by_attribute'] == 'true' ? 1 : 0),
			'product_is_free' => zen_db_prepare_input($info['product_is_free'] == 'true' ? 1 : 0),
			'product_is_call' => zen_db_prepare_input($info['product_is_call'] == 'true' ? 1 : 0),
			'products_quantity_mixed' => zen_db_prepare_input($info['products_quantity_mixed'] == 'true' ? 1 : 0),
			'product_is_always_free_shipping' => zen_db_prepare_input($info['product_is_always_free_shipping'] == 'true' ? 1 : 0),
			'products_qty_box_status' => zen_db_prepare_input($info['products_qty_box_status'] == 'true' ? 1 : 0),
			'products_quantity_order_max' => zen_db_prepare_input($info['products_quantity_order_max']),
			'products_sort_order' => (int)zen_db_prepare_input($info['products_sort_order']),
			'products_discount_type' => zen_db_prepare_input($info['products_discount_type']),
			'products_discount_type_from' => zen_db_prepare_input($info['products_discount_type_from']),
			'products_price_sorter' => zen_db_prepare_input($info['products_price_sorter'])
		);
		
		// when set to none remove from database
		// is out dated for browsers use radio only
		$sql_data_array['products_image'] = zen_db_prepare_input($info['products_image']);
		$new_image= 'true';
		
		if ($info['image_delete'] == 'true') {
			$sql_data_array['products_image'] = '';
			$new_image= 'false';
		}
		
		$update_sql_data = array( 
			'products_last_modified' => 'now()',
			'master_categories_id' => ($info['master_category'] > 0 ? zen_db_prepare_input($info['master_category']) : zen_db_prepare_input($info['master_categories_id']))
		);
		
		$sql_data_array = array_merge($sql_data_array, $update_sql_data);
		
		zen_db_perform(TABLE_PRODUCTS, $sql_data_array, 'update', "products_id = '" . (int)$products_id . "'");
		
		// reset products_price_sorter for searches etc.
		zen_update_products_price_sorter((int)$products_id);
		/*$db->Execute("update products_addition_image
					set products_image='".zen_db_prepare_input($info['products_image1'])."' where products_id=".(int)$products_id." ");*/
		///////////////////////////////////////////////////////
		//// INSERT PRODUCT-TYPE-SPECIFIC *UPDATES* HERE //////
		
		
		////    *END OF PRODUCT-TYPE-SPECIFIC UPDATES* ////////
		///////////////////////////////////////////////////////
		
		$languages = parent::zen_get_languages_mzt();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$language_id = $languages[$i]['id'];
			
			$sql_data_array = array(
				'products_name' => zen_db_prepare_input($info['products_name'][$language_id]),
				'products_description' => zen_db_prepare_input($info['products_description'][$language_id]),
				'products_url' => zen_db_prepare_input($info['products_url'][$language_id])
			);
			
			zen_db_perform(TABLE_PRODUCTS_DESCRIPTION, $sql_data_array, 'update', "products_id = '" . (int)$products_id . "' and language_id = '" . (int)$language_id . "'");
		}
		
		// add meta tags
		/*$languages = zen_get_languages();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$language_id = $languages[$i]['id'];
			
			$sql_data_array = array(
				'metatags_title' => zen_db_prepare_input($info['metatags_title'][$language_id]),
				'metatags_keywords' => zen_db_prepare_input($info['metatags_keywords'][$language_id]),
				'metatags_description' => zen_db_prepare_input($info['metatags_description'][$language_id])
			);
			
			zen_db_perform(TABLE_META_TAGS_PRODUCTS_DESCRIPTION, $sql_data_array, 'update', "products_id = '" . (int)$products_id . "' and language_id = '" . (int)$language_id . "'");
		}*/
		
		
		// future image handler code
		/*define('IMAGE_MANAGER_HANDLER', 0);
		define('DIR_IMAGEMAGICK', '');
		if ($new_image == 'true' and IMAGE_MANAGER_HANDLER >= 1) {
			$src= DIR_FS_CATALOG . DIR_WS_IMAGES . zen_get_products_image((int)$products_id);
			$filename_small= $src;
			preg_match("/.*\/(.*)\.(\w*)$/", $src, $fname);
			list($oiwidth, $oiheight, $oitype) = getimagesize($src);
			
			$small_width= SMALL_IMAGE_WIDTH;
			$small_height= SMALL_IMAGE_HEIGHT;
			$medium_width= MEDIUM_IMAGE_WIDTH;
			$medium_height= MEDIUM_IMAGE_HEIGHT;
			$large_width= LARGE_IMAGE_WIDTH;
			$large_height= LARGE_IMAGE_HEIGHT;
			
			$k = max($oiheight / $small_height, $oiwidth / $small_width); //use smallest size
			$small_width = round($oiwidth / $k);
			$small_height = round($oiheight / $k);
			
			$k = max($oiheight / $medium_height, $oiwidth / $medium_width); //use smallest size
			$medium_width = round($oiwidth / $k);
			$medium_height = round($oiheight / $k);
			
			$large_width= $oiwidth;
			$large_height= $oiheight;
			
			$products_image = zen_get_products_image((int)$products_id);
			$products_image_extension = substr($products_image, strrpos($products_image, '.'));
			$products_image_base = preg_replace('/'.$products_image_extension.'/', '', $products_image);
			
			$filename_medium = DIR_FS_CATALOG . DIR_WS_IMAGES . 'medium/' . $products_image_base . IMAGE_SUFFIX_MEDIUM . '.' . $fname[2];
			$filename_large = DIR_FS_CATALOG . DIR_WS_IMAGES . 'large/' . $products_image_base . IMAGE_SUFFIX_LARGE . '.' . $fname[2];
			
			// ImageMagick
			if (IMAGE_MANAGER_HANDLER == '1') {
				copy($src, $filename_large);
				copy($src, $filename_medium);
				exec(DIR_IMAGEMAGICK . "mogrify -geometry " . $large_width . " " . $filename_large);
				exec(DIR_IMAGEMAGICK . "mogrify -geometry " . $medium_width . " " . $filename_medium);
				exec(DIR_IMAGEMAGICK . "mogrify -geometry " . $small_width . " " . $filename_small);
			}
		}*/
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * delete a product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_delete($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$delete_linked = $info['delete_linked'];
		$do_delete_flag = false;
		//echo 'products_id=' . $_POST['products_id'] . '<br />';
		if (isset($info['products_id']) && isset($info['product_categories']) && is_array($info['product_categories'])) {
			$product_id = zen_db_prepare_input($info['products_id']);
			$product_categories = $info['product_categories'];
			$do_delete_flag = true;
			if (!isset($delete_linked)) $delete_linked = 'true';
		}
		
		/*if (zen_not_null($cascaded_prod_id_for_delete) && zen_not_null($cascaded_prod_cat_for_delete) ) {
			$product_id = $cascaded_prod_id_for_delete;
			$product_categories = $cascaded_prod_cat_for_delete;
			$do_delete_flag = true;
			// no check for $delete_linked here, because it should already be passed from categories.php
		}*/
		
		if ($do_delete_flag) {
			//--------------PRODUCT_TYPE_SPECIFIC_INSTRUCTIONS_GO__BELOW_HERE--------------------------------------------------------
			
			
			//--------------PRODUCT_TYPE_SPECIFIC_INSTRUCTIONS_GO__ABOVE__HERE--------------------------------------------------------
			
			
			// now do regular non-type-specific delete:
			
			// remove product from all its categories:
			for ($k=0, $m=sizeof($product_categories); $k<$m; $k++) {
				$db->Execute("delete from " . TABLE_PRODUCTS_TO_CATEGORIES . "
							where products_id = '" . (int)$product_id . "'
							and categories_id = '" . (int)$product_categories[$k] . "'");
			}
			// confirm that product is no longer linked to any categories
			$count_categories = $db->Execute("select count(categories_id) as total
											from " . TABLE_PRODUCTS_TO_CATEGORIES . "
											where products_id = '" . (int)$product_id . "'");
			// echo 'count of category links for this product=' . $count_categories->fields['total'] . '<br />';
			
			// if not linked to any categories, do delete:
			if ($count_categories->fields['total'] == '0') {
				zen_remove_product($product_id, $delete_linked);
			}
		
		} // endif $do_delete_flag
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * move a product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_move($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$products_id = zen_db_prepare_input($info['products_id']);
		$new_parent_id = zen_db_prepare_input($info['move_to_category_id']);
		$current_category_id = $info['current_category_id'];
		
		$duplicate_check = $db->Execute("select count(*) as total
										from " . TABLE_PRODUCTS_TO_CATEGORIES . "
										where products_id = '" . (int)$products_id . "'
										and categories_id = '" . (int)$new_parent_id . "'");
		
		if ($duplicate_check->fields['total'] < 1) {
			$db->Execute("update " . TABLE_PRODUCTS_TO_CATEGORIES . "
						set categories_id = '" . (int)$new_parent_id . "'
						where products_id = '" . (int)$products_id . "'
						and categories_id = '" . (int)$current_category_id . "'");
			
			// reset master_categories_id if moved from original master category
			$check_master = $db->Execute("select products_id, master_categories_id from " . TABLE_PRODUCTS . " where products_id='" .  (int)$products_id . "'");
			if ($check_master->fields['master_categories_id'] == (int)$current_category_id) {
				$db->Execute("update " . TABLE_PRODUCTS . "
							set master_categories_id='" . (int)$new_parent_id . "'
							where products_id = '" . (int)$products_id . "'");
			}
			
			// reset products_price_sorter for searches etc.
			zen_update_products_price_sorter((int)$products_id);
		} else {
			//$messageStack->add_session(ERROR_CANNOT_MOVE_PRODUCT_TO_CATEGORY_SELF, 'error');
			return ErrCode::error(API_ERROR_CANNOT_MOVE_PRODUCT_TO_CATEGORY_SELF);
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * copy a product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_copy($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		if (isset($info['products_id']) && isset($info['categories_id'])) {
			$products_id = zen_db_prepare_input($info['products_id']);
			$categories_id = zen_db_prepare_input($info['categories_id']);
			$current_category_id = $info['current_category_id'];
			
			// Copy attributes to duplicate product
			$products_id_from=$products_id;
			
			if ($info['copy_as'] == 'link') {
				if ($categories_id != $current_category_id) {
					$check = $db->Execute("select count(*) as total
										from " . TABLE_PRODUCTS_TO_CATEGORIES . "
										where products_id = '" . (int)$products_id . "'
										and categories_id = '" . (int)$categories_id . "'");
					if ($check->fields['total'] < '1') {
						$db->Execute("insert into " . TABLE_PRODUCTS_TO_CATEGORIES . "
									(products_id, categories_id)
									values ('" . (int)$products_id . "', '" . (int)$categories_id . "')");
					}
				} else {
					//$messageStack->add_session(ERROR_CANNOT_LINK_TO_SAME_CATEGORY, 'error');
					return ErrCode::error(API_ERROR_CANNOT_LINK_TO_SAME_CATEGORY);
				}
			} elseif ($info['copy_as'] == 'duplicate') {
				$old_products_id = (int)$products_id;
				$product = $db->Execute("select products_type, products_quantity, products_model, products_image,
										products_price, products_virtual, products_date_available, products_weight,
										products_tax_class_id, manufacturers_id,
										products_quantity_order_min, products_quantity_order_units, products_priced_by_attribute,
										product_is_free, product_is_call, products_quantity_mixed,
										product_is_always_free_shipping, products_qty_box_status, products_quantity_order_max, products_sort_order,
										products_price_sorter, master_categories_id
										from " . TABLE_PRODUCTS . "
										where products_id = '" . (int)$products_id . "'");
				
				$tmp_value = zen_db_input($product->fields['products_quantity']);
				$products_quantity = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
				$tmp_value = zen_db_input($product->fields['products_price']);
				$products_price = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
				$tmp_value = zen_db_input($product->fields['products_weight']);
				$products_weight = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
				
				$db->Execute("insert into " . TABLE_PRODUCTS . "
							(products_type, products_quantity, products_model, products_image,
							products_price, products_virtual, products_date_added, products_date_available,
							products_weight, products_status, products_tax_class_id,
							manufacturers_id,
							products_quantity_order_min, products_quantity_order_units, products_priced_by_attribute,
							product_is_free, product_is_call, products_quantity_mixed,
							product_is_always_free_shipping, products_qty_box_status, products_quantity_order_max, products_sort_order,
							products_price_sorter, master_categories_id
							)
							values ('" . zen_db_input($product->fields['products_type']) . "',
							'" . $products_quantity . "',
							'" . zen_db_input($product->fields['products_model']) . "',
							'" . zen_db_input($product->fields['products_image']) . "',
							'" . $products_price . "',
							'" . zen_db_input($product->fields['products_virtual']) . "',
							now(),
							'" . (zen_not_null(zen_db_input($product->fields['products_date_available'])) ? zen_db_input($product->fields['products_date_available']) : '0001-01-01 00:00:00') . "',
							'" . $products_weight . "', '0',
							'" . (int)$product->fields['products_tax_class_id'] . "',
							'" . (int)$product->fields['manufacturers_id'] . "',
							'" . zen_db_input($product->fields['products_quantity_order_min']) . "',
							'" . zen_db_input($product->fields['products_quantity_order_units']) . "',
							'" . zen_db_input($product->fields['products_priced_by_attribute']) . "',
							'" . (int)$product->fields['product_is_free'] . "',
							'" . (int)$product->fields['product_is_call'] . "',
							'" . (int)$product->fields['products_quantity_mixed'] . "',
							'" . zen_db_input($product->fields['product_is_always_free_shipping']) . "',
							'" . zen_db_input($product->fields['products_qty_box_status']) . "',
							'" . zen_db_input($product->fields['products_quantity_order_max']) . "',
							'" . zen_db_input($product->fields['products_sort_order']) . "',
							'" . zen_db_input($product->fields['products_price_sorter']) . "',
							'" . zen_db_input($categories_id) .
							"')");
				
				$dup_products_id = $db->Insert_ID();
				
				$addtion_image=$db->Execute("select products_image from products_addition_image where products_id = '" . (int)$products_id . "'");
				
				
				$db->Execute("insert into products_addition_image(products_id,products_image) values('".(int)$dup_products_id."','".zen_db_input($addtion_image->fields['products_image'])."')");
				
				$description = $db->Execute("select language_id, products_name, products_description,
											products_url
											from " . TABLE_PRODUCTS_DESCRIPTION . "
											where products_id = '" . (int)$products_id . "'");
				while (!$description->EOF) {
					$db->Execute("insert into " . TABLE_PRODUCTS_DESCRIPTION . "
								(products_id, language_id, products_name, products_description,
								products_url, products_viewed)
								values ('" . (int)$dup_products_id . "',
								'" . (int)$description->fields['language_id'] . "',
								'" . zen_db_input($description->fields['products_name']) . "',
								'" . zen_db_input($description->fields['products_description']) . "',
								'" . zen_db_input($description->fields['products_url']) . "', '0')");
					$description->MoveNext();
				}
				
				$db->Execute("insert into " . TABLE_PRODUCTS_TO_CATEGORIES . "
							(products_id, categories_id)
							values ('" . (int)$dup_products_id . "', '" . (int)$categories_id . "')");
				$products_id = $dup_products_id;
				$description->MoveNext();
				// FIX HERE
				/////////////////////////////////////////////////////////////////////////////////////////////
				// Copy attributes to duplicate product
				// moved above            $products_id_from=zen_db_input($products_id);
				$products_id_to= $dup_products_id;
				$products_id = $dup_products_id;
				
				if ( $info['copy_attributes']=='true' and $info['copy_as'] == 'duplicate' ) {
					// $products_id_to= $copy_to_products_id;
					// $products_id_from = $pID;
					//            $copy_attributes_delete_first='1';
					//            $copy_attributes_duplicates_skipped='1';
					//            $copy_attributes_duplicates_overwrite='0';
					
					if (DOWNLOAD_ENABLED == 'true') {
						$copy_attributes_include_downloads='1';
						$copy_attributes_include_filename='1';
					} else {
						$copy_attributes_include_downloads='0';
						$copy_attributes_include_filename='0';
					}
					
					zen_copy_products_attributes($products_id_from, $products_id_to);
				}
				// EOF: Attributes Copy on non-linked
				/////////////////////////////////////////////////////////////////////
				
				// copy product discounts to duplicate
				if ($info['copy_discounts'] == 'true') {
					zen_copy_discounts_to_product($old_products_id, (int)$dup_products_id);
				}
			
			}
			
			// reset products_price_sorter for searches etc.
			zen_update_products_price_sorter($products_id);
			
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * get product's meta tags
	 *
	 * @param string $products_id
	 * @return string
	 */
	public static function product_meta_tags_id($products_id) {
		$db = parent::prepare_db();
		$products_id = parent::prepare_input($products_id);
		$products_id = $products_id[0];
		$return = array();
		
		$check_meta_tags_description = $db->Execute("select products_id from " . TABLE_META_TAGS_PRODUCTS_DESCRIPTION . " where products_id='" . (int)$products_id . "'");
		if ($check_meta_tags_description->RecordCount() <= 0) {
			$product = $db->Execute("select pd.products_name, p.products_model, p.products_price_sorter,
									p.metatags_title_status, p.metatags_products_name_status, p.metatags_model_status,
									p.products_id, p.metatags_price_status, p.metatags_title_tagline_status
									from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd
									where p.products_id = '" . (int)$products_id . "'
									and p.products_id = pd.products_id
									and pd.language_id = '" . (int)$_SESSION['languages_id'] . "'");
		} else {
			$product = $db->Execute("select pd.products_name, p.products_model, p.products_price_sorter,
									p.metatags_title_status, p.metatags_products_name_status, p.metatags_model_status,
									p.products_id, p.metatags_price_status, p.metatags_title_tagline_status,
									mtpd.metatags_title, mtpd.metatags_keywords, mtpd.metatags_description
									from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd, " . TABLE_META_TAGS_PRODUCTS_DESCRIPTION . " mtpd
									where p.products_id = '" . (int)$products_id . "'
									and p.products_id = pd.products_id
									and pd.language_id = '" . (int)$_SESSION['languages_id'] . "'
									and p.products_id = mtpd.products_id
									and mtpd.language_id = '" . (int)$_SESSION['languages_id'] . "'");
		}
		
		$pInfo = new objectInfo($product->fields);
		
		$return['products_id'] = $pInfo->products_id;
		$return['metatags_title_status'] = $pInfo->metatags_title_status ? 'true' : 'false';
		$return['metatags_products_name_status'] = $pInfo->metatags_products_name_status ? 'true' : 'false';
		$return['metatags_model_status'] = $pInfo->metatags_model_status ? 'true' : 'false';
		$return['metatags_price_status'] = $pInfo->metatags_price_status ? 'true' : 'false';
		$return['metatags_title_tagline_status'] = $pInfo->metatags_title_tagline_status ? 'true' : 'false';
		$languages = zen_get_languages();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$return['metatags_title'][$languages[$i]['id']] = zen_get_metatags_title($pInfo->products_id, $languages[$i]['id']);
			$return['metatags_keywords'][$languages[$i]['id']] = zen_get_metatags_keywords($pInfo->products_id, $languages[$i]['id']);
			$return['metatags_description'][$languages[$i]['id']] = zen_get_metatags_description($pInfo->products_id, $languages[$i]['id']);
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * add or update or delete meta tags
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_meta_tags_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$products_id = zen_db_prepare_input($info['products_id']);
		//$products_date_available = zen_db_prepare_input($info['products_date_available']);
		
		//$products_date_available = (date('Y-m-d') < $products_date_available) ? $products_date_available : 'null';
		
		$sql_data_array = array(
			'metatags_title_status' => zen_db_prepare_input($info['metatags_title_status'] == 'true' ? 1 : 0),
			'metatags_products_name_status' => zen_db_prepare_input($info['metatags_products_name_status'] == 'true' ? 1 : 0),
			'metatags_model_status' => zen_db_prepare_input($info['metatags_model_status'] == 'true' ? 1 : 0),
			'metatags_price_status' => zen_db_prepare_input($info['metatags_price_status'] == 'true' ? 1 : 0),
			'metatags_title_tagline_status' => zen_db_prepare_input($info['metatags_title_tagline_status'] == 'true' ? 1 : 0)
		);

		$update_sql_data = array( 'products_last_modified' => 'now()');
		
		$sql_data_array = array_merge($sql_data_array, $update_sql_data);
		//die('UPDATE PRODUCTS ID:' . (int)$products_id . ' - ' . sizeof($sql_data_array));
		zen_db_perform(TABLE_PRODUCTS, $sql_data_array, 'update', "products_id = '" . (int)$products_id . "'");

		// check if new meta tags or existing
		$check_meta_tags_description = $db->Execute("select products_id from " . TABLE_META_TAGS_PRODUCTS_DESCRIPTION . " where products_id='" . $products_id . "'");
		$action = 'update_product_meta_tags';
		if ($check_meta_tags_description->RecordCount() <= 0) {
			$action = 'new_product_meta_tags';
		}
		
		$languages = zen_get_languages();
		for ($i=0, $n=sizeof($languages); $i<$n; $i++) {
			$language_id = $languages[$i]['id'];
			
			$sql_data_array = array(
				'metatags_title' => zen_db_prepare_input($info['metatags_title'][$language_id]),
				'metatags_keywords' => zen_db_prepare_input($info['metatags_keywords'][$language_id]),
				'metatags_description' => zen_db_prepare_input($info['metatags_description'][$language_id])
			);

			if ($action == 'new_product_meta_tags') {
				$insert_sql_data = array(
					'products_id' => $products_id,
					'language_id' => $language_id
				);
				
				$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
				
				zen_db_perform(TABLE_META_TAGS_PRODUCTS_DESCRIPTION, $sql_data_array);
			} elseif ($action == 'update_product_meta_tags') {
				if (empty($info['metatags_title'][$language_id]) && empty($info['metatags_keywords'][$language_id]) && empty($info['metatags_description'][$language_id])) {
					$remove_products_metatag = "DELETE from " . TABLE_META_TAGS_PRODUCTS_DESCRIPTION . " WHERE products_id = '" . (int)$products_id . "' and language_id = '" . (int)$language_id . "'";
					$db->Execute($remove_products_metatag);
				} else {
				
					zen_db_perform(TABLE_META_TAGS_PRODUCTS_DESCRIPTION, $sql_data_array, 'update', "products_id = '" . (int)$products_id . "' and language_id = '" . (int)$language_id . "'");
				}
			}
		}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update product's status
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_status_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		//zen_set_product_status($info['products_id'], $info['flag']);
		$products_id  = $info['products_id'];
		$status       = $info['flag'];
		if ($status == '1') {
              $db->Execute("update " . TABLE_PRODUCTS . "
                           set products_status = 1, products_last_modified = now()
                           where products_id = '" . (int)$products_id . "'");

        } elseif ($status == '0') {
              $db->Execute("update " . TABLE_PRODUCTS . "
                           set products_status = 0, products_last_modified = now()
                           where products_id = '" . (int)$products_id . "'");
		 } else {}
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * list all special product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_special_list($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		// create search filter
		$search = '';
		if (isset($info['search']) && zen_not_null($info['search'])) {
			$keywords = zen_db_input(zen_db_prepare_input($info['search']));
			$search = " and (pd.products_name like '%" . $keywords . "%' or pd.products_description like '%" . $keywords . "%' or p.products_model like '%" . $keywords . "%')";
		}
		
		// order of display
		$order_by = " order by pd.products_name ";
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
		
		$specials_query_raw = "select p.products_id, pd.products_name, p.products_model, 
							p.products_price, p.products_priced_by_attribute, s.specials_id, 
							s.specials_new_products_price, s.specials_date_added, s.specials_last_modified, 
							s.expires_date, s.date_status_change, s.status, 
							s.specials_date_available 
							from " . TABLE_PRODUCTS . " p, " . TABLE_SPECIALS . " s, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_id = pd.products_id and pd.language_id = '" . (int)$_SESSION['languages_id'] . "' and p.products_id = s.products_id" . $search . $order_by . $limit;
		$specials = $db->Execute($specials_query_raw);
    	while (!$specials->EOF) {
    		$item['products_id'] = $specials->fields['products_id'];
    		$item['products_name'] = $specials->fields['products_name'];
    		$item['products_model'] = $specials->fields['products_model'];
    		$item['products_price'] = $specials->fields['products_price'];
    		$item['products_priced_by_attribute'] = $specials->fields['products_priced_by_attribute'] ? 'true' : 'false';
    		$item['specials_id'] = $specials->fields['specials_id'];
    		$item['specials_new_products_price'] = $specials->fields['specials_new_products_price'];
    		$item['specials_date_added'] = $specials->fields['specials_date_added'];
    		$item['specials_last_modified'] = $specials->fields['specials_last_modified'];
    		$item['expires_date'] = $specials->fields['expires_date'];
    		$item['date_status_change'] = $specials->fields['date_status_change'];
    		$item['status'] = $specials->fields['status'];
    		$item['specials_date_available'] = $specials->fields['specials_date_available'];
    		
    		$return[] = $item;
    		$specials->MoveNext();
    	}
    	
    	return parent::prepare_output($return);
	}
	
	/**
	 * add a special product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_special_add($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();

		$products_id = zen_db_prepare_input($info['products_id']);
		$products_price = zen_db_prepare_input($info['products_price']);
		
		$tmp_value = zen_db_prepare_input($info['specials_price']);
		$specials_price = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
		
		if (substr($specials_price, -1) == '%') {
			$new_special_insert = $db->Execute("select products_id, products_price, products_priced_by_attribute
											from " . TABLE_PRODUCTS . "
											where products_id = '" . (int)$products_id . "'");
			
			// check if priced by attribute
			if ($new_special_insert->fields['products_priced_by_attribute'] == '1') {
				$products_price = zen_get_products_base_price($products_id);
			} else {
				$products_price = $new_special_insert->fields['products_price'];
			}
			
			$specials_price = ($products_price - (($specials_price / 100) * $products_price));
		}
		
		$specials_date_available = ((zen_db_prepare_input($info['start']) == '') ? '0001-01-01' : zen_date_raw($info['start']));
		$expires_date = ((zen_db_prepare_input($info['end']) == '') ? '0001-01-01' : zen_date_raw($info['end']));
		
		$products_id = zen_db_prepare_input($info['products_id']);
		$db->Execute("insert into " . TABLE_SPECIALS . "
					(products_id, specials_new_products_price, specials_date_added, expires_date, status, specials_date_available)
					values ('" . (int)$products_id . "',
					'" . zen_db_input($specials_price) . "',
					now(),
					'" . zen_db_input($expires_date) . "', '1', '" . zen_db_input($specials_date_available) . "')");
		
		$new_special = $db->Execute("select specials_id from " . TABLE_SPECIALS . " where products_id='" . (int)$products_id . "'");
		
		// reset products_price_sorter for searches etc.
		zen_update_products_price_sorter((int)$products_id);
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update a special product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_special_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$specials_id = zen_db_prepare_input($info['specials_id']);

        if ($info['products_priced_by_attribute'] == 'true') {
          $products_price = zen_get_products_base_price($info['update_products_id']);
        } else {
          $products_price = zen_db_prepare_input($info['products_price']);
        }

        $tmp_value = zen_db_prepare_input($info['specials_price']);
        $specials_price = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;

        if (substr($specials_price, -1) == '%') $specials_price = ($products_price - (($specials_price / 100) * $products_price));

        $specials_date_available = ((zen_db_prepare_input($info['start']) == '') ? '0001-01-01' : zen_date_raw($info['start']));
        $expires_date = ((zen_db_prepare_input($info['end']) == '') ? '0001-01-01' : zen_date_raw($info['end']));

        $db->Execute("update " . TABLE_SPECIALS . "
                      set specials_new_products_price = '" . zen_db_input($specials_price) . "',
                          specials_last_modified = now(),
                          expires_date = '" . zen_db_input($expires_date) . "',
                          specials_date_available = '" . zen_db_input($specials_date_available) . "'
                      where specials_id = '" . (int)$specials_id . "'");

        // reset products_price_sorter for searches etc.
        $update_price = $db->Execute("select products_id from " . TABLE_SPECIALS . " where specials_id = '" . (int)$specials_id . "'");
        zen_update_products_price_sorter($update_price->fields['products_id']);
        
        $return[] = '1';
        return parent::prepare_output($return);
	}
	
	/**
	 * delete a special product
	 *
	 * @param string $specials_id
	 * @return string
	 */
	public static function product_special_delete($specials_id) {
		$db = parent::prepare_db();
		$specials_id = parent::prepare_input($specials_id);
		$specials_id = zen_db_prepare_input($specials_id[0]);
		$return = array();

        // reset products_price_sorter for searches etc.
        $update_price = $db->Execute("select products_id from " . TABLE_SPECIALS . " where specials_id = '" . $specials_id . "'");
        $update_price_id = $update_price->fields['products_id'];

        $db->Execute("delete from " . TABLE_SPECIALS . "
                      where specials_id = '" . (int)$specials_id . "'");

        zen_update_products_price_sorter($update_price_id);
        
        $return[] = '1';
        return parent::prepare_output($return);
	}
	
	/**
	 * update a special product status
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_special_status_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		zen_set_specials_status($info['specials_id'], $info['flag']);

        // reset products_price_sorter for searches etc.
        $update_price = $db->Execute("select products_id from " . TABLE_SPECIALS . " where specials_id = '" . $info['specials_id'] . "'");
        zen_update_products_price_sorter($update_price->fields['products_id']);
        
        $return[] = '1';
        return parent::prepare_output($return);
	}
	
	/**
	 * list all feature product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_feature_list($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$search = '';
		if (isset($info['search']) && zen_not_null($info['search'])) {
			$keywords = zen_db_input(zen_db_prepare_input($info['search']));
			$search = " and (pd.products_name like '%" . $keywords . "%' or pd.products_description like '%" . $keywords . "%' or p.products_model like '%" . $keywords . "%')";
		}
		
		// order of display
		$order_by = " order by pd.products_name ";
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
		
		$featured_query_raw = "select p.products_id, pd.products_name, p.products_model, 
							p.products_price, p.products_priced_by_attribute, f.featured_id, 
							f.featured_date_added, f.featured_last_modified, f.expires_date, 
							f.date_status_change, f.status, f.featured_date_available 
							from " . TABLE_PRODUCTS . " p, " . TABLE_FEATURED . " f, " . TABLE_PRODUCTS_DESCRIPTION . " pd where p.products_id = pd.products_id and pd.language_id = '" . (int)$_SESSION['languages_id'] . "' and p.products_id = f.products_id"  . $search . $order_by . $limit;
		$featured = $db->Execute($featured_query_raw);
		while (!$featured->EOF) {
			$item['products_id'] = $featured->fields['products_id'];
			$item['products_name'] = $featured->fields['products_name'];
			$item['products_model'] = $featured->fields['products_model'];
			$item['products_price'] = $featured->fields['products_price'];
			$item['products_priced_by_attribute'] = $featured->fields['products_priced_by_attribute'] ? 'true' : 'false';
			$item['featured_id'] = $featured->fields['featured_id'];
			$item['featured_date_added'] = $featured->fields['featured_date_added'];
			$item['featured_last_modified'] = $featured->fields['featured_last_modified'];
			$item['expires_date'] = $featured->fields['expires_date'];
			$item['date_status_change'] = $featured->fields['date_status_change'];
			$item['status'] = $featured->fields['status'];
			$item['featured_date_available'] = $featured->fields['featured_date_available'];
			
			$return[] = $item;
			$featured->MoveNext();
		}
		
		return parent::prepare_output($return);
	}
	
	/**
	 * add a featured product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_feature_add($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$products_id = zen_db_prepare_input($info['products_id']);
		
		$featured_date_available = ((zen_db_prepare_input($info['start']) == '') ? '0001-01-01' : zen_date_raw($info['start']));
		$expires_date = ((zen_db_prepare_input($info['end']) == '') ? '0001-01-01' : zen_date_raw($info['end']));
		
		$db->Execute("insert into " . TABLE_FEATURED . "
					(products_id, featured_date_added, expires_date, status, featured_date_available)
					values ('" . (int)$products_id . "',
					now(),
					'" . zen_db_input($expires_date) . "', '1', '" . zen_db_input($featured_date_available) . "')");
		
		$new_featured = $db->Execute("select featured_id from " . TABLE_FEATURED . " where products_id='" . (int)$products_id . "'");
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
	
	/**
	 * update a feature product
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_feature_update($info) {
		$db = parent::prepare_db();
		$info = parent::prepare_input($info);
		$return = array();
		
		$featured_id = zen_db_prepare_input($info['featured_id']);

        $featured_date_available = ((zen_db_prepare_input($info['start']) == '') ? '0001-01-01' : zen_date_raw($info['start']));
        $expires_date = ((zen_db_prepare_input($info['end']) == '') ? '0001-01-01' : zen_date_raw($info['end']));

        $db->Execute("update " . TABLE_FEATURED . "
                      set featured_last_modified = now(),
                          expires_date = '" . zen_db_input($expires_date) . "',
                          featured_date_available = '" . zen_db_input($featured_date_available) . "'
                      where featured_id = '" . (int)$featured_id . "'");
        
        $return[] = '1';
        return parent::prepare_output($return);
	}
	
	/**
	 * delete a feature product
	 *
	 * @param string $featured_id
	 * @return string
	 */
	public static function product_feature_delete($featured_id) {
		$db = parent::prepare_db();
		$featured_id = parent::prepare_input($featured_id);
		$featured_id = zen_db_prepare_input($featured_id[0]);
		$return = array();

        $db->Execute("delete from " . TABLE_FEATURED . "
                      where featured_id = '" . (int)$featured_id . "'");
        
        $return[] = '1';
        return parent::prepare_output($return);
	}
	
	/**
	 * update feature product status
	 *
	 * @param string $info
	 * @return string
	 */
	public static function product_feature_status_update($info) {
		$info = parent::prepare_input($info);
		$return = array();
		
		zen_set_featured_status($info['featured_id'], $info['flag']);
		
		$return[] = '1';
		return parent::prepare_output($return);
	}
}
?>