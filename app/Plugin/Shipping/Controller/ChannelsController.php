<?php
App::uses('ShippingAppController', 'Shipping.Controller');
/**
 * Channels Controller
 *
 * @property Channel $Channel
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class ChannelsController extends ShippingAppController {

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
		$this->Channel->recursive = 0;
		$this->set('channels', $this->Paginator->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		if (!$this->Channel->exists($id)) {
			throw new NotFoundException(__('Invalid channel'));
		}
		$options = array('conditions' => array('Channel.' . $this->Channel->primaryKey => $id));
		$this->set('channel', $this->Channel->find('first', $options));
	}


/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		if (!$this->Channel->exists($id)) {
			throw new NotFoundException(__('Invalid channel'));
		}
		if ($this->request->is(array('post', 'put'))) {
			if ($this->Channel->save($this->request->data)) {
				$this->Session->setFlash('The channel has been saved.','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash('The channel could not be saved. Please, try again.','default',array('class'=>'alert alert-warnging'));
			}
		} else {
			$options = array('conditions' => array('Channel.' . $this->Channel->primaryKey => $id));
			$this->request->data = $this->Channel->find('first', $options);
		}
		$countries = $this->Channel->Country->find('list');
		$cities = $this->Channel->City->find('list');
		$this->set(compact('countries', 'cities'));
	}

/**
 * admin_delete method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		$this->Channel->id = $id;
		if (!$this->Channel->exists()) {
			throw new NotFoundException(__('Invalid channel'));
		}
		$this->request->allowMethod('post', 'delete');
		if ($this->Channel->delete()) {
			$this->Session->setFlash('The channel has been deleted.','default',array('class'=>'alert alert-success'));
		} else {
			$this->Session->setFlash('The channel could not be deleted. Please, try again.','default',array('class'=>'alert alert-warnging'));
		}
		return $this->redirect(array('action' => 'index'));
	}
/**
 * admin_add method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */	
	public function admin_generate_channels(){
		if($this->request->is('post')){
			$country_city_data = $this->Channel->Country->find('all',array('limit'=>null));
			$channels = array();
			$newChannelList = array();
			foreach($country_city_data as $key=>$val){
				foreach($val['City'] as $k=>$v){
					$chn = array(
						'Channel' => array(
							'country_id' => $val['Country']['id'],
							'city_id'	 =>	$v['id']
						)
					);
					array_push($channels,$chn);
					$newChannelList[$v['id']] = $val['Country']['id'];
				}
			}
			ksort($newChannelList);
			
			$currentChannels = $this->Channel->find('list',array('fields'=>array('city_id','country_id')));
			
			ksort($currentChannels);
			unset($currentChannels['']);
			
			$deleteable  = array_diff_assoc($currentChannels,$newChannelList);
			
			foreach($deleteable as $del_city=>$del_country){
				$this->Channel->query("Delete FROM channels WHERE city_id = '{$del_city}'");
			}
			$insertable  = array_diff_assoc($newChannelList,$currentChannels);
			$insertableNew = array();
			foreach($insertable as $ins_city=>$ins_country){
				$data['Channel'] = array(
					'country_id' =>$ins_country,
					'city_id' =>$ins_city,
				);
				array_push($insertableNew, $data);
			}
			
			$this->Channel->saveAll($insertableNew);
			$this->Session->setFlash('Channels has been Updated','default',array('class'=>'alert alert-success'));
			return $this->redirect(array('action' => 'index'));
		}
	}
	
	public function admin_add(){
		if($this->request->is('post')){
			$data = $this->request->data;
			if($this->Channel->save($data)){
				$this->Session->setFlash('Channels has been added','default',array('class'=>'alert alert-success'));
				return $this->redirect(array('action' => 'index'));
			}else{
				$this->Session->setFlash('Please try again.','default',array('class'=>'alert alert-warning'));
			}
			
		}
		$countries = $this->Channel->Country->find('list');
		$cities = $this->Channel->City->find('list');
		$this->set(compact('countries', 'cities'));
	}
}
