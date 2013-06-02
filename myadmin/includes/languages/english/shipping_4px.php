<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 * @author Morrowind  
 * @contact 752979972@qq.com / hnsytcg@163.com
 * @version $Id: shipping_4px.php 15881 2011-06-22 16:32:39Z wilt $
 */
define('UT_CODE_LIST0', '请选择');
define('UT_CODE_LIST1', '百分比');
define('UT_CODE_LIST2', '每票');
define('UT_CODE_LIST3', '每KG');
define('FK_CODE_FUEL_PRICE','燃油费');
define('OTHER_PRICE_CODE','其他费用');
define('OTHER_IMPORT_DATA','数据导入');
define('MODULE_IMPORT','导入数据');
define('INSERT_INFO_RESULT','导入成功');
define('OTHER_IMPORT_DATA_TEXT','导入须知');
define('IMPORT_DATA_TEXT_INFO','
<div style="padding:5px;line-height:25px;">
<h2>一  Excel文件导入</h2>
1,根据文档<a href="../import_file_style/shipping_test.xls">shipping_test.xls</a>，制作excle表格，可一次添加多个物流。<br />
2.文档里必须填对应的国家二位代码。多个用英文的<b style="color:red">逗号(,)</b>隔开。<br />
3.重量段，必须用<b style="color:red"> - </b>隔开。如：0-0.5 。<br />
4.由于时间的关系，暂时不支持导入杂费的功能。<br />
<br />
<img src="images/excel_handler.gif"><br />


<h2>二.csv文件导入</h2>
1.文件格式必须是.csv</br >
2.<b>数据的格式</b>根据<a href="../import_file_style/import_templates_style.xls">import_templates_style.xls</a>文件内容格式,再导出csv文件.<br />
3.<b>导入数据请根据如下命名文件名</b><br />
<产品表>为：<span style="color:red;"><a href="../import_file_style/ShippingProductsTable.csv">ShippingProductsTable.csv</a></span><br />
<区域定义表>为:<span style="color:red;"><a href="../import_file_style/ShippingAreaNameTable.csv">ShippingAreaNameTable.csv</a></span><br />
<区域国家表>为:<span style="color:red;"><a href="../import_file_style/ShippingAreaCountryTable.csv">ShippingAreaCountryTable.csv</a></span><br />
<区域价格表>为:<span style="color:red;"><a href="../import_file_style/ShippingPriceTable.csv">ShippingPriceTable.csv</a> 其他物流也可命名为此名。、<a href="../import_file_style/ShippingPriceTable-dhl.csv">ShippingPriceTable-dhl.csv</a>、<a href="../import_file_style/ShippingPriceTable-ems.csv">ems</a>、<a href="../import_file_style/ShippingPriceTable-ups.csv">ups</a></span><br />
<杂费表>为:<span style="color:red;"><a href="../import_file_style/ShippingIncidentalPrice.csv">ShippingIncidentalPrice.csv</a></span>.<br />
4.<b>请不要同数据多次导入</b>。<br />
5.<b>此导入更新，只支持<区域价格表>更新: </b>
文件名为<span style="color:red;"> <a href="../import_file_style/Update_ShippingPriceTable.csv">Update_ShippingPriceTable.csv</a></span><br />
6.<b>区域价格表</b>中的总价单价标志,1为此重量段按<b style="color:blue;">总价</b>来计算，2为此重量段按重量<b style="color:blue;">单价</b>来计算。<br />
当总价单价标志为1时，单位（单价有效）此项为0，当为2时，单位（单价有效）此项请必须填写计算的单位如:1 , 1代表1kg.<br/>
第一行的区间ID务必填对。
</div>
');
define('TRUNCATE_TABLE_RECORD','清空数据表');
define('TRUNCATE_TABLE_NAME','表名:');
define('TRUNCATE_TABLE_TURE','确定清空？');
define('NO_TRUNCATE_TABLE_NAME','<b style="color:red;">清空表失败，或无此表</b>');
define('TRUNCATE_TABLE_SUCCESS','<b style="color:red;">清空成功</b>');
define('TRUNCATE_TABLE_NOTES','
<div style="padding:5px;line-height:25px;">
<b>清空须知</b><br />
请根据导入须知中文件命名清空表，例：清空杂费表输入   ShippingIncidentalPrice  .
</div>
');


define('INSERT_NEW_SHIPPING','Add new shipping');
define('TEXT_DSF_ACCOUNT_CONFIRM_DELETE','Delete?');
define('HEADING_TITLE', '4PX Shipping');
define('SELECT_INCIDENTALPRICE', 'Miscellaneous price table');
define('SHIPPING_WAY', 'Miscellaneous price table');
define('SHIPPING_TYPE', 'Transport way');
define('SELECT_FEE_TYPE', 'Fee type');
define('SELECT_CALCULATION_WAY', 'Calculation way');
define('SELECT_CALCULATION_VALUE', 'Calculation value');
define('SELECT_MAX_VALUE', 'Max value');
define('SELECT_MIN_VALUE', 'Min value');
define('SHIPPING_INCIDEN_STATUS', 'Status');


define('TABLE_HEADING_DSF_SHIPPING', '4PX Shipping');
define('TABLE_HEADING_ACTION', 'Action');

define('TEXT_HEADING_NEW_MANUFACTURER', 'New Manufacturer');
define('TEXT_HEADING_EDIT_MANUFACTURER', 'Edit Manufacturer');
define('TEXT_HEADING_DELETE_MANUFACTURER', 'Delete Manufacturer');

define('TEXT_DSF_SHIPPING', '4PX Shipping:');
define('TEXT_DATE_ADDED', 'Date Added:');
define('TEXT_LAST_MODIFIED', 'Last Modified:');
define('TEXT_PRODUCTS', 'Products:');
define('TEXT_PRODUCTS_IMAGE_DIR', 'Upload to directory:');
define('TEXT_IMAGE_NONEXISTENT', 'IMAGE DOES NOT EXIST');
define('TEXT_DSF_SHIPPING_IMAGE_MANUAL', '<strong>Or, select an existing image file from server, filename:</strong>');

define('TEXT_NEW_INTRO', 'Please fill out the following information for the new 4PX shipping');
define('TEXT_EDIT_INTRO', 'Please make any necessary changes');

define('TEXT_DSF_SHIPPING_NAME', '4PX Shipping Name:');
define('TEXT_DSF_SHIPPING_IMAGE', '4PX Shipping Image:');
define('TEXT_DSF_SHIPPING_URL', '4PX Shipping URL:');

define('TEXT_DELETE_INTRO', 'Are you sure you want to delete this 4PX shipping?');
define('TEXT_DELETE_IMAGE', 'Delete 4PX shippings image?');
define('TEXT_DELETE_PRODUCTS', 'Delete products from this 4PX shipping? (including product reviews, products on special, upcoming products)');
define('TEXT_DELETE_WARNING_PRODUCTS', '<b>WARNING:</b> There are %s products still linked to this 4PX shipping!');

define('ERROR_DIRECTORY_NOT_WRITEABLE', 'Error: I can not write to this directory. Please set the right user permissions on: %s');
define('ERROR_DIRECTORY_DOES_NOT_EXIST', 'Error: Directory does not exist: %s');


define('TABLE_HEADING_DSF_SHIPPING_CODE', 'Shipping Code');
define('TABLE_HEADING_DSF_SHIPPING_NAME', 'Shipping Name');
define('TABLE_HEADING_SHIPPING_DISPLAYS_NAME', 'Display Name');
define('TABLE_HEADING_SHIPPING_DISPLAYS_IMAGE', 'Display Image');
define('TABLE_HEADING_SHIPPING_DISPLAYS_NOTE', 'Display Remark');
define('TABLE_HEADING_PRICE_PERCENTAGE', 'Price Percentage');
define('TABLE_HEADING_PRICE_INCREASE', 'Price Increase');
define('TABLE_HEADING_SORT_INDEX', 'Sort');
define('TABLE_HEADING_MODIFIED', 'Modified Date');
define('TABLE_HEADING_STATUS', 'Status');


define('TEXT_DSF_SHIPPING_STATUS', '物流状态');
define('TEXT_DSF_SHIPPING_CODE', '物流编码');
define('TEXT_SHIPPING_DISPLAYS_NAME', '前台显示名称');
define('TEXT_SHIPPING_DISPLAYS_IMAGE', '前台显示图片地址');
define('TEXT_SHIPPING_DISPLAYS_NOTE', '前台显示备注信息');
define('TEXT_PRICE_PERCENTAGE', '结果百分比');
define('TEXT_PRICE_INCREASE', '附加费用数值');

define('TEXT_DSF_SHIPPING_STATUS_TITLE', '物流状态');
define('TEXT_DSF_SHIPPING_CODE_TITLE', '物流编码');
define('TEXT_DSF_SHIPPING_NAME_TITLE', '物流名称');
define('TEXT_SHIPPING_DISPLAYS_NAME_TITLE', '前台显示名称');
define('TEXT_SHIPPING_DISPLAYS_IMAGE_TITLE', '前台显示图片地址');
define('TEXT_SHIPPING_DISPLAYS_NOTE_TITLE', '前台显示备注信息');
define('TEXT_PRICE_PERCENTAGE_TITLE', '结果百分比');
define('TEXT_PRICE_INCREASE_TITLE', '附加费用');
define('TEXT_SORT_INDEX_TITLE', '排序');


define('TEXT_DSF_SHIPPING_STATUS_DESC', '物流状态');
define('TEXT_DSF_SHIPPING_CODE_DESC', '物流编码');
define('TEXT_DSF_SHIPPING_NAME_DESC', '物流名称');
define('TEXT_SHIPPING_DISPLAYS_NAME_DESC', '前台显示名称');
define('TEXT_SHIPPING_DISPLAYS_IMAGE_DESC', '前台显示图片地址');
define('TEXT_SHIPPING_DISPLAYS_NOTE_DESC', '前台显示备注信息');
define('TEXT_PRICE_PERCENTAGE_DESC', '结果百分比');
define('TEXT_PRICE_INCREASE_DESC', '请填写附加费用数值');
define('TEXT_SORT_INDEX_DESC', '排序');


define('TEXT_HEADING_DSF_ACCOUNT_INSTALL', '递四方物流接口安装');
define('TEXT_DSF_STATUS_TITLE', '状态');
define('TEXT_DSF_STATUS_DESC', 'true表示开启，false表示关闭');
define('TEXT_DSF_USERNAME_TITLE', '递四方用户名');
define('TEXT_DSF_USERNAME_DESC', '如果没有请和4px联系拿折扣，递四方网址：http://www.4px.cc');
define('TEXT_DSF_PASSWORD_TITLE', '密码');
define('TEXT_DSF_PASSWORD_DESC', '密码');


define('TEXT_DISPLAY_NUMBER_OF_DSF_SHIPPING', 'Displaying <b>%d</b> to <b>%d</b> (of <b>%d</b> shipping)');


?>