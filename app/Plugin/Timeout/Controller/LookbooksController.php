<?php
App::uses('TimeoutAppController', 'Timeout.Controller');
/**
 * Lookbooks Controller
 *
 * @property Lookbook $Lookbook
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class LookbooksController extends TimeoutAppController {

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
		$this->Lookbook->recursive = 0;
		$this->set('lookbooks', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Lookbook->exists($id)) {
			throw new NotFoundException(__('Invalid lookbook'));
		}
		$options = array('conditions' => array('Lookbook.' . $this->Lookbook->primaryKey => $id));
		$this->set('lookbook', $this->Lookbook->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$data = $this->request->data;
			if(isset($data['Lookbook']['image']) && $data['Lookbook']['image']['error'] == 0){
				$data['Lookbook']['image_extension'] = $this->Uploader->getFileExtension($data['Lookbook']['image']);
			}
			$this->Lookbook->create();
			if ($this->Lookbook->save($data)){
				$image_id = $this->Lookbook->getInsertId();
				if(isset($data['Lookbook']['image']) && $data['Lookbook']['image']['error'] == 0){
					$this->Uploader->upload($data['Lookbook']['image'], $image_id, $data['Lookbook']['image_extension'], 'lookbooks',$fileOrImage = null, $height = '', $width = '900', $oldfile = null );
				}
				$this->Session->setFlash('The lookbook has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The lookbook could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
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
		if (!$this->Lookbook->exists($id)) {
			throw new NotFoundException(__('Invalid lookbook'));
		}
		if ($this->request->is(array('post', 'put'))) {
			$data = $this->request->data;
			if(isset($data['Lookbook']['image']) && $data['Lookbook']['image']['error'] == 0){
				$data['Lookbook']['image_extension'] = $this->Uploader->getFileExtension($data['Lookbook']['image']);
				$this->Uploader->upload($data['Lookbook']['image'], $id, $data['Lookbook']['image_extension'], 'lookbooks',$fileOrImage = null, $height = '', $width = '900', $oldfile = null );
			}else{
				$data['Lookbook']['image_extension'] = '';
			}
			if ($this->Lookbook->save($data)) {
				
				$this->Session->setFlash('The lookbook has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The lookbook could not be saved. Please, try again.','default',array('class'=>'alert alert-warnging'));
			}
		} else {
			$options = array('conditions' => array('Lookbook.' . $this->Lookbook->primaryKey => $id));
			$this->request->data = $this->Lookbook->find('first', $options);
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
		$this->Lookbook->id = $id;
		if (!$this->Lookbook->exists()) {
			throw new NotFoundException(__('Invalid lookbook'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Lookbook->delete()) {
			$this->Session->setFlash('The lookbook has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The lookbook could not be deleted. Please, try again.','default',array('class'=>'alert alert-warnging'));
		}
		return $this->redirect(array('action' => 'index'));
	}
}
