<?php
App::uses('EcommerceAppModel', 'Ecommerce.Model');
/**
 * Attribute Model
 *
 * @property Type $Type
 * @property AttributeValue $AttributeValue
 */
class Attribute extends EcommerceAppModel {

/**
 * Use database config
 *
 * @var string
 */
	public $useDbConfig = 'ecommerce';

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
		'type_id' => array(
			'uuid' => array(
				'rule' => array('uuid'),
				//'message' => 'Your custom message here',
				//'allowEmpty' => false,
				//'required' => false,
				//'last' => false, // Stop validation after this rule
				//'on' => 'create', // Limit validation to 'create' or 'update' operations
			),
		),
		'title' => array(
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

	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'Type' => array(
			'className' => 'Ecommerce.Type',
			'foreignKey' => 'type_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'AttributeLabel' => array(
				'className' => 'Ecommerce.AttributeLabel',
				'foreignKey' => 'attribute_label_id',
				'conditions' => '',
				'fields' => '',
				'order' => ''
		),
		
	);

/**
 * hasMany associations
 *
 * @var array
 */
	public $hasMany = array(
		'AttributeValue' => array(
			'className' => 'Ecommerce.AttributeValue',
			'foreignKey' => 'attribute_id',
			'dependent' => true,
			'conditions' => '',
			'fields' => '',
			'order' => '',
			'limit' => '',
			'offset' => '',
			'exclusive' => '',
			'finderQuery' => '',
			'counterQuery' => ''
		)
	);

}
