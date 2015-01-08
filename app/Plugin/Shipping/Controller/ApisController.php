<?php
App::uses('ShippingAppController', 'Shipping.Controller');
/**
 * Cities Controller
 *
 * @property City $City
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ApisController extends ShippingAppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');
	
	public $uses = array('Shipping.Country','Shipping.Channel','Shipping.City');
	
	public function beforeFilter(){
		parent::beforeFilter();
		$this->Auth->allow();
	}
	
	//enable cors
	public function beforeRender(){
		$this->response->header('Access-Control-Allow-Origin', '*');
	}
	
	//get shipping cost
	public function get_shipping_cost(){
		if($this->request->is('post')){
			
			//get city id 
			$country = $this->Country->find('list');
			$city = $this->City->find('all',array('fields'=>array('id','country_id','title'),'recursive'=>-1));
			$channels = $this->Channel->find('all',array('recursive' => -1));
			
			//process data
			$data['status'] = true;
			$data['shippingMatrix']['country'] = $country;
			$data['shippingMatrix']['city'] = $city;
			$data['shippingMatrix']['channels'] = $channels;
			$data['message'] = 'Got all data';
			
		}else{
			
			$data['status'] = false;
			$data['message'] = 'Invalid Reqeust';
		}
		
		$this->set(
				array(
					'_serialize',
					'data' => array('shippingDetails'=>$data),
					'_jsonp' => true
				)
		);
		$this->render('json_render');
		
	}
	
}