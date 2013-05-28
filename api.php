<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 * @contact 290313271@qq.com / hnsytcg@163.com
 * @version $Id: api.php 15881 2011-03-21 16:32:39Z wilt $
 */
require('includes/application_top.php');

//定义加载API相关类的路径
define('DIR_WS_CLASSES_API', DIR_WS_CLASSES . 'api/');
define('DIR_FS_CATALOG_IMAGES','images/');
//加载API基类
require DIR_WS_CLASSES_API . 'ApiBase.class.php';

//加载错误码处理类
require DIR_WS_CLASSES_API . 'ErrCode.class.php';

//加载API相关类
require DIR_WS_CLASSES_API . 'System.class.php';
require DIR_WS_CLASSES_API . 'Categories.class.php';
require DIR_WS_CLASSES_API . 'ProductsApi.class.php';
require DIR_WS_CLASSES_API . 'ProductTypes.class.php';
//require DIR_WS_CLASSES_API . 'OptionNames.class.php';
require DIR_WS_CLASSES_API . 'OptionValues.class.php';
require DIR_WS_CLASSES_API . 'Attributes.class.php';
//require DIR_WS_CLASSES_API . 'Customers.class.php';
require DIR_WS_CLASSES_API . 'Orders.class.php';
require DIR_WS_CLASSES_API . 'OrderStatus.class.php';
//require DIR_WS_CLASSES_API . 'Languages.class.php';
//require DIR_WS_CLASSES_API . 'CurrenciesApi.class.php';
//require DIR_WS_CLASSES_API . 'Countries.class.php';
//require DIR_WS_CLASSES_API . 'ZonesApi.class.php';
//require DIR_WS_CLASSES_API . 'TaxClass.class.php';
//require DIR_WS_CLASSES_API . 'TaxZones.class.php';
//require DIR_WS_CLASSES_API . 'TaxRates.class.php';
//require DIR_WS_CLASSES_API . 'Manufacturers.class.php';
//require DIR_WS_CLASSES_API . 'GroupPricing.class.php';
//require DIR_WS_CLASSES_API . 'Reviews.class.php';
//require DIR_WS_CLASSES_API . 'Coupon.class.php';

//加载API总类
require DIR_WS_CLASSES_API . 'Api.class.php';

//开启SOAP服务
$wsdl = HTTP_SERVER . DIR_WS_CATALOG . 'api.wsdl';
ini_set("soap.wsdl_cache_enabled", "0"); // disabling WSDL cache
$server = new SoapServer($wsdl);
$server->setClass('Api');
$server->handle();

//加载页面尾部
require(DIR_WS_INCLUDES . 'application_bottom.php');
?>