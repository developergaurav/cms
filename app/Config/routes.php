<?php

	Router::connect('/', array('controller' => 'users', 'action' => 'login','admin'=>true));
	Router::connect('/administrator', array('controller' => 'users', 'action' => 'login','admin'=>true));
	
	CakePlugin::routes();


	
	Router::mapResources("Sites");
	Router::parseExtensions('json');
	
	require CAKE . 'Config' . DS . 'routes.php';
