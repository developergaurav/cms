<?php
App::uses('AppController', 'Controller');
/**
 * WebPages Controller
 *
 * @property WebPage $WebPage
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class WebPagesController extends AppController {

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
		$this->WebPage->recursive = 0;
		$this->set('webPages', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->WebPage->exists($id)) {
			throw new NotFoundException(__('Invalid web page'));
		}
		$options = array('conditions' => array('WebPage.' . $this->WebPage->primaryKey => $id));
		$this->set('webPage', $this->WebPage->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->WebPage->create();
			if ($this->WebPage->save($this->request->data)) {
				$this->Session->setFlash('The web page has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The web page could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
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
		if (!$this->WebPage->exists($id)) {
			throw new NotFoundException(__('Invalid web page'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->WebPage->save($this->request->data)) {
				$this->Session->setFlash('The web page has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The web page could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		} else {
			$options = array('conditions' => array('WebPage.' . $this->WebPage->primaryKey => $id));
			$this->request->data = $this->WebPage->find('first', $options);
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
		$this->WebPage->id = $id;
		if (!$this->WebPage->exists()) {
			throw new NotFoundException(__('Invalid web page'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->WebPage->delete()) {
			$this->Session->setFlash('The web page has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The web page could not be deleted. Please, try again.','default',array('class'=>'alert alert-warning'));
		}
		return $this->redirect(array('action' => 'index'));
	}
	
	
	
}
