<?php
App::uses('EcommerceAppController', 'Ecommerce.Controller');
/**
 * Products Controller
 *
 * @property Product $Product
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ProductsController extends EcommerceAppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session','Uploader');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->Product->recursive = 1;
		$this->set('products', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Product->exists($id)) {
			throw new NotFoundException(__('Invalid product'));
		}
		$options = array('conditions' => array('Product.' . $this->Product->primaryKey => $id));
		$this->set('product', $this->Product->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			
			$data = $this->request->data;
			
			//remove uncheck brands
			foreach($data['Product']['ProductBrand'] as $brand_ind => $brand_val){
				if($brand_val['brand_id'] == 0){
					unset($data['Product']['ProductBrand'][$brand_ind]);
				}
			}
			
			//remove uncheck categories
			
			foreach($data['Product']['ProductCategory'] as $category_ind => $category_val){
				if($category_val['category_id'] == 0){
					unset($data['Product']['ProductCategory'][$category_ind]);
				}
			}
			//remove uncheck product attributes
				
			foreach($data['Product']['ProductAttribute'] as $attribute_ind => $attribute_value){
				if(!isset($attribute_value['attribute_id'])){
					unset($data['Product']['ProductAttribute'][$attribute_ind]);
				}
			}
				
			//remove uncheck product attribute values
			foreach($data['Product']['ProductAttribute'] as $attribute_ind => $attribute_value){
				foreach($attribute_value['ProductAttributeValue'] as $attributeValueId => $attributeValueValue ){
					if(!isset($attributeValueValue['attribute_value_id'])){
						unset($data['Product']['ProductAttribute'][$attribute_ind]['ProductAttributeValue'][$attributeValueId]);
					}
				}
			}
			
			//store image data
			$temp_images = $data['Product']['ProductImage'];
			unset($data['Product']['ProductImage']);
			
			foreach ($temp_images as $key=>$value){
			//	pr($value);
				$data['Product']['ProductImage'][$key]['extension'] =$this->Uploader->getFileExtension($value);
			}
			
			
			$this->Product->create();
			if ($this->Product->saveAssociated($data,array('deep' => true))) {
				$product_id = $this->Product->getInsertId();
				$image_names = ClassRegistry::init('Ecommer.ProductImage')->find(
						'list',
						array(
								'fields'=>array('id','extension'),
								'conditions'=>array('product_id'=>$product_id)
						)
					);
				$i = 0;
				foreach($image_names as $image_name=>$img_extension){
					echo $i;
					$this->Uploader->upload($temp_images[$i], $image_name, $img_extension, 'products',$fileOrImage = null, $height = '', $width = '600', $oldfile = null );
					$i++;
				}
				
				$this->Session->setFlash('The product has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The product could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		}
		
		$this->set('productTypes', $this->getProductTypes());
		$this->set('productBrands', $this->getProductBrands());
		$this->set('productCategories', $this->getProductCategories());
		$this->set('productAttributes', $this->getProductTypeAndAttributes());
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		
		if (!$this->Product->exists($id)) {
			throw new NotFoundException(__('Invalid product'));
		}
		if ($this->request->is(array('post', 'put'))) {
			
			$data = $this->request->data;
			
			////remove uncheck brands
			foreach($data['Product']['ProductBrand'] as $brand_ind => $brand_val){
				if($brand_val['brand_id'] == 0){
					unset($data['Product']['ProductBrand'][$brand_ind]);
				}
			}
				
			//remove uncheck categories
				
			foreach($data['Product']['ProductCategory'] as $category_ind => $category_val){
				if($category_val['category_id'] == 0){
					unset($data['Product']['ProductCategory'][$category_ind]);
				}
			}
				
			//remove uncheck product attributes
			
			foreach($data['Product']['ProductAttribute'] as $attribute_ind => $attribute_value){
				if(!isset($attribute_value['attribute_id'])){
					unset($data['Product']['ProductAttribute'][$attribute_ind]);
				}
			}
			
			//remove uncheck product attribute values
			foreach($data['Product']['ProductAttribute'] as $attribute_ind => $attribute_value){
				foreach($attribute_value['ProductAttributeValue'] as $attributeValueId => $attributeValueValue ){
					if(!isset($attributeValueValue['attribute_value_id'])){
						unset($data['Product']['ProductAttribute'][$attribute_ind]['ProductAttributeValue'][$attributeValueId]);
					}
				}
			}
			//store images temporary.
			$submitted_images = $data['Product']['ProductImage'];
			unset($data['Product']['ProductImage']);
			
			$temp_images = array();
			foreach($submitted_images as $temp_img_no => $temp_img_val){
				if(isset($temp_img_val['id_extension'])){
					$temp_image_id_extension_array = explode('#ZUBAYER#', $temp_img_val['id_extension']);
					$temp_img_val['id'] = $temp_image_id_extension_array[0];
					$temp_img_val['extension'] = $temp_image_id_extension_array[1];
					unset($temp_img_val['id_extension']);
				}
				
				$temp_images[$temp_img_no] = $temp_img_val;
			}
			
			//delete first
			if ($this->Product->deleteAll(array('Product.id'=>$id,true))) {
				//add new
				$this->Product->create();
				if ($this->Product->saveAssociated($data,array('deep' => true))) {
					
					$product_id = $this->Product->getInsertID();
							
					$this->update_images($product_id, $temp_images);
					
					$this->Session->setFlash('The product has been updated.','default',array('class'=>'alert alert-success'));
					return $this->redirect(array('action' => 'index'));
				} else {
					$this->Session->setFlash('The product could not be updated. Please, try again.','default',array('class'=>'alert alert-warning'));
				}
			}else{
				$this->Session->setFlash('The product could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
			
		} else {
			$options = array(
				'conditions' => array(
					'Product.' . $this->Product->primaryKey => $id
				),
				'contain' => array(
					'ProductCategory',
					'ProductBrand',
					'ProductAttribute' => array(
						'ProductAttributeValue'		
					),
					'ProductImage'
				)
			);
			$request_data = $this->Product->find('first', $options);
						
			//brans list
			$selected_Brands = array();
			foreach($request_data['ProductBrand'] as $key=>$value ){
				$selected_Brands[] = $value['brand_id'];
			}
			
			//brans list
			$selected_Categories = array();
			foreach($request_data['ProductCategory'] as $key=>$value ){
				$selected_Categories[] = $value['category_id'];
			}
			$request_data['ProductBrand'] = $selected_Brands;
			$request_data['ProductCategory'] = $selected_Categories;
			//
			
			//pr($request_data);
			$this->request->data = $request_data;
		}
		
		$this->set('productTypes', $this->getProductTypes());
		$this->set('productBrands', $this->getProductBrands());
		$this->set('productCategories', $this->getProductCategories());
		$this->set('productAttributes', $this->getProductTypeAndAttributes());
		
		
	}

/**
 * admin_delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		$this->Product->id = $id;
		if (!$this->Product->exists()) {
			throw new NotFoundException(__('Invalid product'));
		}
		$this->request->allowMethod('post', 'delete');
		
		$deleteable_image_files = $this->Product->ProductImage->find('list',array('fields'=>array('id','extension'), 'conditions'=>array('product_id'=> $id)));
		
		if ($this->Product->deleteAll(array('Product.id'=>$id,true))) {
			
			foreach($deleteable_image_files as $id=>$ext){
				$this->Uploader->deleteFile(WWW_ROOT."img/site/products/{$id}.{$ext}");
			}
			
			$this->Session->setFlash('The product has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The product could not be deleted. Please, try again.','default',array('class'=>'alert alert-warning'));
		}
		return $this->redirect(array('action' => 'index'));
	}
	
/*private methods */	
	
	//get product types
	private function getProductTypes(){
		$data = ClassRegistry::init('Ecommerce.Type')->find('list');
		return $data;
	}
	
	//get product categories grouped by product types
	private function getProductCategories(){
		$category_list_data = ClassRegistry::init('Ecommerce.Category')->find('list',array('fields'=>array('id','title'),'recursive'=>-1));
		$type_category_list_data = ClassRegistry::init('Ecommerce.TypeCategory')->find('all',array('fields'=>array('type_id','category_id'),'recursive'=>-1));
		$type_category_list = array();
		foreach($type_category_list_data as $k=>$v){
			if(isset($type_category_list[$v['TypeCategory']['type_id']])){
				$type_category_list[$v['TypeCategory']['type_id']]['categories'][$v['TypeCategory']['category_id']] = $category_list_data[$v['TypeCategory']['category_id']];
			}else{
				$type_category_list[$v['TypeCategory']['type_id']] = array();
				$type_category_list[$v['TypeCategory']['type_id']]['categories'][$v['TypeCategory']['category_id']] = $category_list_data[$v['TypeCategory']['category_id']];
			}
		}
		return $type_category_list;
	}
	
	//get all brand list
	private function getProductBrands(){
		$data = ClassRegistry::init('Ecommerce.Brand')->find('list');
		return $data;
	}
	
	//get attributes associated with type
	private function getProductTypeAndAttributes(){
		$data = ClassRegistry::init('Ecommerce.Type')->find('all',array(
			'fields' => array('id','title'),
			'contain' => array(
				'Attribute' => array(
					'fields'=>array('title'),
					'AttributeValue' => array('fields'=> array('value','has_price'))
				),
			)
		)
	);
		return json_encode($data);
	}
	
	// 
	protected function update_images($product_id, $image_files){
		$final_images['ProductImage'] = array();
		
		$totaly_newly_added = array();
		foreach($image_files as $n_k=>$n_v){
			if($n_v['error'] == 0 and !isset($n_v['id'])){
				$totaly_newly_added[$n_k] = $n_v;
				
				$temp_image = array();
				$temp_image['product_id'] = $product_id;
				$temp_image['extension'] = $this->Uploader->getFileExtension($n_v);
				$temp_image['file'] = $n_v;
				
				array_push($final_images['ProductImage'],$temp_image);
			}
		}
		
		//file updated images
		$file_updated_only = array();
		foreach($image_files as $u_f_k=>$u_f_v){
			if($u_f_v['error'] == 0 and isset($u_f_v['id'])){
				$file_updated_only[$u_f_k] = $u_f_v;
				$this->Uploader->deleteFile(WWW_ROOT."img/site/products/{$u_f_v['id']}.{$u_f_v['extension']}");
				unset($u_f_v['id']);
				unset($u_f_v['extension']);
				
				$temp_image = array();
				$temp_image['product_id'] = $product_id;
				$temp_image['extension'] = $this->Uploader->getFileExtension($u_f_v);
				$temp_image['file'] = $u_f_v;
				
				array_push($final_images['ProductImage'],$temp_image);
				
			}
		}
		
		
		// existing images 
		$existing_images = array();
		foreach($image_files as $ex_k=>$ex_v){
			if($ex_v['error'] != 0 and isset($ex_v['id'])){
				
				$temp_image = array();
				$temp_image['product_id'] = $product_id;
				$temp_image['extension'] = $ex_v['extension'];
				$temp_image['renaming_id'] = $ex_v['id'];
				
				array_push($final_images['ProductImage'],$temp_image);
			}
		}
		
		
		//update db and databases
		foreach($final_images['ProductImage'] as $i => $data){
			
			$saving_data['ProductImage'] = $data;
			
			$this->Product->ProductImage->create();
			if($this->Product->ProductImage->save($data)){
				
				$image_id = $this->Product->ProductImage->getInsertId();
				if(isset($data['file'])){
					$this->Uploader->upload($data['file'], $image_id, $data['extension'], 'products',$fileOrImage = null, $height = '', $width = '600', $oldfile = null );
				}elseif(isset($data['renaming_id'])){
					
					$old_name = WWW_ROOT."img/site/products/{$data['renaming_id']}.{$data['extension']}";
					$new_name = WWW_ROOT."img/site/products/{$image_id}.{$data['extension']}";
					rename($old_name, $new_name);
				}
			}
		}
		
	}
	
	//delete productimage by id
	public function admin_delete_product_image_by_id(){
		$this->layout = false;
		$this->autoRender = false;
		if($this->request->is('Post')){
			$file_name = $this->request->data['image_id'];
			$image_array = explode('.',$file_name);
			if($this->Product->ProductImage->delete($image_array[0])){
				$this->Uploader->deleteFile(WWW_ROOT."img/site/products/{$file_name}");
				return 'success';
			}else{
				return 'fail';
			}
		}
		
	}
}
