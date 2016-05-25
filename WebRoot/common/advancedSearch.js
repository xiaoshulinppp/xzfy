
function fieldChanged(field){
	for(i=0;i<field.options.length;i++){
		if(field.options[i].value == field.value){
			searchEditor.showValue(i);
			break;
		}
	}
}

function addExp(){
	searchEditor.addExp();
}

function removeExp(){
	searchEditor.removeExp();
}

function submitSearch(){
	searchEditor.submit();
}

function addBracket(){
	searchEditor.addBracket();
}

function removeBracket(){
	searchEditor.removeBracket();
}


function SearchEditor(){
	var field_dict;
	var field_type;
	var value_select;
	var value_input;
	var link_element;
	var equation_element;
	var exp_show_element;
	var exp_value_element;
	var form_element;
	var field_element;

	var exp_items;

	var equation_store;

	this.init = function(field_dict_,field_type_){
		this.field_dict = field_dict_;
		this.field_type = field_type_;
		this.value_select = document.getElementById("value_select");
		this.value_input = document.getElementById("value_input");
		this.link_element = document.getElementById("link_element");
		this.equation_element = document.getElementById("equation_element");
		this.exp_show_element = document.getElementById("exp_show");
		this.exp_value_element = document.getElementById("exp_value");
		this.form_element = document.getElementById("search_form");
		this.field_element = document.getElementById("field_element");
		this.exp_items = new Array(0);
		this.equation_store = -1;
	}


	this.initSelect = function(field_id){
		while(this.value_select.options != null && this.value_select.options.length>0){
				this.value_select.options.removeChild(this.value_select.options[0]);
		}
		for(i=0;i<this.field_dict[field_id].length;i+=2){
			this.value_select.options[this.value_select.options.length] = new Option(this.field_dict[field_id][i],this.field_dict[field_id][i+1]);
			if(this.value_select.options.length == 1){
				this.value_select.options[0].selected = true;
			}
		}
	}

	this.showValue = function(field_id){
		if(this.field_type[field_id] == "select"){
			this.initSelect(field_id);
			this.value_input.style.display="none";
			this.value_select.style.display="block";
			if(this.equation_store == -1){
				this.equation_store = this.getSelectedIndex(this.equation_element);
				if(this.equation_store == -1)this.equation_store = 0;
				this.equation_element.options[this.equation_store].selected = false;
				this.equation_element.options[0].selected = true;
				this.equation_element.disabled = true;
			}
		}
		else{
			this.value_input.style.display="block";
			this.value_select.style.display="none";
			if(this.equation_store != -1){
				this.equation_element.options[this.equation_store].selected = true;
				this.equation_element.options[0].selected = false;
				this.equation_element.disabled = false;
			}
			this.equation_store = -1;
		}
	}

	this.getSelectedIndex = function(select){
		for(var i=0;select.options != null && i<select.options.length;i++){
			if(select.options[i].selected){
				return i;
			}
		}
		return -1;
	}

	this.getSelected = function(select){
		var i = this.getSelectedIndex(select);
		if(i >= 0){
			return select.options[i];
		}
	}

	this.addExp = function(){
		var value_for_value = this.value_input.value;
		var value_for_show = this.value_input.value;
		if(this.value_select.style.display == "block"){
			value_for_value = this.getSelected(this.value_select).value;
			value_for_show = this.getSelected(this.value_select).innerHTML;
		}
		var i = this.exp_show_element.options.length;
		this.exp_items[i] = new ExpItem();
		this.exp_items[i].leftBracketCount = 0;
		this.exp_items[i].rightBracketCount = 0;
		this.exp_items[i].link = this.getSelected(this.link_element).value;
		this.exp_items[i].field = this.getSelected(this.field_element).value;
		this.exp_items[i].equation = this.getSelected(this.equation_element).value;
		this.exp_items[i].value = value_for_value;
		this.exp_items[i].link_show = this.getSelected(this.link_element).innerHTML;
		this.exp_items[i].field_show = this.getSelected(this.field_element).innerHTML;
		this.exp_items[i].equation_show = this.getSelected(this.equation_element).innerHTML;
		this.exp_items[i].value_show = value_for_show;

		this.exp_show_element.options[this.exp_show_element.options.length] = new Option();
		this.exp_show_element.options[this.exp_show_element.options.length-1].innerHTML = this.getExpShow(this.exp_items[i]);
	}

	this.getExpShow = function(exp_item){
		var leftBracket = "";
		var rightBracket = ""
		for(var i = 0;i<exp_item.leftBracketCount;i++){
			leftBracket += "(";
		}
		for(var i = 0;i<exp_item.rightBracketCount;i++){
			rightBracket += ")";
		}

		var exp = exp_item.link_show+" "+leftBracket+exp_item.field_show+" "+" "+exp_item.equation_show+" \""+exp_item.value_show+"\""+rightBracket;
		return exp;
	}

	this.removeExp = function(){
		for(var i=0;this.exp_show_element.options != null && i<this.exp_show_element.options.length;i++){
			if(this.exp_show_element.options[i].selected){
				this.exp_show_element.options.removeChild(this.exp_show_element.options[i]);
				this.exp_items.removeChild(exp_items[i]);
				i--;
			}
		}
		
	}

	this.submit = function(){
		exp = " 1=1 ";
		for(var i=0;this.exp_items != null && i < this.exp_items.length;i++){
			if(this.exp_items[i] != null){
				exp +=  this.exp_items[i].toExp();
			}
		}
		this.exp_value_element.value = exp;
		this.form_element.submit();
	}

	this.addBracket = function(){
		var start = -1;
		var end = -1;
		for(var i=0;this.exp_show_element.options != null && i<this.exp_show_element.options.length;i++){
			if(this.exp_show_element.options[i].selected){
				end = i;
				if(start == -1){
					start = i;
				}
			}
		}
		if(start != -1){
			if(start != end){
				var bracketCount = this.exp_items[start].rightBracketCount;
				bracketCount -= this.exp_items[end].leftBracketCount;
				for(var i = start + 1;i < end;i++){
					bracketCount += this.exp_items[i].rightBracketCount;
					bracketCount -= this.exp_items[i].leftBracketCount;
				}
				if(bracketCount != 0 && bracketCount + this.exp_items[end].rightBracketCount - this.exp_items[start].leftBracketCount != 0){
					alert("您不能这样添加括号");
					return;
				}
			}
			this.exp_items[start].leftBracketCount++;
			this.exp_items[end].rightBracketCount++;
			this.exp_show_element.options[start].innerHTML = this.getExpShow(this.exp_items[start]);
			this.exp_show_element.options[end].innerHTML = this.getExpShow(this.exp_items[end]);
		}
	}

	this.removeBracket = function(){
		var index = this.getSelectedIndex(this.exp_show_element);
		if(index >= 0){
			if(this.exp_items[index].leftBracketCount > 0){
				var bracketCount = 1 - this.exp_items[index].rightBracketCount;
				this.exp_items[index].leftBracketCount--;
				this.exp_show_element.options[index].innerHTML = this.getExpShow(this.exp_items[index]);
				for(var i = index;i <this.exp_items.length;){
					if(bracketCount <= 0){
						this.exp_items[i].rightBracketCount --;
						this.exp_show_element.options[i].innerHTML = this.getExpShow(this.exp_items[i]);
						return;
					}
					i ++;
					bracketCount += this.exp_items[i].leftBracketCount;
					bracketCount -= this.exp_items[i].rightBracketCount;
				}
			}
			else if(this.exp_items[index].rightBracketCount > 0){
				var bracketCount = 1 - this.exp_items[index].leftBracketCount;
				this.exp_items[index].rightBracketCount--;
				this.exp_show_element.options[index].innerHTML = this.getExpShow(this.exp_items[index]);
				for(var i = index;i >= 0;){
					if(bracketCount <= 0){
						this.exp_items[i].leftBracketCount --;
						this.exp_show_element.options[i].innerHTML = this.getExpShow(this.exp_items[i]);
						return;
					}
					i --;
					bracketCount -= this.exp_items[i].leftBracketCount;
					bracketCount += this.exp_items[i].rightBracketCount;
				}
			}
		}
	}

	function ExpItem(){
		var leftBracketCount;//
		var rightBracketCount;//
		var link;
		var field;
		var equation;
		var value;

		var link_show;
		var field_show;
		var equation_show;
		var value_show;

		this.toExp = function(){
			var valueExp = this.value;
			if(this.equation == "like"){
				valueExp = "%" + this.value + "%";
			}
			var leftBracket = "";
			var rightBracket = ""
			for(var i = 0;i<this.leftBracketCount;i++){
				leftBracket += "(";
			}
			for(var i = 0;i<this.rightBracketCount;i++){
				rightBracket += ")";
			}
			var exp = " " + this.link + " " + leftBracket + " " + this.field + " " + this.equation + " '" + valueExp + "'" + rightBracket;
			return exp;
		}
	}
}

