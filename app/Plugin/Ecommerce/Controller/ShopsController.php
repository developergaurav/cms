<?php
App::uses('EcommerceAppController', 'Ecommerce.Controller');
/**
 * Attributes Controller
 *
 * @property Attribute $Attribute
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ShopsController extends EcommerceAppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session','RequestHandler');
	
	public $uses = array(
		'Ecommerce.Category',
		'Ecommerce.Brand',
		'Ecommerce.Type',
		'Ecommerce.Product',
		'Ecommerce.Store',
	);

	public function beforeFilter(){
		parent::beforeFilter();
		$this->Auth->allow(array('index','individual_product_details'));
	}
	
	public function index(){
		$categories = $this->Category->find('list',array('conditions'=>array('status'=>'active')));
		$brands = $this->Brand->find('list',array('conditions'=>array('status'=>'active')));
		$types = $this->Type->find('list',array('conditions'=>array('status'=>'active')));
		$products = $this->Product->find('list',array('conditions'=>array('status'=>'active')));
		$stores = $this->Store->find('list',array('conditions'=>array('status'=>'active')));
		$this->Set(array(
				'_serialize',
				'data' => array('categories'=>$categories,'brands'=>$brands,'types'=>$types,'products'=>$products,'stores'=>$stores),
				'_jsonp' => true
		));
	}
	
	
	public function individual_product_details($product_id){
	 	$product_details = $this->Product->find(
	 			'all',
	 			array(
	 				'conditions'=> array(
	 						'id' => $product_id
	 						)	
 					)
 			);
	 	
	 	$this->Set(array(
	 			'_serialize',
	 			'data' => array('product_details'=>$product_details),
	 			'_jsonp' => true
	 	));
	 	
	 	$this->render('index');
	}
}
