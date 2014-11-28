<?php
App::uses('EcommerceAppController', 'Ecommerce.Controller');
/**
 * Categories Controller
 *
 * @property Category $Category
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class CategoriesController extends EcommerceAppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Paginator', 'Session', 'Uploader');

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->Category->recursive = 0;
		$this->set('categories', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Category->exists($id)) {
			throw new NotFoundException(__('Invalid category'));
		}
		$options = array('conditions' => array('Category.' . $this->Category->primaryKey => $id));
		$this->set('category', $this->Category->find('first', $options));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			
			$data = $this->request->data;
			
			$this->Category->create();
			if ($this->Category->save($data )) {
				$image_id = $this->Category->getInsertId();
				if(isset($data['Category']['image']) && $data['Category']['image']['error'] == 0){
					$this->Uploader->upload($data['Category']['image'], $image_id, 'png', 'product_categories',$fileOrImage = null, $height = '', $width = '750', $oldfile = null );
				}
				
				$this->Session->setFlash('The category has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The category could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		}
		$parentCategories = $this->Category->find('list');
		$this->set(compact('parentCategories'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		if (!$this->Category->exists($id)) {
			throw new NotFoundException(__('Invalid category'));
		}
		if ($this->request->is(array('post', 'put'))) {
			$data = $this->request->data;
			if(isset($data['Category']['image']) && $data['Category']['image']['error'] == 0){
				echo $this->Uploader->upload($data['Category']['image'], $id, 'png', 'product_categories',$fileOrImage = null, $height = '', $width = '750', $oldfile = null );
			}
			
			
			if ($this->Category->save($data)) {
				$this->Session->setFlash('The category has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The category could not be saved. Please, try again.','default',array('class'=>'alert alert-warning'));
			}
		} else {
			$options = array('conditions' => array('Category.' . $this->Category->primaryKey => $id));
			$this->request->data = $this->Category->find('first', $options);
		}
		$parentCategories = $this->Category->find('list');
		$this->set(compact('parentCategories'));
	}

/**
 * admin_delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		$this->Category->id = $id;
		if (!$this->Category->exists()) {
			throw new NotFoundException(__('Invalid category'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Category->delete()) {
			$this->Session->setFlash('The category has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The category could not be deleted. Please, try again.','default',array('class'=>'alert alert-warning'));
		}
		return $this->redirect(array('action' => 'index'));
	}
	
	public function admin_sort() {
		$data = $this->Category->find('threaded',
				array(
						'contain'=> array(),
						'fields' => array('id','title','order','parent_id'),
						'order'  => array('order' => 'asc'),
						'recursive' => 2,
						//'conditions' => array('Category.parent_id != ' => '')
					)
		);
		$tree_data = array();
		foreach($data as $k=>$v){
			if($v['Category']['parent_id'] == ''){
				array_push($tree_data, $v);
			}
		}
		
		pr($tree_data);
	}
}
