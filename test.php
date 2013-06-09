<?php 
  require_once('/includes/classes/http_client.php');
$jmw_wsdl_rul                = 'http://www.jiemai.com/services/JieMaiSlService?wsdl';
  $jmw_login_name              = 'kaiweicai';
  $jmw_password                = 'yousini979';
$NusoapWSDL          = $jmw_wsdl_rul;
          $client              = new SoapClient($NusoapWSDL, array(true));
		  $param               = array('in0'=>$jmw_login_name ,'in1'=>$jmw_password,'in2'=>1.0);
		  try{
		  $result              = $client->__call('fetchToken',array($param));
		  }catch(SOAPFault $e){
	        print_r($e);
	      }
	       $user_token          = $result->out->usertoken;
		  $user_status         = strtolower($result->out->status);
		  if(!empty($user_token) && $user_status==='success'){
		     $authorized       = true;
			 $api_token_string = $user_token;
			 $api_result       = $result;
		  }
		  
		  $param                   = array('in0'=>$api_token_string,'in1'=>'SZZW','in2'=>1.0);
		  try{
	$result                  = $client->__call('getReferenceLogisticsChannel',array($param));
	}catch(SOAPFault $e){
	  print_r($e);
	}
	var_dump($result);
?> 