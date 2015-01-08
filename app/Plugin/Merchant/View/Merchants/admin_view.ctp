<h1 class="page-title"><?php echo __('Merchant details'); ?></h1>
<dl>
	<dt><?php echo __('Id'); ?></dt>
	<dd><?php echo h($merchant['Merchant']['id']); ?></dd>

	<dt><?php echo __('Email'); ?></dt>
	<dd><?php echo h($merchant['Merchant']['email']); ?></dd>

	<dt><?php echo __('Password'); ?></dt>
	<dd><?php echo h($merchant['Merchant']['password']); ?></dd>

	<dt><?php echo __('Basic Information'); ?></dt>
	<dd><?php echo h($merchant['Merchant']['basic_information']); ?></dd>

	<dt><?php echo __('Status'); ?></dt>
	<dd><?php echo h($merchant['Merchant']['status']); ?></dd>

	<dt><?php echo __('Created'); ?></dt>
	<dd><?php echo h($merchant['Merchant']['created']); ?></dd>

	<dt><?php echo __('Modified'); ?></dt>
	<dd><?php echo h($merchant['Merchant']['modified']); ?></dd>

</dl>
