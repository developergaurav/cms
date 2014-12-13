<?php
App::uses('TimeoutAppController', 'Timeout.Controller');
/**
 * Galleries Controller
 *
 * @property Gallery $Gallery
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class GalleriesController extends TimeoutAppController {

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
		$this->Gallery->recursive = 0;
		$this->set('galleries', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Gallery->exists($id)) {
			throw new NotFoundException(__('Invalid gallery'));
		}
		$options = array('conditions' => array('Gallery.' . $this->Gallery->primaryKey => $id));
		$this->set('gallery', $this->Gallery->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$data = $this->request->data;
			if(isset($data['Gallery']['image']) && $data['Gallery']['image']['error'] == 0){
				$data['Gallery']['image_extension'] = $this->Uploader->getFileExtension($data['Gallery']['image']);
			}
				
			$this->Gallery->create();
			if ($this->Gallery->save($data)) {
				$image_id = $this->Gallery->getInsertId();
				if(isset($data['Gallery']['image']) && $data['Gallery']['image']['error'] == 0){
					$this->Uploader->upload($data['Gallery']['image'], $image_id, $data['Gallery']['image_extension'], 'gallery',$fileOrImage = null, $height = '', $width = '900', $oldfile = null );
				}
				$this->Session->setFlash('The gallery has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The gallery could not be saved. Please, try again.','default',array('class'=>'alert alert-warnging'));
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
		if (!$this->Gallery->exists($id)) {
			throw new NotFoundException(__('Invalid gallery'));
		}
		if ($this->request->is(array('post', 'put'))) {
			$data = $this->request->data;
			if(isset($data['Gallery']['image']) && $data['Gallery']['image']['error'] == 0){
				$data['Gallery']['image_extension'] = $this->Uploader->getFileExtension($data['Gallery']['image']);
				$this->Uploader->upload($data['Gallery']['image'], $id, $data['Gallery']['image_extension'], 'gallery',$fileOrImage = null, $height = '', $width = '900', $oldfile = null );
			}
			
			if ($this->Gallery->save($data)) {
				$this->Session->setFlash('The gallery has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The gallery could not be saved. Please, try again.','default',array('class'=>'alert alert-warnging'));
			}
		} else {
			$options = array('conditions' => array('Gallery.' . $this->Gallery->primaryKey => $id));
			$this->request->data = $this->Gallery->find('first', $options);
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
		$this->Gallery->id = $id;
		if (!$this->Gallery->exists()) {
			throw new NotFoundException(__('Invalid gallery'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Gallery->delete()) {
			$this->Session->setFlash('The gallery has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The gallery could not be deleted. Please, try again.','default',array('class'=>'alert alert-warnging'));
		}
		return $this->redirect(array('action' => 'index'));
	}
}
