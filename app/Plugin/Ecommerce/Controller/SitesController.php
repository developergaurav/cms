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
	
	//merchantid = 25227
	//r8MRx39ZzNw6m5PEs7b4DYa67CtFf8d3WGj45Key

	/**
	 * Components
	 *
	 * @var array
	 */
	public $components = array('RequestHandler','Ecommerce.Icepay');

	public $uses = array(
		'Ecommerce.Category',
		'Ecommerce.Brand',
		'Ecommerce.Product',
		'Ecommerce.Store',
		'Ecommerce.Type',
		'Ecommerce.Attribute',
		'Ecommerce.ProductOrder'
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
		if($this->request->is('get')){
			$data = $this->Brand->find('list',array('conditions'=>array('status'=>'active')));
			$this->set(
					array(
						'_serialize',
						'data' => array('ecommerce_brands'=>$data),
						'_jsonp' => true
			
					)
			);
		}else{
			$this->set(
			array(
				'_serialize',
				'data' => array('ecommerce_brands'=>'Invalid Request'),
				'_jsonp' => true
				)
			);
		}
		$this->render('json_render');
	}


	/*
	 * category list
	*/
	public function category_list(){
		if($this->request->is('get')){
			$data = $this->Category->find('list',array('conditions'=>array('status'=>'active')));
			$this->set(
					array(
							'_serialize',
							'data' => array('ecommerce_categories'=>$data),
							'_jsonp' => true
					)
			);
		}else{
			$this->set(
					array(
							'_serialize',
							'data' => array('ecommerce_categories'=>'Invalid Request'),
							'_jsonp' => true
					)
			);
		}
		
		$this->render('json_render');
	}
	
	
/**
 * get random product list
 */	
	public function random_product_list(){
		if($this->request->is('get')){
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
		}else{
			$this->set(
					array(
							'_serialize',
							'data' => array('ecommerce_product_list'=>'Invalid Request'),
							'_jsonp' => true
					)
			);
		}
		
		$this->render('json_render');
	}
	
	
/**
 * product_list_by_category
 */	
	public function product_list_by_category($id){
		$data = $this->Product->find(
			'all',
			array(
				'contain' => array(
					'ProductCategory' => array(
						'conditions'	=> array(
							'ProductCategory.category_id'=> $id,
						)
							
					),
					'ProductImage'
				),
				'conditions' => array(
					'Product.status' => 'active'		
				),
				'order' => array('modified' => 'asc')
				
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
		$data = $this->Product->find(
			'all',
			array(
				'contain' => array(
					'ProductBrand'=> array(
						'conditions' => array(
							'ProductBrand.brand_id' => $id		
						)		
					),
					'ProductImage'
				),
				'conditions'	=> array(
					'Product.status' 		=> 'active',
				),
				'order' => array('modified' => 'asc')
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

/**
 * checkout
 */
	public function order(){
		if($this->request->is('post')){
			$post_data =  $this->request->input('json_decode',true);
			
			$ready_data['ProductOrder']['client_detail'] 	= json_encode($post_data['client_details']);
			$ready_data['ProductOrder']['order_detail'] 	= json_encode($post_data['cart']);
			$ready_data['ProductOrder']['status'] 			= 'ordered';
			
			if($this->ProductOrder->save($ready_data)){
				$order_id = $this->ProductOrder->getInsertId();
				$icePayData['amount'] = json_encode($post_data['total_cost'])*100;
				$icePayData['order_id'] = $order_id;
				$payment_object = $this->Icepay->processPaymentObject($icePayData);
				$payment_url = $this->Icepay->getPayNowUrl($payment_object,$order_id);
				$response['status'] = true;
				$response['message'] = $payment_url;
			}else{
				$response['status'] = false;
				$response['message'] = 'Please try again';
			}
			//paymentDetail
			
		}else{
			$response = array('message'=>'Invalid Request');
		}
		
		$this->set(
			array(
				'_serialize',
				'data' => array('ecommerce_checkout'=>$response),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
		
	}
	
/*
 * shoping history
 */	
	
	public function shoping_history(){
	
		if($this->request->is('post')){
			$post_data =  $this->request->input('json_decode',true);
			$client_data = json_decode($post_data['client_details'],true);
			$client_id = $client_data['Client']['id'];
			
			//ordered
			$data_ordered = $this->ProductOrder->find(
					'all',
					array(
						'conditions' => array(
							'client_detail LIKE' => "%$client_id%",
							'status' => 'ordered'
						),
						'recursive'=>-1		
					)
				);
			
			//processing
			$data_processing = $this->ProductOrder->find(
				'all',
				array(
					'conditions' => array(
						'client_detail LIKE' => "%$client_id%",
						'status' => 'processing'
					),
					'recursive'=>-1
				)
			);
			
			//completed
			$data_completed = $this->ProductOrder->find(
				'all',
				array(
					'conditions' => array(
						'client_detail LIKE' => "%$client_id%",
						'status' => 'completed'
					),
					'recursive'=>-1
				)
			);
			
			$data_cancelled = $this->ProductOrder->find(
				'all',
				array(
					'conditions' => array(
						'client_detail LIKE' => "%$client_id%",
						'status' => 'cancelled'
					),
					'recursive'=>-1
				)
			);
			
			$response['ordered'] = $data_ordered;
			$response['processing'] = $data_processing;
			$response['completed'] = $data_completed;
			$response['cancelled'] = $data_cancelled;
			
			
		}else{
			$response = array('message'=>'Invalid Request');
		}
		
		$this->set(
				array(
						'_serialize',
						'data' => array('ecommerce_history'=>$response),
						'_jsonp' => true
				)
		);
		$this->render('json_render');
	}
	
	public function IcePayPaymentMethodList(){
		$response = $this->Icepay->get_payment_methods();
		
		$this->set(
			array(
				'_serialize',
				'data' => array('ecommerce_history'=>$response),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}
	
	public function payNow(){
		$response = $this->Icepay->payByIcePay();
		$this->set(
			array(
				'_serialize',
				'data' => array('ecommerce_history'=>$response),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}
	
}
