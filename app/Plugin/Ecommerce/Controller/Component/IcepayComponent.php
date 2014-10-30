<?php
define('MERCHANTID','25227');
define('SECRETCODE','r8MRx39ZzNw6m5PEs7b4DYa67CtFf8d3WGj45Key');
App::import('Vendor', 'Ecommerce.icepay', array('file' => 'icepay/icepay_api_webservice.php'));


class IcepayComponent extends Component {

	public function get_payment_methods(){
		$service = Icepay_Api_Webservice::getInstance()->paymentMethodService();

		// Configure the service
		$paymentMethods = $service->setMerchantID(MERCHANTID)
		->setSecretCode(SECRETCODE)
		->retrieveAllPaymentmethods()
		->asArray(); /* Saves the Paymentmethod array to a file. */

		/* Alternatively you can also fetch the paymentmethods object and/or array. */
		//$paymentMethods = $service->retrieveAllPaymentMethods()->asArray();
		
		return $paymentMethods;
	}
	
	public function payByIcePay(){
		$paymentObj = new Icepay_PaymentObject();
		$paymentObj->setCountry('NL')
		->setLanguage("EN")
		->setCurrency("EUR")
		->setAmount(300)
		->setPaymentMethod("IDEAL")
		->setIssuer("ING")
		->setOrderID(6);
		
		try {
			// Set the service
			$service = Icepay_Api_Webservice::getInstance()->paymentService();
		
			// Merchant Settings
			$service->setMerchantID(MERCHANTID)
			->setSecretCode(SECRETCODE);
		
			/* Start the transaction */
			$transactionObj = $service->checkOut($paymentObj);
			
			return $transactionObj->getPaymentScreenURL();
		
			/* Display the PaymentScreen URL */
		//	echo("<a href='".$transactionObj->getPaymentScreenURL()."'>".$transactionObj->getPaymentScreenURL()."</a>");
		
		} catch (Exception $e){
			echo($e->getMessage());
		}
	}

}