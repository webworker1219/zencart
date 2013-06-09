<?php
/*
 * get the logical post method by whcode.
 */
function get_jmw_post_method($whCode) {
//	define(PROXY_ADDRESS, 'inet-proxy-a.appl.swissbank.com');
//	define(PROXY_PORT, 8080);
//	define(PROXY_USERNAME, 'weicl');
//	define(PROXY_PASS, 'Ab123456');
	$client = new SoapClient('http://www.jiemai.com/services/JieMaiSlService?wsdl', array (
		true
//		'proxy_host' => PROXY_ADDRESS,
//		'proxy_port' => PROXY_PORT,
//		'proxy_login' => PROXY_USERNAME,
//		'proxy_password' => PROXY_PASS
	));
	$param = array (
		'loginName' => 'kaiweicai',
		'password' => 'yousini979'
	);
	$result = $client->__call('fetchToken', array (
		$param
	));

	$userToken = $result->result->usertoken;
	$param = array (
		'usertoken' => $userToken,
		'whCode' => $whCode
	);

	$result = $client->__call('getJiemaiLogisticsChannel', array (
		$param
	));
	$dpv = $result->result->dpv->DeliveryProductVo;
	return $dpv;
}
/*
 * $compId:'421766',$imCode:'IE00123-01',$dpCode:SGGH
 * 检查是否可以使用这种派送方式.
 */
function checkDeliever($compId,$imCode,$dpCode,$rnd) {
	$jmwCheckDelUrl = 'http://www.jiemai.com/frontCheckDeliever.html'."?compId=$compId&imCode=$imCode&dpCode=$dpCode&rnd=$rnd";
	$ch = curl_init($jmwCheckDelUrl);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	//set proxy server. Please remarked follow 3 lines if cancel it.
//	curl_setopt($ch, CURLOPT_PROXY, 'inet-proxy-a.appl.swissbank.com');
//	curl_setopt($ch, CURLOPT_PROXYPORT, 8080);
//	curl_setopt($ch, CURLOPT_PROXYUSERPWD, 'weicl:Ab123456');
	$content = curl_exec($ch);
	curl_close($ch);
	return $content;
}

/*
 * 
 */
function transfeeCalcute($compId,$imCode,$padpCode,$bookingNum,$sInsuType,$soConsigneecountry,$whCode,$rnd) {
	$parameter="?imCode=$imCode&compId=$compId&bookingNum=$bookingNum&sInsuType=$sInsuType&padpCode=$padpCode&soConsigneecountry=$soConsigneecountry&whCode=$whCode&rnd=$rnd";
	$jmwCalFeeUrl = 'http://www.jiemai.com/transfeeCalcute.html'.$parameter;
	$ch = curl_init($jmwCalFeeUrl);
//	curl_setopt($ch, CURLOPT_PROXY, 'inet-proxy-a.appl.swissbank.com');
//	curl_setopt($ch, CURLOPT_PROXYPORT, 8080);
//	curl_setopt($ch, CURLOPT_PROXYUSERPWD, 'weicl:Ab123456');
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$content = curl_exec($ch);
	curl_close($ch);
	return $content;
}

//// test_jmw_post_method();
//if($_GET['action']=='checkDeliever'){
//	$compId=$_GET[compId];
//	$imCode=$_GET[imCode];
//	$dpCode=$_GET[dpCode];
//	$rnd=$_GET[compId];
//	echo checkDeliever($compId,$imCode,$dpCode,$rnd);
//}else if($_GET['action']=='calculateFee'){
//	$compId=$_GET[compId];
//	$imCode=$_GET[imCode];
//	$padpCode=$_GET[padpCode];
//	$bookingNum=$_GET[bookingNum];
//	$sInsuType=$_GET[sInsuType];
//	$soConsigneecountry=$_GET[soConsigneecountry];
//	$whCode=$_GET[whCode];
//	$rnd=$_GET[compId];
//	echo transfeeCalcute($compId,$imCode,$padpCode,$bookingNum,$sInsuType,$soConsigneecountry,$whCode,$rnd);
//}
?>