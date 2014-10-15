function process_type_forms(type){
	var attributes = new Array();
	var attribute_titles  = $('.attr-title');
	var attribute_labels = $('.attr-label');
	for(var i = 0;i<attribute_titles.length;i++){
		var t_v = attribute_titles.eq(i); // title
		var l_v = attribute_labels.eq(i); // label
		var attr  = new Array();
		attr['title'] = t_v.val();
		attr['attribute_label_id'] = l_v.val();
		
		
		//for edit
		if(type == 'edit'){
			if(t_v.attr('attribute_id') != ''){
				attr['id'] = t_v.attr('attribute_id');
			}
		}
		
		attr['AttributeValue'] = new Array();
		attributes.push(attr);
	}
	
	//get attr_value
	var attribute_value_holder  = $('.attr_value_holder');
	for(var i = 0;i<attribute_value_holder.length;i++){
		var a_v_h = attribute_value_holder.eq(i);
		var att_ind_val_holder = a_v_h.children('.attr_value');
		var attr_val = att_ind_val_holder.find('input');
		var attr_has_value = att_ind_val_holder.find('select');
		var attr_value = new Array();
		$.each(attr_val,function(){
			var a_v = new Array();
			a_v['value'] = $(this).val();
			if(type == 'edit'){
				if($(this).attr('attr_value_value_id') != ''){
					a_v['id'] = $(this).attr('attr_value_value_id');
				}
			}
			a_v['has_price'] = '';
			attr_value.push(a_v);
		});
		
		$.each(attr_has_value,function(ind,val){
			attr_value[ind]['has_price'] = $(val).val();
		});
		attributes[i]['AttributeValue'] = attr_value;
	}
	var type_data = new Array();
	type_data['Type'] = new Array();
	type_data['Type']['title'] = $('#TypeTitle').val();
	type_data['Type']['description'] = $('#TypeDescription').val();
	type_data['Type']['status'] = $('#TypeStatus').val();
	type_data['Type']['Attribute'] = attributes;
	
	var post_url = 'ajax_add';
	if(type == 'edit'){
		type_data['Type']['id'] = $('#TypeId').val();
	    post_url = '../ajax_edit';
	}
	
	//post
	$.ajax({
		type	 : 'POST',
		url 	 : post_url,
		data	 : convArrToObj(type_data)
	}).done(function(data){
		if(data == 'success'){
			var host = window.location.host;
			var pathname = window.location.pathname;
			var url_array = pathname.split('/');
			console.log(url_array);
			var new_url = '';
			var loop_length = url_array.length;
			if(type == 'edit'){
				loop_length = loop_length-1;
			}
			
			for (var i =1; i<loop_length;i++){
				if(i ==  loop_length -1 ){
					new_url += '/index';
				}else{
					new_url += '/'+url_array[i];
				}
			}
			window.location.replace(window.location.protocol+'//'+host+new_url);
		}else{
			var host = window.location.host;
			var pathname = window.location.pathname;
			var url_array = pathname.split('/');
			
			var new_url = '';
			
			var loop_length = url_array.length;
			if(type == 'edit'){
				loop_length = loop_length-1;
			}
			
			for (var i =1; i<loop_length;i++){
				if(i ==  loop_length -1 ){
					new_url += '/add';
				}else{
					new_url += '/'+url_array[i];
				}
			}
			
			window.location.replace(window.location.protocol+'//'+host+new_url);
			
		}
	}).error(function(){
		window.location.replace(window.location.protocol+'//'+window.location.host+window.location.pathname);
	});
		
	return false;
}

//add more attribute
function add_more_attr(){
	var attr_labels = $('.attr-label').html();
	var attr_label_html = '<div class="form-group"><label for="AttributeAttributeLabelId">Label</label><select id="AttributeAttributeLabelId" class="form-control attr-label" name="data[Attribute][attribute_label_id]">'+attr_labels+'</select></div>';
	var attr_html ='\
	<div class="attr">\
		<div class="row">\
			<div class="col-md-6">\
				<div class="row">\
					<div class="col-md-12">\
						<span onclick="remove_attr(this);" class="btn btn-warning btn-sm pull-right">Remove Attribute</span>\
					</div>\
				</div>\
				<div class="row">\
					<div class="col-md-12">\
						<div class="form-group required"><label for="AttributeTitle">Name</label><input type="text" required="required" id="AttributeTitle" maxlength="100" class="form-control attr-title" name="data[Attribute][title]"></div>'+attr_label_html+
					'</div>\
				</div>\
			</div>\
			<div class="col-md-6 ">\
				<div class="row">\
					<div class="col-md-12">\
						<span onclick="add_attr_value(this);" class="btn btn-success btn-sm pull-left">Add More Attribute Value</span>\
					</div>\
				</div>\
				<div class="row">\
					<div class="attr_value_holder">\
						<div class="attr_value">\
							<div class="col-md-9">\
								<div class="form-group">\
									<label for="AttributeValueValue">Value</label>\
									<input type="text" id="AttributeValueValue" class="form-control attr-value-value" name="data[AttributeValue][value]"></div>									<div class="form-group"><label for="AttributeValueHasValue">Has Price</label>\
									<select id="AttributeValueHasValue" class="form-control attr-value-has-value" name="data[AttributeValue][has_value]">\
										<option value="yes">Yes</option>\
										<option value="no">No</option>\
									</select>\
								</div>\
							</div>\
							<div class="col-md-3 clearfix">\
								<span onclick="remove_attr_value(this);" class="btn btn-warning btn-sm">Remove Value</span>\
							</div>\
						</div>\
						<div class="clearfix"></div>\
					</div>\
				</div>\
			</div>\
		</div>\
	</div>';
	$('.attr-holder').append(attr_html);
}
//remove attribute
function remove_attr(selector){

	var target = $(selector).parent().parent().parent().parent().parent();
	
	if($('.attr').length > 1){
		target.remove();
	}else{
		alert('Each type must have minimum one attribute and its values.');
	}
	
}


//add more attr values
function add_attr_value(selector){
	var holder_location = $(selector).parent().parent().next('div').children('.attr_value_holder');
	var html_form = '\
		<div class="attr_value">\
			<div class="col-md-9">\
				<div class="form-group">\
					<label for="AttributeValueValue">Value</label>\
					<input type="text" id="AttributeValueValue" class="form-control attr-value-value" name="data[AttributeValue][value]">\
				</div>\
				<div class="form-group">\
					<label for="AttributeValueHasValue">Has Price</label>\
					<select id="AttributeValueHasValue" class="form-control attr-value-has-value" name="data[AttributeValue][has_value]">\
						<option value="yes">Yes</option>\
						<option value="no">No</option>\
					</select>\
				</div>\
			</div>\
			<div class="col-md-3 clearfix">\
				<span onclick="remove_attr_value(this);" class="btn btn-warning btn-sm">Remove Value</span>\
			</div>\
		</div>';
	holder_location.append(html_form);
}

//remove attr_value
function remove_attr_value(selector){
	var target = $(selector).parent().parent();
	var parent = $(selector).parent().parent().parent();
	var parent_childs = parent.children('.attr_value');
	var parent_childs_no = parent_childs.length;
	if(parent_childs_no > 1){
		target.remove();
	}else{
		alert('Each Attribute must have minimum one values.');
	}
}

var convArrToObj = function(array){
    var thisEleObj = new Object();
    if(typeof array == "object"){
        for(var i in array){
            var thisEle = convArrToObj(array[i]);
            thisEleObj[i] = thisEle;
        }
    }else {
        thisEleObj = array;
    }
    return thisEleObj;
};



