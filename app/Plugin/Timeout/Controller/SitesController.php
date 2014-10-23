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
		$this->response->header('Access-Control-Allow-Origin', '*');
		
		$this->Auth->allow(array('client_registration','client_login'));
		
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
		$response = array();
		if($this->request->is('post')){
			//catch post ata
			$data =  $this->request->input('json_decode',true);
			
			//process data
			$login_data = array();
			foreach($data as $key=>$value){
				$login_data[$value['name']] =$value['value'];
			}
			
			//check user auth credential
			$is_valid_user = $this->Client->processLogin($login_data['username'],$login_data['password']);
			
			if($is_valid_user != 'error'){
				unset($is_valid_user['Client']['password']);
				
				$response['status'] = 'success';
				$response['loggeduser'] = $is_valid_user;
			} else {
				$response['status'] = 'error';
				$response['message'] = 'Username and Password does not match';
			}
			
		//block other type of request.	
		}else{
			$response['status'] = 'error';
			$response['message'] = 'Invalid Request.';
		}
		
		//process the view
		
		$this->set(
			array(
				'_serialize',
				'data' => array('client_login'=>$response),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}

}
