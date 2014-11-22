<div class="row bar bar-primary bar-top">
	<div class="col-md-12">
		<h1 class="bar-title"><?php echo __('Admin Add Product'); ?></h1>
	</div>
</div>

<div class="row bar bar-secondary">
	<div class="col-md-12">
		<?php echo $this->Html->link('<i class=\'glyphicon glyphicon-list\'></i> List Products', array('action' => 'index','admin'=>true),array('escape'=>false,'class'=>'btn btn-success')); ?>
	</div>	
</div>

<div class="row bar bar-third">
	<div class="col-md-12">
	<?php 
	$prduct_current_data = $this->request->data;
	echo $this->Form->create('Product',array('class'=>'form','type'=>'file')); 
	?>
	

	<div class="row">
		<div class="col-md-6">
			<?php
				echo $this->Form->input('id',array('class'=>'form-control','div'=>array('class'=>'form-group')));
				echo $this->Form->input('title',array('class'=>'form-control','div'=>array('class'=>'form-group')));
				echo $this->Form->input('meta_keys',array('class'=>'form-control','div'=>array('class'=>'form-group')));
				echo $this->Form->input('meta_description',array('type'=>'textarea', 'class'=>'form-control','div'=>array('class'=>'form-group')));
				echo $this->Form->input('price',array('label'=>'Base Price', 'min'=>0, 'class'=>'form-control','div'=>array('class'=>'form-group')));
			?>
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
				<?php
					echo $this->Form->input('description',array('type'=>'textarea','class'=>'editor form-control','div'=>array('class'=>'form-group')));
				?>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "row">
		<div class="col-md-12">
			<div ng-app='product' ng-controller='ProductAttributeController' class="AttrDataHolder" attribute_array ='<?php echo $productAttributes;?>'>
			<?php
				$option_values = json_encode($productTypes);
				echo $this->Form->input('type_id',array('type'=>'select', 'type_categories' => json_encode($productCategories), 'options'=>$productTypes, 'ng-change'=>'checkProductType()','ng-model'=>'productType', 'option_values'=>$option_values, 'required'=>true,'class'=>'form-control product_type','selected_value'=>$this->request->data['Product']['type_id'], 'div'=>array('class'=>'form-group')));
			?>
			
				<div class = "row">
					<div class="col-md-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Categories</div>
							</div>
							
							<div class="panel-body category-brand-box current_categories" data-current-selected-categories = '<?php echo json_encode($prduct_current_data['ProductCategory'])?>'>
								<label class='checkbox' style='margin-left : 20px;' data-ng-repeat="(id,value) in selected_type_categories.categories">
									<input id="ProductProductCategory{{$index}}CategoryId" type="checkbox" data-ng-if = "db_selected_type_categories.indexOf(id) != -1" checked value="{{id}}" name="data[Product][ProductCategory][{{$index}}][category_id]">
									<input id="ProductProductCategory{{$index}}CategoryId" type="checkbox" data-ng-if = "db_selected_type_categories.indexOf(id) == -1" value="{{id}}" name="data[Product][ProductCategory][{{$index}}][category_id]">{{value}}
								</label>
							</div>
							
						</div>
					</div>
					
					<div class="col-md-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Brands</div>
							</div>
							<div class="panel-body category-brand-box">
							<?php 
								static $i = 0;
								foreach($productBrands as $b_id => $b_title):
									if(array_search("{$b_id}", $prduct_current_data['ProductBrand']) === false){
										$checked = false;
									}else{
										$checked = true;
									}
									echo "<label class='checkbox' style='margin-left : 20px;'>".$this->Form->input("Product.ProductBrand.{$i}.brand_id",array('type'=>'checkbox','value'=>$b_id,'checked' => $checked, 'label'=>false,'div'=>false))." {$b_title}</label>";
								$i++;
								endforeach;
							?>
							</div>
						</div>
					</div>
				</div>
			
			</div>
			
			<div class="row attr-inputs" existing-values = '<?php echo json_encode($this->request->data['ProductAttribute'],true)?>'></div>
			
			<!-- Image uploading -->
			<div class="row">
				<div class="col-md-12">
					<div class="row padding-bottom-10">
						<div class="col-md-12">
							<div class="form-group">
								<label class="pull-left"> Upload Images </label>
								<span class="pull-right btn btn-info" onclick="uploadMoreImage()"> Upload More Images </span>
							</div>
						</div>
					</div>
					
					<div class="image-uploader-div">
						<div class="row image-uploader-div-row">
							<?php foreach($prduct_current_data['ProductImage'] as $image_key => $image_value):?>
								<div class="col-md-4 individual-image">
									<div class="form-group">
										<input type ="hidden" name="data[Product][ProductImage][][id_extension]" value="<?php echo $image_value['id']."#ZUBAYER#".$image_value['extension'];?>">
										<span class="pull-left"><input type ="file" name="data[Product][ProductImage][]" onchange="processPreview(this)" class="product-image-input-field"></span>
										<span class="pull-right btn btn-danger btn-xs" onclick="removeImage(this,'<?php echo $image_value['id'].".".$image_value['extension'];?>')">Remove</span>
										<div class="clearfix"></div>
									</div>
									<div class="image-preview">
										<?php echo $this->Html->image("site/products/{$image_value['id']}.{$image_value['extension']}",array('class'=>'img-responsive upload-image-thumbnail'));?>
									</div>
								</div>
								<?php if(($image_key+1)%3 == 0): echo '<div class="clerafix row-divider-upload"></div>';endif;?>
							<?php endforeach;?>
						</div>
					</div>
				</div>
			</div>
			
			<?php 
				echo $this->Form->input('status',array('options'=>$status, 'class'=>'form-control','div'=>array('class'=>'form-group')));
			?>
		</div>
	</div>
	
	
	
	<?php 	
		echo $this->Form->button('Reset',array('type'=>'reset', 'class'=>'btn btn-warning','label'=>false,'div'=>false));
		echo $this->Form->button('Submit',array('type'=>'submit','class'=>'btn btn-success btn-left-margin','label'=>false,'div'=>false));

	echo $this->Form->end(); 
?>	</div>
</div>

<?php echo $this->Html->script(array('Ecommerce.product','Ecommerce.filesystem'));?>

<style type ="text/css">
.attribute-id-holder{
	font-weight: bold;
	border-bottom : 1px solid #ccc;
	margin-bottom : 5px;
}
</style>



