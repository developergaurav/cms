<?php
App::uses('AppModel', 'Model');
/**
 * WebPage Model
 *
 */
class WebPage extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'title';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'title' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				'message' => 'Please input a title.',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		
		'meta_keys' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				'message' => 'Pleas input meta key words',
				'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'meta_description' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				'message' => 'Pleas input meta description.',
				//'allowEmpty' => false,
				'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'description' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				'message' => 'Please input a details.',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'status' => array(
			'numeric' => array(
				'rule' => array('notEmpty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);
	
	public function beforeSave($options = array()){
		$data = $this->data;
		$slug = $this->slugify($data['WebPage']['title']);
		$check_slug = $this->find('count',array('conditions'=>array('slug'=>$slug)));
		if($check_slug == 0){
			$data['WebPage']['slug'] = $slug;
			
		}else{
			$counter = $check_slug+1;
			$data['WebPage']['slug'] = $slug."_{$counter}";
		}
		$this->data = $data;
		
		return true;
	}
}
