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
$currencies = new currencies();
class Jmw_Tree{
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
	}
  function _gettypeitem($data,$id){
	  if($this->_getchildren($data,$id)){
		  return 1;
	  }else{
			 return 0;
	  }
  }
  function _gettree($data,$id,$callstack,$result=array()){
	  set_time_limit(700);
	  if($callstack===0){
		  $result=array();
		  }
	  $startlevel=$this->_getchildren($data,$id);
	  for($x=0;$x<count($startlevel);$x++){
		  $node=$this->_gettypeitem($data,$startlevel[$x]["categoryId"]);
		  $result[]=array("categoryId"     => $startlevel[$x]["categoryId"],
						  "parenId"        => $startlevel[$x]["parenId"],
						  "name"           => str_repeat("&nbsp;&nbsp;",$callstack).$startlevel[$x]["name"],
						  "cnName"         => str_repeat("&nbsp;&nbsp;",$callstack).$startlevel[$x]["cnName"],
						  "stack"          => $callstack,
						  "type"           => $node,);
			  
		  if($node===1 && $callstack<2){
			  $result=$this->_gettree($data,$startlevel[$x]["categoryId"],$callstack+1,$result);
		  }
		  }  
	  return $result;
	}
}
$mian_query=$db->Execute("select * from jmw_products_categories order by jmw_id desc");
 while (!$mian_query->EOF) {
   $category_tree_array[]=array('categoryId'=>$mian_query->fields['categoryId'],'parenId'=>$mian_query->fields['parenId'],
	                             'name'=>$mian_query->fields['name'],'cnName'=>$mian_query->fields['cnName']);
 $mian_query->MoveNext();
}
$new_jmw_tree=new Jmw_Tree();
$tree_categoires      = $new_jmw_tree->_gettree($category_tree_array,0,0);
$select_list_cate     = '<select name="jmw_categories_id" id="jmw_categories_id" rel="dropdown">';
$select_list_cate    .= '<option value="0">--查询借卖网分类--</option>';
for($j=0;$j<sizeof($tree_categoires);$j++){
  $select_list_cate  .= '<option value="'.$tree_categoires[$j]['categoryId'].'">'.$tree_categoires[$j]['cnName'].'</option>';
}
$select_list_cate    .= '</select>';
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<meta name="robot" content="noindex, nofollow" />
<script language="JavaScript" src="includes/menu.js" type="text/JavaScript"></script>
<link rel="stylesheet" type="text/css" href="includes/cssjsmenuhover.css" media="all" id="hoverJS" />
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" href="ymPrompt/jmw_api_style.css">
<script language="javascript" src="includes/general.js"></script>

<SCRIPT src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></SCRIPT>
<script type="text/javascript"  src="includes/javascript/jscript_jquery-min.js"></script>
<script type="text/javascript"  src="includes/javascript/calender.js"></script>
<script type="text/javascript">
var api_currencies_id_setup = <?=API_CURRENCIES_ID_SETUP?> ;
function gotoPage(){
	var i=1;
	var div_show_content,div_show_loading;
	var action="jmw_return.php?action=request_select";
	div_show_content = "#show_jmw_products_list";
	div_show_loading = "#show_jmw_products_list";		
	if(arguments.length>1){
		i=arguments[1];
	}
	if(arguments.length>2){
		action=arguments[2];
		div_show_content  = "#show_categories";
		div_show_loading  = "#show_cate_loading";
	}
	var loadingString     = '<img src="images/loading.gif" border="0" /> loading...';
	var jmw_categories_id = parseInt($("#jmw_categories_id").val());
	var select_jmw_key    = $("#select_jmw_key").val();
	var select_jmw_sku    = $("#select_jmw_sku").val();
	var startprice        = $("#startprice").val();
	var endprice          = $("#endprice").val();
	var startputawaydate  = $("#startputawaydate").val();
	var endputawaydate    = $("#endputawaydate").val();
	var WhCodeName        = $('select[name="WhCodeName"]').val();
	if (typeof WhCodeName =='undefined') WhCodeName = '';
	if(WhCodeName=='all') WhCodeName='';
	var query_every_page  = $('#query_every_page').val();
	
	$(div_show_loading).html(loadingString);
	
	
	$.ajax({
		type: "GET",    //define the type of ajax call (POST, GET, etc)
	    url: action,   //The name of the script you are calling
	    data: {jmw_categories_id:jmw_categories_id, select_jmw_key: select_jmw_key,select_jmw_sku:select_jmw_sku,
				startprice:startprice,endprice:endprice,startputawaydate:startputawaydate,endputawaydate:endputawaydate,current_page_value:i
				,query_every_page:query_every_page,whCode:WhCodeName},    //Your data you are sending to the script
	    success: function(msg){
			$(div_show_content).html(msg);
			if(div_show_loading=='#show_cate_loading'){
				$(div_show_loading).html('&nbsp;&nbsp;完成&nbsp;&nbsp;');
			}
	    }
	});
	
	
//	$.post(action, {
//				jmw_categories_id:jmw_categories_id, select_jmw_key: select_jmw_key,select_jmw_sku:select_jmw_sku,
//				startprice:startprice,endprice:endprice,startputawaydate:startputawaydate,endputawaydate:endputawaydate,current_page_value:i
//				,query_every_page:query_every_page,whCode:WhCodeName}, function(data) {
//						$(div_show_content).html(data);
//						if(div_show_loading=='#show_cate_loading'){
//							 $(div_show_loading).html('&nbsp;&nbsp;完成&nbsp;&nbsp;');
//						}
//		}); 
		
};

function ajax_wsdl_factory($_obj){
	this._action = $_obj._action ; //wsdl方法
	_id = this._id     = '#'+$_obj._id ; //页面id
	this._loadingString = $_obj._loadingString ; //加载时显示的提示内容
	this._arguments = $_obj._arguments!='' ? $_obj._arguments:'{null:null}';//其它的一些参数 ,类型为object
	var clearHtml = typeof($_obj.clearHtml)!='undefined' ? $_obj.clearHtml : '';
	if(this._action !=''){
		$(this._id).html('<span style="color:#ff0000">'+this._loadingString+'</span>');
		
		$.ajax({
    		type: "POST",    //define the type of ajax call (POST, GET, etc)
		    url: "jmw_return.php?action="+this._action+"&isajax=true",   //The name of the script you are calling
		    data: this._arguments,    //Your data you are sending to the script
		    success: function(msg){
		       $(_id).html(msg);
				if(clearHtml!='') $('#'+clearHtml).html('');
		    }
		});
		
//		$.post('jmw_return.php?action='+this._action,this._arguments,function(data){
//			$(_id).html(data);
//			if(clearHtml!='') $('#'+clearHtml).html('');
//		});
		
	}
}
$(document).ready(function(){
	
	$("#request_categories").click(function() {
		gotoPage(null,1,"jmw_return.php?action=request_categories");
	});
	$("#request_select").click(gotoPage);
	//加载仓库
	setTimeout(function(){
		ajax_wsdl_factory({'_action':'queryWhCode','_id':'queryWhCode','_loadingString':'正在加载借卖网仓库...','_arguments':''});
	},1000);
	
});
function clear_products_record(){
	//清空未添加成功的产品
	setTimeout(function(){
		ajax_wsdl_factory({'_action':'clear_products_record','_id':'IDclear_products_record','_loadingString':'正在清空...','_arguments':'','clearHtml':'IDform_content'});
	},1000);
}

function CheckAll(value,obj){
	var form=document.getElementsByTagName("form")
	 for(var i=0;i<form.length;i++){
	    for (var j=0;j<form[i].elements.length;j++){
	    if(form[i].elements[j].type=="checkbox"){ 
	    var e = form[i].elements[j]; 
	    if (value=="selectAll"){e.checked=obj.checked}     
	    else{e.checked=!e.checked;} 
	       }
	    }
	 }
}
var current_page_value, tail_page_value;
function request_page(request_page_value){
    current_page_value = parseInt($("#current_page_value").val());
	tail_page_value    = parseInt($("#tail_page_value").val());
	if(request_page_value=='home_page'){
	   current_page_value  = 0;
	}
	if(request_page_value=='back_page'){
	   current_page_value = current_page_value-1;
	}
	if(request_page_value=='next_page'){
      current_page_value = current_page_value+1;
	}
	if(request_page_value=='tail_page'){
      current_page_value = tail_page_value;
	}
	gotoPage(null,current_page_value);
}
function request_page_by_attr(stype){
	if (stype=='s') current_page_value = $('#scurrent_page').find("option:selected").val();
	if (stype=='goto') {
		current_page_value =$('#IDgotopage').val();
		obj=$('#IDgotopage').attr('attr');
		obj=eval('('+obj+')');
		total_page=obj.total_page;
		if(current_page_value==null || current_page_value==undefined || (!current_page_value)) {alert('必须为数字');return false;}
		if(isNaN(current_page_value)){alert("输入合法的数字");return false;}
		if(current_page_value<=0) {alert("页数必须大于零");return false;}
		if(current_page_value>total_page){alert('页数不能超过总页数');return false;}
	}
	gotoPage(null,current_page_value);
}
var utime=0;
function func_input_confirm(frm){
 	var new_date=Date.parse(new Date())/1000;
  	var time_new =(new_date-utime);
	if(api_currencies_id_setup==''){
		alert("请输入人民币汇率值!");
		return false ;
	}
  	if(time_new<10){
		alert('请稍后提交！');
		return false;
  	}
  	utime=new_date;
    var loadingString     = '<img src="images/loading.gif" border="0" /> loading...';
	var add_to_categories = parseInt($("#add_to_categories").val());
	var price_rate        = parseInt($("#price_rate").val());
	if( price_rate=='' || price_rate<0 || price_rate =='undefinder') {alert("请输入合法的价格点");return false;}
	var products_sku      = frm.products_sku;
	products_sku=frm.products_sku['length']?products_sku:[products_sku];//判断是否为数组
	var len               = products_sku.length;
	var count_input=new Array();
	var price_rate_custom = new Array();
	var j=0;
	for(var i=0;i<len;i++){
		if(products_sku[i].checked){
			count_input[j]=products_sku[i].value;
			$_price_rate_temp = $('#price_rate_'+products_sku[i].value).val() ;
			if($_price_rate_temp!='' && ( $_price_rate_temp <0 || $_price_rate_temp=='undefinder')){
				alert("请输入合法的利润点!");return false;
			}else{
				price_rate_custom[j] = '{"sku":"'+products_sku[i].value+'","rate":"'
										+( ( $_price_rate_temp!='' && $_price_rate_temp >= 0 ) ? $_price_rate_temp : price_rate) +'"}';
			}
			j++;
		}
	}
	if(count_input.length==0){
	  alert('SKU为空');
	  return false;
	}
	$('#show_add_products_loading').html("<span style='color:#06C;'><b>执行开始...</b></span><br />");
	tmp=0;
	function ajax_jwm_addproducts(sku_arr,add_to_categories,price_rate_custom){
		$("#show_add_products_loading").html($("#show_add_products_loading").html()+sku_arr[0]+'...START'+'<br />');
		
		$.ajax({
    		type: "POST",    //define the type of ajax call (POST, GET, etc)
		    url: "jmw_return.php?action=add_jmw_products&isajax=true",   //The name of the script you are calling
		    data: {products_sku:sku_arr,add_to_categories:add_to_categories,rate:price_rate_custom},    //Your data you are sending to the script
		    success: function(mesg) {
				$("#show_add_products_loading").html($("#show_add_products_loading").html()+'<br /><span style="color:#06C"><b>'+mesg+'...END</b></span><br />');
				tmp+=1;
				if(tmp<count_input.length) {
					function tout(){
						sku_arr = new Array();
						sku_arr[0] = count_input[tmp] ;
						ajax_jwm_addproducts(sku_arr,add_to_categories,price_rate_custom) ;
					}
					$("#show_add_products_loading").html($("#show_add_products_loading").html()+'加载...<br />');
					setTimeout(tout,3000);
				}
				if(tmp==count_input.length) $("#show_add_products_loading").html($("#show_add_products_loading").html()+'<br /><span style="color:#06C"><b>执行完毕!</b></span>');
		    }
		});
		
		
//		$.post("jmw_return.php?action=add_jmw_products", {products_sku:sku_arr,add_to_categories:add_to_categories,rate:price_rate_custom},
//			function(data) {
//				$("#show_add_products_loading").html($("#show_add_products_loading").html()+'<br /><span style="color:#06C"><b>'+data+'...END</b></span><br />');
//				tmp+=1;
//				if(tmp<count_input.length) {
//					function tout(){
//						sku_arr = new Array();
//						sku_arr[0] = count_input[tmp] ;
//						ajax_jwm_addproducts(sku_arr,add_to_categories,price_rate_custom) ;
//					}
//					$("#show_add_products_loading").html($("#show_add_products_loading").html()+'加载...<br />');
//					setTimeout(tout,3000);
//				}
//				if(tmp==count_input.length) $("#show_add_products_loading").html($("#show_add_products_loading").html()+'<br /><span style="color:#06C"><b>执行完毕!</b></span>');
//		});
	}
	sku_arr = new Array();
	sku_arr[0] =count_input[0];
	ajax_jwm_addproducts(sku_arr,add_to_categories,price_rate_custom);

	//onload=request_page("home_page");
	//window.location.reload();
	//parent.ymPrompt.close();//关闭弹出窗口
	//return false;
	setTimeout("add_products_whether_sussecc()",600000);
}
function add_products_whether_sussecc(){
  if(confirm("是否继续添加?")){
	   onload=request_page("home_page");
  }else{
	    return false;
  }
}
/**
*借卖网产品更新提交
@param Array frm
*/
function func_update_request(frm){
    var loadingString     = '<img src="images/loading.gif" border="0" /> loading...';
	var products_sku      = frm.products_sku_array;
	products_sku          = frm.products_sku_array['length']?products_sku:[products_sku];
	var len               = products_sku.length;
	var count_input       = new Array();
	var j=0;
	for(var i=0;i<len;i++){
		if(products_sku[i].checked){
			count_input[j]=products_sku[i].value;
			j++;
		}
	}
	if(count_input.length==0){
	  alert('SKU为空');
	  return false;
	}
	$('#return_result_html').html(loadingString);
	$.post('jmw_return.php?action=update_request_sku',{
	products_sku:count_input},function(data){$("#return_result_html").html(data);}); 
	onload=request_page_update('home_page');
	//window.location.reload();
	//parent.ymPrompt.close();//关闭弹出窗口
	//return false;
}
function request_page_update(request_page_value){
    current_page_value    = parseInt($("#current_page_value").val());
	tail_page_value       = parseInt($("#tail_page_value").val());
	var jmw_categories_id = parseInt($("#jmw_categories_id").val());
	var select_jmw_key    = $("#select_jmw_key").val();
	var select_jmw_sku    = $("#select_jmw_sku").val();
	var startputawaydate  = $("#startputawaydate").val();
	var endputawaydate    = $("#endputawaydate").val();
	
	var loadingString     = '<img src="images/loading.gif" border="0" /> loading...'; 
	if(request_page_value=='home_page'){
	   current_page_value  = 0;
	}
	if(request_page_value=='back_page'){
	   current_page_value = current_page_value-1;
	}
	if(request_page_value=='next_page'){
      current_page_value = current_page_value+1;
	}
	if(request_page_value=='tail_page'){
      current_page_value = tail_page_value;
	}
	$('#show_update_loading').html(loadingString);
	$.post('jmw_return.php?action=request_products_update', {
	jmw_categories_id:jmw_categories_id, select_jmw_key: select_jmw_key,select_jmw_sku:select_jmw_sku,
	startputawaydate:startputawaydate,endputawaydate:endputawaydate,current_page_value:current_page_value}, function(data) {
		$("#show_update_loading").html(data);
	});
}

function request_jmw_update(){
    var loadingString     = '<img src="images/loading.gif" border="0" /> loading...'; 
	var jmw_categories_id = parseInt($("#jmw_categories_id").val());
	var select_jmw_key    = $("#select_jmw_key").val();
	var select_jmw_sku    = $("#select_jmw_sku").val();
	var startputawaydate  = $("#startputawaydate").val();
	var endputawaydate    = $("#endputawaydate").val();
	var WhCodeName        = $('select[name="WhCodeName"]').val();
	if (typeof WhCodeName =='undefined') WhCodeName = '';
	if(WhCodeName=='all') WhCodeName='';
	var query_every_page  = $('#query_every_page').val();
	
	$('#show_update_loading').html(loadingString);
	$.post("jmw_return.php?action=request_products_update", {
	jmw_categories_id:jmw_categories_id, select_jmw_key: select_jmw_key,select_jmw_sku:select_jmw_sku,
	startputawaydate:startputawaydate,endputawaydate:endputawaydate,current_page_value:current_page_value
	,query_every_page:query_every_page,whCode:WhCodeName},
	function(data) {$("#show_update_loading").html(data);}); 
}
function request_fail_products(fial){
  var loadingString     = '<img src="images/loading.gif" border="0" /> loading...';
  var count_input=new Array();
  var price_rate_custom = new Array() ;
  var $_fail_add_to_categories_temp = new Array();
  $('input[name="products_sku_no"]').each(function(i,domEle){
  	 _sku = $(domEle).val() ;
  	 count_input[i] = _sku ;
  	 $_price_rate_temp = $('#price_rate_'+_sku).val();
     price_rate_custom[i] = '{"sku":"'+_sku+'","rate":"'+( ( $_price_rate_temp!='' && $_price_rate_temp >= 0 ) ? $_price_rate_temp : 0) +'"}';
	 $_fail_add_to_categories_temp[i] = $('#fail_add_to_categories_'+_sku).val();
  });
  $('#show_fail_info').html('');
  $('#show_add_products_loading').html("<span style='color:#06C;'><b>执行开始...</b></span><br />");
	tmp=0;
	function ajax_jwm_addproducts_r(sku_arr,add_to_categories,price_rate_custom){
		$("#show_add_products_loading").html($("#show_add_products_loading").html()+sku_arr[0]+'...START'+'<br />');
		$.post("jmw_return.php?action=add_jmw_products", {products_sku:sku_arr,add_to_categories:add_to_categories,rate:price_rate_custom},
			function(data) {
				$("#show_add_products_loading").html($("#show_add_products_loading").html()+'<br /><span style="color:#06C"><b>'+data+'...END</b></span><br />');
				tmp+=1;
				if(tmp<count_input.length) {
					sku_arr = new Array();
					sku_arr[0] = count_input[tmp] ;
					ajax_jwm_addproducts_r(sku_arr,$_fail_add_to_categories_temp[tmp],price_rate_custom) ;
				}
				if(tmp==count_input.length) $("#show_add_products_loading").html($("#show_add_products_loading").html()+'<br /><span style="color:#06C"><b>执行完毕!</b></span><input type="button" value="清空未完成的" onclick="clear_products_record()"/><div id="IDclear_products_record"></div>');
		});
	}
	sku_arr = new Array();
	sku_arr[0] =count_input[0];
	ajax_jwm_addproducts_r(sku_arr,$_fail_add_to_categories_temp[0],price_rate_custom);
 }
</script>
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
  // -->
</script>
</head>
<body onLoad="init()">
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<div style="padding:10px;">
<?php
if($_GET['action']=='request_jmw_update'){
    //echo'<script type="text/javascript">onload=request_jmw_update();</script>';
	?>
	<div class="pageHeading">借卖网产品更新查询</div>
	<div style="line-height:25px;">
		<span id="current_categories" style="width:auto;overflow:hidden;">
			<span style="width:100px;">目录分类:</span><span id="show_categories">'.$select_list_cate.'</span>
			<span id="show_cate_loading"></span>
		</span>
		<span id="request_categories" style="text-decoration:underline;cursor:pointer;">
		   <span style="width:auto;">同步借卖网分类</span>
		</span><br />
		<span style="width:100px;">更新日期区间:</span>
		<input class="Wdate" type="text" id="startputawaydate" name="startputawaydate" onClick="WdatePicker()"> 到
	    <input class="Wdate" id="endputawaydate" type="text" name="endputawaydate" onClick="WdatePicker()">
	    <br />
		<span style="width:96px;">关键字:</span>
		<span style="width:242px;"><input type="text" id="select_jmw_key" name="select_jmw_key" style="width:242px;" /></span>
		<br/>
		<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="70">仓库所在地:</td>
			<td><div id="queryWhCode"></div></td>
		</tr>
	    </table>
		<span style="width:100px;">产品SKU:</span><input type="text" id="select_jmw_sku" name="select_jmw_sku" />
		&nbsp;&nbsp;每页显示记录数:<input type="text" id="query_every_page" name="query_every_page" value="20"/>
		<br />
		<input type="button" value="查询" onclick="request_jmw_update();">
		<input type="button" class="submit" value="返回" onclick="history.back();">
    </div>
<?php
	echo'<div id="return_result_html"></div>';
    echo'<div id="show_update_loading"></div>';
}else{
?>
<div class="pageHeading">添加借卖网产品</div>
<div style="line-height:25px;margin:5px;">
	<span id="current_categories" style="width:auto;overflow:hidden;">
		<span style="width:100px;display:-moz-inline-box;">分类:</span><span id="show_categories"><?php echo $select_list_cate;?></span>
		<span id="show_cate_loading"style="width:atuo;"></span>
	</span>
	<span id="request_categories" style="text-decoration:underline;cursor:pointer;">
	   <span style="width:auto;">同步借卖网分类</span>
	</span>
	<br />
	<span style="width:100px;display:-moz-inline-box;">价格区间:</span><input type="text" id="startprice" name="startprice" /> -
	<input type="text" id="endprice" name="endprice" /><br />
	<table cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td width="70">仓库所在地:</td>
			<td><div id="queryWhCode"></div></td>
		</tr>
	</table>
	<span style="width:96px;display:-moz-inline-box;">上架日期区间:</span>
	<input class="Wdate" type="text" id="startputawaydate" name="startputawaydate" onClick="WdatePicker()"> 到
	<input class="Wdate" id="endputawaydate" type="text" name="endputawaydate" onClick="WdatePicker()"><br />
	<span style="width:100px;display:-moz-inline-box;">关键字:</span><input type="text" id="select_jmw_key" name="select_jmw_key" /><br />
	<span style="width:100px;display:-moz-inline-box;">产品SKU:</span><input type="text" id="select_jmw_sku" name="select_jmw_sku" />
	&nbsp;&nbsp;每页显示记录数:<input type="text" id="query_every_page" name="query_every_page" value="20" size="4" style="text-align:center"/>
	<br />
	<input type="button" value="查询" id="request_select">
	<input type="button" class="submit" value="返回" onclick="history.back();">
</div>
<div id="show_jmw_categories"></div>
<div id="show_jmw_products_list"></div>
<span>
<b>温馨提示</b>:添加产品时, 当看到'执行完毕!' 时,表示所选产品添加完毕。
</span>
<?php
}
?>
</div>
<div class="copyrightrow"><a href="http://www.zen-cart.cn" target="_blank"><img src="images/small_zen_logo.gif" alt="Zen Cart:: 电子商务的艺术" border="0" /></a><br /><br />版权所有 &copy; 2003-<?php echo date('Y'); ?> <a href="http://www.zen-cart.cn" target="_blank">Zen Cart 中文版</a></div><div class="warrantyrow">Zen Cart 源于 osCommerce<br />本程序可免费使用，但不提供任何保修和服务<br />
</div>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>