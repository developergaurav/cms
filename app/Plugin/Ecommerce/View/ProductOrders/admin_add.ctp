<div class="row bar bar-primary bar-top">
	<div class="col-md-12">
		<h1 class="bar-title"><?php echo __('Admin Add Product Order'); ?></h1>
	</div>
</div>

<div class="row bar bar-secondary">
	<div class="col-md-12">
		<?php echo $this->Html->link('<i class=\'glyphicon glyphicon-list\'></i> List Product Orders', array('action' => 'index','admin'=>true),array('escape'=>false,'class'=>'btn btn-success')); ?>
	</div>	
</div>

<div class="row bar bar-third">
	<div class="col-md-12">
	<?php 
	echo $this->Form->create('ProductOrder',array('class'=>'form')); 
	
		echo $this->Form->input('client_detail',array('class'=>'form-control','div'=>array('class'=>'form-group')));
		echo $this->Form->input('order_detail',array('class'=>'form-control','div'=>array('class'=>'form-group')));
		echo $this->Form->input('payment_detail',array('class'=>'form-control','div'=>array('class'=>'form-group')));
		echo $this->Form->input('status',array('class'=>'form-control','div'=>array('class'=>'form-group')));
		echo $this->Form->input('order_date',array('class'=>'form-control','div'=>array('class'=>'form-group')));
		echo $this->Form->input('complete_date',array('class'=>'form-control','div'=>array('class'=>'form-group')));

		echo $this->Form->button('Reset',array('type'=>'reset', 'class'=>'btn btn-warning','label'=>false,'div'=>false));
		echo $this->Form->button('Submit',array('type'=>'submit','class'=>'btn btn-success btn-left-margin','label'=>false,'div'=>false));

	echo $this->Form->end(); 
?>	</div>
</div>
