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
		echo $this->Form->create('Product',array('class'=>'form','type'=>'file')); 
	?>
	
	<div class = "row">
		<div class="col-md-12" data-ng-app='product'>
		
			<div class="row">
				<div class="col-md-6"  data-ng-controller='discountController'>
					<?php
						echo $this->Form->input('product_code',array('class'=>'form-control','div'=>array('class'=>'form-group')));
						echo $this->Form->input('title',array('class'=>'form-control','div'=>array('class'=>'form-group')));
						echo $this->Form->input('meta_keys',array('class'=>'form-control','div'=>array('class'=>'form-group')));
						echo $this->Form->input('meta_description',array('type'=>'textarea', 'class'=>'form-control','div'=>array('class'=>'form-group')));
						echo $this->Form->input('quantity',array('type'=>'number', 'class'=>'form-control','div'=>array('class'=>'form-group')));
						echo $this->Form->input('price',array('label'=>'Base Price','data-ng-change'=>'calculateDiscount()','min'=>'0','data-ng-model'=>'basePrice', 'class'=>'form-control','div'=>array('class'=>'form-group')));
						echo $this->Form->input('discount.0.type',array('data-ng-change'=>'calculateDiscount()','data-ng-model'=>'discountType','options'=>array('fixed'=>'Fixed','percentage'=>'Percentage'), 'label'=>'Discount Type', 'class'=>'form-control','div'=>array('class'=>'form-group')));
						echo $this->Form->input('discount.1.amount',array('type'=>'number','min'=>'0', 'data-ng-change'=>'calculateDiscount()','label'=>'Discount Amount','data-ng-model'=>'discountAmount', 'class'=>'form-control','div'=>array('class'=>'form-group')));
						echo $this->Form->input('discount.2.finalDiscount',array('readonly'=>true, 'value'=>'{{finalDiscount}}', 'type'=>'number','label'=>'Discount', 'class'=>'form-control','div'=>array('class'=>'form-group')));
					?>
						<div class="group-control">
							<strong>Base Price : </strong>{{basePrice}} EUR
							<strong>Discount : </strong>{{finalDiscount}} EUR
							<strong>Sale Price : </strong>{{salePrice}} EUR
						</div>
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
		
		
			<div  data-ng-controller='ProductAttributeController' class="AttrDataHolder"  attribute_array ='<?php echo $productAttributes;?>'>
			<?php
				$option_values = json_encode($productTypes);
				echo $this->Form->input('type_id',array('type'=>'select', 'options'=>$productTypes, 'type_categories' => json_encode($productCategories), 'ng-change'=>'checkProductType()','ng-model'=>'productType', 'option_values'=>$option_values, 'required'=>true,'class'=>'form-control product_type','div'=>array('class'=>'form-group')));
			?>
				
			
				<div class = "row">
					<div class="col-md-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Categories </div>
							</div>
							<div class="panel-body category-brand-box">
								<label class='checkbox' style='margin-left : 20px;' data-ng-repeat="(id,value) in selected_type_categories.categories">
									<input id="ProductProductCategory{{$index}}CategoryId" type="checkbox" value="{{id}}" name="data[Product][ProductCategory][{{$index}}][category_id]">{{value}}
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
									echo "<label class='checkbox' style='margin-left : 20px;'>".$this->Form->input("Product.ProductBrand.{$i}.brand_id",array('type'=>'checkbox','value'=>$b_id,'label'=>false,'div'=>false))." {$b_title}</label>";
								$i++;
								endforeach;
							?>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">Related Products</div>
							</div>
							<div class="panel-body category-brand-box">
								<?php 
									static $j = 0;
									foreach($productList as $related_product => $name):
										echo "<label class='checkbox' style='margin-left : 20px;'>".$this->Form->input("Product.RelatedProduct.{$j}.related_product",array('type'=>'checkbox','value'=>$related_product,'label'=>false,'div'=>false))." {$name}</label>";
									$j++;
									endforeach;
								?>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<div class="row attr-inputs"></div>
			
			<!-- Upload Images -->
			
			<?php 
				echo $this->Form->input('status',array('options'=>$status, 'class'=>'form-control','div'=>array('class'=>'form-group')));
			?>
		</div>
	</div>
	
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
					<div class="col-md-4 individual-image">
						<div class="form-group">
							<span><input type ="file" name="data[Product][ProductImage][]" required onchange="processPreview(this)" class="product-image-input-field"></span>
							<div class="clearfix"></div>
						</div>
						<div class="image-preview "></div>
					</div>
				</div>
			</div>
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



