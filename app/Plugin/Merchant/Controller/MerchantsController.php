<?php
App::uses('MerchantAppController', 'Merchant.Controller');
/**
 * Merchants Controller
 *
 * @property Merchant $Merchant
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class MerchantsController extends MerchantAppController {

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
		$this->Merchant->recursive = 0;
		$this->set('merchants', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Merchant->exists($id)) {
			throw new NotFoundException(__('Invalid merchant'));
		}
		$options = array('conditions' => array('Merchant.' . $this->Merchant->primaryKey => $id));
		$this->set('merchant', $this->Merchant->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->Merchant->create();
			if ($this->Merchant->save($this->request->data)) {
				$this->Session->setFlash('The merchant has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The merchant could not be saved. Please, try again.','default',array('class'=>'alert alert-warnging'));
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
		if (!$this->Merchant->exists($id)) {
			throw new NotFoundException(__('Invalid merchant'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->Merchant->save($this->request->data)) {
				$this->Session->setFlash('The merchant has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The merchant could not be saved. Please, try again.','default',array('class'=>'alert alert-warnging'));
			}
		} else {
			$options = array('conditions' => array('Merchant.' . $this->Merchant->primaryKey => $id));
			$this->request->data = $this->Merchant->find('first', $options);
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
		$this->Merchant->id = $id;
		if (!$this->Merchant->exists()) {
			throw new NotFoundException(__('Invalid merchant'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Merchant->delete()) {
			$this->Session->setFlash('The merchant has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The merchant could not be deleted. Please, try again.','default',array('class'=>'alert alert-warnging'));
		}
		return $this->redirect(array('action' => 'index'));
	}
}
