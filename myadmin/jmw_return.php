<?php
/**
 * @package admin
 * @license http://www.zen-cart.cn
 * @author Morrowind  
 * @contact 290313271@qq.com / hnsytcg@163.com
 * @version $Id: jmw_api.php 15881 2011-03-21 16:32:39Z wilt $
 */
  require('includes/application_top.php');
  require(DIR_WS_CLASSES . 'currencies.php');
  require(DIR_WS_CLASSES .'jmw_api/products_imgaes_handle.class.php');
  set_time_limit(0);
  
	define('API_MULTI_MAP_SETUP',true);
	$currencies                  = new currencies();
	$jmw_login_name              = JMW_API_LOGIN_NAME;
	$jmw_password                = JMW_API_KEY;
	$api_token_string=JMW_API_USER_TOKEN; //借卖网会员Token认证
  
  	define(PROXY_ADDRESS,'inet-proxy-a.appl.swissbank.com');
	define(PROXY_PORT,8080);
	define(PROXY_USERNAME,'weicl');
	define(PROXY_PASS,'Ab123456');
  
  if(empty($api_token_string) ||  empty($jmw_login_name) || empty($jmw_password)){
  	$param               = array('in0'=>$jmw_login_name ,'in1'=>$jmw_password);
 	try {
 		$jmwWSDLClient = new SoapClient("http://www.jiemai.com/services/JieMaiService?wsdl", array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => PROXY_PORT,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROXY_PASS));
 		$result              = $jmwWSDLClient->__call('fetchToken',array($param));
 	}catch (SoapFault  $e){
 		 print_r($e);
 	}
	$api_token_string          = $result->out->usertoken;
	//echo $user_token.'fdfd';
	$user_status          = strtoupper($result->out->status);
	if(strtoupper($user_status)==='SUCCESS' && !empty($api_token_string)){
		$db->Execute("update ".TABLE_CONFIGURATION." set configuration_value='".$api_token_string."' where configuration_key='JMW_API_USER_TOKEN'");
	}else{
		echo $result->out->message;exit;
	}
}
function write_add_products_record($write_array,$price_rate_custom,$add_to_categories){
	if(sizeof($write_array) <0) return  ;
	if(sizeof($price_rate_custom) < 0) return  ; 
	$jmwlogPath = dirname(__FILE__).'/jmwlog';
	$add_products_recordPath = $jmwlogPath.'/add_products_record.txt';
	$get_record_add_products 	= file_get_contents($add_products_recordPath);
	$already_record_products    = empty($get_record_add_products)?array():explode(',',$get_record_add_products);
	foreach ($write_array as $_sku){
		$rate = queryPriceRate($_sku,$price_rate_custom);
		if(empty($rate)) $rate = 0;
		$temp_arr[]= $_sku.'::'.$rate.'::'.$add_to_categories;
	}
	$write_products_start       = array_unique(array_merge($already_record_products,$temp_arr));
	$write_products_record      = $write_products_start?implode(',',$write_products_start):null;
	file_put_contents($add_products_recordPath,$write_products_record);
}
function Remove_products_record($products_sku){
	$jmwlogPath = dirname(__FILE__).'/jmwlog';
	$add_products_recordPath = $jmwlogPath.'/add_products_record.txt';
  	$get_record_add_products          = file_get_contents($add_products_recordPath);
  	$already_record_products          = empty($get_record_add_products)?array():explode(',',$get_record_add_products);
  	foreach($already_record_products as $key=>$val){
  		$temp = explode('::',$val) ;
    	if($products_sku!=$temp[0]){
	   		$new_products_sku[] =$val;
	  	}
  	}
  	$write_record  = empty($new_products_sku)?'':implode(',',$new_products_sku);
  	file_put_contents($add_products_recordPath,$write_record);
}
function get_association_sku_productsid($sku){
   global $db;
   $query_relust=$db->Execute("select products_id from ".TABLE_PRODUCTS." where products_model='".$sku."'");
   return $query_relust->fields['products_id'];
}
/**
 * 导入借卖网产品到本站函数
 * @param Array $products_sku
 * @param Integer $add_to_categories
 * @param Double $price_rate
 * @return 
 */
function handle_add_fail_products($products_sku,$add_to_categories,$price_rate_custom){//添加借卖网产品函数
	global $db,$api_token_string;
	$currencies_value   = API_CURRENCIES_ID_SETUP ;
	//write_add_products_record($products_sku,$price_rate_custom,$add_to_categories);
	$param = array('in0'=>$api_token_string,'in1'=>$products_sku,'in2'=>'','in3'=>true);
	$startTime = get_microtime();
	try{
		$jmwWSDLQueryClient = new SoapClient("http://query.jiemai.com/services/UsJieMaiSlService?wsdl",array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROXY_PASS));
		$result  = $jmwWSDLQueryClient->__call('getProductDetail',array($param));
	}catch(SOAPFault $e){
	  	print_r($e);
	   	print_r('错误信息:<b style="color:red;">查询借卖网产品详细信息失败,导致添加产品失败！</b>');
	}
	
	if(get_microtime()-$startTime>30){
		echo '---链接过慢,跳过SKU:'.($products_sku[0]);exit;
	}
	
	$result_out_status=$result->out->status;
	if($result_out_status=='Fail'){
	 	die('<b>错误信息:</b><b style="color:red;">'.$result->out->message.'</b>--> 具体请联系<b>借卖网</b>！');
	}else{
	   //$script_string = 'onload=add_products_whether_sussecc();';
	}
	
	$productsarray      = $result->out->productDetail->ProductDetail;
	
	$NewHandleImages    = new ProductsImagesHandle();
	
	$count_prodsarray   = sizeof($productsarray);
	
	for($i=0;$i<$count_prodsarray;$i++){
		try {
	    	if($count_prodsarray==1){
        		$productsarrays = $productsarray;
        	}else{
        		$productsarrays = $productsarray[$i];
        	}
			$products_id = get_association_sku_productsid($productsarrays->sku);
			//echo '----------------------------'.$productsarrays->sku.'--------------------------';
			if(empty($products_id)){
				$_products_image = $NewHandleImages->products_urlimage_handle($productsarrays->picInfo->PicInfo);
				
				if(!empty($_products_image)){
					
					$temp_file = explode(',',$_products_image) ;
					$temp_file_exists = true;
					foreach ($temp_file as $imgfile){
						if(!file_exists(str_replace('//','/',DIR_FS_CATALOG.'/images/'.$imgfile))) {
							$temp_file_exists=false ;break ;
						}
					}
					if($temp_file_exists){
	    				$products_date_available = null;
						$products_date_available = (date('Y-m-d') < $products_date_available) ? $products_date_available : 'null';
        				$tmp_value               = JMW_API_PRODUCTS_QUANTITY;
						$products_quantity       = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
						$price_rate = queryPriceRate($productsarrays->sku,$price_rate_custom);
						$price_rate              =  intval($price_rate)>0?intval($price_rate)/100:0;
						echo '----price is ---'.$productsarrays->price;
						echo '<br>';
						echo '----price rate is ---'.$price_rate;
						echo '<br>';
						echo '--currencies value is-----'.$currencies_value;
						echo '<br>';
						$products_price          = round(($productsarrays->price*((int)1+$price_rate))/$currencies_value,2);
						
						$products_weight         = zen_db_prepare_input($productsarrays->weight);
						$tmp_value               = zen_db_prepare_input($productsarrays->manufacturers_id);
						$manufacturers_id        = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
						$sql_data_array = array(
							'products_quantity'               => $products_quantity,
							'products_type'                   => 1,
							'products_model'                  => zen_db_prepare_input($productsarrays->sku),
							'products_price'                  => $products_price,
							'products_date_available'         => $products_date_available,
							'products_weight'                 => $products_weight,
							'products_jmw_height'             => $productsarrays->height,
							'products_jmw_length'             => $productsarrays->length,
							'products_jmw_width'              => $productsarrays->width,
							'products_status'                 => 1,
							'products_virtual'                => 0,
							'products_tax_class_id'           => 0,
							'manufacturers_id'                => $manufacturers_id,
							'products_quantity_order_min'     => 1,
							'products_quantity_order_units'   => 1,
							'products_priced_by_attribute'    => 0,
							'product_is_free'                 => 0,
							'product_is_call'                 => 0,
							'products_quantity_mixed'         => 1,
							'product_is_always_free_shipping' => 0,
							'products_qty_box_status'         => 1,
							'products_quantity_order_max'     => 0,
							'products_sort_order'             => 0,
							'products_discount_type'          => 0,
							'products_discount_type_from'     => 0,
							'products_price_sorter'           => $products_price,
							'products_jmw_api'                =>1,
							'products_jmw_sku'				  =>$productsarrays->sku,
							'products_image' => $_products_image
					);
					$new_image                        = 'true';
					if ($info['image_delete'] == 'true') {
						$sql_data_array['products_image'] = '';
						$new_image                        = 'false';
					}
					$insert_sql_data = array( 
						'products_date_added'  => 'now()',
						'master_categories_id' => $add_to_categories,
					);
					$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
					
					zen_db_perform(TABLE_PRODUCTS, $sql_data_array);
					$products_id = zen_db_insert_id();
					zen_update_products_price_sorter($products_id);
					$db->Execute("insert into " . TABLE_PRODUCTS_TO_CATEGORIES . "
						(products_id, categories_id)
						values ('" . (int)$products_id . "', '" . $add_to_categories . "')");
					$jmw_language   = $productsarrays->productDesc->ProductDesc[0]->language;
					$insert_language_id= $jmw_language=='CN'?2:1;
					$sql_data_array = array(
						'products_name'        => $db->prepare_input($productsarrays->cnname),
						'products_description' => stripslashes(str_replace(array('\\r\\n','\\n\\r','\\n','\\r'),array('<br />','<br />','<br />','<br />'),$db->prepare_input($productsarrays->productDesc->ProductDesc[0]->desc))),
						'products_url'         => zen_db_prepare_input($productsarrays->products_url)
					);
					$insert_sql_data = array(
						'products_id' => $products_id,
						'language_id' => $insert_language_id
					);
					$sql_data_array = array_merge($sql_data_array, $insert_sql_data);
					zen_db_perform(TABLE_PRODUCTS_DESCRIPTION, $sql_data_array);
					$sql_data_array_1 = array(
						'products_name'        => $db->prepare_input($productsarrays->enname),
						'products_description' => stripslashes(str_replace(array('\\r\\n','\\n\\r','\\n','\\r'),array('<br />','<br />','<br />','<br />'),$db->prepare_input($productsarrays->productDesc->ProductDesc[1]->desc))),
						'products_url'         => zen_db_prepare_input($productsarrays->products_url)
					);
					$jmw_language       = $productsarrays->productDesc->ProductDesc[1]->language;
					$insert_language_id = $jmw_language=='CN'?2:1;
					$insert_sql_data_1  = array(
						'products_id'   => $products_id,
						'language_id'   => $insert_language_id
					);
					$sql_data_array_1 = array_merge($sql_data_array_1, $insert_sql_data_1);
					zen_db_perform(TABLE_PRODUCTS_DESCRIPTION, $sql_data_array_1);
					//Remove_products_record($productsarrays->sku);
				     echo 'SKU-'.$productsarrays->sku.' ADD SUCCESS !';
				}else{
					 echo 'SKU-'.$productsarrays->sku.' 图片下载失败 ADD Fail 2! <br />';
				}
				
			 }else{
			 	     echo 'SKU-'.$productsarrays->sku.' 图片下载失败 ADD Fail 1! <br />';
			 }
			}else{
				//Remove_products_record($productsarrays->sku);
				echo 'SKU-'.$productsarrays->sku.' 已经添加过!<br />';
			}
		 
		}catch (Exception $e) { 
		  echo  'SKU-'.$productsarrays->sku.'-图片处理连接超时，导致失败！,建议一次少添加几个<br />' ;
		}
	 }
	 unset($result,$productsarray,$_products_image,$sql_data_array);
	 echo "耗时:<b>".(get_microtime() - $startTime).'</b>s';exit;
	/* echo   '<script type="text/javascript">
			'.$script_string.'
			</script>&nbsp;
			';*/
}
function update_jmw_token(){//清空借卖网的TOKEN值
  global $db;
  $db->Execute("update ".TABLE_CONFIGURATION." set configuration_value='".$user_token."' 
               where configuration_key='JMW_API_USER_TOKEN'");
}
class UpdateProductCondtion{
	public $country;
	public function UpdateProductCondtion($Name,$Sku,$Categoryid,$startPutawayDate,$endPutawayDate,$whCode='',$sort='',$country='US'){
		if(!empty($Name)) $this->name = $Name ;
		if(!empty($Sku)) $this->sku = $Sku ;
		if(!empty($Categoryid)) $this->categoryid = $Categoryid ;
		if(!empty($startPutawayDate)) $this->startPutawayDate =$startPutawayDate ;
		if(!empty($endPutawayDate)) $this->endUpdatedDate = $endPutawayDate ;
		if(!empty($whCode)) $this->whCode = $whCode ;
		if(!empty($sort)) $this->sort = $sort ;
		$this->country = !empty($country) ? $country : 'US';
	}
}
/**
 * jmw产品类
 */
class ProductCondtion{
	public $country ;//到达国家二字码（必须）目前提供如下所列国家，供试算预计物流费,(JP:日本;AU:澳大利亚;GB:英国;FR:法国;DE:德国;IT:意大利;NL:荷兰;ES:西班牙;CA:加拿大;US:美国;RU:俄罗斯联邦)
	public function ProductCondtion($name='',$sku='',$categoryid=0,$startPrice,$endPrice,$startPutawayDate='',$endPutawayDate=''
	,$whCode='',$sort='',$country='US'){
		
		if(!empty($name)) $this->name = $name ;
		if(!empty($sku))  $this->sku = $sku ;
		if (!empty($categoryid))  $this->categoryid = $categoryid ;
		if(!empty($startPrice)) $this->startPrice = $startPrice ;
		if(!empty($endPrice)) $this->endPrice = $endPrice ;
		if(!empty($startPutawayDate)) $this->startPutawayDate = $startPutawayDate ;
		if(!empty($endPutawayDate)) $this->endPutawayDate = $endPutawayDate ;
	    if(!empty($whCode)) $this->whCode = $whCode ;
	    if(!empty($sort)) $this->sort = $sort ;
		$this->country = !empty($country) ? $country : 'US';
	}
}
class Jmw_Tree
{
   //取得子目录
	  function _getchildren($data,$id){
		  $counter=0;
		  for($i=0;$i<count($data);$i++){
			  if($data[$i]["parenId"]==$id){
				  $children[$counter]["categoryId"]    = $data[$i]["categoryId"];
				  $children[$counter]["parenId"]       = $data[$i]["parenId"];
				  $children[$counter]["name"]          = $data[$i]["name"];
				  $children[$counter]["cnName"]        = $data[$i]["cnName"];
				  $counter ++;
				}
			  
		  }
			  return $children;
		}//取得类型节点
	  function _gettypeitem($data,$id){
		  if($this->_getchildren($data,$id)){
			  return 1;
		  }else{
				 return 0;
		  }
	  }//取得目录树
	  function _gettree($data,$id,$callstack,$result=array()){
		  
		  if($callstack===0){
			  $result=array();
			  }
		  $startlevel=$this->_getchildren($data,$id);
		  for($x=0;$x<count($startlevel);$x++){
			  $node = $this->_gettypeitem($data,$startlevel[$x]["categoryId"]);
			  $result[]=array("categoryId"     => $startlevel[$x]["categoryId"],
							  "parenId"        => $startlevel[$x]["parenId"],
							  "name"           => str_repeat("&nbsp;&nbsp;",$callstack).$startlevel[$x]["name"],
							  "cnName"         => str_repeat("&nbsp;&nbsp;",$callstack).$startlevel[$x]["cnName"],
							  "stack"          => $callstack,
							  "type"           => $node,);
				  
			  if($node===1&& $callstack<2){
				  $result=$this->_gettree($data,$startlevel[$x]["categoryId"],$callstack+1,$result);
			  }
			  }  
		  return $result;
		}
	  function zen_get_category_tree_jmw($parent_id = '0', $spacing = '', $exclude = '', $category_tree_array = '', 
                               $include_itself = false, $category_has_products = false, $limit = false) {
	    global $db;
	    if ($limit) {
	      $limit_count = " limit 1";
	    } else {
	      $limit_count = '';
	    }
	    if (!is_array($category_tree_array)) $category_tree_array = array();
	    if ( (sizeof($category_tree_array) < 1) && ($exclude != '0') ) $category_tree_array[] = array('id' => '0', 'text' => TEXT_TOP);

	    if ($include_itself) {
	      $category = $db->Execute("select cd.categories_name
	                                from " . TABLE_CATEGORIES_DESCRIPTION . " cd
	                                where cd.language_id = '" . (int)$_SESSION['languages_id'] . "'
	                                and cd.categories_id = '" . (int)$parent_id . "'");
	      $category_tree_array[] = array('id' => $parent_id, 'text' => $category->fields['categories_name']);
	    }
	    $categories = $db->Execute("select c.categories_id, cd.categories_name, c.parent_id
	                                from " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd
	                                where c.categories_id = cd.categories_id
	                                and cd.language_id = '" . (int)$_SESSION['languages_id'] . "'
	                                and c.parent_id = '" . (int)$parent_id . "' 
	                                order by c.sort_order, cd.categories_name");
	    while (!$categories->EOF) {
	      if ($category_has_products == true and zen_products_in_category_count(
		      $categories->fields['categories_id'], '', false, true) >= 1) {
	        $mark = '*';
	      } else {
	        $mark = '&nbsp;&nbsp;';
	      }
	      if ($exclude != $categories->fields['categories_id']) $category_tree_array[] = 
		      array('id' => $categories->fields['categories_id'], 'text' => $spacing . $categories->fields['categories_name'] . $mark);
	      $category_tree_array = zen_get_category_tree($categories->fields['categories_id'], $spacing . '&nbsp;&nbsp;&nbsp;',
	                        	  $exclude, $category_tree_array, '', $category_has_products);
	      $categories->MoveNext();
	    }
	    return $category_tree_array;
    }

	   function zen_draw_pull_down_menu_jmw($name, $values, $default = '', $parameters = '', $required = false) {
	    $field   = '<select rel="dropdown" id="add_to_categories" name="' . zen_output_string($name) . '"';
	    if (zen_not_null($parameters)) $field .= ' ' . $parameters;
	    $field  .= '>' . "\n";
	    //$field  .='<option value="0">All Category</option>';
	    if (empty($default) && isset($GLOBALS[$name]) && is_string($GLOBALS[$name]) ) $default = stripslashes($GLOBALS[$name]);
	    for ($i=0, $n=sizeof($values); $i<$n; $i++) {
	      $field .= '<option value="' . zen_output_string($values[$i]['id']) . '"';
	      if ($default == $values[$i]['id']) {
	        $field    .= ' selected="selected"';
	      }
	      $field      .= '>' . zen_output_string($values[$i]['text'], array('"' => '&quot;', '\'' => '&#039;', '<' => '&lt;', '>' => '&gt;'))
	              	  . '</option>' . "\n";
	    }
	    $field .= '</select>' . "\n";
	    if ($required == true) $field .= TEXT_FIELD_REQUIRED;
	    return $field;
	}
}
function get_products_whether_update($products_model){
   global $db;
   $date=date("Y-m-d");
   $query_relust=$db->Execute("select products_id from ".TABLE_PRODUCTS."
                               where products_model='".$products_model."' and products_updatedate='".$date."'");
   if(!empty($query_relust->fields['products_id'])){
      return true;
   }else{
      return false;
   }
}
function select_products_sku($products_id){
  global $db;
  $implode_array  = !empty($products_id)?implode(',',$products_id):0;
   $query_relust=$db->Execute("select products_model from ".TABLE_PRODUCTS."
                               where products_id in (".$implode_array.")");
   while (!$query_relust->EOF) {
     $products_model   = $query_relust->fields['products_model'];
     $products_sku[]   = $products_model?$products_model:null;unset($products_model);
     $query_relust->MoveNext();
	}
  return $products_sku;
}
$new_jmw_tree=new Jmw_Tree();
if($_GET['action']=='request_categories'){ //同步借卖网分类
  $categoies_param    = array('usertoken'=>$api_token_string);
  try {
  	$jmwWSDLClient = new SoapClient('http://www.jiemai.com/services/JieMaiSlService?wsdl',array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROX_YPASS));
	$result_categories  = $jmwWSDLClient->__call('getAllCategories',array($categoies_param));
  }catch (SoapFault $e){
  	print_r($e);exit;
  }
  $result_categories  = $result_categories->result->categories->CategoryVO;
  $count_categories   = sizeof($result_categories);
  $db->Execute("TRUNCATE TABLE `jmw_products_categories`");
  for($i=0;$i<$count_categories;$i++){
      $categoryid     = $result_categories[$i]->categoryId;
	  $cnname         = $db->prepare_input($result_categories[$i]->cnName);
	  $name           = $db->prepare_input($result_categories[$i]->name);
	  $parenId        = $result_categories[$i]->parenId;
	  $sortOrder      = $result_categories[$i]->sortOrder;
	  $sqlInsert="insert into jmw_products_categories (jmw_id,categoryId,parenId,name,cnName,sortOrder)
             	  values ('','".$categoryid."','".$parenId."','".$name."','".$cnname."','".$sortOrder."')";
	  $db->Execute($sqlInsert);
	  }
	  //上面是重新获取借卖网的分类
	  //下面是重新输出分类
	$mian_query=$db->Execute("select * from jmw_products_categories order by jmw_id desc");
	while (!$mian_query->EOF) {
	   $category_tree_array[] = array('categoryId'=>$mian_query->fields['categoryId'],'parenId'=>$mian_query->fields['parenId'],
		                              'name'=>$mian_query->fields['name'],'cnName'=>$mian_query->fields['cnName']);
	 	$mian_query->MoveNext();
	}
	$tree_categoires      = $new_jmw_tree->_gettree($category_tree_array,0,0);
	$select_list_cate     = '<select name="jmw_categories_id"  id="jmw_categories_id" rel="dropdown">';
	$select_list_cate    .= '<option value="0">查询借卖网分类</option>';
	for($j=0;$j<sizeof($tree_categoires);$j++){
	  $select_list_cate  .= '<option value="'.$tree_categoires[$j]['categoryId'].'">'.$tree_categoires[$j]['cnName'].'</option>';
	}
	$select_list_cate    .= '</select>';
	echo $select_list_cate;
}elseif(!empty($_POST['products_sku']) && $_GET['action']=='add_jmw_products'){//导入JMW产品到本站
//	var_dump(debug_backtrace()); 
    $price_rate_custom  = $_POST['price_rate_custom'] ;
    $add_to_categories  = $_POST['add_to_categories'];
	handle_add_fail_products($_POST['products_sku'],$add_to_categories,$_POST['rate']);
	
 }elseif($_GET['action']=='request_products_update'){ //借卖网产品更新查询
     //查询产品更新信息 这里没 日期选项 $startPutawayDate   = $_POST['startputawaydate']; $endPutawayDate     = $_POST['endputawaydate'];
	 $name               = $_POST['select_jmw_key'];
	 $sku                = $_POST['select_jmw_sku'];
	 $categoryId         = $_POST['jmw_categories_id']==0?0:$_POST['jmw_categories_id'];
	 $startPutawayDate   = $_POST['startputawaydate'];
	 $endPutawayDate     = $_POST['endputawaydate'];
	 $whCode			 =  $_POST['whCode'];
	 $sort  			=	$_POST['sort'];
	 $country			=	$_POST['country'] ;
	 //end
	 $current_page       = empty($_POST['current_page_value'])?0:$_POST['current_page_value'];
	 $every_page_n       = intval(JMW_API_PRODUCTS_LIST)>1?JMW_API_PRODUCTS_LIST:10;
	 if(!empty($_POST['query_every_page']) && (int)$_POST['query_every_page'] > 0) $every_page_n = (int)$_POST['query_every_page'] ;
	 $current_products   = $current_page>1?($current_page-1)*$every_page_n:0;
	 
     $updateproduct      = new UpdateProductCondtion($name,$sku,$categoryId,$startPutawayDate,$endPutawayDate,$whCode,$sort,$country);
	 $param              = array('in0'=>$api_token_string,'in1'=>$updateproduct,'in2'=>$current_products,'in3'=>$every_page_n);
	
	 $jmwWSDLQueryClient	= new SoapClient('http://query.jiemai.com/services/UsJieMaiSlService?wsdl', array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROXY_PASS));
	 $result             = $jmwWSDLQueryClient->__call('queryUpdatedProduct',array($param));
	 $total_products     = $result->out->total;//查询得到总产品数
	 $total_page         = ceil($total_products/$every_page_n);//总页面数
	 $current_page       = ($current_page*$every_page_n)>$total_products?$total_page:$current_page;//重新定义当前页
	 $productbaseinfo    = $result->out->baseInfo->ProductBaseInfo;//print_r($result);
	 echo'<span class="pageHeading">借卖网产品更新列表：</span><br />';
	 echo'<form name="form5" method="post">';
	 echo'<table border="0" width="100%" cellpadding="2" cellspacing="0">';
	 echo'<tr class="dataTableHeadingRow dataTableHeadingContent" style="height:25px;">';
	 echo'<td width="150">sku</td>';
	 echo'<td>产品名</td>';
	 echo'<td width="140">商品价格(不包含运费)</td>';
	 echo'<td width="90">预计运费</td>';
	 echo'<td width="90">所在仓库</td>';
	 echo'<td width="90">库存数量</td>';
	 echo'<td width="90">重量</td>';
	 echo'</tr>';
	 $count_sizeof=sizeof($productbaseinfo);
	 for($i=0;$i<$count_sizeof;$i++){
	    if($count_sizeof==1){
        $productbaseinfos = $productbaseinfo;
        }else{
        $productbaseinfos = $productbaseinfo[$i];
        }
		 $whether_update=get_products_whether_update($productbaseinfos->sku);
		 echo'<tr class="dataTableRow" onMouseOut="rowOutEffect(this)" onMouseOver="rowOverEffect(this)">';
		 echo'<td>';
		 if($whether_update){
		   echo '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		 }else{
		   echo'<input type="checkbox" name="products_sku_array" id="products_sku_array" value="'.$productbaseinfos->sku.'" />';
		 }
		 echo$productbaseinfos->sku;
		 echo'</td>';
		 echo'<td>'.$productbaseinfos->cnname.'</td>';
		 echo'<td>'.$productbaseinfos->price.'元</td>';
		 echo'<td>'.$productbaseinfos->dpfee.'</td>';
		 echo'<td>'.$productbaseinfos->whCnName.'&nbsp;['.$productbaseinfos->whCode.']'.'</td>';
		 echo'<td>'.$productbaseinfos->stockNum.'</td>';
		 echo'<td>'.$productbaseinfos->weight.'KG</td>';
		 echo'</tr>';
	 }
	 echo'</table>';
	 echo'</form>';
	 echo'<div>';
	 echo'<span style="float:left;width:auto;pading-left:6px;">';
	 //echo"<INPUT onclick=CheckAll('selectAll',this) type=checkbox value=on name=chkall>全选";
	 echo'<input type="checkbox" name="invest" value="checkbox" onClick="CheckAll()">反选';
	 echo'</span>';
	 echo'<span class="buttom_page_span">';
	 echo'<input type="hidden" id="current_page_value" name="current_page_value" value="'.$current_page.'"/>';
	 echo'<input type="hidden" id="tail_page_value" name="tail_page_value" value="'.$total_page.'"/>';
	 if($current_page<$total_page){
	    $number_one = (int)1;
	    $current_products_count=($current_products*$every_page_n)+$number_one;
		$current_to_page        =$current_page==0?$every_page_n:($current_page+1)*$every_page_n;
		echo'<span>共'.$total_products.'条 </span>';
	    //echo'<span>当前显示'.$current_products_count.'到'.$current_to_page.'条</span>';
	 }
	 if($current_page>1){
		echo"    <span onclick=\"request_page_update('home_page');\" class='text_underline_cursor'>首页</span>";
	 }
	 if($current_page>1){
		echo"    <span onclick=\"request_page_update('back_page');\" class='text_underline_cursor'>上一页</span>";
	 }
	 if($current_page<$total_page && $total_page>1){
		echo"    <span onclick=\"request_page_update('next_page');\"  class='text_underline_cursor'>下一页</span>";
	 }
	 if($total_page>1 && $current_page!=$total_page){
		echo"    <span onclick=\"request_page_update('tail_page');\" class='text_underline_cursor'>尾页</span>";
	 }
	 echo'</span>';
	 echo'<span class="buttom_submit_button">';
	 echo'   <input name="" type="button" value="提交"  onclick="return func_update_request(document.form5);"/>';
	 echo'</span>';
	 echo'</div>';
	 
     //echo'=========';
}elseif($_GET['action']=='shelveproductfromshop'){//接受发送过来的sku产品，到借卖网删除 ,下架意味着删除
     $delete_products_id = select_products_sku($_POST['products_id']);
     $param              = array('usertoken'=>$api_token_string,'arraySku'=>$delete_products_id,'status'=>'OFF');
     try {
     	$jmwWSDLClient	= new SoapClient('http://www.jiemai.com/services/JieMaiSlService?wsdl',array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROXY_PASS));
     	$result = $jmwWSDLClient->__call('shelveProductFromShop',array($param));
     }catch (SOAPFault $e ){
     	print_r($e);
     }
	 if($result->result->status=='Success'){
	   echo '<script type="text/javascript">Onload = handle_delete_product();</script>';
	   echo 'SUCCESS';
	 }else{
	   echo '删除失败:'.$result->result->message;
	 }
}elseif($_GET['action']=='update_request_sku'){//接受发送过来的sku产品，再更新到本地
     $select_currencies  = $db->Execute("select value from ".TABLE_CURRENCIES." where currencies_id=".API_CURRENCIES_ID_SETUP."");
	 $currencies_value   = number_format($select_currencies->fields['value'],3,'.','');
	 $price_rate         = JMW_API_PRICE_RATE; //更新的时候按照设置的更新价格比例
     $param              = array('in0'=>$api_token_string,'in1'=>$_POST['products_sku'],'in2'=>'','in3'=>'');
     try {
     	$jmwWSDLQueryClient = new SoapClient('http://query.jiemai.com/services/UsJieMaiSlService?wsdl',array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROXY_PASS));
     	$result             = $jmwWSDLQueryClient->__call('getProductDetail',array($param));
     }catch (SoapFault $e){
     	print_r($e);exit;
     }
	 $productsarray      = $result->out->productDetail->ProductDetail;
	 include(DIR_WS_CLASSES.'jmw_api/products_imgaes_handle.class.php');
	 $NewHandleImages    = new ProductsImagesHandle();//print_r($result);
	 $count_prodsarray   = sizeof($productsarray);
	 for($i=0;$i<$count_prodsarray;$i++){
	    if($count_prodsarray==1){
        $productsarrays = $productsarray;
        }else{
        $productsarrays = $productsarray[$i];
        }
		$request_sku=$productsarrays->sku;
	    $products_id = get_association_sku_productsid($request_sku);
		if(!empty($products_id)){
			$products_date_available = zen_db_prepare_input($productsarrays->products_date_available);
			$products_date_available = (date('Y-m-d') < $products_date_available) ? $products_date_available : 'null';
			$products_quantity       = JMW_API_PRODUCTS_QUANTITY;
			$tmp_value               = ($productsarrays->price*((int)1+$price_rate))/$currencies_value;
			$products_price          = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
			$tmp_value               = zen_db_prepare_input($productsarrays->weight);
			$products_weight         = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
			$tmp_value               = zen_db_prepare_input($productsarrays->manufacturers_id);
			$manufacturers_id        = (!zen_not_null($tmp_value) || $tmp_value=='' || $tmp_value == 0) ? 0 : $tmp_value;
			$sql_data_array = array(
				'products_quantity'               => $products_quantity,
				'products_type'                   => 1,
				'products_model'                  => $request_sku,
				'products_price'                  => $products_price,
				'products_date_available'         => $products_date_available,
				'products_weight'                 => $products_weight,
				'products_status'                 => 1,
				'products_virtual'                => 0,
				'products_tax_class_id'           => 0,
				'manufacturers_id'                => $manufacturers_id,
				'products_quantity_order_min'     => 1,
				'products_quantity_order_units'   => 1,
				'products_priced_by_attribute'    => 0,
				'product_is_free'                 => 0,
				'product_is_call'                 => 0,
				'products_quantity_mixed'         => 1,
				'product_is_always_free_shipping' => 0,
				'products_qty_box_status'         => 1,
				'products_quantity_order_max'     => 0,
				'products_sort_order'             => 0,
				'products_discount_type'          => 0,
				'products_discount_type_from'     => 0,
				'products_price_sorter'           => $products_price,
				'products_updatedate'             =>date("Y-m-d"),
			);
			$sql_data_array['products_image']  = $NewHandleImages->products_urlimage_handle(zen_db_prepare_input($productsarrays->imageurl));
			$new_image= 'true';
			if ($info['image_delete'] == 'true') {
				$sql_data_array['products_image'] = '';
				$new_image= 'false';
			}
			$update_sql_data = array('products_last_modified' => 'now()');
			$sql_data_array = array_merge($sql_data_array, $update_sql_data);
			zen_db_perform(TABLE_PRODUCTS, $sql_data_array, 'update', "products_id = '" . (int)$products_id . "'");
			zen_update_products_price_sorter((int)$products_id);
			$jmw_language   = $productsarrays->productDesc->ProductDesc[0]->language;
			$insert_language_id= $jmw_language=='CN'?2:1;
			$sql_data_array = array(
				'products_name'        => $db->prepare_input($productsarrays->cnname),
				'products_description' => stripslashes(str_replace(array('\\r\\n','\\n\\r','\\n','\\r'),array('<br />','<br />','<br />','<br />'),$db->prepare_input($productsarrays->productDesc->ProductDesc[0]->desc))),
				'products_url'         => zen_db_prepare_input($productsarrays->products_url)
			);
			zen_db_perform(TABLE_PRODUCTS_DESCRIPTION, $sql_data_array, 'update',"products_id = '" .
				(int)$products_id . "' and language_id = '" . (int)$insert_language_id . "'");
			$sql_data_array_1 = array(
				'products_name'        => $db->prepare_input($productsarrays->enname),
				'products_description' => stripslashes(str_replace(array('\\r\\n','\\n\\r','\\n','\\r'),array('<br />','<br />','<br />','<br />'),$db->prepare_input($productsarrays->productDesc->ProductDesc[1]->desc))),
				'products_url'         => zen_db_prepare_input($productsarrays->products_url)
			);
			$jmw_language       = $productsarrays->productDesc->ProductDesc[1]->language;
			$language_id = $jmw_language=='CN'?2:1;
			zen_db_perform(TABLE_PRODUCTS_DESCRIPTION, $sql_data_array_1, 'update',"products_id = '" .
						(int)$products_id . "' and language_id = '" . (int)$language_id . "'");
		}
	 }
     echo'<br />更新请求的sku产品成功<br /><br />';
 }elseif ($_GET['action'] =='queryWhCode'){ //查询借卖网仓库
 	$jmwWSDLClient	=	 new  SoapClient('http://www.jiemai.com/services/JieMaiSlService?wsdl',array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROXY_PASS));
 	$param	=	array('usertoken'=>$api_token_string);
 	try {
 		$jmwReturn = $jmwWSDLClient->__call('queryWhCode',array($param));
 	}catch (SoapFault $e){
 		print_r($e); 
 	}
 	$WhCodeInfoArr =  $jmwReturn->result->info->WhCodeInfo;
 	if(sizeof($WhCodeInfoArr)<=0) die('没有发现仓库');
 	echo "<select name='WhCodeName'>";
 	echo "<option value='all'>---全部仓库---</option>";
 	foreach ($WhCodeInfoArr as $_k => $_v){
 		if($_k!=0 && $_k%3==0) echo '<br />'; 
 		echo "<option value='{$_v->whCode}'>{$_v->whCnName}</option>";
 	}
 	echo "</select>";
 }elseif ($_GET['action'] =='getJMWOrderStatus'){ //非批量查看借卖网订单状态
 	$post = $_POST;
 	$orders_id = $post['orders_id'] ;
 	$jmwOrderID = $post['jmwOrderID'] ;
 	$param = array('usertoken'=>$api_token_string,'jmwOrderID'=>$jmwOrderID,'orderId'=>$orders_id);
 	try {
 		$jmwWSDLClient = new SoapClient('http://www.jiemai.com/services/JieMaiSlService?wsdl',array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROX_YPASS));
 		$result = $jmwWSDLClient->__call('getJMWOrderStatus',array($param));
 	}catch (SoapFault $e){
 		print_r($e);
 	}
	switch (strtoupper($result->result->status)){
		case 'SUCCESS':
			echo '<br  /><b>借卖网订单号:</b>'.$jmwOrderID.'<br /><b>订单状态:</b>'.(!empty($result->result->orderList->JmwOrderInfo->shippingStatus) ? $result->result->orderList->JmwOrderInfo->shippingStatus:'未发送');
			break;
		case 'FAIL':
			echo $result->result->message;
			break ;
	}
 	
 }elseif ($_GET['action'] =='setCallServiceAPI'){ //接受推送服务地址设定
	 $post = $_POST;
	 $param = array('usertoken' => $api_token_string ,'callBack' => 'N','shopName' => $post['shopName'] , 'shopUrl'=>$post['shopUrl'],
	 'serviceUrl'=>$post['serviceUrl'],'callType'=>'0');
	 try {
	 	$jmwWSDLClient = new SoapClient('http://www.jiemai.com/services/JieMaiSlService?wsdl',array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROXY_PASS)) ;
	 	$result = $jmwWSDLClient->__call('setCallServiceAPI',array($param));
	 }catch (SoapFault $e){
	 	print_r($e);
	 }
	 if(strtoupper($result->result->status)=='SUCCESS') SetCallServiceAPI();
	 echo $result->result->message;
 }elseif ($_GET['action'] =='clear_products_record'){ //清空record
 	$jmwlogPath = dirname(__FILE__).'/jmwlog';
	$add_products_recordPath = $jmwlogPath.'/add_products_record.txt';
	@file_put_contents($add_products_recordPath,0);
	echo "清空完毕";exit;
 }elseif($_GET['action'] =='request_select'){//根据条件查询产品列表
//	 $current_page       = empty($_POST['current_page_value'])?0:$_POST['current_page_value'];
//	 $every_page_n       = intval(JMW_API_PRODUCTS_LIST)>1?JMW_API_PRODUCTS_LIST:10;
//	 if(!empty($_POST['query_every_page']) && (int)$_POST['query_every_page'] > 0) $every_page_n = (int)$_POST['query_every_page'] ;
//	 $current_products   = $current_page>1?($current_page-1)*$every_page_n:0;
//	 $name               = $_POST['select_jmw_key'];
//	 $sku                = $_POST['select_jmw_sku'];
//	 $categoryId         = $_POST['jmw_categories_id']==0?0:$_POST['jmw_categories_id'];
//	 $startPrice         = $_POST['startprice'];
//	 $endPrice           = $_POST['endprice'];
//	 $startPutawayDate   = $_POST['startputawaydate'];
//	 $endPutawayDate     = $_POST['endputawaydate'];
//	 $whCode			 =  $_POST['whCode'];
//	 $sort  			=	$_POST['sort'];
//	 $country			=	$_POST['country'] ;

$current_page       = empty($_GET['current_page_value'])?0:$_GET['current_page_value'];
	 $every_page_n       = intval(JMW_API_PRODUCTS_LIST)>1?JMW_API_PRODUCTS_LIST:10;
	 if(!empty($_GET['query_every_page']) && (int)$_GET['query_every_page'] > 0) $every_page_n = (int)$_GET['query_every_page'] ;
	 $current_products   = $current_page>1?($current_page-1)*$every_page_n:0;
	 $name               = $_GET['select_jmw_key'];
	 $sku                = $_GET['select_jmw_sku'];
	 $categoryId         = $_GET['jmw_categories_id']==0?0:$_GET['jmw_categories_id'];
	 $startPrice         = $_GET['startprice'];
	 $endPrice           = $_GET['endprice'];
	 $startPutawayDate   = $_GET['startputawaydate'];
	 $endPutawayDate     = $_GET['endputawaydate'];
	 $whCode			 =  $_GET['whCode'];
	 $sort  			=	$_GET['sort'];
	 $country			=	$_GET['country'] ;
	 $productobject      = new ProductCondtion($name,$sku,$categoryId,$startPrice,$endPrice,$startPutawayDate,$endPutawayDate,$whCode,$sort,$country);
	 $param              = array('in0'=>$api_token_string,'in1'=>$productobject,'in2'=>$current_products,'in3'=>$every_page_n);
	 try{
	 	 $queryClient	= new SoapClient('http://query.jiemai.com/services/UsJieMaiSlService?wsdl', array(
											'proxy_host'     => PROXY_ADDRESS,
                                            'proxy_port'     => 8080,
                                            'proxy_login'    => PROXY_USERNAME,
                                            'proxy_password' => PROXY_PASS));
		 $result       	= $queryClient->__call('queryProduct',array($param));//得到查询结果集
	 }catch(SOAPFault $e){
	   	  print_r($e);
	   	  die("查询失败!");
	 }
	 if(strtoupper($result->out->status)=='FAIL'){echo $result->out->message;}
	 $total_products     = $result->out->total;//查询得到总产品数
	 $total_page         = ceil($total_products/$every_page_n);//总页面数
	 $current_page       = ($current_page*$every_page_n)>$total_products?$total_page:$current_page;//重新定义当前页
	 $productbaseinfo    = $result->out->baseInfo->ProductBaseInfo;
	 echo'<span class="pageHeading">产品列表：</span><br />';
	 echo'<form name="form1" method="post">';
	 echo'<table border="0" width="100%" cellpadding="2" cellspacing="0">';
	 echo'<tr class="dataTableHeadingRow dataTableHeadingContent" style="height:25px;">';
	 echo'<td width="120">sku</td>';
	 echo'<td>产品名</td>';
	 echo'<td width="140">借卖价格(不包含运费)</td>';
	 echo'<td width="90">预计运费</td>';
	 echo'<td width="90">所在仓库</td>';
	 echo'<td width="100">库存数量</td>';
	 echo'<td width="90">重量</td>';
	 echo'<td width="90">利润点</td>';
	 echo'</tr>';
	 $count_select_relust=sizeof($productbaseinfo);
	 for($i=0;$i<$count_select_relust;$i++){
	    if($count_select_relust==1){
         $productsarrays = $productbaseinfo;
        }else{
         $productsarrays = $productbaseinfo[$i];
        }
		 echo'<tr class="dataTableRow" onMouseOut="rowOutEffect(this)" onMouseOver="rowOverEffect(this)">';
		 echo'<td>
			  <input type="checkbox" name="products_sku" id="products_sku" value="'.$productsarrays->sku.'" '.(checkProcutIn($productsarrays->sku) ? 'disabled':'').'/>
			  '.(!checkProcutIn($productsarrays->sku)?$productsarrays->sku:'<span style="color:#ff0000">'.$productsarrays->sku.'&nbsp;&nbsp;已添加</span>');
		 echo'</td>';
		 echo'<td><a href="'.$productsarrays->producturl.'" target="_blank">'.(!empty($productsarrays->enname)?$productsarrays->enname:$productsarrays->cnname).'</a></td>';
		 echo'<td>'.$productsarrays->price.'元</td>';
		 echo'<td>'.$productsarrays->dpfee.'</td>';
		 echo'<td>'.$productsarrays->whCnName.'&nbsp;['.$productsarrays->whCode.']'.'</td>';
		 echo'<td>'.$productsarrays->stockNum.'</td>';
		 echo'<td>'.$productsarrays->weight.'KG</td>';
		 echo '<td><input type="text" name="price_rate_'.$productsarrays->sku.'" id="price_rate_'.$productsarrays->sku.'" value="'.JMW_API_PRICE_RATE.'" size=4 />%</td>';
		 echo'</tr>';
	 }
	 echo'</table>';
	 echo'</form>';
	 echo'<div class="page">';
	 echo'<span style="float:left;width:auto;pading-left:6px;">';
	 //echo"<INPUT onclick=CheckAll('selectAll',this) type=checkbox value=on name=chkall>全选";
	 echo'<input type="checkbox" name="invest" value="checkbox" onClick="CheckAll()">反选';
	 echo'</span>';
	 echo'<span class="buttom_page_span">';
	 echo'<input type="hidden" id="current_page_value" name="current_page_value" value="'.$current_page.'"/>';
	 echo'<input type="hidden" id="tail_page_value" name="tail_page_value" value="'.$total_page.'"/>';
	 if($current_page<$total_page){
	    //$current_products_count=(int)$current_products*$every_page_n+(int)1;
		//$number_one = (int)1;
	  //  $current_products_count=($current_products*$every_page_n)+$number_one;
		//$current_to_page        =$current_page==0?$every_page_n:$current_page*$every_page_n;
		echo '<span>共<span class="key">'.$total_products.'</span>条</span>';
		echo "<span>共<span class='key'>".$total_page."</span>页</span>";
	   
	    //echo'<span>当前显示'.$current_products_count.'-'.$current_to_page.'条</span>';
	 }
	 if($current_page>1){
		echo"    <span onclick=\"request_page('home_page');\" class='text_underline_cursor'>首页</span>";
	 }
	 if($current_page>1){
		echo"    <span onclick=\"request_page('back_page');\" class='text_underline_cursor'>上一页</span>";
	 }
	 if($current_page<$total_page && $total_page>1){
		echo"    <span onclick=\"request_page('next_page');\"  class='text_underline_cursor'>下一页</span>";
	 }
	 if($total_page>1 && $current_page!=$total_page){
		echo"    <span onclick=\"request_page('tail_page');\" class='text_underline_cursor'>尾页</span>";
	 }
	 echo "<span>当前第<span class='key'>".$current_page."</span>页</span>";
	 if($total_page>1){
	 	echo "<span><select name='scurrent_page' id='scurrent_page' onchange=\"request_page_by_attr('s')\">";
	 	for ($k=1;$k<=$total_page;$k++){
	 		echo '<option value='.$k.' '.($current_page==$k ? ' selected':'').'>'.$k.'</option>';
	 	}
	 	echo "</select></span>";
	 }
	 echo '<span class="page_goto"><input type="text" name="gotopage" value="'.$current_page.'" id="IDgotopage" size="4" attr="{total_page:'.$total_page.'}"/><input type="button" value="跳转"  onclick="request_page_by_attr(\'goto\')" /></span>';
	 echo'</span>';
	 echo'<span class="buttom_submit_button">';
	 echo'复制到分类:'.$new_jmw_tree->zen_draw_pull_down_menu_jmw('add_to_categories',
		  $new_jmw_tree->zen_get_category_tree_jmw('', '', '0', '', '', true), '', '');
	 echo'<b style="color:red;">价格加:<input name="price_rate" id="price_rate" type="text" size="4" value="'.JMW_API_PRICE_RATE.'"/>%</b>';
	 echo'   <input name="" type="button" value="提交"  onclick="return func_input_confirm(document.form1);"/>';
	 echo'</span>';
	 echo'</div>';
	 echo'<div class="buttom_clear_div"></div>';
	 echo'<span id="show_add_products_loading"></span>';
	 
}
 //if($_GET['action']=='request_select'){
 if($_GET['action']=='add_failed_product'){
	$jmwlogPath = dirname(__FILE__).'/jmwlog';
	$add_products_recordPath = $jmwlogPath.'/add_products_record.txt';
	$get_fail_product  = file_get_contents($add_products_recordPath);
 	if(!empty($get_fail_product)){//此段代码输出 添加未成功的产品信息。
  		$array_diff = explode(',',$get_fail_product);
  		$_SESSION['fail_add_to_categories']  = !empty($add_to_categories)?$add_to_categories:$_SESSION['fail_add_to_categories'];
  		if(!empty($array_diff)){
    		$fail_porducts  = explode(',',implode(',',$array_diff));
			//handle_add_fail_products($fail_porducts,$add_to_categories,$price_rate);
			$fail_string = '<br /><br /><hr><b>添加失败的产品</b><br />';
			$i=1;
			foreach($array_diff as $val){
				$temp = explode('::',$val) ;
	  			$fail_string  .= 'SKU-'.$i.'：<b style="color:red;">'.$temp[0].'</b>
	  			<input name="products_sku_no"  type="hidden" value="'.$temp[0].'" /><br />
	  			<input type="hidden" name="price_rate_'.$temp[0].'" id="price_rate_'.$temp[0].'" value="'.$temp[1].'" />
	  			<input type="hidden" name="fail_add_to_categories_'.$temp[0].'" id="fail_add_to_categories_'.$temp[0].'" value="'.$temp[2].'"/>
	  			';
	  			$i++;
			}
	 		//$fail_param              = array('in0'=>$api_token_string,'in1'=>$fail_porducts);
	 		//$fail_result             = $client->__call('shelveProductFromShop',array($fail_param));
			echo '
				<div id="show_fail_info" style="clear:both;">
					<form action="jmw_return.php?action=add_jmw_products" method="get" name="fail_products">
					<div id="IDform_content">
					'.$fail_string.'
					<input border="0" type="button" value="重新提交失败产品" onclick="return request_fail_products(document.fail_products);">
					<input type="button" value="清空未完成的" onclick="clear_products_record()"/>
					</div>
					<div id="IDclear_products_record"></div>
					</form>
				</div>';
  		}
	}
}
?>
<?php 
function SetCallServiceAPI(){
	$jmwlogPath = dirname(__FILE__).'/jmwlog';
	$isSetCallServiceAPIFilePath = $jmwlogPath.'/isSetCallServiceAPI.txt';
	if(!file_exists($isSetCallServiceAPIFilePath)) return false;
	if (!is_writable($isSetCallServiceAPIFilePath)){
			@chmod($jmwlogPath,0777);
			@chmod($isSetCallServiceAPIFilePath,0777);
	}
	file_put_contents($isSetCallServiceAPIFilePath,'1');
	return true;
}
/**
 * @des 检测产品是否已经添加
 * @var $_jmw_sku String
 * @return true or false 
 */
function checkProcutIn($_jmw_sku=''){
	global $db ;
	if (empty($_jmw_sku)) return false ;
	$checkSqlQuery = $db->Execute("SELECT count(*) as t FROM ".TABLE_PRODUCTS." WHERE products_jmw_sku = '".trim($_jmw_sku)."' LIMIT 1");
	if($checkSqlQuery->fields['t']!=1) return false;
	return true ; 
}
/**
 * @des 根据产品sku 查找 price_rate
 * @var $_sku String
 * @var $_rate Array
 * @return price_rate Double
 */
function queryPriceRate($_sku='',$_rate){
	if(empty($_sku)) return '';
	if(sizeof($_rate)<0) return '';
	foreach ($_rate as $json) {
		$json = str_replace('\\','',$json);
		$jsonobj = json_decode($json);
		if($jsonobj->sku==$_sku) return $jsonobj->rate;
	}
	return '';
}
/**
*/
function get_microtime(){ 
	list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
} 
?>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>