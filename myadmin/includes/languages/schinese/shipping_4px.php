<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 * @author Morrowind  
 * @contact 752979972@qq.com / hnsytcg@163.com
 * @version $Id: shipping_4px.php 15881 2011-06-22 16:32:39Z wilt $
 */
define('INSERT_NEW_SHIPPING','添加新的物流方式');
define('TEXT_DSF_ACCOUNT_CONFIRM_DELETE','确认删除？');
define('HEADING_TITLE', '4PX Shipping');
define('SELECT_INCIDENTALPRICE', '杂费价格表');
define('SHIPPING_WAY', 'Miscellaneous price table');
define('SHIPPING_TYPE', '运输方式');
define('SELECT_FEE_TYPE', '费用类型');
define('SELECT_CALCULATION_WAY', '计算方法');
define('SELECT_CALCULATION_VALUE', '计算值 ');
define('SELECT_MAX_VALUE', '最大值');
define('SELECT_MIN_VALUE', '最小值');
define('SHIPPING_INCIDEN_STATUS', '状态');
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




define('TEXT_DSF_SHIPPING_STATUS', '物流状态');
define('TEXT_DSF_SHIPPING_CODE', '物流编码');
define('TEXT_SHIPPING_DISPLAYS_NAME', '前台显示名称');
define('TEXT_SHIPPING_DISPLAYS_IMAGE', '前台显示图片地址');
define('TEXT_SHIPPING_DISPLAYS_NOTE', '前台显示备注信息');
define('TEXT_PRICE_PERCENTAGE', '结果百分比');
define('TEXT_PRICE_INCREASE', '结果增减量');
define('TEXT_DSF_SHIPPING_STATUS_DESC', '物流状态');
define('TEXT_DSF_SHIPPING_CODE_DESC', '物流编码');
define('TEXT_DSF_SHIPPING_NAME_DESC', '物流名称');
define('TEXT_SHIPPING_DISPLAYS_NAME_DESC', '前台显示名称');
define('TEXT_SHIPPING_DISPLAYS_IMAGE_DESC', '前台显示图片地址');
define('TEXT_SHIPPING_DISPLAYS_NOTE_DESC', '前台显示备注信息');
define('TEXT_PRICE_PERCENTAGE_DESC', '结果百分比');
define('TEXT_PRICE_INCREASE_DESC', '结果增减量');
define('TEXT_SORT_INDEX_DESC', '排序');
define('TEXT_DSF_SHIPPING_STATUS_TITLE', '物流状态');
define('TEXT_DSF_SHIPPING_CODE_TITLE', '物流编码');
define('TEXT_DSF_SHIPPING_NAME_TITLE', '物流名称');
define('TEXT_SHIPPING_DISPLAYS_NAME_TITLE', '前台显示名称');
define('TEXT_SHIPPING_DISPLAYS_IMAGE_TITLE', '前台显示图片地址');
define('TEXT_SHIPPING_DISPLAYS_NOTE_TITLE', '前台显示备注信息');
define('TEXT_PRICE_PERCENTAGE_TITLE', '结果百分比');
define('TEXT_PRICE_INCREASE_TITLE', '结果增减量');
define('TEXT_SORT_INDEX_TITLE', '排序');

define('HEADING_TITLE', '4PX 运送');

define('TABLE_HEADING_DSF_SHIPPING', '4PX 运送');
define('TABLE_HEADING_ACTION', '作用');

define('TEXT_HEADING_NEW_MANUFACTURER', '新厂商');
define('TEXT_HEADING_EDIT_MANUFACTURER', '编辑制造商');
define('TEXT_HEADING_DELETE_MANUFACTURER', '删除制造商');

define('TEXT_DSF_SHIPPING', '4PX 运送:');
define('TEXT_DATE_ADDED', '添加日期:');
define('TEXT_LAST_MODIFIED', '最后修改:');
define('TEXT_PRODUCTS', '产品:');
define('TEXT_PRODUCTS_IMAGE_DIR', '上传路径:');
define('TEXT_IMAGE_NONEXISTENT', '图像不存在');
define('TEXT_DSF_SHIPPING_IMAGE_MANUAL', '<strong>或, 从服务器的文件里选择一个存在的图像文件:</strong>');

define('TEXT_NEW_INTRO', '请为新的4PX运送填写下面的信息');
define('TEXT_EDIT_INTRO', '请做必要的更改');

define('TEXT_DSF_SHIPPING_NAME', '4PX 运送名称:');
define('TEXT_DSF_SHIPPING_IMAGE', '4PX 运送图像:');
define('TEXT_DSF_SHIPPING_URL', '4PX 运送URL:');

define('TEXT_DELETE_INTRO', '你确定要删除这个4PX运送吗?');
define('TEXT_DELETE_IMAGE', '删除4PX运送图像?');
define('TEXT_DELETE_PRODUCTS', '从这次4PX运送中删除产品？ (包括产品评论，特价产品，新近产品等)');
define('TEXT_DELETE_WARNING_PRODUCTS', '<b>警告:</b> 还有 %s 个产品和这次4PX运送相关!');

define('ERROR_DIRECTORY_NOT_WRITEABLE', '错误:该路径不可写。请设置合法的用户使用权限: %s');
define('ERROR_DIRECTORY_DOES_NOT_EXIST', '错误: 路径不存在: %s');


define('TABLE_HEADING_DSF_SHIPPING_CODE', '运送号码');
define('TABLE_HEADING_DSF_SHIPPING_NAME', '运送名称');
define('TABLE_HEADING_SHIPPING_DISPLAYS_NAME', '显示名称');
define('TABLE_HEADING_SHIPPING_DISPLAYS_IMAGE', '显示图像');
define('TABLE_HEADING_SHIPPING_DISPLAYS_NOTE', '显示注意事项');
define('TABLE_HEADING_PRICE_PERCENTAGE', '价格百分比');
define('TABLE_HEADING_PRICE_INCREASE', '价格增长');
define('TABLE_HEADING_SORT_INDEX', '排序');
define('TABLE_HEADING_MODIFIED', '修改日期');

define('TEXT_DISPLAY_NUMBER_OF_DSF_SHIPPING', '显示 <b>%d</b> 至<b>%d</b> (共 <b>%d</b> 条运送)');


?>