var slimeValidator = new Object();

slimeValidator.validateMode = "";

slimeValidator.textContent = "";

slimeValidator.errorMassage = "";

slimeValidator.validator = function(textContent, mode){
	var regex = "^Empty|Email|Char|Number|Chinese|UpCase|LowerCase|Null$";
	if(mode.match(regex)){
		this.validateMode = mode;
		this.textContent = textContent.replace(/(^\s*)|(\s*$)/g, "");
		return this.validate();
	}else{
		alert("无效验证方式！");
		return;
	}
}

slimeValidator.validate = function(){
	var regex = "";
	if(this.validateMode == "Empty"){
		return this.validateEmpty();
	}else if(this.validateMode == "Email"){
		regex = "^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$";
		return this.judgeRegex(regex);
	}else if(this.validateMode == "Char"){
		regex = "^[a-zA-Z]+$";
		return this.judgeRegex(regex);
	}else if(this.validateMode == "Number"){
		regex = "^[0-9]+$";
		return this.judgeRegex(regex);
	}else if(this.validateMode == "Chinese"){
		regex = "^[\u4e00-\u9fa5]+$";
		return this.judgeRegex(regex);
	}else if(this.validateMode == "UpCase"){
		regex = "^[A-Z0-9]+$";
		return this.judgeRegex(regex);
	}else if(this.validateMode == "LowerCase"){
		regex = "^[a-z0-9]+$";
		return this.judgeRegex(regex);
	}else if(this.validateMode == "Null"){
		return this.validateNull();
	}
}

slimeValidator.judgeRegex = function(regex){
	if(this.textContent.match(regex)){
		return true;
	}else{
		return false;
	}
}

slimeValidator.validateNull = function(){
	if(this.textContent == null){
		return true;
	}else{
		return false;
	}
}

slimeValidator.validateEmpty = function(){
	if(this.textContent == null){
		return true;
	}else if(this.textContent == ""){
		return true;
	}else{
		return false;
	}
}

slimeValidator.testFileUrl = function() {
	alert("成功引入slimeValidator.js文件！");
}