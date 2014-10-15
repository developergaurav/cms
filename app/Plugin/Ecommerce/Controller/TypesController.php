<?php
App::uses('EcommerceAppController', 'Ecommerce.Controller');
/**
 * Types Controller
 *
 * @property Type $Type
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class TypesController extends EcommerceAppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->Type->recursive = 0;
		$this->set('types', $this->Paginator->paginate());
	}
	
	public function admin_ajax_index() {
		$this->layout = false;
		$this->Type->recursive = 0;
		$this->set('types', $this->Paginator->paginate());
	}
	

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Type->exists($id)) {
			throw new NotFoundException(__('Invalid type'));
		}
		$options = array('conditions' => array('Type.' . $this->Type->primaryKey => $id));
		$this->set('type', $this->Type->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->Type->create();
			if ($this->Type->save($this->request->data)) {
				$this->Session->setFlash('The type has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The type could not be saved. Please, try again.','default',array('class'=>'alert alert-warnging'));
			}
		}
		
		$attribute_labels = ClassRegistry::init('Ecommerce.AttributeLabel')->find('list',array('fields'=>array('id','label')));
		$this->set(compact('attribute_labels'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		if (!$this->Type->exists($id)) {
			throw new NotFoundException(__('Invalid type'));
		}
		if ($this->request->is(array('post', 'put'))) {
			
			if ($this->Type->save($this->request->data)) {
				$this->Session->setFlash('The type has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The type could not be saved. Please, try again.','default',array('class'=>'alert alert-warnging'));
			}
		} else {
			$options = array('recursive'=>2, 'conditions' => array('Type.' . $this->Type->primaryKey => $id));
			$this->request->data = $this->Type->find('first', $options);
			
			$attribute_labels = ClassRegistry::init('Ecommerce.AttributeLabel')->find('list',array('fields'=>array('id','label')));
			$this->set(compact('attribute_labels'));
		}
		
		
	}

/**
 * admin_delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		$this->Type->id = $id;
		if (!$this->Type->exists()) {
			throw new NotFoundException(__('Invalid type'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Type->deleteAll(array('Type.id'=>$id,true))) {
			$this->Session->setFlash('The type has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The type could not be deleted. Please, try again.','default',array('class'=>'alert alert-warning'));
		}
		return $this->redirect(array('action' => 'index'));
	}
	
	public function admin_ajax_add() {
		$this->layout = false;
		$this->autoRender = false;
		
		if($this->request->is('post')){
			$data =  $this->request->data;
			
			//pr($data);die();
			$this->Type->create();
			if($this->Type->saveAssociated($data,array('deep' => true))){
				
				$this->Session->setFlash('This configuration is saved.','default',array('class'=>'alert alert-success'));
				return 'success';
			}else{
				$this->Session->setFlash('This configuration can not saved. Please try again.','default',array('class'=>'alert alert-success'));
				return 'error';
			}
		}
	}
	
	public function admin_ajax_edit() {
		$this->layout = false;
		$this->autoRender = false;
	
		if($this->request->is('post')){
			
			//post
			$data =  $this->request->data;
			
			
			$p_attr = array();
			$p_attr_values =  array();
			foreach($data['Type']['Attribute'] as $p_attr_key => $p_attr_v){
				if(isset($p_attr_v['id'])){
					$p_attr[] = $p_attr_v['id'];
				}
				
				foreach($p_attr_v['AttributeValue'] as $i=>$j){
					if(isset($j['id'])){
						$p_attr_values[] = $j['id'];
					}
					
				}
			}
			
			//get current data
			$cur_data = $this->Type->find('all',array(
				 'contain'=>array(
			 			'Attribute'=>array(
		 					'AttributeValue' => array('fields' => array('id'))
	 					)
		 			),
					'conditions' => array('id' =>$data['Type']['id'] )
						
				)
			);
			$c_attr = array();
			$c_attr_values =  array();
			foreach($cur_data[0]['Attribute'] as $c_attr_key => $c_attr_name){
				$c_attr[] = $c_attr_name['id'];
				foreach($c_attr_name['AttributeValue'] as $i=>$j){
					$c_attr_values[] = $j['id'];
				}
			}
			
			$deleteAbleAttributes = array_diff($c_attr, $p_attr);
			$deleteAbleAttributeValues = array_diff($c_attr_values, $p_attr_values);
			
			
			//delete attributes
			$attributeClass = ClassRegistry::init('Attribute');
			foreach($deleteAbleAttributes as $key => $value){
				$attributeClass->query("DELETE FROM attributes WHERE id = '{$value}'");
			}
			
			$attributeValueClass = ClassRegistry::init('AttributeValue');
			foreach($deleteAbleAttributeValues as $key => $value){
				$attributeValueClass->query("DELETE FROM attribute_values WHERE id = '{$value}'");
			}
			
			
			$this->Type->id = $data['Type']['id'];
			if($this->Type->saveAssociated($data,array('deep' => true))){
				$this->Session->setFlash('This configuration is saved.','default',array('class'=>'alert alert-success'));
				return 'success';
			}else{
				$this->Session->setFlash('This configuration can not saved. Please try again.','default',array('class'=>'alert alert-success'));
				return 'error';
			}
		}
	}
}
