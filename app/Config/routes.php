<?php

	Router::connect('/', array('controller' => 'users', 'action' => 'login','admin'=>true));
	Router::connect('/administrator', array('controller' => 'users', 'action' => 'login','admin'=>true));
	
	CakePlugin::routes();


	//cms+blog+ecommerceCopyOfBrandsController.php
	//Router::mapResources(array("Sites",'Blog.Sites','Ecommerce.Sites','Timeout.Sites'));
	
	Router::parseExtensions('json');
	
	require CAKE . 'Config' . DS . 'routes.php';
