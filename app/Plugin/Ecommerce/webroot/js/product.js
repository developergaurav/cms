/* angular section */
var product = angular.module('product',[]);

product.controller('ProductAttributeController', ['$scope', function($scope) {
	$scope.AttrData = JSON.parse($('.AttrDataHolder').attr('attribute_array'));
	$scope.option_list =JSON.parse($('.product_type').attr('option_values'));
	
	//check is edit
	 var is_edit_form = function(){
		if($('.attr-inputs').attr('existing-values') != undefined){
			return JSON.parse($('.attr-inputs').attr('existing-values'));
		}else{
			return false;
		}
	}
	
	//set default product type 
	$scope.defaultSelectedType = function(){
		
		if(angular.isUndefined($('.product_type').attr('selected_value')) == true){
			var i = 0;
			$.each($scope.option_list,function(ind,val){
				if(i ==0){
					$scope.productType = ind;
				}
				i++;
			});
		}else{
			$scope.productType = $('.product_type').attr('selected_value');
		}
	}
	
	//check pruduct type
	$scope.checkProductType = function(){
		$scope.productType = $('.product_type').val();
	}
	
	//watch productType and filter attributes and values
	$scope.selected_attr = new Object();
	
	$scope.$watch('productType',function(){
		if($scope.productType != undefined){
			$.each($scope.AttrData,function(ind,val){
				if(val.Type.id == $scope.productType){
					$scope.selected_attr = val.Attribute;
				}
			});
		}else{
			$scope.defaultSelectedType();
		}
	});

	//process form according to filtered attribute and attribute value 
	
	$scope.$watch('selected_attr',function(){
		var attr_html = '';
		if(is_edit_form() == false){
			//for product add
			$.each($scope.selected_attr,function(ind,val){
				attr_html += '<div class="col-md-4">';
					attr_html += '<div class="attribute-id-holder"><input type="checkbox" value="'+val.id+'" checked name=data[Product][ProductAttribute]['+ind+'][attribute_id]> '+val.title +'</div>';
					$.each(val.AttributeValue,function(i,v){
						
						attr_html+= '<div><span class="pull-left"> <input type="checkbox" value="'+v.id+'" checked name=data[Product][ProductAttribute]['+ind+'][ProductAttributeValue]['+i+'][attribute_value_id] > '+v.value+'</span>';
						if(v.has_price == 'yes'){
							attr_html+='<span class="pull-right"><input name=data[Product][ProductAttribute]['+ind+'][ProductAttributeValue]['+i+'][price] placeholder="Price"></span>';
						}
						attr_html+= '<div class="clearfix"></div></div>';
						
					});
				attr_html += '</div>';
			});
		}else{
			//for edit form
			var existing_value = is_edit_form();
			$.each($scope.selected_attr,function(ind,val){
				//attribute is checked or not 
				var attribute_checked = '';
				var existing_attribute_value_value = '';
				
				$.each(existing_value,function(existing_ind, existing_value){
					if(existing_value.attribute_id == val.id){
						attribute_checked  = 'checked';
						existing_attribute_value_value = existing_value.ProductAttributeValue;
					}
				})
				
					
				attr_html += '<div class="col-md-4">';
					attr_html += '<div class="attribute-id-holder"><input type="checkbox" value="'+val.id+'" name=data[Product][ProductAttribute]['+ind+'][attribute_id] '+attribute_checked+' > '+val.title +'</div>';
					
					//attribute value section
					$.each(val.AttributeValue,function(i,v){
						
						
						var existing_attribute_value_value_check = '';
						var price = '';
						$.each(existing_attribute_value_value,function(existing_value_ind, existing_value_value){
							if(existing_value_value.attribute_value_id == v.id){
								existing_attribute_value_value_check  = 'checked';
								price = 'value="'+existing_value_value.price+'"';
							}
						})
						
						attr_html+= '<div><span class="pull-left"> <input type="checkbox" '+existing_attribute_value_value_check+' value="'+v.id+'"  name=data[Product][ProductAttribute]['+ind+'][ProductAttributeValue]['+i+'][attribute_value_id] > '+v.value+'</span>';
						if(v.has_price == 'yes'){
							attr_html+='<span class="pull-right"><input '+price+' name=data[Product][ProductAttribute]['+ind+'][ProductAttributeValue]['+i+'][price] placeholder="Price"></span>';
						}
						attr_html+= '<div class="clearfix"></div></div>';
					});
				attr_html += '</div>';
			});
		}
		
		
		//print attribute and attribute value form
		$('.attr-inputs').empty().html(attr_html);
		
	});
	
}]);

