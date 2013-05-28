<?php
define('API_ERROR_UNAUTHORIZED', 1001);
define('API_ERROR_ILLEGALINPUT', 1002);

//与Customers操作有关的错误代码
define('API_ERROR_ENTRY_FIRST_NAME_MIN_LENGTH', 2001);
define('API_ERROR_ENTRY_LAST_NAME_MIN_LENGTH', 2002);
define('API_ERROR_ENTRY_EMAIL_ADDRESS_MIN_LENGTH', 2003);
define('API_ERROR_ENTRY_EMAIL_ADDRESS_ILLEGE', 2004);
define('API_ERROR_ENTRY_STREET_ADDRESS_MIN_LENGTH', 2005);
define('API_ERROR_ENTRY_POSTCODE_MIN_LENGTH', 2006);
define('API_ERROR_ENTRY_CITY_MIN_LENGTH', 2007);
define('API_ERROR_ENTRY_TELEPHONE_MIN_LENGTH', 2008);
define('API_ERROR_ENTRY_DATE_OF_BIRTH_ILLEGE', 2009);
define('API_ERROR_ENTRY_COUNTRY_ID_UNSELECT', 2010);
define('API_ERROR_ENTRY_STATE_UNSELECT', 2011);
define('API_ERROR_ENTRY_STATE_NO_EXIST', 2012);
define('API_ERROR_ENTRY_EMAIL_ADDRESS_EXISTS', 2013);

//与Languages操作有关的错误代码
define('API_ERROR_DUPLICATE_LANGUAGE_CODE', 3001);

//与Countries操作有关的错误代码
define('API_ERROR_COUNTRY_IN_USE', 4001);

//与TaxClass操作有关的错误代码
define('API_ERROR_TAX_RATE_EXISTS_FOR_CLASS', 5001);
define('API_ERROR_TAX_RATE_EXISTS_FOR_PRODUCTS', 5002);

//与TaxZones操作有关的错误代码
define('API_ERROR_TAX_RATE_EXISTS', 6001);

//与GroupPricing操作有关的错误代码
define('API_ERROR_GROUP_PRICING_CUSTOMERS_EXIST', 7001);

//与Categories操作有关的错误代码
define('API_ERROR_CANNOT_MOVE_CATEGORY_TO_CATEGORY_SELF', 8001);
define('API_ERROR_CANNOT_MOVE_CATEGORY_TO_PARENT', 8002);
define('API_ERROR_CATEGORY_HAS_PRODUCTS', 8003);
define('API_ERROR_CANNOT_MOVE_PRODUCT_TO_CATEGORY_SELF', 8004);
define('API_ERROR_CANNOT_LINK_TO_SAME_CATEGORY', 8005);

//与OptionNames，OptionValues操作有关的错误代码
define('API_ATTRIBUTE_POSSIBLE_OPTIONS_NAME_WARNING_DUPLICATE', 9001);
define('API_ATTRIBUTE_POSSIBLE_OPTIONS_VALUE_WARNING_DUPLICATE', 9002);

class ErrCode extends ApiBase {
	private static $messages = array(
		API_ERROR_UNAUTHORIZED	=>	'未验证',
		API_ERROR_ILLEGALINPUT	=>	'非法输入',
		
		API_ERROR_ENTRY_FIRST_NAME_MIN_LENGTH=>'姓字段长度过短',
		API_ERROR_ENTRY_LAST_NAME_MIN_LENGTH=>'名字段长度过短',
		API_ERROR_ENTRY_EMAIL_ADDRESS_MIN_LENGTH=>'Email长度过短',
		API_ERROR_ENTRY_EMAIL_ADDRESS_ILLEGE=>'Email格式不正确',
		API_ERROR_ENTRY_STREET_ADDRESS_MIN_LENGTH=>'街道地址长度过短',
		API_ERROR_ENTRY_POSTCODE_MIN_LENGTH=>'邮政编码长度过短',
		API_ERROR_ENTRY_CITY_MIN_LENGTH=>'城市字段长度过短',
		API_ERROR_ENTRY_TELEPHONE_MIN_LENGTH=>'电话号码长度过短',
		API_ERROR_ENTRY_DATE_OF_BIRTH_ILLEGE=>'出生日期格式不正确',
		API_ERROR_ENTRY_COUNTRY_ID_UNSELECT=>'未选择国家',
		API_ERROR_ENTRY_STATE_UNSELECT=>'未选择省份/洲',
		API_ERROR_ENTRY_STATE_NO_EXIST=>'选择的省份/洲不属于指定的国家',
		API_ERROR_ENTRY_EMAIL_ADDRESS_EXISTS=>'该Email地址已存在',
		
		API_ERROR_DUPLICATE_LANGUAGE_CODE=>'语言代码已存在',
		
		API_ERROR_COUNTRY_IN_USE=>'该国家代码已有客户使用',
		
		API_ERROR_TAX_RATE_EXISTS_FOR_CLASS=>'针对该税种已设置了税率',
		API_ERROR_TAX_RATE_EXISTS_FOR_PRODUCTS=>'已有商品使用该税种',
		
		API_ERROR_TAX_RATE_EXISTS=>'针对该地区已设置了税率',
		
		API_ERROR_GROUP_PRICING_CUSTOMERS_EXIST=>'已针对客户使用了该团体价格',
		
		API_ERROR_CANNOT_MOVE_CATEGORY_TO_CATEGORY_SELF=>'不能将商品类别移动到自身',
		API_ERROR_CANNOT_MOVE_CATEGORY_TO_PARENT=>'不能将商品类别移动到它的父类',
		API_ERROR_CATEGORY_HAS_PRODUCTS=>'目标类别下包含商品，不能移动',
		API_ERROR_CANNOT_MOVE_PRODUCT_TO_CATEGORY_SELF=>'不能移动商品到相同分类或原来的分类中',
		API_ERROR_CANNOT_LINK_TO_SAME_CATEGORY=>'不能在同一分类中链接商品',
		
		API_ATTRIBUTE_POSSIBLE_OPTIONS_NAME_WARNING_DUPLICATE=>'选项名称重复',
		API_ATTRIBUTE_POSSIBLE_OPTIONS_VALUE_WARNING_DUPLICATE=>'选项内容重复',
	);
	
	/**
	 * return the error code and message
	 *
	 * @param integer $code the error code
	 * @return string
	 */
	public static function error($code) {
		file_put_contents(DIR_FS_CATALOG . 'apilog.txt', "[".date('Y-m-d H:i:s')."] 错误代码：{$code}，描述：".self::$messages[$code]."\r\n", FILE_APPEND);
		return parent::prepare_output(array('code'=>$code, 'message'=>self::$messages[$code]));
	}
}
?>