<div class="row bar bar-primary bar-top">
	<div class="col-md-12">
		<h1 class="bar-title"><?php echo __('Add New Product Type'); ?></h1>
	</div>
</div>

<div class="row bar bar-secondary">
	<div class="col-md-12">
		<?php echo $this->Html->link('<i class=\'glyphicon glyphicon-list\'></i> List All Product Types', array('action' => 'index','admin'=>true),array('escape'=>false,'class'=>'btn btn-success')); ?>
	</div>	
</div>

<div class="row bar bar-third">
	<div class="col-md-12">
    <div onclick="process_type_forms()">sdfdsf</div>
	<?php 
	echo $this->Form->create('Type',array('class'=>'form','onsubmit'=>'process_type_forms();return false;')); 
	?>
	<div class="form-section-heading">Product Type details </div>
	
	<!-- Category list show-->
                  <div class="col-md-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Categories</div>
                        </div>
                        <div class="panel-body category-brand-box">
                        <?php 
                            static $j = 0;
                            foreach($productCategories as $c_id => $c_title):
                                echo "<label class='checkbox' style='margin-left : 20px;'>".$this->Form->input("Type.TypeCategory.{$j}.category_id",array('class'=>'category_ids', 'type'=>'checkbox','value'=>$c_id,'label'=>false,'div'=>false))." {$c_title}</label>";
                            $j++;
                            endforeach;
                        ?>
                        </div>
                    </div>
                </div>
                <!-- End show category list-->
	
	
	
	<?php	
		echo $this->Form->input('title',array('class'=>'form-control','div'=>array('class'=>'form-group')));
		echo $this->Form->input('description',array('type'=>'textarea', 'class'=>'form-control','div'=>array('class'=>'form-group')));
		echo $this->Form->input('status',array('options'=>$status, 'class'=>'form-control','div'=>array('class'=>'form-group')));
	?>
	<div class="form-section-heading"><span class="pull-left">Attributes</span> <span class="btn btn-success pull-right" onclick="add_more_attr()">Add More attributes</span> <div class="clearfix"></div></div>
	<div class="attr-holder">
		<div class="attr">
			<div class="row">
                <!--  attribute -->
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<span class="btn btn-warning btn-sm pull-right" onclick="remove_attr(this);">Remove Attribute</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<?php echo $this->Form->input('Attribute.title',array('label'=>'Name', 'class'=>'form-control attr-title', 'div'=>array('class'=>'form-group')));?>
						</div>
					</div>
				</div>
				
				<!-- Attr Value -->
				<div class="col-md-6 ">
					<div class="row">
						<div class="col-md-12">
							<span class="btn btn-success btn-sm pull-left" onclick="add_attr_value(this);">Add More Attribute Value</span>
						</div>
					</div>
					<div class="row">
						<div class="attr_value_holder">
							<div class="attr_value">
								<div class="col-md-9">
									<?php echo $this->Form->input('AttributeValue.value',array('label'=>'Value', 'class'=>'form-control attr-value-value','div'=>array('class'=>'form-group')));?>
									<?php echo $this->Form->input('AttributeValue.has_value',array('options'=>array('yes'=>'Yes','no'=>'No'), 'label'=>'Has Price', 'class'=>'form-control attr-value-has-value','div'=>array('class'=>'form-group')));?>
								</div>
								<div class="col-md-3 clearfix">
									<span class="btn btn-warning btn-sm" onclick="remove_attr_value(this);">Remove Value</span>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<?php
		echo $this->Form->button('Reset',array('type'=>'reset', 'class'=>'btn btn-warning','label'=>false,'div'=>false));
		
		echo $this->Form->button('Submit',array('type'=>'submit','class'=>'btn btn-success btn-left-margin','label'=>false,'div'=>false));

	echo $this->Form->end();

	
	?>
	</div>
</div>

