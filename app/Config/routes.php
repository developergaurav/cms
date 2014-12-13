<?php
	//for admin
	Router::connect('/', array('controller' => 'users', 'action' => 'login','admin'=>true));
	Router::connect('/administrator', array('controller' => 'users', 'action' => 'login','admin'=>true));
	
	//for site
	Router::connect('/sites/:action/*', array('controller' => 'sites'));
	Router::connect('/ecommerce/sites/:action/*', array('plugin'=>'Ecommerce', 'controller' => 'sites'));
	Router::connect('/blog/sites/:action/*', array('plugin'=>'Blog', 'controller' => 'sites'));
	Router::connect('/timeout/sites/:action/*', array('plugin'=>'Timeout', 'controller' => 'sites'));
	
	//alow json extension
	Router::parseExtensions('json');
	
	require CAKE . 'Config' . DS . 'routes.php';
