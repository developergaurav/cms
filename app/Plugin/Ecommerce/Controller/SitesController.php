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
		'Ecommerce.Type',
		'Ecommerce.Attribute'
	);

	public function beforeFilter(){
		parent::beforeFilter();
		$this->response->header('Access-Control-Allow-Origin','*');
		$this->response->header('Access-Control-Allow-Methods','*');
		$this->response->header('Access-Control-Allow-Headers','X-Requested-With');
		//$this->response->header('Access-Control-Allow-Headers','Content-Type, x-xsrf-token');
		$this->response->header('Access-Control-Max-Age','172800');
		
		$this->Auth->allow();
	}

	public function beforeRender(){
		//$this->response->header('Access-Control-Allow-Origin', '*');
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
	
	
/**
 * get random product list
 */	
	public function random_product_list(){
		$data = $this->Product->find(
			'all',
			array(
				'conditions' => array('status' => 'active'),
				'order'		 => array('created'=> 'asc'),
				'limit'		 => 20	
			)	
		);
		
		$this->set(
			array(
				'_serialize',
				'data' => array('ecommerce_product_list'=>$data),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}
	
	
/**
 * product_list_by_category
 */	
	public function product_list_by_category($id){
		$data = $this->Product->ProductCategory->find(
			'all',
			array(
				'conditions'	=> array(
					'ProductCategory.category_id' 		=> $id,
				)
			)
		);
		
		$this->set(
			array(
				'_serialize',
				'data' => array('ecommerce_product_list'=>$data),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}
	
	
	
/**
 * product_list_by_brand
 */
	public function product_list_by_brand($id){
		$data = $this->Product->ProductBrand->find(
			'all',
			array(
				'conditions'	=> array(
					'ProductBrand.brand_id' 		=> $id,
				)
			)
		);
	
		$this->set(
			array(
				'_serialize',
				'data' => array('ecommerce_product_list'=>$data),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}	
	
/**
 * product_details_by_id
 */
	public function product_details($id){
		$data = $this->Product->find(
			'all',
			array(
				'contain' => array(
					'ProductBrand',
					'ProductCategory',
					'ProductImage',
					'ProductAttribute' => array(
						'ProductAttributeValue'		
					)	
				),	
				'conditions'	=> array(
					'Product.id' 		=> $id,
					'Product.status' 	=> 'active',
				)
			)
		);
	
		$this->set(
			array(
				'_serialize',
				'data' => array('ecommerce_product_details'=>$data),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}

/**
 * product_attribute_list
 */
	public function product_attribute_list($type_id){
		$data = $this->Attribute->find('all',array('conditions'=> array('Attribute.type_id'=> $type_id)));
		$this->set(
				array(
					'_serialize',
					'data' => array('ecommerce_product_attributes'=>$data),
					'_jsonp' => true
				)
		);
		$this->render('json_render');
	}
	
	
}
