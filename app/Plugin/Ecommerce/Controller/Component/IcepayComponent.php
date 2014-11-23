<?php
App::import('Vendor', 'Ecommerce.icepay', array('file' => 'icepay/icepay_api_basic.php'));


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
 
 	public function getPayNowUrl ($paymentObj,$order_id){
 
		 try {
		     // Merchant Settings
		     $basicmode = Icepay_Basicmode::getInstance();
		     $basicmode->setMerchantID($this->merchantId)     
		             ->setSecretCode($this->secrectCode)
		             ->validatePayment($paymentObj)
		     		 ->setSuccessURL("http://localhost:9000/#/shop/order/{$order_id}")
		     		 ->setSuccessURL("http://localhost:9000/#/shop/order/{$order_id}");
		 
		 $payNowUrl = $basicmode->getURL();
		 
		 return $payNowUrl;
		     
		 } catch (Exception $e){
		     return $e->getMessage();
		 }
 	}

}