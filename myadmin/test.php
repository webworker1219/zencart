<?php
require('includes/application_top.php');
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<meta name="robot" content="noindex, nofollow" />
<div id='feetipinfo'></div>
<script type="text/javascript"  src="includes/javascript/jscript_jquery-min.js"></script>
<script language="javascript">
/**
 * 检查此种派送方式是不是不推荐的
 * 
 * @returns
 */
function checkDeliever(compId,imCode){
    var result;
    var dpCode = 'SGGH';
    var url = "testJMWCheck.php?compId="+compId+"&imCode=" + imCode + "&dpCode=" + dpCode + "&rnd=" + Math.random()+ "&action=checkDeliever"+ "&isajax=true";
    $.ajax({
	type: "POST",
	url: url,
	async: false,
	dataType:"json",
	success: function(value){
	    result = value;
	}
    });
    return result;
}

//var result = checkDeliever('421766','IE00123-01');
var result = calcutefee();
//alert(result);

/**
 * 运费试算
 * 
 * @returns
 */
function calcutefee(){
    var intChar= /^[0-9]*[1-9][0-9]*$/;　　// 正整数
// var imCode = document.getElementById("imCode").value;
// var compId = document.getElementById("compId").value;
// var cr = checkDeliever(compId,imCode);
    // sku编码后半部分例如902765-IE00123-01中的IE00123-01
    var imCode = 'IE00123-01';
    /*
     * sku编码前半部分例如902765-IE00123-01中的902765
     */
    var compId = '421766';
    var cr = checkDeliever(compId,imCode);

    if(cr.code == "1"){
		//var msg=jmw_i18n['item.notRecommendDeliver'].format($("#padpCode").find("option:selected").text());
		var msg = "该产品不推荐走["+"选择的快递方式" + "]派送渠道哦";
		alert(msg);
	}
//	var bookingNum = document.getElementById("bookingNum").value;
//	var sInsuType = document.getElementById("sInsuType").value;
//	var padpCode = document.getElementById("padpCode").value;
//	var soConsigneecountry = document.getElementById("soConsigneecountry").value;
//	var whCode = document.getElementById("whCode").value;
	var bookingNum = 1;
	var sInsuType = 'N';
	var padpCode = 'SGGH';
	var soConsigneecountry = '71';
	var whCode = 'SZZW';
	if(bookingNum == "" || bookingNum == null){
		//alert(jmw_i18n['item.reverseQtycannotbenull']);
		alert('预订的货物数量不能为空!');
		return ;
	}
	if(!intChar.test(bookingNum)){
		alert('预定的货物的数量必须是整数!');
		return ;
	}
	if(isNaN(bookingNum))
	{
		alert('预订的货物必须是不能为空');
		return ;
	}
	if(whCode == "" || whCode == null){
//		alert(jmw_i18n['item.selectWarehouse']);
//		document.getElementById("whCode").focus();
		alert('选择仓库不能为空!');
		return ;
	}
	if(padpCode == "" || padpCode == null ){
		alert('派送的仓库不能为空!');
		return ;
	}
	if(soConsigneecountry == "" || soConsigneecountry == null ){
	//	alert(jmw_i18n['item.destinationCannotbenull']);
		alert('发送的国家不能为空!');
		return ;
	}
//	var caculateurl = 'transfeeCalcute.html?imCode='+imCode+'&compId='+compId+'&bookingNum='+bookingNum+'&sInsuType='+sInsuType
//		+'&padpCode='+padpCode+'&soConsigneecountry='+soConsigneecountry+ '&whCode=' + whCode +'&rnd=' + Math.random();
	
	var result;
    var dpCode = 'SGGH';
    var url = "testJMWCheck.php?imCode="+imCode+"&compId="+compId+"&bookingNum="+bookingNum+"&sInsuType="+sInsuType
		+"&padpCode="+padpCode+"&soConsigneecountry="+soConsigneecountry+ "&whCode=" + whCode +"&rnd=" + Math.random()
		+ "&action=calculateFee"+ "&isajax=true";
    $.ajax({
		type: "POST",
		url: url,
		async: false,
		dataType:"json",
		success: function(value){
		    result = value;
		}
    });
	
	
	$("#feetipinfo").html('<div style="vertical-align: middle;line-height: 50px;" align="center"> <image style="vertical-align: middle;" src="http://cnpic.jiemai.com/images/loading.gif"></image> 正在试算中... </div>');
//	$("#yunfeicalcut").attr("disabled","disabled");
//	$.getJSON(caculateurl,function(callBackValue){
	var feeygroup ;
	try{
		feeygroup = eval("("+result+")");
	}catch(e){
		$("#feetipinfo").html("<p>" + callBackValue + "</p>");
		$("#yunfeicalcut").attr("disabled",false);
		return;
	}
	$("#yunfeicalcut").attr("disabled",false);
	var tipfee = "<table width='100%'>";
	var totalfee = 0;
	for(var i = 0; i < feeygroup.length; i++)
		{
			totalfee += feeygroup[i].oefFee;
			if(feeygroup[i].oefee.eftCode == '订单操作费'){
			tipfee += " <tr>"
			+" <td width='50%' style='text-align: left'>订单操作费<a target='_blank' href='http://www.jiemai.com/sellerJiemaiIntroduction.html?acCode=862&location=college' style='vertical-align: middle;' ><img alt='操作费提示' src='http://cnpic.jiemai.com/images/bgif/tip_operator.gif' border='0' /></a></td>"
			+" <td style='text-align: left;'>&nbsp;&nbsp;&nbsp;&nbsp;"+feeygroup[i].oefFee+"</td>"
			+" </tr> ";
		} else if(feeygroup[i].oefee.eftCode == '包装费'){
			tipfee += " <tr>"
			+" <td >包装费<a target='_blank' href='http://www.jiemai.com/sellerJiemaiIntroduction.html?acCode=862&location=college' style='vertical-align: middle;' ><img alt='操作费提示' src='http://cnpic.jiemai.com/images/bgif/tip_operator.gif' border='0' /></a></td>"
			+" <td style='text-align: left;'>&nbsp;&nbsp;&nbsp;&nbsp;"+feeygroup[i].oefFee+"</td>"
			+" </tr> ";
		}else{
			tipfee += " <tr>"
			+" <td>"+feeygroup[i].oefee.eftCode+"</td>"
			+" <td style='text-align: left;'>&nbsp;&nbsp;&nbsp;&nbsp;"+feeygroup[i].oefFee+"</td>"
			+" </tr> ";
		}
	}
	tipfee += "<tr height='1px' ><td colspan='4' valign='middle'><div class='dt_content2_4_5_3'>&nbsp;</div></td></tr>";
	tipfee += " <tr>"
	+" <td style='font-weight:bold'>总计:</td>"
	+" <td style='text-align: left;font-weight:bold'>&nbsp;&nbsp;&nbsp;&nbsp;"+totalfee+"</td>"
	+" </tr> ";
	$("#feetipinfo").html(tipfee+"</table>");
//	});
} 

</script>

</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>