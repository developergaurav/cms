<?php
App::import('Vendor', 'Ecommerce.icepay', array('file' => 'icepay/icepay_api_webservice.php'));


class IcepayComponent extends Component {
	public $merchantId 		= '25227';
	public $secrectCode 	= 'r8MRx39ZzNw6m5PEs7b4DYa67CtFf8d3WGj45Key';
	
    public function processPaymentObject($data){ 
		$paymentObj = new Icepay_PaymentObject();
		$paymentObj->setAmount($data['amount'])
		->setCountry("NL")
		->setLanguage("NL")
		->setReference("Timeout")
		->setDescription("Timeout Payment")
		->setCurrency("EUR")
		->setOrderID($data['order_id']);
		
		return $paymentObj;
    }
 
 	public function getPayNowUrl ($paymentObj){
 
		 try {
		     // Merchant Settings
		     $basicmode = Icepay_Basicmode::getInstance();
		     $basicmode->setMerchantID($merchantId)     
		             ->setSecretCode($secretCode)
		             ->validatePayment($paymentObj);
		 
		 $payNowUrl = $basicmode->getURL();
		 
		 return $payNowUrl;
		     
		 } catch (Exception $e){
		     return $e->getMessage();
		 }
 	}

}