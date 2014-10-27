<?php
App::uses('EcommerceAppController', 'Ecommerce.Controller');
/**
 * ProductOrders Controller
 *
 * @property ProductOrder $ProductOrder
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ProductOrdersController extends EcommerceAppController {

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
	protected $order_status = array(
			'ordered'		=> 'Ordered',
			'processing'	=> 'Processing',
			'completed'		=> 'Completed',
			'cancelled'		=> 'Cancelled'
		);
	
	public function beforeFilter(){
		parent::beforeFilter();
		$this->set('order_status',$this->order_status );
	}
	public function admin_index() {
		
		$this->ProductOrder->recursive = 0;
		$this->set('productOrders', $this->Paginator->paginate());
	}
	
	

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->ProductOrder->exists($id)) {
			throw new NotFoundException(__('Invalid product order'));
		}
		$options = array('conditions' => array('ProductOrder.' . $this->ProductOrder->primaryKey => $id));
		$this->set('productOrder', $this->ProductOrder->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->ProductOrder->create();
			if ($this->ProductOrder->save($this->request->data)) {
				$this->Session->setFlash('The product order has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The product order could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		}
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		if (!$this->ProductOrder->exists($id)) {
			throw new NotFoundException(__('Invalid product order'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->ProductOrder->save($this->request->data)) {
				$this->Session->setFlash('The product order has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The product order could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		} else {
			$options = array('conditions' => array('ProductOrder.' . $this->ProductOrder->primaryKey => $id));
			$this->request->data = $this->ProductOrder->find('first', $options);
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
		$this->ProductOrder->id = $id;
		if (!$this->ProductOrder->exists()) {
			throw new NotFoundException(__('Invalid product order'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->ProductOrder->delete()) {
			$this->Session->setFlash('The product order has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The product order could not be deleted. Please, try again.','default',array('class'=>'alert alert-warning'));
		}
		return $this->redirect(array('action' => 'index'));
	}
	
	
	public function admin_make_processing($id) {
		if($this->request->is('Post')){
			$this->ProductOrder->id = $id;
			$this->ProductOrder->set(array('status'=>'processing'));
			if($this->ProductOrder->save()){
				$this->Session->setFlash('This product status is changed','default',array('class'=>'alert alert-success'));
				
			}else{
				$this->Session->setFlash('Please Try again','default',array('class'=>'alert alert-warning'));
			}
			return $this->redirect(array('action' => 'index'));
		}
	
	}
	
	public function admin_make_completed($id) {
		if($this->request->is('Post')){
			$this->ProductOrder->id = $id;
			$this->ProductOrder->set(array('status'=>'completed','complete_date'=>date('Y-m-d H:i:s')));
			if($this->ProductOrder->save()){
				$this->Session->setFlash('This product status is changed','default',array('class'=>'alert alert-success'));
	
			}else{
				$this->Session->setFlash('Please Try again','default',array('class'=>'alert alert-warning'));
			}
			return $this->redirect(array('action' => 'index'));
		}
	
	}
	
	public function admin_make_cancelled($id) {
		
		if($this->request->is('Post')){
			$this->ProductOrder->id = $id;
			$this->ProductOrder->set(array('status'=>'cancelled','complete_date'=>date('Y-m-d H:i:s')));
			if($this->ProductOrder->save()){
				$this->Session->setFlash('This product status is changed','default',array('class'=>'alert alert-success'));
	
			}else{
				$this->Session->setFlash('Please Try again','default',array('class'=>'alert alert-warning'));
			}
			return $this->redirect(array('action' => 'index'));
		}
	
	}
	
}
