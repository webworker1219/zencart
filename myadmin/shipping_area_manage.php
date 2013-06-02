<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 * @author Morrowind  
 * @contact 752979972@qq.com / hnsytcg@163.com
 * @version $Id: shipping_4px.php 15881 2011-06-22 16:32:39Z wilt $
 */
require('includes/application_top.php');
function handle_form_area_data($action,$condition=null){//添加、更新区域名称信息
	$pr_id                  = zen_db_prepare_input($_POST['pr_id']);
	$country_regional_name  = zen_db_prepare_input($_POST['country_regional_name']);
	$status                 = $_POST['status']?zen_db_prepare_input($_POST['status']):1;
	$sql_data_array         = array('pr_id'                   => $pr_id,
							        'country_regional_name'   => $country_regional_name,
							        'status'                  => $status,
							        'modified'                => date("Y-m-d H:i:s"));
    if($action=='insert'){
	 $created_date          = array('created' => date("Y-m-d H:i:s"));
	 $sql_data_array        = array_merge($sql_data_array,$created_date);
	}
	zen_db_perform("shipping_country_regional", $sql_data_array, $action,$condition);
}
function get_shipping_way_list(){//获得物流方式
  global $db;
  $result_raw               = $db->Execute("select pr_name,pr_id from shipping_pricerule");
   while (!$result_raw->EOF) {
     $return_array[$result_raw->fields['pr_id']]  = $result_raw->fields['pr_name'];
     $result_raw->MoveNext();
   }
   return $return_array;
}
function get_shipping_menu_list($array,$list_name='null',$default_id=null,$class_style=null){//输出下拉框例表
  $select_list       = '<select id="'.$list_name.'" name="'.$list_name.'" '.$class_style.'>';
  $select_list      .= '<option value="">'.UT_CODE_LIST0.'</option>';
  foreach($array as $key => $val){
    $selected        = $default_id==$key?' selected="selected" ':'';
    $select_list    .= '<option value="'.$key.'" '.$selected.'>'.$val.'</option>';
	unset($selected);
  }
  $select_list     .= '</select>';
  return $select_list;
}
function get_area_info($area_id,$select_string){//根据条件查询区域信息
  global $db;
  $result_area_info = $db->Execute("select ".$select_string." from shipping_country_regional where country_regional_id='".$area_id."'");
  return $result_area_info->fields[$select_string];
}
function get_countries_id_array($retrun_info=null){//获得国家ID、名字数组
  global $db;
  //$result_countries = $db->Execute("select countries_id,countries_name,countries_cn_name from ".TABLE_COUNTRIES);
	$result_countries = $db->Execute("select countries_id,countries_name,countries_cn_name from shipping_country");
  $languages_id     = $_SESSION['languages_id'];
  while (!$result_countries->EOF) {
    $countries_id[] = $result_countries->fields['countries_id'];
	$countries_name = ($languages_id ==2)?$result_countries->fields['countries_cn_name']:$result_countries->fields['countries_name'];
	$return_countries_name[$result_countries->fields['countries_id']] = $countries_name;
	unset($countries_name);
    $result_countries->MoveNext();
  }
  $return_array = empty($retrun_info)?$countries_id:$return_countries_name;
  unset($countries_id,$return_countries_name);
  return $return_array;
}
function get_area_already_countries($area_id,$pr_id,$accurate_info=null){//获得已选国家
  global $db;
  $condition = empty($accurate_info)?" and area_id='".$area_id."'":'';
  $result_area_info = $db->Execute("select countries_id from shipping_freightpricearea where pr_id='".$pr_id."' ".$condition);
  while(!$result_area_info->EOF) {
    $countries_id[] = $result_area_info->fields['countries_id'];
    $result_area_info->MoveNext();
  }
  return $countries_id;
}
function get_area_can_countries($area_id,$pr_id){//获得可选国家
  global $db;
  $already_country   = get_area_already_countries($area_id,$pr_id,'accurate');
  $already_countries = empty($already_country)?array():implode(',',$already_country);
  if(empty($already_countries)){
     return get_countries_id_array();
  }
  //$result_countries = $db->Execute("select countries_id,countries_name,countries_cn_name from ".TABLE_COUNTRIES." where countries_id not in(".$already_countries.") order by countries_name,countries_cn_name");
	$result_countries = $db->Execute("select countries_id,countries_name,countries_cn_name from shipping_country where countries_id not in(".$already_countries.") order by countries_name,countries_cn_name");
  while (!$result_countries->EOF) {
    $return_countries[] = $result_countries->fields['countries_id'];
    $result_countries->MoveNext();
  }
  return $return_countries;
}
//--------------------------------------------------------- function   end ------------------------------------------------------------------------------
$shipping_way_array_list=get_shipping_way_list();
$all_countries = get_countries_id_array('name');
$url_show_pr_id = $_GET['pr_id']?'&pr_id='.$_GET['pr_id']:null;

$action = (isset($_GET['action']) ? $_GET['action'] : '');
if (zen_not_null($action)) {
  switch ($action) {
    case 'area_save':
	  if (isset($_GET['country_regional_id'])) $country_regional_id = zen_db_prepare_input($_GET['country_regional_id']);
	  handle_form_area_data('update',"country_regional_id ='".(int)$country_regional_id."'");
	  if($_GET['pr_id']){ $pr_id_url_address = '&pr_id='.$_GET['pr_id'];}
      zen_redirect(zen_href_link("shipping_area_manage", (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '')
	  . 'country_regional_id=' . $country_regional_id.$pr_id_url_address));
	break;
	case 'area_insert':
	  if (isset($_GET['country_regional_id'])) $country_regional_id = zen_db_prepare_input($_GET['country_regional_id']);
	  handle_form_area_data('insert');
      zen_redirect(zen_href_link("shipping_area_manage", (isset($_GET['page']) ? 'page=' . $_GET['page'].$url_show_pr_id : '')));
	break;
	case 'area_delete':
      if($_GET['country_regional_id'])
	  $db->Execute("delete from shipping_country_regional where country_regional_id='".$_GET['country_regional_id']."'");
	  zen_redirect(zen_href_link("shipping_area_manage", (isset($_GET['page']) ? 'page=' . $_GET['page'].$url_show_pr_id : '')));
	break;
	case 'setup_countries_area':
	break;
	case 'save_set_area_countries_list':
	  $country_regional_id  = $_GET['country_regional_id'];
	  $pr_id                = $_POST['pr_id'];
	  $db->Execute("delete from shipping_freightpricearea where area_id='".$country_regional_id."' and pr_id='".$pr_id."'");
	  $add_country_list     = $_POST['country_list'];
	  if($add_country_list){
	    foreach($add_country_list as $key=>$value){
	      $insert_data_array   = array('pr_id'        => $pr_id,
							           'area_id'      => $country_regional_id,
							           'countries_id' => $value,
							           'status'       => 1);
	      zen_db_perform("shipping_freightpricearea", $insert_data_array,'insert');
		}
	  }
	  zen_redirect(zen_href_link("shipping_area_manage", 'action=set_area_countries_list&country_regional_id='.$country_regional_id.'&'.(isset($_GET['page']) ? 'page=' . $_GET['page'].$url_show_pr_id : '')));
	break;
	case 'set_area_price_list'://更新区域价格
	if(empty($_POST['id'])) break;//如果无更新，跳出跟新区域。
	foreach($_POST['id'] as $key=>$value){
	  $update_pr_id                   = $_POST['id'][$key];
	  $_POST['wk_code'][$key]        !='undefined'?$update_data_array['wk_code']         = $_POST['wk_code'][$key]:null;
	  $_POST['fv_unitweight'][$key]  !='undefined'?$update_data_array['fv_unitweight']   = $_POST['fv_unitweight'][$key]:null;
	  $_POST['weight_start'][$key]   !='undefined'?$update_data_array['weight_start']    = $_POST['weight_start'][$key]:null;
	  $_POST['weight_end'][$key]     !='undefined'?$update_data_array['weight_end']      = $_POST['weight_end'][$key]:null;
	  $_POST['price_value'][$key]    !='undefined'?$update_data_array['price_value']     = $_POST['price_value'][$key]:null;
	  $update_sql_array               =  array_merge_recursive($update_data_array);
	  zen_db_perform("shipping_freightpricevalue", $update_sql_array,'update',"pv_id={$update_pr_id}");
	  unset($update_data_array['wk_code'],$update_data_array['fv_unitweight'],$update_data_array['weight_start'],$update_data_array['weight_end'],$update_data_array['price_value']);
	}
	$messageStack->add_session(UPDATE_INFO_RESULT, 'success');
	zen_redirect(zen_href_link("shipping_area_manage", 'action=set_area_price_list&country_regional_id='.$_GET['country_regional_id'].'&'.(isset($_GET['page']) ? 'page=' . $_GET['page'].$url_show_pr_id : '')));
	break;
	case 'insert_area_manage_price':
	foreach($_POST['new_wk_code'] as $key=>$value){
	  if($key==0) continue;
	   $new_wk_code                  = $_POST['new_wk_code'][$key];
	   $new_fv_unitweight            = $_POST['new_fv_unitweight'][$key];
	   $new_weight_start             = $_POST['new_weight_start'][$key];
	   $new_weight_end               = $_POST['new_weight_end'][$key];
	   $new_price_value              = $_POST['new_price_value'][$key];
	   $insert_new_info              = array('pr_id'=>$_POST['pr_id'],
											 'area_id'=>$_POST['area_id'],
											 'wk_code'=>$new_wk_code,
	                                         'fv_unitweight'=>$new_fv_unitweight,
	                                         'weight_start'=>$new_weight_start,
											 'weight_end'=>$new_weight_end,
											 'price_value'=>$new_price_value,
											 'status'=>1
											  );
	  zen_db_perform("shipping_freightpricevalue", $insert_new_info,'insert');
	}
	$messageStack->add_session(INSERT_INFO_RESULT, 'success');
	zen_redirect(zen_href_link("shipping_area_manage", 'action=set_area_price_list&country_regional_id='.$_GET['country_regional_id'].(isset($_GET['page']) ? '&page=' . $_GET['page'].$url_show_pr_id : '')));
	break;
	case 'delete_area_price_unit':
	 $db->Execute("delete from shipping_freightpricevalue where pv_id='".$_GET['pv_id']."' and area_id='".$_GET['country_regional_id']."'");
	 $messageStack->add_session(DELETE_INFO_RESULT, 'success');
	 zen_redirect(zen_href_link("shipping_area_manage", 'action=set_area_price_list&country_regional_id='.$_GET['country_regional_id'].(isset($_GET['page']) ? '&page=' . $_GET['page'].$url_show_pr_id : '')));
	break;
  }
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" href="includes/cssjsmenuhover.css" media="all" id="hoverJS">
<link rel="stylesheet" type="text/css" href="includes/javascript/shipping_4px.css">
<script language="javascript" src="includes/javascript/jquery-1.5.js"></script>
<script language="javascript" src="includes/javascript/shipping_4px.js"></script>
<script language="javascript" src="includes/menu.js"></script>
<script language="javascript" src="includes/general.js"></script>
<script type="text/javascript">
  <!--
  function init()
  {
    cssjsmenu('navbar');
    if (document.getElementById)
    {
      var kill = document.getElementById('hoverJS');
      kill.disabled = true;
    }
  }
function addRow() {
  var row_html_var = '<tr>' + $('#row_html').html() + '</tr>';
  $(row_html_var).insertBefore('#last_row');
}
function delRow(obj) {
  $(obj).parent().parent().remove();
}
function show_new_insert_price_list(){
  $("#show_new_insert_price_list").show();
  addRow();
}
function close_new_insert_price_list(){
  $("#show_new_insert_price_list").hide();
}
  // -->
</script>
</head>
<body onload="init()">
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<?php
switch ($action) {
case 'set_area_countries_list'://设置区域国家
$get_country_regional_id  = get_area_info($_GET['country_regional_id'],'pr_id');
?>
<div style="padding-left:10px;padding-right:5px;">
  <div style="padding-top:5px;padding-bottom:10px;color:#003D00;font-size:16px;font-variant:small-caps;font-weight:bold;">
   <?php echo AREA_URL_PATCH; //  ---------------------------->> 你所在的位置--->> 国家设置 ----------------------------------  ?>
	<a href="<?php echo zen_href_link("shipping_4px");?>">
	<?php echo HEADING_TITLE; ?>
	</a>&rArr;
	   <a href="<?php echo zen_href_link("shipping_area_manage",$url_show_pr_id);?>">
	   <?php echo TABLE_HEADING_SET_AREA; ?>
	   </a>
	&rArr;
	<span style="font-size:12px;">
	  <?php echo TABLE_SETUP_AREA_COUNTRIES_LIST;?>
	</span>:
	<span style="font-size:12px;">
	    <?php  echo $shipping_way_array_list[$get_country_regional_id];?>
	</span> 
  </div>
<table class="menutab" width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr>
	  <td class="menumaintopon">
	    <?php echo TABLE_SETUP_AREA_COUNTRIES_LIST;?>
	  </td>
    </tr>
	<tr>
	  <td>
	  <?php echo zen_draw_form('save_set_area_countries_list', "shipping_area_manage", 'page=' . $_GET['page'] . '&country_regional_id=' . $_GET['country_regional_id'] . '&action=save_set_area_countries_list'.$url_show_pr_id, 'post', 'enctype="multipart/form-data"');?>
	   <table width="100%" cellspacing="0" cellpadding="0" border="0">
	     <tbody>
		   <tr>
		     <td class="smalltdrow1" width="194" valign="top" align="left">
			   <?php echo TABLE_HEADING_SHIPPING_WAY;?>
			 </td>
			 <td class="smalltdrow2" align="left">
			   <?php 
			   echo $shipping_way_array_list[$get_country_regional_id];?>
			   <input type="hidden" value="<?php echo $get_country_regional_id;?>" name="pr_id">
			 </td>
		   </tr>
		   <tr>
		     <td class="smalltdrow1" width="194" valign="top" align="left">
			   <?php echo TABLE_HEADING_SHIPPING_AREA_NAME;?>
			 </td>
			 <td class="smalltdrow2" align="left">
			   <?php echo get_area_info($_GET['country_regional_id'],'country_regional_name');?>
			 </td>
		   </tr>
		   <tr>
		     <td class="smalltdrow1" width="194" valign="top" align="left">
			   <?php echo TABLE_ALREADY_COUNTRIES;?>
			 </td>
			 <td class="smalltdrow2" align="left" style="line-height:30px;">
			   <?php 
			   $already_country_array = get_area_already_countries($_GET['country_regional_id'],$get_country_regional_id);
			   if($already_country_array){
			     foreach($already_country_array as $key=>$val){
			       echo '<span class="area_manage_countries_hidden"><input type="checkbox" value="'.$val.'" name="country_list[]" checked="checked">'.
				   $all_countries[$val].'</span>';
			     }
			   }
			   ?>
			 </td>
		   </tr>
		   <tr>
		     <td class="smalltdrow1" width="194" valign="top" align="left">
			   <?php echo TABLE_CAN_COUNTRIES;?>
			 </td>
			 <td class="smalltdrow2" align="left" style="line-height:30px;">
			   <?php 
			    $can_countries_array = get_area_can_countries($_GET['country_regional_id'],$get_country_regional_id);
				if($can_countries_array){
				  foreach($can_countries_array as $key=>$val){
			       echo '<span  class="area_manage_countries_hidden"><input type="checkbox" value="'.$val.'" name="country_list[]">'.$all_countries[$val].'</span>';
			     }
				}
			   ?>
			 </td>
		   </tr>
		 </tbody>
	   </table>
	   <?php echo '</from>';?>
	</td>
	<tr>
	  <td class="tdblue" valign="center" height="25" align="center">
	    <?php 
		echo zen_image_submit('button_save.gif', IMAGE_SAVE);
		echo '&nbsp;&nbsp;<a href="'.zen_href_link("shipping_area_manage",'action=area_info'.$url_show_pr_id).'">'.zen_image_button('button_back.gif', IMAGE_CANCEL).'</a>';
		?>
	</td>
    </tr>
  </tbody>
</table>
</div>

<?php
break;
case 'set_area_price_list':  //  ---------------------------->>  你所在的位置  --->>   价格设置   --------------------------------
$wk_code_array = array(1=>TOTAL_CALCULATE,2=>UNIVALENT_CALCULATE);
$get_pr_id  = get_area_info($_GET['country_regional_id'],'pr_id'); //物流方式ID
$area_id                  = $_GET['country_regional_id'];
$result_price_list        = $db->Execute("select * from shipping_freightpricevalue where area_id='".$area_id."' and pr_id='".$get_pr_id."'");
?>
<div style="padding-left:10px;padding-right:5px;">
  <div style="padding-top:5px;padding-bottom:10px;color:#003D00;font-size:16px;font-variant:small-caps;font-weight:bold;">
   <?php echo AREA_URL_PATCH;?>
	<a href="<?php echo zen_href_link("shipping_4px");?>">
	<?php echo HEADING_TITLE; ?>
	</a>&rArr;
	   <a href="<?php echo zen_href_link("shipping_area_manage",$url_show_pr_id);?>">
	   <?php echo TABLE_HEADING_SET_AREA; ?>
	   </a>
	&rArr;
	<span style="font-size:12px;">
	<?php echo TABLE_HEADING_AREA_PRICE;?>:
	<?php echo get_area_info($_GET['country_regional_id'],'country_regional_name');?>
	</span>
  </div>
  
<table class="menutab" width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr>
	  <td class="menumaintopon">
	    <?php echo TABLE_HEADING_AREA_PRICE;?>
	  </td>
    </tr>
	<tr>
	  <td>
	  <table width="100%" cellspacing="0" cellpadding="0" border="0">
	     <tbody>
		   <tr>
		     <td class="smalltdrow1" align="left" width="160">
			   <?php echo TABLE_HEADING_SHIPPING_WAY;?>
			 </td>
			 <td class="smalltdrow2" align="left">
			   <?php 
			   echo $shipping_way_array_list[$get_pr_id];?>
			 </td>
		   </tr>
		   <tr>
		     <td class="smalltdrow1" align="left" width="160">
			   <?php echo TABLE_HEADING_SHIPPING_AREA_NAME;?>
			 </td>
			 <td class="smalltdrow2" align="left">
			   <?php echo get_area_info($_GET['country_regional_id'],'country_regional_name');?>
			 </td>
		   </tr>
         </tbody>
      </table>
      <div style="text-align:right;clear:both;width:99%;padding:5px 5px 0 5px;"><a href="javascript:void(0);" onclick="show_new_insert_price_list();"><?php echo INSERT_INFO_RESULT_BUTTON;?></a></div>	  
	   <?php //下面显示价格设置 ?>
       <div style="border:1px solid #999;margin:5px;">
	   <table width="100%" cellspacing="0" cellpadding="0" border="0">
	     <tbody>
		   <tr>
		     <td class="smalltdrow1" align="center">
			   <?php echo TABLE_HEADING_AREA_PRICE_MARK;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_PRICE_CALCULATE_UNIT;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_START_WEIGHT_AREA;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_END_WEIGHT_AREA;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_HEADING_AREA_PRICE_UNIT;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_HEADING_SHIPPING_AREA_ACTION;?>
			 </td>
		  </tr>
		  <?php  while(!$result_price_list->EOF){  ?>
		  <tr>
		     <td class="smalltdrow2" align="center">
			 <?php 
			 $calss_style = ' vid="'.$result_price_list->fields['pv_id'].'" ovalue="'.$result_price_list->fields['wk_code'].'" ';
			 echo get_shipping_menu_list($wk_code_array,'wk_code',$result_price_list->fields['wk_code'],$calss_style);
			 ?>
			 </td>
			 <td class="smalltdrow2" align="center">
			 <input type="text" name="fv_unitweight" vid="<?php echo $result_price_list->fields['pv_id'];?>" ovalue="<?php echo $result_price_list->fields['fv_unitweight'];?>" value="<?php echo $result_price_list->fields['fv_unitweight'];?>" />
			 </td>
			 <td class="smalltdrow2" align="center">
			 <input type="text" name="weight_start" vid="<?php echo $result_price_list->fields['pv_id'];?>" ovalue="<?php echo $result_price_list->fields['weight_start'];?>" value="<?php echo $result_price_list->fields['weight_start'];?>"/>
			 </td>
			 <td class="smalltdrow2" align="center">
			   <input type="text" name="weight_end" vid="<?php echo $result_price_list->fields['pv_id'];?>" ovalue="<?php echo $result_price_list->fields['weight_end'];?>" value="<?php echo $result_price_list->fields['weight_end'];?>"/>
			 </td>
			 <td class="smalltdrow2" align="center">
			   <input type="text" name="price_value" vid="<?php echo $result_price_list->fields['pv_id'];?>" ovalue="<?php echo $result_price_list->fields['price_value'];?>" value="<?php echo $result_price_list->fields['price_value'];?>"/>
			 </td>
			 <td class="smalltdrow2" align="center">
			   <a <?php echo 'onclick="javascript:if(!confirm(\''.TEXT_DSF_ACCOUNT_CONFIRM_DELETE.'\')){return false;}" ';?>
			   href="<?php echo zen_href_link("shipping_area_manage",'action=delete_area_price_unit&country_regional_id='.
			                       $area_id.'&pv_id='.$result_price_list->fields['pv_id'].(isset($_GET['page']) ? '&page=' . $_GET['page'].$url_show_pr_id : ''));?>">
			     <?php echo zen_image(DIR_WS_IMAGES . 'icon_delete.gif', ICON_DELETE,'16');?>
			   </a>
			 </td>
		  </tr>
		  <?php  $result_price_list->MoveNext();} ?>
		  <tr>
		    <td colspan="6" class="smalltdrow2" align="center" >
			  <?php 
	    if($result_price_list->fields['pv_id']){
		echo '<img src="'.DIR_WS_LANGUAGES . $_SESSION['language'] . '/images/buttons/button_save.gif" onclick="price_list_update();" />' ;
		echo '&nbsp;&nbsp;<a href="'.zen_href_link("shipping_area_manage",'action=area_info'.$url_show_pr_id).'">'.zen_image_button('button_back.gif', IMAGE_CANCEL).'</a>';
		echo '<span style="float:right;"><a href="javascript:void(0);" onclick="show_new_insert_price_list();">'
		.INSERT_INFO_RESULT_BUTTON.'</a></span>';
		}
		?>
			</td>
		  </tr>
		  
		  <tr>
		    <td colspan="6" class="smalltdrow2" align="center" style="padding:0;margin:0;" >
			<?php  //========================================>>>>     新添加的价格 strat     >>>>=========================================================
		   echo zen_draw_form('shipping_area_manage', "shipping_area_manage", 'action=insert_area_manage_price&country_regional_id='.$area_id.'&page='.$_GET['page'].$url_show_pr_id, 'post','id="insert_new_price"');
		   ?>
		    <input type="hidden" value="<?php echo $get_pr_id;?>"  name="pr_id">
			<input type="hidden" value="<?php echo $area_id;?>"  name="area_id">
		  <div id="show_new_insert_price_list" style="display:none;">
		  <table width="100%" cellspacing="0" cellpadding="0" border="0">
		  <tr>
		     <td class="smalltdrow1" align="center">
			   <?php echo TABLE_HEADING_AREA_PRICE_MARK;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_PRICE_CALCULATE_UNIT;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_START_WEIGHT_AREA;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_END_WEIGHT_AREA;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_HEADING_AREA_PRICE_UNIT;?>
			 </td>
			 <td class="smalltdrow1" align="center">
			   <?php echo TABLE_HEADING_SHIPPING_AREA_ACTION;?>
			 </td>
		  </tr>
		  <tr id="row_html" style="display:none;">
		     <td class="smalltdrow2" align="center">
			   <?php  echo get_shipping_menu_list($wk_code_array,'new_wk_code[]',null);?>
			 </td>
			 <td class="smalltdrow2" align="center">
			   <input type="text" value=""  name="new_fv_unitweight[]">
			 </td>
			 <td class="smalltdrow2" align="center">
			  <input type="text" value="" name="new_weight_start[]">
			 </td>
			 <td class="smalltdrow2" align="center">
			   <input type="text" value="" name="new_weight_end[]">
			 </td>
			 <td class="smalltdrow2" align="center">
			  <input type="text" value="" name="new_price_value[]">
			 </td>
			 <td class="smalltdrow2" align="center">
			   <a href="javascript:void(0);" onclick="delRow(this);"><?php echo zen_image(DIR_WS_IMAGES . 'icon_delete.gif', ICON_DELETE,'16');?></a>
			 </td>
		  </tr>
		  <tr id="last_row"></tr>
		  <tr>
		     <td colspan="6" class="smalltdrow2" align="center" >
			   <?php  echo zen_image_submit('button_insert.gif', IMAGE_SAVE);?> 
			   <a href="javascript:void(0);" onclick="close_new_insert_price_list();">
			   <?php echo zen_image_button('button_cancel.gif', IMAGE_CANCEL);?>
			   </a>
			 </td>
		  </tr>
		</table>
		</div>
		<?php //========================================>>>>     新添加的价格 end   >>>>=========================================================
		echo '</form>';
		?>
		  
		  </td>
		</tr>
		  
		 </tbody>
	   </table>
	   </div>
	   
	  </td>
	</tr>
  </tbody>
</table>
  
  
  
  
</div>
<?php
break;
default://默认显示区域列表
?>

<table border="0" width="100%" cellspacing="2" cellpadding="2">
  <tr>
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td width="100%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading" valign="top">
			<?php echo AREA_URL_PATCH;?>
			<a href="<?php echo zen_href_link("shipping_4px");?>">
			<?php echo HEADING_TITLE; ?>
			</a>&rArr;
			<span style="font-size:12px;">
			   <?php echo TABLE_HEADING_SET_AREA; ?>&nbsp;:
			   <?php echo $shipping_way_array_list[$_GET['pr_id']]; ?>
			</span>
			</td>
            <td class="pageHeading" align="right"><?php echo zen_draw_separator('pixel_trans.gif', HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT); ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
                <td class="dataTableHeadingContent" width="50"><?php echo TABLE_HEADING_SHIPING_AREA_ID; ?></td>
                <td class="dataTableHeadingContent" width="120"><?php echo TABLE_HEADING_SHIPPING_AREA_NAME; ?></td>
                <td class="dataTableHeadingContent" width="120"><?php echo TABLE_HEADING_SHIPPING_WAY; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_SHIPPING_AREA_COUNTRIES; ?></td>
                <td class="dataTableHeadingContent" align="right" width="160">
				 <?php echo TABLE_HEADING_SHIPPING_AREA_ACTION; ?>
				</td>
              </tr>
<?php
   if($_GET['pr_id']){
     $condition_sql = " where  pr_id='".$_GET['pr_id']."' ";
   }
  $shipping_area_query_raw = "select * from shipping_country_regional ".$condition_sql." order by pr_id asc,country_regional_id";
  $shipping_area_split = new splitPageResults($_GET['page'], MAX_DISPLAY_SEARCH_RESULTS, $shipping_area_query_raw, $shipping_erea_query_numrows);
  $shipping_area = $db->Execute($shipping_area_query_raw);
  while (!$shipping_area->EOF) {
    if ((!isset($_GET['country_regional_id']) || (isset($_GET['country_regional_id']) && ($_GET['country_regional_id'] == $shipping_area->fields['country_regional_id']))) && !isset($mInfo)) {
      $mInfo = new objectInfo($shipping_area->fields);
    }
	
    if (isset($mInfo) && is_object($mInfo) && ($shipping_area->fields['country_regional_id'] == $mInfo->country_regional_id)) {
      echo '              <tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . zen_href_link("shipping_area_manage", 'page=' . $_GET['page'] . '&country_regional_id=' . $shipping_area->fields['country_regional_id'] . '&action=area_edit'.$url_show_pr_id) . '\'">' . "\n";
    } else {
      echo '              <tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . zen_href_link("shipping_area_manage", 'page=' . $_GET['page'] . '&country_regional_id=' . $shipping_area->fields['country_regional_id'] . '&action=area_info'.$url_show_pr_id) . '\'">' . "\n";
    }
?>
                <td class="dataTableContent"><?php echo $shipping_area->fields['country_regional_id']; ?></td>
                <td class="dataTableContent"><?php echo $shipping_area->fields['country_regional_name']; ?></td>
                <td class="dataTableContent"><?php echo $shipping_way_array_list[$shipping_area->fields['pr_id']]; ?></td>
                <td class="dataTableContent" style="line-height:30px;">
				  <?php 
				  $already_country_array = get_area_already_countries($shipping_area->fields['country_regional_id'],$shipping_area->fields['pr_id']);
				  if($already_country_array){
				     foreach($already_country_array as $key=>$val){
				       echo $all_countries[$val].'&nbsp;   &nbsp;   &nbsp;';
				     }
				   }
				  ?>
				</td>
                <td class="dataTableContent" align="right">
				 <a href="<?php echo zen_href_link('shipping_area_manage','action=set_area_price_list&country_regional_id='.$shipping_area->fields['country_regional_id'].$url_show_pr_id.'&page='.$_GET['page']); ?>">
				   <?php echo TABLE_SETUP_PRICE_LIST;?>
				 </a>
				 <?php 
				 echo '<a href="'.zen_href_link("shipping_area_manage",'action=set_area_countries_list&country_regional_id='.$shipping_area->fields['country_regional_id'].$url_show_pr_id.'&page='.$_GET['page']).'">'.TABLE_SETUP_AREA_COUNTRIES_LIST.'</a>';
				 ?>
                  <?php echo '<a href="' . zen_href_link("shipping_area_manage", 'country_regional_id=' . $shipping_area->fields['country_regional_id'] . '&action=area_edit'.$url_show_pr_id.'&page=' . $_GET['page'])  .  '">' . zen_image(DIR_WS_IMAGES . 'icon_edit.gif', ICON_EDIT) . '</a>'; ?>
				  <?php  
				  echo '<a onclick="javascript:if(!confirm(\''.TEXT_DSF_ACCOUNT_CONFIRM_DELETE.'\')){return false;}"  href="'.zen_href_link("shipping_area_manage", 'action=area_delete'.$url_show_pr_id.'&country_regional_id='.$shipping_area->fields['country_regional_id'].'&page='.$_GET['page']).'">';
				  echo zen_image(DIR_WS_IMAGES . 'icon_delete.gif', ICON_DELETE,'16');
				  echo '</a>';
				  ?>
                  <?php if (isset($mInfo) && is_object($mInfo) && ($shipping_area->fields['country_regional_id'] == $mInfo->country_regional_id)) { echo zen_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', ''); } else { echo '<a href="' . zen_href_link("shipping_area_manage", zen_get_all_get_params(array('country_regional_id')) . 'country_regional_id=' . $shipping_area->fields['country_regional_id']).$url_show_pr_id . '">' . zen_image(DIR_WS_IMAGES . 'icon_info.gif', IMAGE_ICON_INFO) . '</a>'; } ?>
				  
                </td>
              </tr>
<?php
    $shipping_area->MoveNext();
  }
?>
              <tr>
                <td colspan="11"><table border="0" width="100%" cellspacing="0" cellpadding="2">
                  <tr>
                    <td class="smallText" valign="top">
					<?php echo $shipping_area_split->display_count($shipping_erea_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, $_GET['page'], TEXT_DISPLAY_NUMBER_OF_DSF_SHIPPING); ?></td>
                    <td class="smallText" align="right">
					<?php echo $shipping_area_split->display_links($shipping_erea_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, MAX_DISPLAY_PAGE_LINKS, $_GET['page']); ?>
					</span>
					&nbsp;&nbsp;
					<?php
					echo '<a href="' . zen_href_link("shipping_area_manage",'action=insert_area_info'.$url_show_pr_id) . '">' . zen_image_button( 'button_insert.gif', IMAGE_INSERT) . '</a>';
					echo '&nbsp;<a href="'.zen_href_link("shipping_4px",null).'">' . 
					zen_image_button( 'button_back.gif', IMAGE_INSERT) . '</a>';
					?>
					
					</td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
<?php
  $heading = array();
  $contents = array();

  switch ($action) {
    case 'area_edit':
      if (isset($mInfo) && is_object($mInfo)) {
	  if($_GET['pr_id']){ $pr_id_url_address = '&pr_id='.$_GET['pr_id'];}
        $heading[] = array('text' => '<b>' . $mInfo->country_regional_name . '</b>');
	    $contents = array('form' => zen_draw_form('shipping_area_manage', "shipping_area_manage",  'country_regional_id=' . $mInfo->country_regional_id . '&action=area_save'.$pr_id_url_address.$url_show_pr_id.'&page=' . $_GET['page'], 'post', 'enctype="multipart/form-data"'));

		  if ($mInfo->status == "1") {
		    $status_true = true;
		    $status_false = false;
		  } else {
		  	$status_true = false;
		    $status_false = true;
		  }
	      $tmpText = '<b>' . TEXT_SHIPPING_AREA_STATUS_TITLE . '</b><br />' . TEXT_SHIPPING_AREA_STATUS_CONTENT . '<br /><br />' . zen_draw_radio_field('status', 1, $status_true) . ' true <br />' . zen_draw_radio_field('status', 0, $status_false) . ' false <br /><br />';
	      $contents[] = array('text' => $tmpText);
	      $tmpText = '<b>' . TABLE_HEADING_SHIPING_AREA_ID . '</b><br />' . TABLE_HEADING_SHIPING_AREA_ID_CONTENT . '<br /><br />' . $mInfo->country_regional_id . '<br /><br />';
	      $contents[] = array('text' => $tmpText);
	      $tmpText = '<b>' . TEXT_SHIPPING_AREA_WAY_TITLE . '</b><br />' . TEXT_SHIPPING_AREA_WAY_CONTENT . '<br /><br />' .  get_shipping_menu_list($shipping_way_array_list,'pr_id', $mInfo->pr_id). '<br /><br />';
	      $contents[] = array('text' => $tmpText);
	      $tmpText = '<b>' . TABLE_HEADING_SHIPPING_AREA_NAME . '</b><br />' . TABLE_HEADING_SHIPPING_AREA_NAME_CONTENT . '<br /><br />' . zen_draw_input_field('country_regional_name', $mInfo->country_regional_name, 'size="30"') . '<br /><br />';
	      $contents[] = array('text' => $tmpText);
		  
	      $contents[] = array('align' => 'center', 'text' => '<br>' . zen_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . zen_href_link("shipping_area_manage",'country_regional_id='. $mInfo->country_regional_id .$pr_id_url_address. '&page=' . $_GET['page']) . '">' . zen_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
	  }
      break;
    case 'area_info':
    default:
      if (isset($mInfo) && is_object($mInfo)) {
        $heading[] = array('text' => '<b>' . $mInfo->country_regional_name . '</b>');
        $contents[] = array('text' => TEXT_SHIPPING_AREA_STATUS_TITLE . '<br /><b>' . $mInfo->status . '</b>');
        $contents[] = array('text' => TABLE_HEADING_SHIPING_AREA_ID . '<br /><b>' . $mInfo->country_regional_id . '</b>');
		 $contents[] = array('text' => TEXT_SHIPPING_AREA_WAY_TITLE . '<br /><b>' . $shipping_way_array_list[$mInfo->pr_id] . '</b>');
        $contents[] = array('text' => TABLE_HEADING_SHIPPING_AREA_NAME . '<br /><b>' . $mInfo->country_regional_name . '</b>');
        $contents[] = array('text' => TEXT_DATE_ADDED . '<br /><b>' . zen_date_short($mInfo->created) . '</b>');
		if($_GET['pr_id']){ $pr_id_url_address = '&pr_id='.$_GET['pr_id'];}
        if (zen_not_null($mInfo->modified)) $contents[] = array('text' => TEXT_LAST_MODIFIED . '<br /><b>' . zen_date_short($mInfo->modified) . '</b>');
        $contents[] = array('align' => 'center', 'text' => '<a href="' . zen_href_link("shipping_area_manage", 'page=' . $_GET['page'] . '&country_regional_id=' . $mInfo->country_regional_id . '&action=area_edit'.$pr_id_url_address) . '">' . zen_image_button('button_edit.gif', IMAGE_EDIT) . '</a>');
      }
      break;
	case 'insert_area_info':
	   $pr_id_url_address = $_GET['pr_id']?'&pr_id='.$_GET['pr_id']:null;
	   $heading[] = array('text' => '<b>' .TABLE_HEADING_ADD_SHIPPING_AREA . '</b>');
	   $contents = array('form' => zen_draw_form('shipping_area_manage', "shipping_area_manage", 'page=' . $_GET['page'] . '&country_regional_id=' . $mInfo->country_regional_id . '&action=area_insert'.$pr_id_url_address, 'post', 'enctype="multipart/form-data"'));
	   $status_true = true;
	   $status_false = false;
	      $tmpText = '<b>' . TEXT_SHIPPING_AREA_STATUS_TITLE . '</b><br />' . TEXT_SHIPPING_AREA_STATUS_CONTENT . '<br /><br />' . zen_draw_radio_field('status', 1, $status_true) . ' true <br />' . zen_draw_radio_field('status', 0, $status_false) . ' false <br /><br />';
	      $contents[] = array('text' => $tmpText);
	      $tmpText = '<b>' . TEXT_SHIPPING_AREA_WAY_TITLE . '</b><br />' . TEXT_SHIPPING_AREA_WAY_CONTENT . '<br /><br />' . get_shipping_menu_list($shipping_way_array_list,'pr_id',$_GET['pr_id']) . '<br /><br />';
	      $contents[] = array('text' => $tmpText);
	      $tmpText = '<b>' . TABLE_HEADING_SHIPPING_AREA_NAME . '</b><br />' . TABLE_HEADING_SHIPPING_AREA_NAME_CONTENT . '<br /><br />' . zen_draw_input_field('country_regional_name',null, 'size="30"') . '<br /><br />';
	      $contents[] = array('text' => $tmpText);
	      $contents[] = array('align' => 'center', 'text' => '<br>' . zen_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . zen_href_link("shipping_area_manage", 'page=' . $_GET['page'] . '&country_regional_id=' . $mInfo->country_regional_id .$pr_id_url_address) . '">' . zen_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
		  
	break;
  }
  if ( (zen_not_null($heading)) && (zen_not_null($contents)) ) {
    echo '<td width="20%" valign="top">' . "\n";
    $box = new box;
    echo $box->infoBox($heading, $contents);
    echo '            </td>' . "\n";
  }
?>
          </tr>
        </table></td>
      </tr>
    </table></td>

  </tr>
</table>
<?php }  //---------------------?>

<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<br>
<form name="frm" method="post">	
	</form>
</body>
<script type="text/javascript">
	function price_init(){
		var cols=new Array('wk_code','fv_unitweight','weight_start','weight_end','price_value');
		var len=cols.length;
		var tmps=new Array();
		var tmp_len=0;
		var tmp_ops_len=0;
		for(i=0;i<len;i++){
			col=cols[i];
			tmps=document.getElementsByName(col);		
			tmp_len=tmps.length;
			//呈现值
			for(var j=0;j<tmp_len;j++){
				switch(tmps[j].tagName){
					case "SELECT":
						tmp_ops_len=tmps[j].options.length;
						for(var t=0;t<tmp_ops_len;t++){
							if(tmps[j].options[t].value==tmps[j].attributes['ovalue'].value){
								tmps[j].options[t].selected="selected";
								break;
							}
						}
					break;
					default:
					tmps[j].value=tmps[j].attributes['ovalue'].value;
				}
			}
		}
	}
	/*function add(){
		var tbl=document.getElementById('tbl');
		//var tr = document.createElement("tr");
		//tr.innerHTML='<td>&nbsp;</td><td><input type="text" name="addname[]" /></td><td><input type="text" name="addage[]" /></td>';
		//tbl.childnodes[0].add(tr);
		tbl.innerHTML=tbl.innerHTML+'<tr><td>&nbsp;</td><td><input type="text" name="addname[]" /></td><td><input type="text" name="addage[]" /></td></tr>';
	}*/
	
	function price_list_update(){
		//要修改的ID值
		var ids=new Array();
		var cols=new Array('wk_code','fv_unitweight','weight_start','weight_end','price_value');
		//当前列
		var col='';
		var len=cols.length;
		var i=0;
		var j=0;
		var tmps=new Array();
		var tmp_len=0;
		var tmp_id='';
		var hidden_html="";
		for(i=0;i<len;i++){
			col=cols[i];
			//修改	
			tmps=document.getElementsByName(col);
			tmp_len=tmps.length;				
			for(j=0;j<tmp_len;j++){
				//查看原始记录是否跟旧记录值不相等
				if(tmps[j].value!=tmps[j].attributes['ovalue'].value){
					tmp_id='id_'+tmps[j].attributes['vid'].value;
					if(typeof(ids[tmp_id])!="object"){
						ids[tmp_id]=new Array();
					}
					ids[tmp_id][col]=tmps[j].value;		
				}			
			}		
		}	
		for(var id in ids){
			hidden_html=hidden_html+'<input type="hidden" name="id[]" value="'+id.substr(3)+'" />'
			for(i=0;i<len;i++){
				col=cols[i];
				hidden_html=hidden_html+'<input type="hidden" name="'+col+'[]" value="'+ids[id][col]+'" />'
			}
		}
		/*var tbl=document.getElementById('tbl');
		document.frm.innerHTML=hidden_html+tbl.innerHTML;*/
		document.frm.innerHTML=hidden_html;
		document.frm.submit();
	}
	price_init();
</script>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>