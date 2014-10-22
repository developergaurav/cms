<?php
App::uses('TimeoutAppController', 'Timeout.Controller');
/**
 * Clients Controller
 *
 * @property Client $Client
 * @property PaginatorComponent $Paginator
 * @property SessionComponent $Session
 */
class SitesController extends TimeoutAppController {

/**
 * Components
 *
 * @var array
 */
	public $components = array('Session','RequestHandler');
	
	public $uses = array('Timeout.Client');
	
	public function beforeFilter(){
		parent::beforeFilter();
		$this->Auth->allow(array('client_registration','client_login'));
	}
	
	public function beforeRender(){
		$this->response->header('Access-Control-Allow-Origin', '*');
	}
	
/*
 * cleint registraion
 */	
	public function client_registration(){
		
		if($this->request->is('post')){
			$data =  $this->request->input('json_decode',true);
			$cilentData = array();
			foreach($data as $key => $value){
				if($value['name'] != 'repassword'){
					if($value['name'] == 'username'){
						$cilentData['Client'][$value['name']] =$value['value'];
					}elseif($value['name'] == 'password'){
						$cilentData['Client'][$value['name']] =$value['value'];
					}else{
						$cilentData['Client']['details'][$value['name']] =$value['value'];
					}
				}
			}
			$cilentData['Client']['details'] = json_encode($cilentData['Client']['details']);
			
			if($this->Client->find('count',array('conditions'=>array('username'=>$cilentData['Client']['username']))) > 0){
				$return_data = array();
				$return_data['status'] = 'error';
				$return_data['message'] = 'Already registered.';
			}else{
				if($this->Client->save($cilentData)){
					$return_data = array();
					$return_data['status'] = 'success';
					$return_data['message'] = 'Registration has been completed.';
				}else{
					$return_data = array();
					$return_data['status'] = 'error';
					$return_data['message'] = 'Can not be procced.';
				}
			}
			
		}else{
			$return_data = array();
			$return_data['status'] = 'error';
			$return_data['message'] = 'Invalid Request.';
		}
		
		$this->set(
			array(
				'_serialize',
				'data' => array('register_client'=>$return_data),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}

	
	public function client_login(){
		
		if($this->request->is('post')){
			$data =  $this->request->input('json_decode',true);
			$login_data = array();
			foreach($data as $key=>$value){
				$login_data[$value['name']] =$value['value'];
			}
			$has_user = $this->Client->find('all',array('conditions'=>array('username'=>$login_data['username'])));
			if(sizeof($has_user)>0){
				$data = array();
				$data['status'] = 'success';
				$data['loggeduser'] = $has_user;
			}else{
				$data = array();
				$data['status'] = 'error';
			}
		}else{
			$data = array();
			$data['status'] = 'error';
			$data['message'] = 'Invalid Request.';
		}
		
		$this->set(
			array(
				'_serialize',
				'data' => array('client_login'=>$data),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}
	
	
	

}
