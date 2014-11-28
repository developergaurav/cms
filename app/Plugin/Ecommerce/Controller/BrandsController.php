<?php
App::uses('EcommerceAppController', 'Ecommerce.Controller');
/**
 * Brands Controller
 *
 * @property Brand $Brand
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class BrandsController extends EcommerceAppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session','Uploader');
	
	public function beforeFilter(){
		parent::beforeFilter();
	}

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->Brand->recursive = 0;
		$this->set('brands', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Brand->exists($id)) {
			throw new NotFoundException(__('Invalid brand'));
		}
		$options = array('conditions' => array('Brand.' . $this->Brand->primaryKey => $id));
		$this->set('brand', $this->Brand->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		//echo 
		if ($this->request->is('post')) {
			$data = $this->request->data;
			$image = $data['Brand']['images'];
			unset($data['Brand']['images']);
			
			$this->Brand->create();
			if ($this->Brand->save($data)) {
				$image_id = $this->Brand->getInsertId();
				
				$data = $this->request->data;
				if(isset($data['Brand']['image']) && $data['Brand']['image']['error'] == 0){
					$this->Uploader->upload($data['Brand']['image'], $image_id, 'png', 'product_brands',$fileOrImage = null, $height = '300', $width = '500', $oldfile = null );
				}
				$this->Session->setFlash('The brand has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The brand could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
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
		if (!$this->Brand->exists($id)) {
			throw new NotFoundException(__('Invalid brand'));
		}
		if ($this->request->is(array('post', 'put'))) {
			
			$data = $this->request->data;
			if(isset($data['Brand']['image']) && $data['Brand']['image']['error'] == 0){
				$this->Uploader->upload($data['Brand']['image'], $id, 'png', 'product_brands',$fileOrImage = null, $height = '300', $width = '500', $oldfile = null );
			}
				
			if ($this->Brand->save($data)) {
				$this->Session->setFlash('The brand has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The brand could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		} else {
			$options = array('conditions' => array('Brand.' . $this->Brand->primaryKey => $id));
			$this->request->data = $this->Brand->find('first', $options);
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
		$this->Brand->id = $id;
		if (!$this->Brand->exists()) {
			throw new NotFoundException(__('Invalid brand'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Brand->delete()) {
			$this->Session->setFlash('The brand has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The brand could not be deleted. Please, try again.','default',array('class'=>'alert alert-warning'));
		}
		return $this->redirect(array('action' => 'index'));
	}
}
