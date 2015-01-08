<?php
App::uses('Merchant', 'Merchant.Model');

/**
 * Merchant Test Case
 *
 */
class MerchantTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'plugin.merchant.merchant'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->Merchant = ClassRegistry::init('Merchant.Merchant');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->Merchant);

		parent::tearDown();
	}

}
