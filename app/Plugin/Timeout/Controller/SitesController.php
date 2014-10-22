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
		$this->Auth->allow();
	}
	public function client_registration(){
		
		
		$data = $this->request->data;
		
		$this->set(
			array(
				'_serialize',
				'data' => array('single_page'=>$data),
				'_jsonp' => true
			)
		);
		$this->render('json_render');
	}

	
	public function beforeRender(){
		$this->response->header('Access-Control-Allow-Origin', true);
	}

}
