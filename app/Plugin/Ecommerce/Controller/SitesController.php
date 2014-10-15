<?php
App::uses('EcommerceAppController', 'Ecommerce.Controller');
/**
 * Brands Controller
 *
 * @property Brand $Brand
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SitesController extends EcommerceAppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session','RequestHandler');
	
	public $uses = array(
		'Ecommerce.Category',
		'Ecommerce.Brand',
		'Ecommerce.Product',
		'Ecommerce.Store',
		'Ecommerce.Type'
	);

	public function beforeFilter(){
		parent::beforeFilter();
		$this->Auth->allow();
	}
	
	public function beforeRender(){
		$this->response->header('Access-Control-Allow-Origin', '*');
	}

	
	/*
	 * barnd list
	 */
	public function brand_list(){
		$data = $this->Brand->find('list',array('conditions'=>array('status'=>'active')));
		$this->set(
				array(
						'_serialize',
						'data' => array('ecommerce_brands'=>$data),
						'_jsonp' => true
		
				)
		);
		$this->render('json_render');
	}
	
	
	/*
	 * category list
	*/
	public function category_list(){
		$data = $this->Category->find('list',array('conditions'=>array('status'=>'active')));
		$this->set(
				array(
						'_serialize',
						'data' => array('ecommerce_categories'=>$data),
						'_jsonp' => true
	
				)
		);
		$this->render('json_render');
	}
}
