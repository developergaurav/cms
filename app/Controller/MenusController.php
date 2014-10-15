<?php
App::uses('AppController', 'Controller');
/**
 * Menus Controller
 *
 * @property Menu $Menu
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class MenusController extends AppController {

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
		$this->Menu->recursive = 0;
		$this->set('menus', $this->Paginator->paginate());
		
		$web_pages = ClassRegistry::init('WebPage')->find('list');
		$this->set(compact('web_pages'));
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Menu->exists($id)) {
			throw new NotFoundException(__('Invalid menu'));
		}
		$options = array('conditions' => array('Menu.' . $this->Menu->primaryKey => $id));
		$this->set('menu', $this->Menu->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			
			$data = $this->request->data;
			if($data['Menu']['type'] == 'content'){
				$data['Menu']['link_data'] = $data['Menu']['web_pages'];
			}
			unset($data['Menu']['web_pages']);
			
			$this->Menu->create();
			if ($this->Menu->save($data)) {
				$this->Session->setFlash('The menu has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The menu could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		}
		$parentMenus = $this->Menu->find('list');
		$this->set(compact('parentMenus'));
		$this->set('webpages',$this->getWebPages());
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		if (!$this->Menu->exists($id)) {
			throw new NotFoundException(__('Invalid menu'));
		}
		if ($this->request->is(array('post', 'put'))) {
			
			$data = $this->request->data;
			if($data['Menu']['type'] == 'content'){
				$data['Menu']['link_data'] = $data['Menu']['web_pages'];
			}
			unset($data['Menu']['web_pages']);
			
			if ($this->Menu->save($data)) {
				$this->Session->setFlash('The menu has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The menu could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		} else {
			$options = array('conditions' => array('Menu.' . $this->Menu->primaryKey => $id));
			$this->request->data = $this->Menu->find('first', $options);
		}
		$parentMenus = $this->Menu->find('list',array('conditions'=>array('id !=' => $id )));
		$this->set(compact('parentMenus'));
		$this->set('webpages',$this->getWebPages());
	}

/**
 * admin_delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		$this->Menu->id = $id;
		if (!$this->Menu->exists()) {
			throw new NotFoundException(__('Invalid menu'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Menu->delete()) {
			$this->Session->setFlash('The menu has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The menu could not be deleted. Please, try again.','default',array('class'=>'alert alert-warning'));
		}
		return $this->redirect(array('action' => 'index'));
	}
	
	//get web_page list
	
	private function getWebPages(){
		return ClassRegistry::init('WebPage')->find('list');
	}
}
