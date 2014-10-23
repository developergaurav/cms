<?php
App::uses('TimeoutAppModel', 'Timeout.Model');
App::uses('BlowfishPasswordHasher', 'Controller/Component/Auth');
/**
 * Client Model
 *
 */
class Client extends TimeoutAppModel {

/**
 * Use database config
 *
 * @var string
 */
	public $useDbConfig = 'timeout';

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'id';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'username' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'password' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'details' => array(
			'notEmpty' => array(
				'rule' => array('notEmpty'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
	);
	
	public function beforeSave($options = array()) {
		if (isset($this->data[$this->alias]['password'])) {
			$passwordHasher = new BlowfishPasswordHasher();
			$this->data[$this->alias]['password'] = $passwordHasher->hash(
					$this->data[$this->alias]['password'],'Blowfish'
			);
		}
		return true;
	}
	
	public function processLogin($username,$password){
		$salt_data = $this->find('first',array('recursive'=>-1,'conditions'=>array('username'=>$username)));
		if(sizeof($salt_data) > 0){
			$hashed = Security::hash($password,'Blowfish',$salt_data['Client']['password']);
			
			if($salt_data['Client']['password'] == $hashed){
				return $salt_data;
			}
		}
		return 'error';
	}
//
}
