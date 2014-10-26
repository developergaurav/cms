<div class="row bar bar-primary bar-top">
	<div class="col-md-3">
		<h1 class="bar-title"><?php echo __('Product Orders'); ?></h1>
	</div>
	<div class="col-md-9 text-right">
		<?php echo $this->Form->create('ProductOrder',array('class'=>'searchForm','data-role'=>'form')); ?>
		<?php echo $this->Form->input('keywords',array('type'=>'text','div'=>false,'label'=>false,'class'=>'search-box', 'placeholder'=>'Search key words'));?>
		<?php echo $this->Form->button('Search',array('type'=>'submit','div'=>false,'label'=>false, 'class' =>'btn btn-default btn-sm'));?>
		
		<?php echo $this->Form->end(); ?>
	</div>
</div>

<div class="row bar bar-secondary">
	<div class="col-md-12">
		<?php echo $this->Html->link('<i class=\'glyphicon glyphicon-plus-sign\'></i> Add Product Orders', array('action' => 'add','admin'=>true),array('escape'=>false,'class'=>'btn btn-success')); ?>
	</div>	
</div>

<div class="row bar bar-third">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table table-striped" >
			<thead>
				<tr class="info">
					<th><?php echo $this->Paginator->sort('client_detail'); ?></th>
					<th><?php echo $this->Paginator->sort('order_detail'); ?></th>
					<!-- <th><?php echo $this->Paginator->sort('payment_detail'); ?></th> -->
					<th><?php echo $this->Paginator->sort('status'); ?></th>
					<th><?php echo $this->Paginator->sort('order_date'); ?></th>
					<th><?php echo $this->Paginator->sort('complete_date'); ?></th>
					<th class="text-right action-th"><?php echo __('Change Status'); ?></th>
				</tr>
			</thead>
			
			<tbody>
			<?php foreach ($productOrders as $productOrder): ?>
				<tr>
					<td>
						<?php 
							$client_data = json_decode(json_decode($productOrder['ProductOrder']['client_detail'],true),true);
							$client_data_personal = json_decode( $client_data['Client']['details'],true);
							echo $client_data_personal['first_name']." ".$client_data_personal['last_name']."<br>";
							echo $client_data['Client']['username'];
						?>
					</td>
					<td>
						<?php
							$order_data = json_decode($productOrder['ProductOrder']['order_detail'],true);
							foreach($order_data as $i=>$v):
						?>
								<div><?php echo $v['product_title']?></div>
								<div>Id : <?php echo $v['product_id']?></div>
								<div>
									Attributes :
									<ul>
										<?php  foreach($v['attributes'] as $n=>$av):?>
											<li>
												<?php echo $n." : ".$av;?>
											</li>
										<?php endforeach;?>
									
									</ul>
									
								
								</div>
								
								<div>Quantity : <?php echo $v['quantity']?></div>
								<div>Total : <?php echo $v['cost']?></div>
						<?php 	
							endforeach;
						?>
					</td>
					<!--  <td><?php echo h($productOrder['ProductOrder']['payment_detail']); ?></td>-->
					<td><?php echo h($order_status[$productOrder['ProductOrder']['status']]); ?></td>
					<td><?php echo h($productOrder['ProductOrder']['order_date']); ?></td>
					<td><?php echo h($productOrder['ProductOrder']['complete_date']); ?></td>
					<td class="text-right action">
						<?php //echo $this->Html->link('<i class=\'glyphicon glyphicon-edit\'></i> Edit', array('action' => 'edit', $productOrder['ProductOrder']['id'],'admin'=>true),array('escape'=>false,'class'=>'btn btn-warning')); ?>
						<!--<?php echo $this->Form->postLink('<i class=\'glyphicon glyphicon-remove-circle\'></i> Delete', array('action' => 'delete', $productOrder['ProductOrder']['id'],'admin'=>true), array('escape'=>false,'class'=>'btn btn-danger'), __('Are you sure you want to delete?')); ?>-->
						<?php echo $this->Form->postLink('<i class=\'glyphicon glyphicon-repeat\'></i> Processing', array('action' => 'make_processing', $productOrder['ProductOrder']['id'],'admin'=>true), array('escape'=>false,'class'=>'btn btn-warning'), __('Are you sure you want to update?')); ?>
						<?php echo $this->Form->postLink('<i class=\'glyphicon glyphicon-refresh\'></i> Completed', array('action' => 'make_completed', $productOrder['ProductOrder']['id'],'admin'=>true), array('escape'=>false,'class'=>'btn btn-success'), __('Are you sure you want to update?')); ?>
						<?php echo $this->Form->postLink('<i class=\'glyphicon glyphicon-remove\'></i> Cancelled', array('action' => 'make_cancelled', $productOrder['ProductOrder']['id'],'admin'=>true), array('escape'=>false,'class'=>'btn btn-danger'), __('Are you sure you want to update?')); ?>
					</td>
				</tr>
			<?php endforeach; ?>
			</tbody>
			</table>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="pagination-block">
			<p>
			<?php
			echo $this->Paginator->counter(array(
			'format' => __('Page {:page} of {:pages}, showing {:current} records out of {:count} total, starting on record {:start}, ending on {:end}')
			));
			?>			</p>
			<div class="pagination">
			<?php
		echo $this->Paginator->prev('< ' . __('previous'),array('tag'=>'li','disabledTag'=>'a'), null, array('class' => 'prev disabled','tag'=>'li','disabledTag'=>'a'));
		echo $this->Paginator->numbers(array('separator' => '','tag'=>'li','currentTag'=>'a', 'currentClass'=>'current disabled'));
		echo $this->Paginator->next(__('next') . ' >', array('tag'=>'li','disabledTag'=>'a'), null, array('class' => 'prev disabled','tag'=>'li','disabledTag'=>'a'));
	?>
			</div>
		</div>	
	</div>
</div>	