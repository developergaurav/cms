<?php

App::uses('AppController', 'Controller');

class SitesController extends AppController {

	public $components = array('RequestHandler');

	public $uses = array(
		'Site',
		'User',
		'Menu',
		'WebPage'
	);

	public function beforeFilter(){
		parent::beforeFilter();
		$this->Auth->allow();
	}

	public function data_layout(){
		$menu = array();
		foreach($this->menu_locations as $key=>$value){
			$menu[$key] =  $this->Menu->find('all',
					array(
						'conditions'=>array(
							'Menu.status'=>'active',
							'Menu.location'=>"{$key}"
						),
						'order' => array('Menu.order' => 'ASC')
					)
				);
		}

		$this->set(
				array(
					'_serialize',
					'data' => array('menu'=>$menu),
					'_jsonp' => true

				)
		);
	}

	//get web page by id
	public function web_page_by_id($id){
		$data = $this->WebPage->find('all',array(
			'conditions'=>array(
				'id' => $id
			)
		));
		$this->set(
				array(
					'_serialize',
					'data' => array('single_page'=>$data),
					'_jsonp' => true
		
				)
		);
		$this->render('data_layout');
	}
	
	public function beforeRender(){
		$this->response->header('Access-Control-Allow-Origin', '*');
	}
}