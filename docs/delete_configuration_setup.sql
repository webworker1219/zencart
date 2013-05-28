delete from configuration_group where configuration_group_title like '%API设置';
delete from configuration where configuration_key 
in('API_KEY','API_INPUT_FORMAT','API_OUTPUT_FORMAT','PRODUCT_MEDIUM_LARGE_HEIGHT','PRODUCT_MEDIUM_LARGE_WIDTH','PRODUCT_MEDIUM_IMAGE_WIDTH','PRODUCT_MEDIUM_IMAGE_HEIGHT','PRODUCT_MEDIUM_SMALL_WIDTH','PRODUCT_MEDIUM_SMALL_HEIGHT','JMW_API_LOGIN_NAME','JMW_API_KEY','JMW_API_WSDL_URL','JMW_API_USER_TOKEN','JMW_API_PRICE_RATE','JMW_API_PRODUCTS_QUANTITY','JMW_API_PRODUCTS_LIST','JMW_API_ORDERS_STATUS','API_CURRENCIES_ID_SETUP','JMW_API_SHOPNAME','JMW_API_SHOPURL','JMW_API_SERVICEURL');
ALTER TABLE products   DROP `products_jmw_api`;
ALTER TABLE products   DROP `products_jmw_height`;
ALTER TABLE products   DROP `products_jmw_length`;
ALTER TABLE products   DROP `products_jmw_width`;
ALTER TABLE products   DROP `products_updatedate`;
ALTER TABLE products   DROP `products_jmw_sku`;

ALTER TABLE orders   DROP `jmw_orders_send_status`;
ALTER TABLE orders   DROP `jmwOrderID`;
DROP TABLE IF EXISTS `jmw_products_categories`;
