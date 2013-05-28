<?php
class Api extends ApiBase {
	private $authorized = false;
	
	//check authorize here
	public function __construct() {
		$xml = file_get_contents('php://input');
		//$pattern = '/\<SOAP-ENV\:Header\>\<.*\:Authentication SOAP-ENV\:actor\="http\:\/\/schemas\.xmlsoap\.org\/soap\/actor\/next"\>\{"apikey"\:"(.*?)","language":".*?"\}\<\/.*\:Authentication\>\<\/SOAP-ENV\:Header\>/';
		$pattern = '/\<Authentication\>\{"apikey"\:"(.*?)","language":".*?"\}\<\/Authentication\>/';
		preg_match_all($pattern, $xml, $matches);
		if($matches[1][0] == md5(API_KEY)) {
			$this->authorized = true;
		}
		//file_put_contents(DIR_FS_CATALOG . 'apilog.txt', $xml);
	}
	
	/**
	 * check authorize, parameters
	 *
	 * @param string $param
	 * @return mixed
	 * @ignore 
	 */
	public function check($param = '') {
		if(!$this->authorized) {
			return ErrCode::error(API_ERROR_UNAUTHORIZED);
		}
		if($param != '' && !is_string($param)) {
			return ErrCode::error(API_ERROR_ILLEGALINPUT);
		}
		if($param != '' && !is_array(parent::prepare_input($param))) {
			return ErrCode::error(API_ERROR_ILLEGALINPUT);
		}
		return false;
	}
	
	/**
	 * check if the key right or not
	 *
	 * @param string $key
	 * @return string
	 */
	public function check_key($key) {
		return System::check_key($key);
	}
	
	/**
	 * get all zencart config
	 *
	 * @param string $configuration_group_id
	 * @return string
	 */
	public function system_config_list($configuration_group_id) {
		if($err = $this->check($configuration_group_id)) return $err;
		return System::system_config_list($configuration_group_id);
	}
	
	/**
	 * get a config's information
	 *
	 * @param string $configuration_id
	 * @return string
	 */
	public function system_config_list_id($configuration_id) {
		if($err = $this->check($configuration_id)) return $err;
		return System::system_config_list_id($configuration_id);
	}
	
	/**
	 * add a config
	 *
	 * @param string $info
	 * @return string
	 */
	public function system_config_add($info) {
		if($err = $this->check($info)) return $err;
		return System::system_config_add($info);
	}
	
	/**
	 * update a config
	 *
	 * @param string $info
	 * @return string
	 */
	public function system_config_update($info) {
		if($err = $this->check($info)) return $err;
		return System::system_config_update($info);
	}
	
	/**
	 * delete a config
	 *
	 * @param string $configuration_id
	 * @return string
	 */
	public function system_config_delete($configuration_id) {
		if($err = $this->check($configuration_id)) return $err;
		return System::system_config_delete($configuration_id);
	}
	
	/**
	 * get directory list under a directory
	 *
	 * @param string $root
	 * @return string
	 */
	public function system_dir_list($root) {
		if($err = $this->check($root)) return $err;
		return System::system_dir_list($root);
	}
	
	/**
	 * get categories list
	 *
	 * @param string $categories_id
	 * @return string
	 */
	public function category_list($categories_id) {
		if($err = $this->check($categories_id)) return $err;
		return Categories::category_list($categories_id);
	}
	
	/**
	 * get a category's information
	 *
	 * @param string $categories_id
	 * @return string
	 */
	public function category_list_id($categories_id) {
		if($err = $this->check($categories_id)) return $err;
		return Categories::category_list_id($categories_id);
	}
	
	/**
	 * get a category's meta tags
	 *
	 * @param string $categories_id
	 * @return string
	 */
	public function category_meta_tags_id($categories_id) {
		if($err = $this->check($categories_id)) return $err;
		return Categories::category_meta_tags_id($categories_id);
	}
	
	/**
	 * get categories list under the parent id
	 *
	 * @param string $info
	 * @return string
	 */
	public function category_list_parent_id($info) {
		if($err = $this->check($info)) return $err;
		return Categories::category_list_parent_id($info);
	}
	
	/**
	 * add a new category
	 *
	 * @param string $info
	 * @return string
	 */
	public function category_add($info) {
		if($err = $this->check($info)) return $err;
		return Categories::category_add($info);
	}
	
	/**
	 * update a category
	 *
	 * @param string $info
	 * @return string
	 */
	public function category_update($info) {
		if($err = $this->check($info)) return $err;
		return Categories::category_update($info);
	}
	
	/**
	 * delete a category
	 *
	 * @param string $info
	 * @return string
	 */
	public function category_delete($info) {
		if($err = $this->check($info)) return $err;
		return Categories::category_delete($info);
	}
	
	/**
	 * move a category
	 *
	 * @param string $info
	 * @return string
	 */
	public function category_move($info) {
		if($err = $this->check($info)) return $err;
		return Categories::category_move($info);
	}
	
	/**
	 * add/update/delete a category's meta tags
	 *
	 * @param string $info
	 * @return string
	 */
	public function category_meta_tags_update($info) {
		if($err = $this->check($info)) return $err;
		return Categories::category_meta_tags_update($info);
	}
	
	/**
	 * update a category's status
	 *
	 * @param string $info
	 * @return string
	 */
	public function category_status_update($info) {
		if($err = $this->check($info)) return $err;
		return Categories::category_status_update($info);
	}
	
	/**
	 * get product list
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_list_parent_id($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_list_parent_id($info);
	}
	
	/**
	 * get product's information
	 *
	 * @param string $products_id
	 * @return string
	 */
	public function product_list_id($products_id) {
		if($err = $this->check($products_id)) return $err;
		return ProductsApi::product_list_id($products_id);
	}
	
	/**
	 * add a new product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_add($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_add($info);
	}
	
	/**
	 * update a product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_update($info);
	}
	
	/**
	 * delete a product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_delete($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_delete($info);
	}
	
	/**
	 * move a product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_move($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_move($info);
	}
	
	/**
	 * copy a product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_copy($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_copy($info);
	}
	
	/**
	 * get product's meta tags
	 *
	 * @param string $products_id
	 * @return string
	 */
	public function product_meta_tags_id($products_id) {
		if($err = $this->check($products_id)) return $err;
		return ProductsApi::product_meta_tags_id($products_id);
	}
	
	/**
	 * add or update or delete meta tags
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_meta_tags_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_meta_tags_update($info);
	}
	
	/**
	 * update product's status
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_status_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_status_update($info);
	}
	
	/**
	 * list all special product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_special_list($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_special_list($info);
	}
	
	/**
	 * add a special product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_special_add($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_special_add($info);
	}
	
	/**
	 * update a special product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_special_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_special_update($info);
	}
	
	/**
	 * delete a special product
	 *
	 * @param string $specials_id
	 * @return string
	 */
	public function product_special_delete($specials_id) {
		if($err = $this->check($specials_id)) return $err;
		return ProductsApi::product_special_delete($specials_id);
	}
	
	/**
	 * update a special product's status
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_special_status_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_special_status_update($info);
	}
	
	/**
	 * list all feature product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_feature_list($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_feature_list($info);
	}
	
	/**
	 * add a feature product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_feature_add($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_feature_add($info);
	}
	
	/**
	 * update a feature product
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_feature_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_feature_update($info);
	}
	
	/**
	 * delete a feature product
	 *
	 * @param string $featured_id
	 * @return string
	 */
	public function product_feature_delete($featured_id) {
		if($err = $this->check($featured_id)) return $err;
		return ProductsApi::product_feature_delete($featured_id);
	}
	
	/**
	 * update feature product status
	 *
	 * @param string $info
	 * @return string
	 */
	public function product_feature_status_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductsApi::product_feature_status_update($info);
	}
	
	/**
	 * get customers list
	 *
	 * @param string $p
	 * @return string
	 */
	public function customer_list($p) {
		if($err = $this->check($p)) return $err;
		return Customers::customer_list($p);
	}
	
	/**
	 * get specific customer's infomation
	 *
	 * @param string $id
	 * @return string
	 */
	public function customer_list_id($id) {
		if($err = $this->check($id)) return $err;
		return Customers::customer_list_id($id);
	}
	
	/**
	 * delete customer(s)
	 *
	 * @param string $ids
	 * @return string
	 */
	public function customer_delete($ids) {
		if($err = $this->check($ids)) return $err;
		return Customers::customer_delete($ids);
	}
	
	/**
	 * update customer(s) infomation
	 *
	 * @param string $customers
	 * @return string
	 */
	public function customer_update($customers) {
		if($err = $this->check($customers)) return $err;
		return Customers::customer_update($customers);
	}
	
	/**
	 * get order list associated to a specific customer
	 *
	 * @param string $info
	 * @return string
	 */
	public function customer_order_list($info) {
		if($err = $this->check($info)) return $err;
		return Customers::customer_order_list($info);
	}
	
	/**
	 * get configs with customer manage
	 *
	 * @return string
	 */
	public function customer_config_list() {
		if($err = $this->check()) return $err;
		return Customers::customer_config_list();
	}
	
	/**
	 * get languages list
	 *
	 * @return string
	 */
	public function language_list() {
		if($err = $this->check()) return $err;
		return Languages::language_list();
	}
	
	/**
	 * get the specific language information
	 *
	 * @param string $id
	 * @return string
	 */
	public function language_list_id($id) {
		if($err = $this->check($id)) return $err;
		return Languages::language_list_id($id);
	}
	
	/**
	 * get the default language
	 *
	 * @return string
	 */
	public function language_default() {
		return Languages::language_default();
	}
	
	/**
	 * add a new language
	 *
	 * @param string $info
	 * @return string
	 */
	public function language_add($info) {
		if($err = $this->check($info)) return $err;
		return Languages::language_add($info);
	}
	
	/**
	 * delete a language
	 *
	 * @param string $id
	 * @return string
	 */
	public function language_delete($id) {
		if($err = $this->check($id)) return $err;
		return Languages::language_delete($id);
	}
	
	/**
	 * update language(s)
	 *
	 * @param string $info
	 * @return string
	 */
	public function language_update($info) {
		if($err = $this->check($info)) return $err;
		return Languages::language_update($info);
	}
	
	/**
	 * get configuration with language
	 *
	 * @return string
	 */
	public function language_config_list() {
		if($err = $this->check()) return $err;
		return Languages::language_config_list();
	}
	
	/**
	 * get the order list
	 *
	 * @param string $info
	 * @return string
	 */
	public function order_list($info) {
		if($err = $this->check($info)) return $err;
		return Orders::order_list($info);
	}
	
	/**
	 * delete order(s)
	 *
	 * @param string $info
	 * @return string
	 */
	public function order_delete($info) {
		if($err = $this->check($info)) return $err;
		return Orders::order_delete($info);
	}
	
	/**
	 * update order(s)
	 *
	 * @param string $items
	 * @return string
	 */
	public function order_update($items) {
		if($err = $this->check($items)) return $err;
		return Orders::order_update($items);
	}
	
	/**
	 * get order status list
	 *
	 * @return string
	 */
	public function order_status_list() {
		if($err = $this->check()) return $err;
		return OrderStatus::order_status_list();
	}
	
	/**
	 * get a specific order status's information
	 *
	 * @param string $id
	 * @return string
	 */
	public function order_status_list_id($id) {
		if($err = $this->check($id)) return $err;
		return OrderStatus::order_status_list_id($id);
	}
	
	/**
	 * add a new order status
	 *
	 * @param string $info
	 * @return string
	 */
	public function order_status_add($info) {
		if($err = $this->check($info)) return $err;
		return OrderStatus::order_status_add($info);
	}
	
	/**
	 * update order status's information
	 *
	 * @param string $info
	 * @return string
	 */
	public function order_status_update($info) {
		if($err = $this->check($info)) return $err;
		return OrderStatus::order_status_update($info);
	}
	
	/**
	 * delete order status(s)
	 *
	 * @param string $items
	 * @return string
	 */
	public function order_status_delete($items) {
		if($err = $this->check($items)) return $err;
		return OrderStatus::order_status_delete($items);
	}
	
	/**
	 * get currencies list
	 *
	 * @return string
	 */
	public function currency_list() {
		if($err = $this->check()) return $err;
		return CurrenciesApi::currency_list();
	}
	
	/**
	 * add a new currency
	 *
	 * @param string $info
	 * @return string
	 */
	public function currency_add($info) {
		if($err = $this->check($info)) return $err;
		return CurrenciesApi::currency_add($info);
	}
	
	/**
	 * update a currency
	 *
	 * @param string $info
	 * @return string
	 */
	public function currency_update($info) {
		if($err = $this->check($info)) return $err;
		return CurrenciesApi::currency_update($info);
	}
	
	/**
	 * delete a currency
	 *
	 * @param string $item
	 * @return string
	 */
	public function currency_delete($item) {
		if($err = $this->check($item)) return $err;
		return CurrenciesApi::currency_delete($item);
	}
	
	/**
	 * list all countries
	 *
	 * @param string $info
	 * @return string
	 */
	public function country_list($info) {
		if($err = $this->check($info)) return $err;
		return Countries::country_list($info);
	}
	
	/**
	 * get a specific country's information
	 *
	 * @param string $countries_id
	 * @return string
	 */
	public function country_list_id($countries_id) {
		if($err = $this->check($countries_id)) return $err;
		return Countries::country_list_id($countries_id);
	}
	
	/**
	 * add a new country
	 *
	 * @param string $info
	 * @return string
	 */
	public function country_add($info) {
		if($err = $this->check($info)) return $err;
		return Countries::country_add($info);
	}
	
	/**
	 * update a country's information
	 *
	 * @param string $info
	 * @return string
	 */
	public function country_update($info) {
		if($err = $this->check($info)) return $err;
		return Countries::country_update($info);
	}
	
	/**
	 * delete a country
	 *
	 * @param string $item
	 * @return string
	 */
	public function country_delete($item) {
		if($err = $this->check($item)) return $err;
		return Countries::country_delete($item);
	}
	
	/**
	 * get zones list
	 *
	 * @param string $info
	 * @return string
	 */
	public function zone_list($info) {
		if($err = $this->check($info)) return $err;
		return ZonesApi::zone_list($info);
	}
	
	/**
	 * add a new zone
	 *
	 * @param string $info
	 * @return string
	 */
	public function zone_add($info) {
		if($err = $this->check($info)) return $err;
		return ZonesApi::zone_add($info);
	}
	
	/**
	 * update a zone's information
	 *
	 * @param string $info
	 * @return string
	 */
	public function zone_update($info) {
		if($err = $this->check($info)) return $err;
		return ZonesApi::zone_update($info);
	}
	
	/**
	 * delete a zone
	 *
	 * @param string $zone_id
	 * @return string
	 */
	public function zone_delete($zone_id) {
		if($err = $this->check($zone_id)) return $err;
		return ZonesApi::zone_delete($zone_id);
	}
	
	/**
	 * get tax class list
	 *
	 * @return string
	 */
	public function taxclass_list() {
		if($err = $this->check()) return $err;
		return TaxClass::taxclass_list();
	}
	
	/**
	 * add a new tax class
	 *
	 * @param string $info
	 * @return string
	 */
	public function taxclass_add($info) {
		if($err = $this->check($info)) return $err;
		return TaxClass::taxclass_add($info);
	}
	
	/**
	 * update a tax class
	 *
	 * @param string $info
	 * @return string
	 */
	public function taxclass_update($info) {
		if($err = $this->check($info)) return $err;
		return TaxClass::taxclass_update($info);
	}
	
	/**
	 * delete a tax class
	 *
	 * @param string $tax_class_id
	 * @return string
	 */
	public function taxclass_delete($tax_class_id) {
		if($err = $this->check($tax_class_id)) return $err;
		return TaxClass::taxclass_delete($tax_class_id);
	}
	
	/**
	 * get the tax zone list
	 *
	 * @return string
	 */
	public function taxzone_list() {
		if($err = $this->check()) return $err;
		return TaxZones::taxzone_list();
	}
	
	/**
	 * get a tax zone's country/zone list
	 *
	 * @param string $geo_zone_id
	 * @return string
	 */
	public function taxzone_list_sub($geo_zone_id) {
		if($err = $this->check($geo_zone_id)) return $err;
		return TaxZones::taxzone_list_sub($geo_zone_id);
	}
	
	/**
	 * get a specific tax zone's information
	 *
	 * @param string $geo_zone_id
	 * @return string
	 */
	public function taxzone_list_id($geo_zone_id) {
		if($err = $this->check($geo_zone_id)) return $err;
		return TaxZones::taxzone_list_id($geo_zone_id);
	}
	
	/**
	 * get a specific tax zone's country/zone information
	 *
	 * @param string $association_id
	 * @return string
	 */
	public function taxzone_list_id_sub($association_id) {
		if($err = $this->check($association_id)) return $err;
		return TaxZones::taxzone_list_id_sub($association_id);
	}
	
	/**
	 * add a new tax zone
	 *
	 * @param string $info
	 * @return string
	 */
	public function taxzone_add($info) {
		if($err = $this->check($info)) return $err;
		return TaxZones::taxzone_add($info);
	}
	
	/**
	 * add a country/zone to a tax zone
	 *
	 * @param string $info
	 * @return string
	 */
	public function taxzone_add_sub($info) {
		if($err = $this->check($info)) return $err;
		return TaxZones::taxzone_add_sub($info);
	}
	
	/**
	 * update a tax zone
	 *
	 * @param string $info
	 * @return string
	 */
	public function taxzone_update($info) {
		if($err = $this->check($info)) return $err;
		return TaxZones::taxzone_update($info);
	}
	
	/**
	 * update a tax zone's country/zone information
	 *
	 * @param string $info
	 * @return string
	 */
	public function taxzone_update_sub($info) {
		if($err = $this->check($info)) return $err;
		return TaxZones::taxzone_update_sub($info);
	}
	
	/**
	 * delete a tax zone
	 *
	 * @param string $geo_zone_id
	 * @return string
	 */
	public function taxzone_delete($geo_zone_id) {
		if($err = $this->check($geo_zone_id)) return $err;
		return TaxZones::taxzone_delete($geo_zone_id);
	}
	
	/**
	 * delete a country/zone information
	 *
	 * @param string $association_id
	 * @return string
	 */
	public function taxzone_delete_sub($association_id) {
		if($err = $this->check($association_id)) return $err;
		return TaxZones::taxzone_delete_sub($association_id);
	}
	
	/**
	 * get tax rate list
	 *
	 * @return string
	 */
	public function taxrate_list() {
		if($err = $this->check()) return $err;
		return TaxRates::taxrate_list();
	}
	
	/**
	 * get a tax rate's information
	 *
	 * @param string $tax_rates_id
	 * @return string
	 */
	public function taxrate_list_id($tax_rates_id) {
		if($err = $this->check($tax_rates_id)) return $err;
		return TaxRates::taxrate_list_id($tax_rates_id);
	}
	
	/**
	 * add a new tax rate
	 *
	 * @param string $info
	 * @return string
	 */
	public function taxrate_add($info) {
		if($err = $this->check($info)) return $err;
		return TaxRates::taxrate_add($info);
	}
	
	/**
	 * update a tax rate
	 *
	 * @param string $info
	 * @return string
	 */
	public function taxrate_update($info) {
		if($err = $this->check($info)) return $err;
		return TaxRates::taxrate_update($info);
	}
	
	/**
	 * delete a tax rate
	 *
	 * @param string $tax_rates_id
	 * @return string
	 */
	public function taxrate_delete($tax_rates_id) {
		if($err = $this->check($tax_rates_id)) return $err;
		return TaxRates::taxrate_delete($tax_rates_id);
	}
	
	/**
	 * get manufacturer list
	 *
	 * @param string $info
	 * @return string
	 */
	public function manufacturer_list($info) {
		if($err = $this->check($info)) return $err;
		return Manufacturers::manufacturer_list($info);
	}
	
	/**
	 * get a manufacturer's information
	 *
	 * @param string $manufacturers_id
	 * @return string
	 */
	public function manufacturer_list_id($manufacturers_id) {
		if($err = $this->check($manufacturers_id)) return $err;
		return Manufacturers::manufacturer_list_id($manufacturers_id);
	}
	
	/**
	 * add a new manufacturer
	 *
	 * @param string $info
	 * @return string
	 */
	public function manufacturer_add($info) {
		if($err = $this->check($info)) return $err;
		return Manufacturers::manufacturer_add($info);
	}
	
	/**
	 * update a manufacturer
	 *
	 * @param string $info
	 * @return string
	 */
	public function manufacturer_update($info) {
		if($err = $this->check($info)) return $err;
		return Manufacturers::manufacturer_update($info);
	}
	
	/**
	 * delete a manufacturer
	 *
	 * @param string $info
	 * @return string
	 */
	public function manufacturer_delete($info) {
		if($err = $this->check($info)) return $err;
		return Manufacturers::manufacturer_delete($info);
	}
	
	/**
	 * get the group pricing list
	 *
	 * @param string $info
	 * @return string
	 */
	public function grouppricing_list($info) {
		if($err = $this->check($info)) return $err;
		return GroupPricing::grouppricing_list($info);
	}
	
	/**
	 * get a group pricing's information
	 *
	 * @param string $group_id
	 * @return string
	 */
	public function grouppricing_list_id($group_id) {
		if($err = $this->check($group_id)) return $err;
		return GroupPricing::grouppricing_list_id($group_id);
	}
	
	/**
	 * delete a group pricing
	 *
	 * @param string $info
	 * @return string
	 */
	public function grouppricing_delete($info) {
		if($err = $this->check($info)) return $err;
		return GroupPricing::grouppricing_delete($info);
	}
	
	/**
	 * update a group pricing
	 *
	 * @param string $info
	 * @return string
	 */
	public function grouppricing_update($info) {
		if($err = $this->check($info)) return $err;
		return GroupPricing::grouppricing_update($info);
	}
	
	/**
	 * add a new group pricing
	 *
	 * @param string $info
	 * @return string
	 */
	public function grouppricing_add($info) {
		if($err = $this->check($info)) return $err;
		return GroupPricing::grouppricing_add($info);
	}
	
	/**
	 * get the review list
	 *
	 * @param string $info
	 * @return string
	 */
	public function review_list($info) {
		if($err = $this->check($info)) return $err;
		return Reviews::review_list($info);
	}
	
	/**
	 * get a review's information
	 *
	 * @param string $reviews_id
	 * @return string
	 */
	public function review_list_id($reviews_id) {
		if($err = $this->check($reviews_id)) return $err;
		return Reviews::review_list_id($reviews_id);
	}
	
	/**
	 * update a review
	 *
	 * @param string $info
	 * @return string
	 */
	public function review_update($info) {
		if($err = $this->check($info)) return $err;
		return Reviews::review_update($info);
	}
	
	/**
	 * delete a review
	 *
	 * @param string $reviews_id
	 * @return string
	 */
	public function review_delete($reviews_id) {
		if($err = $this->check($reviews_id)) return $err;
		return Reviews::review_delete($reviews_id);
	}
	
	/**
	 * set a review's flag/status
	 *
	 * @param string $info
	 * @return string
	 */
	public function review_setflag($info) {
		if($err = $this->check($info)) return $err;
		return Reviews::review_setflag($info);
	}
	
	/**
	 * get coupon list
	 *
	 * @param string $info
	 * @return string
	 */
	public function coupon_list($info) {
		if($err = $this->check($info)) return $err;
		return Coupon::coupon_list($info);
	}
	
	/**
	 * get a coupon's information
	 *
	 * @param string $coupon_id
	 * @return string
	 */
	public function coupon_list_id($coupon_id) {
		if($err = $this->check($coupon_id)) return $err;
		return Coupon::coupon_list_id($coupon_id);
	}
	
	/**
	 * delete a coupon
	 *
	 * @param string $coupon_id
	 * @return string
	 */
	public function coupon_delete($coupon_id) {
		if($err = $this->check($coupon_id)) return $err;
		return Coupon::coupon_delete($coupon_id);
	}
	
	/**
	 * add a coupon
	 *
	 * @param string $info
	 * @return string
	 */
	public function coupon_add($info) {
		if($err = $this->check($info)) return $err;
		return Coupon::coupon_add($info);
	}
	
	/**
	 * update a coupon
	 *
	 * @param string $info
	 * @return string
	 */
	public function coupon_update($info) {
		if($err = $this->check($info)) return $err;
		return Coupon::coupon_update($info);
	}
	
	/**
	 * get product type list
	 *
	 * @return string
	 */
	public function producttype_list() {
		if($err = $this->check()) return $err;
		return ProductTypes::producttype_list();
	}
	
	/**
	 * get a product type's information
	 *
	 * @param string $type_id
	 * @return string
	 */
	public function producttype_list_id($type_id) {
		if($err = $this->check($type_id)) return $err;
		return ProductTypes::producttype_list_id($type_id);
	}
	
	/**
	 * add a new product type
	 *
	 * @param string $info
	 * @return string
	 */
	public function producttype_add($info) {
		if($err = $this->check($info)) return $err;
		return ProductTypes::producttype_add($info);
	}
	
	/**
	 * update a product type
	 *
	 * @param string $info
	 * @return string
	 */
	public function producttype_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductTypes::producttype_update($info);
	}
	
	/**
	 * delete a product type
	 *
	 * @param string $info
	 * @return string
	 */
	public function producttype_delete($info) {
		if($err = $this->check($info)) return $err;
		return ProductTypes::producttype_delete($info);
	}
	
	/**
	 * get product type layout list
	 *
	 * @param string $product_type_id
	 * @return string
	 */
	public function producttype_layout_list($product_type_id) {
		if($err = $this->check($product_type_id)) return $err;
		return ProductTypes::producttype_layout_list($product_type_id);
	}
	
	/**
	 * get product type config's information
	 *
	 * @param string $configuration_id
	 * @return string
	 */
	public function producttype_layout_list_id($configuration_id) {
		if($err = $this->check($configuration_id)) return $err;
		return ProductTypes::producttype_layout_list_id($configuration_id);
	}
	
	/**
	 * update a product type config
	 *
	 * @param string $info
	 * @return string
	 */
	public function producttype_layout_update($info) {
		if($err = $this->check($info)) return $err;
		return ProductTypes::producttype_layout_update($info);
	}
	
	/**
	 * get option type list
	 *
	 * @return string
	 */
	public function option_types_list() {
		if($err = $this->check()) return $err;
		return OptionNames::option_types_list();
	}
	
	/**
	 * get the next option name id
	 *
	 * @return string
	 */
	public function option_name_next_id() {
		if($err = $this->check()) return $err;
		return OptionNames::option_name_next_id();
	}
	
	/**
	 * get option name list
	 *
	 * @param string $info
	 * @return string
	 */
	public function option_name_list($info) {
		if($err = $this->check($info)) return $err;
		return OptionNames::option_name_list($info);
	}
	
	/**
	 * get a option name's information
	 *
	 * @param string $products_options_id
	 * @return string
	 */
	public function option_name_list_id($products_options_id) {
		if($err = $this->check($products_options_id)) return $err;
		return OptionNames::option_name_list_id($products_options_id);
	}
	
	/**
	 * add a option name
	 *
	 * @param string $info
	 * @return string
	 */
	public function option_name_add($info) {
		if($err = $this->check($info)) return $err;
		return OptionNames::option_name_add($info);
	}
	
	/**
	 * update a option name
	 *
	 * @param string $info
	 * @return string
	 */
	public function option_name_update($info) {
		if($err = $this->check($info)) return $err;
		return OptionNames::option_name_update($info);
	}
	
	/**
	 * delete a option name
	 *
	 * @param string $option_id
	 * @return string
	 */
	public function option_name_delete($option_id) {
		if($err = $this->check($option_id)) return $err;
		return OptionNames::option_name_delete($option_id);
	}
	
	/**
	 * get option value list
	 *
	 * @param string $info
	 * @return string
	 */
	public function option_value_list($info) {
		if($err = $this->check($info)) return $err;
		return OptionValues::option_value_list($info);
	}
	
	/**
	 * get the next option value id
	 *
	 * @return string
	 */
	public function option_value_next_id() {
		if($err = $this->check()) return $err;
		return OptionValues::option_value_next_id();
	}
	
	/**
	 * get a option value's information
	 *
	 * @param string $products_options_values_id
	 * @return string
	 */
	public function option_value_list_id($products_options_values_id) {
		if($err = $this->check($products_options_values_id)) return $err;
		return OptionValues::option_value_list_id($products_options_values_id);
	}
	
	/**
	 * add a new option value
	 *
	 * @param string $info
	 * @return string
	 */
	public function option_value_add($info) {
		if($err = $this->check($info)) return $err;
		return OptionValues::option_value_add($info);
	}
	
	/**
	 * update option value
	 *
	 * @param string $info
	 * @return string
	 */
	public function option_value_update($info) {
		if($err = $this->check($info)) return $err;
		return OptionValues::option_value_update($info);
	}
	
	/**
	 * delete option value
	 *
	 * @param string $value_id
	 * @return string
	 */
	public function option_value_delete($value_id) {
		if($err = $this->check($value_id)) return $err;
		return OptionValues::option_value_delete($value_id);
	}
}
?>