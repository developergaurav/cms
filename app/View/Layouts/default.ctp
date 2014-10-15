<?php
$cakeDescription = __d('cake_dev', 'Uy Systems: the reliable service provider');
$cakeVersion = __d('cake_dev', 'CakePHP %s', Configure::version())
?>
<!DOCTYPE html>
<html>
<head>
<?php echo $this->Html->charset(); ?>
<title><?php echo $cakeDescription ?>: <?php echo $title_for_layout; ?>
</title>
<?php
echo $this->Html->meta('favicon.ico','/favicon.ico',array('type' => 'icon'));

echo $this->Html->css(
		[
			'/bootstrap/css/bootstrap.min',
			'/bootstrap/css/bootstrap-theme.min',
			'uy-sys',
			'/jquery-ui/jquery-ui.min',
			'/froala-editor/css/font-awesome.min',
			'/froala-editor/css/froala_editor.min'
		]
	);

echo $this->Html->script(
		[
			'jquery',
			'/jquery-ui/jquery-ui.min',
			'Ecommerce.angular'
		]
	);
//echo $this->Less->lessCss(['foo']);

echo $this->fetch('meta');
echo $this->fetch('css');
echo $this->fetch('script');
?>
</head>
<body>
	<div class="container-fluid">
		<!-- header -->
		<?php echo $this->element('/admin/header');?>
		<!-- Menus -->
		<div class="row">
			<?php if(!empty($auth_status)):?>
			<?php echo $this->element('/admin/menu');?>

			<!-- Page data -->
			<div class="col-md-10">
			 	<?php if($this->Session->check('Message.flash') != '' or $this->Session->check('Message.auth') != ''):?>
				<div class="row">
					
						<?php echo $this->Session->flash(); ?>
						<?php echo $this->Session->flash('auth'); ?>
					
				</div>
				<?php  endif;?>
			
				<div class="row">
					<div class="col-md-12">
						<?php echo $this->fetch('content'); ?>
					</div>
				</div>
			</div>
			<?php else:?>
				<div class="login-form-holder">
					<div class="col-xs-12 col-sm-6 col-md-12 col-lg-12">

						<?php echo $this->fetch('content'); ?>
					</div>
					<div class="clearfix"></div>
				</div>
			
			<?php endif;?>
		</div>
	</div>

	<?php echo $this->element('sql_dump'); ?>

	<!-- Javascript -->
	<?php 
	echo $this->Html->script(
			[
				'layout',
				'/bootstrap/js/bootstrap.min',
				'/froala-editor/js/froala_editor.min',
				'/froala-editor/js/plugins/media_manager.min',
				'Ecommerce.e-commerce-admin'
			]
		);
	?>
	<!--[if lt IE 9]>
		<?php 
    	echo $this->Html->script(
			[
				'/froala-editor/js/froala_editor.min'
			]
		);
    	?>
	<![endif]-->
</body>
</html>
