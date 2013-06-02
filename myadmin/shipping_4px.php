<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 * @author Morrowind  
 * @contact 752979972@qq.com / hnsytcg@163.com
 * @version $Id: shipping_4px.php 15881 2011-06-22 16:32:39Z wilt $
 */

require('includes/application_top.php');
$ut_code_list = array(0=>UT_CODE_LIST0,1=>UT_CODE_LIST1,2=>UT_CODE_LIST2,3=>UT_CODE_LIST3);
$fk_code_list = array(0=>UT_CODE_LIST0,1=>FK_CODE_FUEL_PRICE,2=>OTHER_PRICE_CODE);
function handle_form_pricerule_data($post,$get,$action,$condition=null){//更新、新增物流产品操作函数
	$pr_name        = zen_db_prepare_input($post['pr_name']);
	$pk_code        = zen_db_prepare_input($post['pk_code']);
	$shipping_logo  = zen_db_prepare_input($post['shipping_logo']);
	$remark         = zen_db_prepare_input($post['remark']);
	$perc_price     = zen_db_prepare_input($post['perc_price']);
	$incr_price     = zen_db_prepare_input($post['incr_price']);
	$sort_index     = zen_db_prepare_input($post['sort_index']);
	$status         = $post['status']?zen_db_prepare_input($post['status']):1;

	$sql_data_array = array('pr_name' => $pr_name
							,'shipping_logo' => $shipping_logo
							,'pk_code' => $pk_code
							,'remark' => $remark
							,'perc_price' => $perc_price
							,'incr_price' => $incr_price
							,'sort_index' => $sort_index
							,'status' => $status
							,'modified' => date("Y-m-d H:i:s")
							);
    if($action=='insert'){
	 $created_date   = array('created' => date("Y-m-d H:i:s"));
	 $sql_data_array = array_merge($sql_data_array,$created_date);
	}
	zen_db_perform("shipping_pricerule", $sql_data_array, $action,$condition);
}
function handle_incidentalprice_save($action,$condition=null){//更新、新增杂费设置操作函数
  $insert_pr_id          = zen_db_prepare_input($_POST['insert_pr_id']);
  $insert_fk_code        = zen_db_prepare_input($_POST['insert_fk_code']);
  $insert_ut_code        = zen_db_prepare_input($_POST['insert_ut_code']);
  $insert_pricevalue     = zen_db_prepare_input($_POST['insert_pricevalue']);
  $insert_max_value      = zen_db_prepare_input($_POST['insert_max_value']);
  $insert_min_value      = zen_db_prepare_input($_POST['insert_min_value']);
  $insert_status         = zen_db_prepare_input($_POST['insert_status']);
  $sql_data_array = array('pr_id'         => $insert_pr_id
							,'fk_code'    => $insert_fk_code
							,'ut_code'    => $insert_ut_code
							,'pricevalue' => $insert_pricevalue
							,'max_value'  => $insert_max_value
							,'min_value'  => $insert_min_value
							,'status'     => $insert_status
							,'modified'   => date("Y-m-d H:i:s")
							);
  if($action=='insert'){
	 $created_date   = array('created' => date("Y-m-d H:i:s"));
	 $sql_data_array = array_merge($sql_data_array,$created_date);
	}
  zen_db_perform("shipping_incidentalprice", $sql_data_array, $action,$condition);
}
function get_shipping_pricerule_info($pr_id,$select_value){//获得物流产表单个字段信息。
   global $db;
   $select_result  = $db->Execute("select ".$select_value." from shipping_pricerule where pr_id='".$pr_id."'");
   return $select_result->fields[$select_value];
}
function handle_incidentalprice_html($pr_id,$id=null){//返回杂费设置信息
  global $ut_code_list,$fk_code_list,$db;
  if($id){
   $result_zf           = $db->Execute("select * from shipping_incidentalprice where id='".$id."'");
   $pr_id               = $result_zf->fields['pr_id'];
   $fk_code             = $result_zf->fields['fk_code'];
   $ut_code             = $result_zf->fields['ut_code'];
   $pricevalue          = $result_zf->fields['pricevalue'];
   $max_value           = $result_zf->fields['max_value'];
   $min_value           = $result_zf->fields['min_value'];
   $status              = $result_zf->fields['status'];
   
   $radio_checked_true  = $status==1?' checked="checked" ':'';
   $radio_checked_false = $status==0?' checked="checked" ':'';
   $html_action         = 'update_incidentalprice';
   $html_action_way     = 'update';
  }else{
   $radio_checked_true  = ' checked="checked" ';
   $html_action_way     = 'insert';
   $html_action         = 'insert_incidentalprice_save';
  }
  $ut_code_down_menu    = '<select name="ut_code" id="insert_ut_code">';
  foreach($ut_code_list as $key=>$value){
    $selected           = ($ut_code==$key)?' selected="selected" ':'';
    $ut_code_down_menu .= '<option value="'.$key.'"'.$selected.'>'.$value.'</option>';
	unset($selected);
  }
  $ut_code_down_menu   .= '</select>';
  $fk_code_down_menu    = '<select name="fk_code" id="insert_fk_code">';
  foreach($fk_code_list as $key=>$value){
    $fk_selected           = ($fk_code==$key)?' selected="selected" ':'';
    $fk_code_down_menu .= '<option value="'.$key.'"'.$fk_selected.'>'.$value.'</option>';
	unset($fk_selected);
  }
  $fk_code_down_menu   .= '</select>';
  $html      = //zen_draw_form('shipping_4px', "shipping_4px", 'action='.$html_action, 'post', 'enctype="multipart/form-data"').
               '<input type="hidden" value="'.$id.'"  name="zf_id" id="zf_id" size="30">'.
			   '<input type="hidden" value="'.$html_action_way.'"  name="action_way" id="action_way" size="30">'.
               SHIPPING_TYPE.':<input type="hidden" value="'.$pr_id.'"  name="pr_id" id="insert_pr_id" size="30">'.
               get_shipping_pricerule_info($pr_id,'pr_name').'<br />'.
               SELECT_FEE_TYPE.':'.$fk_code_down_menu.'<br />'.
               SELECT_CALCULATION_WAY.':'.$ut_code_down_menu.'<br />'.
               SELECT_CALCULATION_VALUE.':'.zen_draw_input_field('pricevalue', $pricevalue, ' id="insert_pricevalue" size="30"').'<br />'.
               SELECT_MIN_VALUE.':'.zen_draw_input_field('min_value', $min_value, 'size="30" id="insert_min_value"').'<br />'.
               SELECT_MAX_VALUE.':'.zen_draw_input_field('max_value', $max_value, 'size="30" id="insert_max_value"').'<br />'.
			   zen_image_submit('button_save.gif', IMAGE_SAVE,'  onclick="insert_incidentalprice_save();" ') .'&nbsp;&nbsp;'.
               zen_image_button('button_cancel.gif', IMAGE_CANCEL,'  onclick="insert_return('.$pr_id.');" ');
  return $html;
}
function write_import_file_record($file_name){//写入导入产品记录
  $filename = 'import_file_record.txt';
  $somecontent = '<b style="color:blue;">'.$file_name.".csv</b>-> Import date:".date("Y-m-d H:i:s")."<br />\r\n";
  if (is_writable($filename)) {
    if (!$handle = fopen($filename, "a")) {}
    if (fwrite($handle, $somecontent) === FALSE) {}
    fclose($handle);
  }
}
function get_current_shipping_id($shipping_name){//根据物流名称，获得国家ID
	global $db;
	$sql_statement ="select pr_id from shipping_pricerule where pr_name='".$shipping_name."'";
	$result = $db->Execute($sql_statement);
	return $result->fields['pr_id'];
}
function handle_excel_other_price($file_info){//处理Excel提交过的杂费数据
	Read_Excel_File($file_info['tmp_name'],$get_return);
	if(is_array($get_return)){
		foreach($get_return as $key=>$value){
			if(is_array($value)){
				foreach($value as $k=>$val){
					if(is_array($val)){
						if($k==0){
							$get_shipping_id = get_current_shipping_id($val[0]);
						}
						if($k>1){
							if($get_shipping_id){
								echo $get_shipping_id.'='.$val[0].'='.$val[1].'='.$val[2].'='.$val[3].'='.$val[4].'<br />';
							}else{
								echo $get_shipping_id.'|'.$val[0].'|'.$val[1].'|'.$val[2].'|'.$val[3].'|'.$val[4].'<br />';
							}
						}
					}
				}
			}
			echo $value[0][0].'--杂费结束<br /><br />';
		}
	}
}
function get_countries_id($code_2){//获得国家ID
  global $db;
  $result_area_info = $db->Execute("select countries_id from shipping_country where country_code='".$code_2."'");
  return $result_area_info->fields['countries_id'];
}
function handle_excel_price($file_info){//处理Excel提交过来的基础价格数据
	Read_Excel_File($file_info['tmp_name'],$get_return);
	if(is_array($get_return)){
		foreach($get_return as $key=>$value){
			if(is_array($value)){
				foreach($value as $k=>$val){
					$count_area_countries= count($val);
					if(is_array($val)){
						switch($k){
							case 0:
							//$int_test = '0.123456gh';
							//'<b style="color:both;">'.(float)$int_test.'</b>';
							break;
							case 1://插入产品信息
								//$get_shipping_id = get_current_shipping_id($val[0]);
								//清空数据库再，再插入数据
								$insert_data_array  = array( 'pr_id'=>'',
			                                       'pk_code'=>$val[1],
																					   'pr_name'=>$val[0],
																					   'perc_price'=>(int)$val[2]*10,
																					   'incr_price'=>$val[3],
																					   'remark'=>$val[4],
																						 'status'=>1
                                        );
								zen_db_perform("shipping_pricerule", $insert_data_array,'insert');
								$get_shipping_id = zen_db_insert_id();
							break;
							case 2://插入区域信息
								for($i=3;$i<$count_area_countries;$i++){
								$insert_data_array  = array( 'country_regional_id'=>'',
			                                       'pr_id'=>$get_shipping_id,
																					   'country_regional_name'=>$val[$i],
																					   'status'=>1
                                        );
								zen_db_perform("shipping_country_regional", $insert_data_array,'insert');
								$get_area_id[$i] = zen_db_insert_id();
								}
							break;
							case 3://插入区域国家信息
								for($i=3;$i<$count_area_countries;$i++){
									if(!empty($val[$i])){
										$countries = explode(',',$val[$i]);
										foreach($countries as $country_code){
											 $countries_id = get_countries_id($country_code);
											 $insert_data_array  = array('pr_id'=>$get_shipping_id,
						                                       'area_id'=>$get_area_id[$i],
																								   'countries_id'=>$countries_id,
																								   'modified'=>date('Y-m-d H:i:s'),
																								   'created'=>date('Y-m-d H:i:s'),
																								   'status'=>1
                                        );
											zen_db_perform("shipping_freightpricearea", $insert_data_array,'insert');
										}
									}
								}
							break;
							default://插入基础价格信息
							for($i=3;$i<$count_area_countries;$i++){
								$explode_wieght = explode('-',$value[$k][0]);
								$weight_start = $explode_wieght[0];
								$weight_end   = $explode_wieght[1];
								$wk_code 	= (int)$value[$k][1];
								$fv_unitweight =(float)$value[$k][2];
								$price_value = (float)$value[$k][$i];
								$sql_insert_array       =  array('pr_id'=>$get_shipping_id,
								                                 'area_id'=>$get_area_id[$i],
																								 'wk_code'=>$wk_code,
																								 'fv_unitweight'=>$fv_unitweight,
																								 'weight_start'=>$weight_start,
																								 'weight_end'=>$weight_end,
																								 'price_value'=>$price_value,
																								 'status'=>1
											 );
								zen_db_perform("shipping_freightpricevalue", $sql_insert_array,'insert');
							}
						}
					}
				}
				unset($get_area_id);
			}
		}
	}
}
function excel_handler_action($file_info){//Excel数据分工处理
	if($file_info['name']=='shipping_other_price.xls'){
		echo '杂费<br />';
		handle_excel_other_price($file_info);
	}else{
		echo '主要费用<br />';
		handle_excel_price($file_info);
	}
	return '<b style="color:red"> Import success!</b>';
}
function import_data_file_handle(){//通过文件导入数据
  global $db;
  if(!empty($_FILES['import_file'])){
    $file_name= $_FILES['import_file']['name'];
     if(strpos($file_name,'csv')){
	   $explode_file =explode('.',$file_name);
	   $final_file_name =$explode_file[0];
	 }elseif(strpos($file_name,'xls')){
			return excel_handler_action($_FILES['import_file']);
	 }else{
	  return 'File format error! Excel.csv';
	 }
	 if(empty($final_file_name)) die('File name error!');
	 $handle_file = fopen($_FILES['import_file']['tmp_name'],"r");
	 switch($final_file_name){
	   case 'ShippingPriceTable'://导入价格表
	   case 'ShippingPriceTable-dhl':
	   case 'ShippingPriceTable-ems':
	   case 'ShippingPriceTable-ups':
        $count_i =0;
        while ($data = fgetcsv($handle_file, 100000, ",")) {
		if($count_i ==0){$number_one=$data;}
		$count_data= count($data)-5;
		if($count_i>1){
		  for($i=5;$i<sizeof($data);$i++){
			 $pr_id                  = $data[0];
		     $area_id                = $number_one[$i];
		     $wk_code                = floor($data[3]);
		     $fv_unitweight          = $data[4];
		     $weight_start           = $data[1];
		     $weight_end             = $data[2];
		     $price_value            = $data[$i];
			 $sql_insert_array       = array('pr_id'=>$pr_id,
			                                 'area_id'=>$area_id,
											 'wk_code'=>$wk_code,
											 'fv_unitweight'=>$fv_unitweight,
											 'weight_start'=>$weight_start,
											 'weight_end'=>$weight_end,
											 'price_value'=>$price_value,
											 'modified'=>date('Y-m-d H:i:s'),
											 'created'=>date('Y-m-d H:i:s'),
											 'status'=>1
											 );
			zen_db_perform("shipping_freightpricevalue", $sql_insert_array,'insert');
		  }
		 }
		 $count_i++;
         }
		 unset($count_i);
	   break;
	   case 'ShippingAreaCountryTable';
	     $count_i =0;
         while ($data = fgetcsv($handle_file, 100000, ",")) {
		   if($count_i>0){
		      $insert_data_array  = array('pr_id'=>$data[0],
                                       'area_id'=>$data[1],
									   'countries_id'=>$data[2],
									   'modified'=>date('Y-m-d H:i:s'),
									   'created'=>date('Y-m-d H:i:s'),
									   'status'=>1
                                        );
			zen_db_perform("shipping_freightpricearea", $insert_data_array,'insert');
		   }
		 $count_i++;
         }
		 unset($count_i);
	   break;
	   case 'ShippingAreaNameTable';
	     $count_i =0;
         while ($data = fgetcsv($handle_file, 100000, ",")) {
		   if($count_i>0){
		    $insert_data_array  = array('country_regional_id'=>$data[0],
                                       'pr_id'=>$data[1],
									   'country_regional_name'=>iconv('gb2312','utf-8',$data[2]),
									   'modified'=>date('Y-m-d H:i:s'),
									   'created'=>date('Y-m-d H:i:s'),
									   'status'=>1
                                        );
			zen_db_perform("shipping_country_regional", $insert_data_array,'insert');
		   }
		 $count_i++;
         }
		 unset($count_i);
	   break;
	   case 'ShippingIncidentalPrice';
	     $count_i =0;
         while ($data = fgetcsv($handle_file, 100000, ",")) {
		   if($count_i>0){
		   $insert_data_array  = array('id'=>$data[0],
                                       'pr_id'=>$data[1],
									   'fk_code'=>$data[2],
									   'ut_code'=>$data[3],
									   'pricevalue'=>$data[4],
									   'max_value'=>$data[5],
									   'min_value'=>$data[6],
									   'modified'=>date('Y-m-d H:i:s'),
									    'created'=>date('Y-m-d H:i:s'),
										'status'=>1
                                        );
			zen_db_perform("shipping_incidentalprice", $insert_data_array,'insert');
		   }
		 $count_i++;
         }
		 unset($count_i);
	   break;
	   case 'ShippingProductsTable';
	     $count =0;
         while ($data = fgetcsv($handle_file, 100000, ",")) {
		   if($count>0){
		   $perc_price_data  = $data[3]==0?100:$data[3];
		   $insert_data_array  = array('pr_id'=>$data[0],
                                       'pk_code'=>$data[1],
									   'pr_name'=>iconv('gb2312','utf-8',$data[2]),
									   'perc_price'=>$perc_price_data,
									   'incr_price'=>$data[4],
									   'remark'=>iconv('gb2312','utf-8',$data[5]),
									   'sort_index'=>$data[6],
									   'modified'=>date('Y-m-d H:i:s'),
									    'created'=>date('Y-m-d H:i:s'),
										'status'=>1
                                        );
			zen_db_perform("shipping_pricerule", $insert_data_array,'insert');
		   }
		 $count++;
         }
		 unset($count);
	   break;
	   case 'Update_ShippingPriceTable';
	     //-------------------------  update shipping price   start-----------------------------------
		 $count_i =0;
        while ($data = fgetcsv($handle_file, 100000, ",")) {
		if($count_i ==0){$number_one=$data;}
		$count_data= count($data)-5;
		if($count_i>1){
		  for($i=5;$i<sizeof($data);$i++){
			 $pr_id                  = $data[0];
		     $area_id                = $number_one[$i];
		     $wk_code                = floor($data[3]);
		     $fv_unitweight          = $data[4];
		     $weight_start           = $data[1];
		     $weight_end             = $data[2];
		     $price_value            = $data[$i];
		   $sql_statement = "update shipping_freightpricevalue  set price_value='".$price_value."'
		                     where pr_id='".$pr_id."' and area_id='".$area_id."' and
                             weight_start='".$weight_start."' and weight_end='".$weight_end."'";
		  $select_result  = $db->Execute($sql_statement);
		  }
		 }
		 $count_i++;
         }die();
		 unset($count_i);
		 //------------------------  update shipping price end  -------------------------------------
	   break;
       default:
	     return '<b style="color:red"> Import failed!</b>';
	 }
	 fclose($handle_file);
	 write_import_file_record($final_file_name);
  }
 return '<b style="color:red"> Import success!</b>';
}

//--------------------------------------- function   end -----------------------------------------------
  $action = (isset($_GET['action']) ? $_GET['action'] : '');
  if (zen_not_null($action)) {
    switch ($action) {
      case 'do_install':
      	
	  break;
	  case 'shipping_save'://保存 -> 更新的物流产品
	     if (isset($_GET['sID'])) $pr_id = zen_db_prepare_input($_GET['sID']);
		handle_form_pricerule_data($_POST,$_GET,'update',"pr_id = '" . (int)$pr_id . "'");
        zen_redirect(zen_href_link("shipping_4px", (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'sID=' . $pr_id));
	  break;
	  case 'insert_new_shipping_save':// 新增物流产品操作
	   if(!empty($_POST['pr_name'])) handle_form_pricerule_data($_POST,$_GET,'insert');
	   zen_redirect(zen_href_link("shipping_4px", (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '')));
	  break;
	  case 'delete_shipping_action'://删除物流产品操作
	    $db->Execute("delete from shipping_pricerule where pr_id='".$_GET['sID']."'");
		zen_redirect(zen_href_link("shipping_4px", (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '')));
	  break;
	  case 'select_incidentalprice'://查询杂费例表
	    echo '<b class="pageHeading">'.SELECT_INCIDENTALPRICE.'</b><br />';
	    $pr_id  = $_POST['pr_id'];
		$result_inciden          = $db->Execute("select * from shipping_incidentalprice where pr_id='".$pr_id."'");
		echo '<table border="0" width="100%" cellspacing="1" cellpadding="0" class="stripe">
              <tr class="dataTableHeadingRow">
			    <td class="dataTableHeadingContent">'.SHIPPING_TYPE.'</td>
				<td class="dataTableHeadingContent">'.SELECT_FEE_TYPE.'</td>
			    <td class="dataTableHeadingContent">'.SELECT_CALCULATION_WAY.'</td>
				<td class="dataTableHeadingContent">'.SELECT_CALCULATION_VALUE.'</td>
				<td class="dataTableHeadingContent">'.SELECT_MAX_VALUE.'</td>
				<td class="dataTableHeadingContent">'.SELECT_MIN_VALUE.'</td>
				<td class="dataTableHeadingContent">'.TABLE_HEADING_ACTION.'</td>
			 </tr>
			 ';
		while (!$result_inciden->EOF) {
		  $pr_id_info            =  $result_inciden->fields['pr_id'];
		  $fk_code_info          =  $result_inciden->fields['fk_code'];
		  $ut_code_info          =  $result_inciden->fields['ut_code'];
		  $pricevalue_info       =  $result_inciden->fields['pricevalue'];
		  $max_value_info        =  $result_inciden->fields['max_value'];
		  $min_value_info        =  $result_inciden->fields['min_value'];
		  
		  echo '<tr class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)">
		          <td class="dataTableContent">'.$pr_id_info.'</td>
				  <td class="dataTableContent">'.$fk_code_list[$fk_code_info].'</td>
				  <td class="dataTableContent">'.$ut_code_list[$ut_code_info].'</td>
				  <td class="dataTableContent">'.$pricevalue_info.'</td>
				  <td class="dataTableContent">'.$max_value_info.'</td>
				  <td class="dataTableContent">'.$min_value_info.'</td>
				  <td class="dataTableContent">&nbsp;&nbsp;
				  <span onclick="send_edit_incidentalprice('.$pr_id_info.','.$result_inciden->fields['id'].');">'.
				   zen_image(DIR_WS_IMAGES . 'icon_edit.gif', ICON_EDIT).'</span>&nbsp;&nbsp;'.
				   '<span onclick="javascript:if(!confirm(\''.TEXT_DSF_ACCOUNT_CONFIRM_DELETE.'\'))
				   {return false;}else{delete_zf_info('.$pr_id_info.','.$result_inciden->fields['id'].');}">'.
				   zen_image(DIR_WS_IMAGES . 'icon_delete.gif', ICON_DELETE,'16').
				   '</span>'.
				  '</td>
			   </tr>
			   ';
		  $result_inciden->MoveNext();
		}
		echo '</table>';
		echo '<div class="shipping_button_algin">'.zen_image_button('button_insert.gif', IMAGE_INSERT,' onclick="insert_incidentalprice('.$pr_id.');" ').'</div>';
		die();
	  break;
	  case 'insert_incidentalprice'://返回杂费 添加信息
	    echo  handle_incidentalprice_html($_POST['pr_id']);die();
	  break;
	  case 'insert_incidentalprice_save':
	    $condition  = ($_POST['action_way']=='update' && $_POST["zf_id"])?'id='.$_POST["zf_id"]:null;
	    handle_incidentalprice_save($_POST['action_way'],$condition);
		die();
	  break;
	  case 'show_incidentalprice_info';
	    echo handle_incidentalprice_html($_POST['handle_pr_id'],$_POST['id']);
		die();
	  break;
	  case 'delete_zf_info':
	    if($_POST['id'])
		  $db->Execute("delete from shipping_incidentalprice where id='".$_POST['id']."'");
		  echo '<script type="text/javascript"> OnLoad=show_miscellaneous_list('.$_POST['pr_id'].'); </script>';
		die();
	  break;
	  case 'import_data_save'://导入操作
	    $file_name= $_FILES['import_file']['name'];
		$get_import_function = import_data_file_handle();
		$messageStack->add_session($get_import_function, 'success');
zen_redirect(zen_href_link("shipping_4px",'action=import_data'.(isset($_GET['page'])?'&page='.$_GET['page'].'&':'')));
	  break;
	  case 'truncate_table_record'://清空表记录
	    $truncate_table_array  = array('ShippingProductsTable',
		                               'ShippingAreaNameTable',
									   'ShippingAreaCountryTable',
									   'ShippingPriceTable',
									   'ShippingIncidentalPrice');
		$table_name            = trim($_POST['truncate_table_name']);
		
		$is_shipping_table     = in_array($table_name,$truncate_table_array);
		if($is_shipping_table){
		  $table_name =='ShippingProductsTable'?$trun_cate_is= 'shipping_pricerule':null;
		  $table_name =='ShippingAreaNameTable'?$trun_cate_is= 'shipping_country_regional':null;
		  $table_name =='ShippingAreaCountryTable'?$trun_cate_is= 'shipping_freightpricearea':null;
		  $table_name =='ShippingPriceTable'?$trun_cate_is= 'shipping_freightpricevalue':null;
		  $table_name =='ShippingIncidentalPrice'?$trun_cate_is= 'shipping_incidentalprice':null;
		  $db->Execute("TRUNCATE TABLE ".$trun_cate_is);
		  $messageStack->add_session(TRUNCATE_TABLE_SUCCESS, 'success');
		}else{
          $messageStack->add_session(NO_TRUNCATE_TABLE_NAME, 'success');
		}
zen_redirect(zen_href_link("shipping_4px", 'action=import_data'.(isset($_GET['page']) ? '&page=' . $_GET['page'] . '&' : '')));
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
<script type="text/javascript"> <!--
function init(){
    cssjsmenu('navbar');
    if (document.getElementById){
      var kill = document.getElementById('hoverJS');
      kill.disabled = true;
    }
}
var utime=0;
function send_shipping_install(){
  var new_date=Date.parse(new Date())/1000;
  var time_new =(new_date-utime);
  if(time_new<15){
	alert('请稍后提交！');
	return false;
  }
  utime=new_date;
	   
		$("#return_result_html").html("loading.....");
    var send_string='install';
    $.post('../update_countries.php',{
	  send_string:send_string},function(data){$("#return_result_html").html(data);}); 
		setTimeout("handle_send_onload()",20000);
}
function handle_send_onload(){
  window.location.reload();
}
 // -->
</script>
</head>
<body onload="init()">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<?php
switch($action){
  case 'import_data':
	echo '<div style="padding:5px;">
	<table cellspacing="0" cellpadding="0" width="100%">
	        <tbody>
			  <tr class="dataTableHeadingRow" height="25">
			    <td>
				  <b>' . OTHER_IMPORT_DATA . '</b>
				</td>
			  </tr>
			  <tr class="dataTableRow">
			    <td>
'. zen_draw_form('import_data_save', "shipping_4px", 'page=' . $_GET['page'] . '&sID=' . $mInfo->pr_id  . '&action=import_data_save', 'post', 'enctype="multipart/form-data"').'
	<input type="file" name="import_file" />
	<div style="clear:both;width;100%;height:3px;overflow:hidden;">&nbsp;</div>
	' . zen_image_submit('button_confirm_red.gif', IMAGE_SAVE) . ' <a href="' . zen_href_link("shipping_4px", '') . '">' . zen_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>
	<div style="clear:both;width;100%;">&nbsp;</div>
	<b>'.OTHER_IMPORT_DATA_TEXT . '</b>
	'.IMPORT_DATA_TEXT_INFO.'
	
</form>         </td>
			  </tr>
			  <tr class="dataTableHeadingRow" height="25">
			    <td>
				  <b>' . TRUNCATE_TABLE_RECORD . '</b>
				</td>
			  </tr>
			  <tr class="dataTableRow">
			    <td>
'. zen_draw_form('truncate_table_record', "shipping_4px", 'page=' . $_GET['page'] . '&sID=' . $mInfo->pr_id  . '&action=truncate_table_record', 'post', 'enctype="multipart/form-data"').'
	'.TRUNCATE_TABLE_NAME.'
	<input type="text" name="truncate_table_name" value="" />
	<div style="clear:both;width;100%;height:3px;overflow:hidden;">&nbsp;</div>
' . zen_image_submit('button_confirm_red.gif', IMAGE_SAVE ,' onclick="if(confirm(\''.TRUNCATE_TABLE_TURE.'\')){}else{return false;}"') . '
<div style="clear:both;width;100%;">&nbsp;</div>
'.TRUNCATE_TABLE_NOTES.'
</form>
				</td>
			  </tr>
			</tbody>
	</table>
	</div>
	';
	$import_files_record =file_exists('import_file_record.txt')? file_get_contents('import_file_record.txt'):null;
	echo $import_files_record?'Import record:<br />'.$import_files_record:null;
  break;
  default:
?>


<!-- body //-->
<table border="0" width="100%" cellspacing="2" cellpadding="2">
  <tr>
<!-- body_text //-->
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td width="100%"><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo HEADING_TITLE; ?></td>
            <td class="pageHeading" align="right"><?php echo zen_draw_separator('pixel_trans.gif', HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT); ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
			    <td class="dataTableHeadingContent">ID</td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_DSF_SHIPPING_CODE; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_DSF_SHIPPING_NAME; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_SHIPPING_DISPLAYS_IMAGE; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_SHIPPING_DISPLAYS_NOTE; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_PRICE_PERCENTAGE; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_PRICE_INCREASE; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_SORT_INDEX; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_STATUS; ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_MODIFIED; ?></td>
                <td class="dataTableHeadingContent" align="right"><?php echo TABLE_HEADING_ACTION; ?>&nbsp;</td>
              </tr>
							
<?php
  $shipping_4px_companuy_id  = SHIPPING_4PX_COMPANY_ID;
	$shipping_4px_soap_url     = SHIPPING_4PX_SOAP_URL;
  if($shipping_4px_companuy_id=="SHIPPING_4PX_COMPANY_ID" or $shipping_4px_soap_url=="SHIPPING_4PX_SOAP_URL"){
	  echo '<a href="javascript:void(0)" onclick="send_shipping_install();" >'.
		   zen_image_button('button_module_install.gif', IMAGE_MODULE_INSTALL)
			 .'</a>
			 <br />
			 <span id="return_result_html"></span>
			 ';
		echo '</table>';
	die();
	}
  $shipping_query_raw = "select * from shipping_pricerule order by sort_index desc,pr_id";
  $shipping_split = new splitPageResults($_GET['page'], MAX_DISPLAY_SEARCH_RESULTS, $shipping_query_raw, $shipping_query_numrows);
  $shipping_result = $db->Execute($shipping_query_raw);
  while (!$shipping_result->EOF) {
    if ((!isset($_GET['sID']) || (isset($_GET['sID']) && ($_GET['sID'] == $shipping_result->fields['pr_id']))) && !isset($mInfo)) {
      $mInfo = new objectInfo($shipping_result->fields);
    }
    if (isset($mInfo) && is_object($mInfo) && ($shipping_result->fields['pr_id'] == $mInfo->pr_id)) {
      echo '              <tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" >' . "\n";
    } else {
      echo '              <tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" >' . "\n";
    }
?>
                <td class="dataTableContent"><?php echo $shipping_result->fields['pr_id']; ?></td>
				<td class="dataTableContent"><?php echo $shipping_result->fields['pk_code']; ?></td>
                <td class="dataTableContent"><?php echo $shipping_result->fields['pr_name']; ?></td>
                <td class="dataTableContent">
				<?php if($shipping_result->fields['shipping_logo']){?>
				<img src="<?php echo $shipping_result->fields['shipping_logo']; ?>" />
				<?php }?>
				</td>
                <td class="dataTableContent"><?php echo $shipping_result->fields['remark']; ?></td>
                <td class="dataTableContent"><?php echo $shipping_result->fields['perc_price']; ?></td>
                <td class="dataTableContent"><?php echo $shipping_result->fields['incr_price']; ?></td>
                <td class="dataTableContent"><?php echo $shipping_result->fields['sort_index']; ?></td>
                <td class="dataTableContent">
				<?php echo $shipping_result->fields['status']==1?zen_image(DIR_WS_IMAGES . 'icon_status_green.gif', IMAGE_ICON_STATUS_ON):
				zen_image(DIR_WS_IMAGES . 'icon_status_red.gif', IMAGE_ICON_LINKED); ?></td>
                <td class="dataTableContent"><?php echo zen_date_short($shipping_result->fields['modified']); ?></td>
                <td class="dataTableContent" align="right">
				<a href="<?php echo zen_href_link("shipping_area_manage", 'action=show_area_list&pr_id='.$shipping_result->fields['pr_id']);?>">区域设置</a>
				<a onclick="miscellaneous_setup(<?php echo $shipping_result->fields['pr_id'];?>);">杂费设置</a>
                  <?php echo '<a href="' . zen_href_link("shipping_4px", 'page=' . $_GET['page'] . '&sID=' . $shipping_result->fields['pr_id'] . '&action=shipping_edit') . '">' . zen_image(DIR_WS_IMAGES . 'icon_edit.gif', ICON_EDIT) . '</a>'; ?>
				  
				  <?php 
				  echo '<a onclick="javascript:if(!confirm(\''.TEXT_DSF_ACCOUNT_CONFIRM_DELETE.'\')){return false;}"  href="'.zen_href_link("shipping_4px", 'action=delete_shipping_action&page='.
				  $_GET['page'].'&sID='.$shipping_result->fields['pr_id']).'">';
				  echo zen_image(DIR_WS_IMAGES . 'icon_delete.gif', ICON_DELETE,'16');
				  echo '</a>';
				  ?>
				  
                  <?php if (isset($mInfo) && is_object($mInfo) && ($shipping_result->fields['pr_id'] == $mInfo->pr_id)) { echo zen_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', ''); } else { echo '<a href="' . zen_href_link("shipping_4px", zen_get_all_get_params(array('sID')) . 'sID=' . $shipping_result->fields['pr_id']) . '">' . zen_image(DIR_WS_IMAGES . 'icon_info.gif', IMAGE_ICON_INFO) . '</a>'; } ?>
                </td>
              </tr>
<?php
    $shipping_result->MoveNext();
  }
?>
              <tr>
                <td colspan="11"><table border="0" width="100%" cellspacing="0" cellpadding="2">
                  <tr>
                    <td class="smallText" valign="top"><?php echo $shipping_split->display_count($shipping_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, $_GET['page'], TEXT_DISPLAY_NUMBER_OF_DSF_SHIPPING); ?></td>
                    <td class="smallText" align="right"><?php echo $shipping_split->display_links($shipping_query_numrows, MAX_DISPLAY_SEARCH_RESULTS, MAX_DISPLAY_PAGE_LINKS, $_GET['page']); ?>
					 
					</td>
                  </tr>
                </table></td>
              </tr>
			  <tr>
                <td align="right" colspan="11" class="smallText">
<?php
  if (empty($action)) {
?>           
<?php
echo '<a href="' . zen_href_link("shipping_4px", 'action=import_data') . '">' . zen_image_button('button_import.gif', MODULE_IMPORT) . '</a>';
?>
<?php
  }
?>
<a href="<?php echo zen_href_link("shipping_4px", 'action=insert_new_shipping') ?>">
<?php echo zen_image_button('button_insert.gif', IMAGE_INSERT);?>
</a>
    </td>
              </tr>
            </table></td>
<?php
  $heading = array();
  $contents = array();

  switch ($action) {
    case 'account_edit':
      $dsf_account_info_query_raw = "select * from dsf_account_info where id=1 limit 1";
	  $dsf_account_info = $db->Execute($dsf_account_info_query_raw);
	  
	  
	  if ($dsf_account_info->fields['status'] == "1") {
	    $status_true = true;
	    $status_false = false;
	  } else {
	  	$status_true = false;
	    $status_false = true;
	  }

      $heading[] = array('text' => '<b>' . TEXT_HEADING_DSF_ACCOUNT_INSTALL . '</b>');

      $contents = array('form' => zen_draw_form('shipping_4px', "shipping_4px", 'action=account_save', 'post', 'enctype="multipart/form-data"'));
      $tmpText = '<b>' . TEXT_DSF_STATUS_TITLE . '</b><br />' . TEXT_DSF_STATUS_DESC . '<br /><br />' . zen_draw_radio_field('status', 1, $status_true) . ' true <br />' . zen_draw_radio_field('status', 0, $status_false) . ' false <br /><br />';
      $contents[] = array('text' => $tmpText);
      
      $tmpText = '<b>' . TEXT_DSF_USERNAME_TITLE . '</b><br />' . TEXT_DSF_USERNAME_DESC . '<br /><br />' . zen_draw_input_field('dsf_username', $dsf_account_info->fields['dsf_username'], 'size="20"') . '<br /><br />';
      $contents[] = array('text' => $tmpText);
      
      $tmpText = '<b>' . TEXT_DSF_PASSWORD_TITLE . '</b><br />' . TEXT_DSF_PASSWORD_DESC . '<br /><br />' . zen_draw_password_field('dsf_password', '') . '<br /><br />';
      $contents[] = array('text' => $tmpText);

      $contents[] = array('align' => 'center', 'text' => '<br>' . zen_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . zen_href_link("shipping_4px", 'action=account_info') . '">' . zen_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    case 'account_info':
      $dsf_account_info_query_raw = "select * from dsf_account_info where id=1 limit 1";
	  $dsf_account_info = $db->Execute($dsf_account_info_query_raw);
	  if (!$dsf_account_info->EOF) {
	  	$aiInfo = new objectInfo($dsf_account_info->fields);
	  }

      if (isset($aiInfo) && is_object($aiInfo)) {
        $heading[] = array('text' => '<b>' . DSF_ACCOUNT_INFO . '</b>');

        $contents[] = array('text' => TEXT_DSF_ACCOUNT_STATUS . '<br /><b>' . $aiInfo->status . '</b>');
        $contents[] = array('text' => TEXT_DSF_USERNAME . '<br /><b>' . $aiInfo->dsf_username . '</b>');
        $contents[] = array('text' => TEXT_COMPANY_NAME_EN . '<br /><b>' . $aiInfo->company_name_en . '</b>');
        $contents[] = array('text' => TEXT_COMPANY_NAME_CN . '<br /><b>' . $aiInfo->company_name_cn . '</b>');
        $contents[] = array('text' => TEXT_COMPANY_CODE . '<br /><b>' . $aiInfo->company_code . '</b>');
        $contents[] = array('text' => TEXT_CUSTOMER_SERVICE_CODE . '<br /><b>' . $aiInfo->customer_service_code . '</b>');
        $contents[] = array('text' => TEXT_CUSTOMER_SERVICE_NAME . '<br /><b>' . $aiInfo->customer_service_name . '</b>');
        $contents[] = array('text' => TEXT_MAINTAINER_CODE . '<br /><b>' . $aiInfo->maintainer_code . '</b>');
        $contents[] = array('text' => TEXT_MAINTAINER_NAME . '<br /><b>' . $aiInfo->maintainer_name . '</b>');
        $contents[] = array('text' => TEXT_DATE_ADDED . '<br /><b>' . zen_date_short($aiInfo->created) . '</b>');
        if (zen_not_null($aiInfo->modified)) $contents[] = array('text' => TEXT_LAST_MODIFIED . '<br /><b>' . zen_date_short($aiInfo->modified) . '</b>');
      }
      $contents[] = array('align' => 'center', 'text' => '<a href="' . zen_href_link("shipping_4px", 'action=account_edit') . '">' . zen_image_button('button_edit.gif', IMAGE_EDIT) . '</a>');
      break;
    case 'shipping_edit':
      if (isset($mInfo) && is_object($mInfo)) {
        $heading[] = array('text' => '<b>' . $mInfo->pr_name . '</b>');

	      $contents = array('form' => zen_draw_form('shipping_4px', "shipping_4px", 'page=' . $_GET['page'] . '&sID=' . $mInfo->pr_id  . '&action=shipping_save', 'post', 'enctype="multipart/form-data"'));
	      
	      //shipping status
		  if ($mInfo->status == "1") {
		    $status_true = true;
		    $status_false = false;
		  } else {
		  	$status_true = false;
		    $status_false = true;
		  }
	      $tmpText = '<b>' . TEXT_DSF_SHIPPING_STATUS_TITLE . '</b><br />' . TEXT_DSF_SHIPPING_STATUS_DESC . '<br /><br />' . zen_draw_radio_field('status', 1, $status_true) . ' true <br />' . zen_draw_radio_field('status',0, $status_false) . ' false <br /><br />';
	      $contents[] = array('text' => $tmpText);
	      
		  
	      //shipping_displays_name
	      $tmpText = '<b>' . TEXT_SHIPPING_DISPLAYS_NAME_TITLE . '</b><br />' . TEXT_SHIPPING_DISPLAYS_NAME_DESC . '<br /><br />' . zen_draw_input_field('pr_name', $mInfo->pr_name, 'size="30"') . '<br /><br />';
	      $contents[] = array('text' => $tmpText);
		  
	      //dsf_shipping_code
	      $tmpText = '<b>' . TEXT_DSF_SHIPPING_CODE_TITLE . '</b><br />' . TEXT_DSF_SHIPPING_CODE_DESC . '<br /><br />' .zen_draw_input_field('pk_code',$mInfo->pk_code , 'size="30"'). '<br /><br />';
	      $contents[] = array('text' => $tmpText);
	      

		  //price_percentage
	      $tmpText = '<b>' . TEXT_PRICE_PERCENTAGE_TITLE . '</b><br />' . TEXT_PRICE_PERCENTAGE_DESC . '<br /><br />' . zen_draw_input_field('perc_price', $mInfo->perc_price, 'size="30"') . '<br /><br />';
	      $contents[] = array('text' => $tmpText);

	      //price_increase
	      $tmpText = '<b>' . TEXT_PRICE_INCREASE_TITLE . '</b><br />' . TEXT_PRICE_INCREASE_DESC . '<br /><br />' . zen_draw_input_field('incr_price', $mInfo->incr_price, 'size="30"') . '<br /><br />';
	      $contents[] = array('text' => $tmpText);
		  
	      //shipping_displays_image
	      $tmpText = '<b>' . TEXT_SHIPPING_DISPLAYS_IMAGE_TITLE . '</b><br />' . TEXT_SHIPPING_DISPLAYS_IMAGE_DESC . '<br /><br />' . zen_draw_input_field('shipping_logo', $mInfo->shipping_logo, 'size="30"') . '<br /><br />';
	      $contents[] = array('text' => $tmpText);

	      //shipping_displays_note
	      $tmpText = '<b>' . TEXT_SHIPPING_DISPLAYS_NOTE_TITLE . '</b><br />' . TEXT_SHIPPING_DISPLAYS_NOTE_DESC . '<br /><br />' . zen_draw_textarea_field('remark','soft','100%','5', $mInfo->remark, 'size="30"') . '<br /><br />';
	      $contents[] = array('text' => $tmpText);

	      //sort_index
	      $tmpText = '<b>' . TEXT_SORT_INDEX_TITLE . '</b><br />' . TEXT_SORT_INDEX_DESC . '<br /><br />' . zen_draw_input_field('sort_index', $mInfo->sort_index, 'size="30"') . '<br /><br />';
	      $contents[] = array('text' => $tmpText);

	      $contents[] = array('align' => 'center', 'text' => '<br>' . zen_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . zen_href_link("shipping_4px", 'page=' . $_GET['page'] . '&sID=' . $mInfo->pr_id) . '">' . zen_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
	  }
      break;
	case 'insert_new_shipping':
	  $heading[]     = array('text' => '<b>'.INSERT_NEW_SHIPPING. '</b>');
	   $contents = array('form' => zen_draw_form('insert_new_shipping_save', "shipping_4px", 'page=' . $_GET['page'] . '&sID=' . $mInfo->pr_id  . '&action=insert_new_shipping_save', 'post', 'enctype="multipart/form-data"'));
	  $contents[]    = array('text' => '<b>' . TEXT_SHIPPING_DISPLAYS_NAME_TITLE . '</b>' .
	                                   '<br /><br />' . zen_draw_input_field('pr_name', '', 'size="30"') . '<br />');
	  $contents[]    = array('text'=>'<b>' . TEXT_DSF_SHIPPING_CODE_TITLE . '</b>'. 
	                                 '<br /><br />' . zen_draw_input_field('pk_code', '', 'size="30"') . '<br />');
	  $contents[]    = array('text'=>'<b>' . TEXT_PRICE_PERCENTAGE_TITLE . '</b>'  . '<br />' . 
	                                 zen_draw_input_field('perc_price', '', 'size="30"') . '<br /><br />');
	  $contents[]    = array('text'=>'<b>' . TEXT_PRICE_INCREASE_TITLE . '</b>'  . '<br />' .
                                   	  zen_draw_input_field('incr_price', '', 'size="30"') . '<br /><br />');
	  $contents[]    = array('text'=>'<b>' . TEXT_SHIPPING_DISPLAYS_NOTE_TITLE . '</b>' . '<br />' .
                                 	  zen_draw_textarea_field('remark','soft','100%','5','', 'size="30"') . '<br />');
	  $contents[]    = array('text'=>'<b>' . TEXT_SHIPPING_DISPLAYS_IMAGE_TITLE . '</b>'. '<br />' . 
	                                 zen_draw_input_field('shipping_logo','', 'size="30"') . '<br />');
	  $contents[]    = array('text'=>'<b>' . TEXT_SORT_INDEX_TITLE . '</b>' . '<br />' . 
	                                 zen_draw_input_field('sort_index', '', 'size="30"') . '<br />');
	  $contents[]    = array('align' => 'center', 'text'=>'<br>' . zen_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . zen_href_link("shipping_4px", 'action=insert_new_shipping_save') . '">' . zen_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a></form>');
	break;/*
	case 'import_data':
	 $heading[]  = array('text' => '<b>' . OTHER_IMPORT_DATA . '</b>');
	 $contents= array('form' => zen_draw_form('import_data_save', "shipping_4px", 'page=' . $_GET['page'] . '&sID=' . $mInfo->pr_id  . '&action=import_data_save', 'post', 'enctype="multipart/form-data"'));
	 
	 $contents[] = array('text'=>'<input type="file" name="import_file" />');
	 $contents[]    = array('align' => 'center', 'text'=>'<br>' . zen_image_submit('button_save.gif', IMAGE_SAVE) . ' <a href="' . zen_href_link("shipping_4px", 'action=insert_new_shipping_save') . '">' . zen_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a></form>');
	 $contents[] = array('text' => '<b>'.OTHER_IMPORT_DATA_TEXT . '</b>');
	 $contents[] = array('text' => IMPORT_DATA_TEXT_INFO);
	break;*/
    case 'shipping_info':
    default:
      if (isset($mInfo) && is_object($mInfo)) {
        $heading[] = array('text' => '<b>' . $mInfo->pr_name . '</b>');
        $show_status =$mInfo->status==1?zen_image(DIR_WS_IMAGES . 'icon_status_green.gif', IMAGE_ICON_STATUS_ON):
				zen_image(DIR_WS_IMAGES . 'icon_status_red.gif', IMAGE_ICON_LINKED);
        $contents[] = array('text' => TEXT_DSF_SHIPPING_STATUS . '<br /><b>' . $show_status . '</b>');
        $contents[] = array('text' => TEXT_DSF_SHIPPING_CODE . '<br /><b>' . $mInfo->pk_code . '</b>');
        $contents[] = array('text' => TEXT_DSF_SHIPPING_NAME . '<br /><b>' . $mInfo->pr_name . '</b>');
        $contents[] = array('text' => TEXT_SHIPPING_DISPLAYS_IMAGE . '<br /><b>' . $mInfo->shipping_logo . '</b>');
        $contents[] = array('text' => TEXT_SHIPPING_DISPLAYS_NOTE . '<br /><b>' . $mInfo->remark . '</b>');
        $contents[] = array('text' => TEXT_PRICE_PERCENTAGE . '<br /><b>' . $mInfo->perc_price . '</b>');
        $contents[] = array('text' => TEXT_PRICE_INCREASE . '<br /><b>' . $mInfo->incr_price . '</b>');
        
        $contents[] = array('text' => TEXT_DATE_ADDED . '<br /><b>' . zen_date_short($mInfo->created) . '</b>');
        if (zen_not_null($mInfo->modified)) $contents[] = array('text' => TEXT_LAST_MODIFIED . '<br /><b>' . zen_date_short($mInfo->modified) . '</b>');
        
        $contents[] = array('align' => 'center', 'text' => '<a href="' . zen_href_link("shipping_4px", 'page=' . $_GET['page'] . '&sID=' . $mInfo->pr_id . '&action=shipping_edit') . '">' . zen_image_button('button_edit.gif', IMAGE_EDIT) . '</a>');
      }
      break;
	
  }

  if ( (zen_not_null($heading)) && (zen_not_null($contents)) ) {
    echo '            <td width="20%" valign="top">' . "\n";

    $box = new box;
    echo $box->infoBox($heading, $contents);

    echo '            </td>' . "\n";
  }
?>
          </tr>
        </table></td>
      </tr>
    </table></td>
<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>

<div id="frmUpload">
  <div  id="show_loading" style="width:900px;height:400px;">
  </div>
</div>
<?php } ?>
</body>
</html>