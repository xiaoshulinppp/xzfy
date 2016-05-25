//邮政编码的验证
function isPostalCode(object) {
	var s = object.value;
	var pattern = /^[0-9]{6}$/;
	if (s != "") {
		if (!pattern.exec(s)) {
			$("postcode").innerHTML = "\u8bf7\u8f93\u5165\u6b63\u786e\u7684\u90ae\u653f\u7f16\u7801";
			object.value = "";
			object.focus();
		}
	}
}
            //身份证的验证
function checkIdcard(idcard) {
	var Errors = new Array("", "\u8eab\u4efd\u8bc1\u53f7\u7801\u4f4d\u6570\u4e0d\u5bf9!", "\u8eab\u4efd\u8bc1\u53f7\u7801\u51fa\u751f\u65e5\u671f\u8d85\u51fa\u8303\u56f4\u6216\u542b\u6709\u975e\u6cd5\u5b57\u7b26!", "\u8eab\u4efd\u8bc1\u53f7\u7801\u6821\u9a8c\u9519\u8bef!", "\u8eab\u4efd\u8bc1\u5730\u533a\u975e\u6cd5!");
	var area = {11:"\u5317\u4eac", 12:"\u5929\u6d25", 13:"\u6cb3\u5317", 14:"\u5c71\u897f", 15:"\u5185\u8499\u53e4", 21:"\u8fbd\u5b81", 22:"\u5409\u6797", 23:"\u9ed1\u9f99\u6c5f", 31:"\u4e0a\u6d77", 32:"\u6c5f\u82cf", 33:"\u6d59\u6c5f", 34:"\u5b89\u5fbd", 35:"\u798f\u5efa", 36:"\u6c5f\u897f", 37:"\u5c71\u4e1c", 41:"\u6cb3\u5357", 42:"\u6e56\u5317", 43:"\u6e56\u5357", 44:"\u5e7f\u4e1c", 45:"\u5e7f\u897f", 46:"\u6d77\u5357", 50:"\u91cd\u5e86", 51:"\u56db\u5ddd", 52:"\u8d35\u5dde", 53:"\u4e91\u5357", 54:"\u897f\u85cf", 61:"\u9655\u897f", 62:"\u7518\u8083", 63:"\u9752\u6d77", 64:"\u5b81\u590f", 65:"\u65b0\u7586", 71:"\u53f0\u6e7e", 81:"\u9999\u6e2f", 82:"\u6fb3\u95e8", 91:"\u56fd\u5916"};
	var idcard, Y, JYM;
	var S, M;
	var idcard_array = new Array();
	idcard_array = idcard.split(""); 
                                    //地区检验 
	if (area[parseInt(idcard.substr(0, 2))] == null) {
		return Errors[4];
	} 
                                    //身份号码位数及格式检验 
	switch (idcard.length) {
	  case 15:
		if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0 || ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0)) {
			ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//测试出生日期的合法性 
		} else {
			ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//测试出生日期的合法性 
		}
		if (ereg.test(idcard)) {
			return Errors[0];
		} else {
			return Errors[2];
		}
		break;
	  case 18: 
                                    //18位身份号码检测
                                    //出生日期的合法性检查
                                    //闰年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
                                    //平年月日:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8])) 
		if (parseInt(idcard.substr(6, 4)) % 4 == 0 || (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard.substr(6, 4)) % 4 == 0)) {
			ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//闰年出生日期的合法性正则表达式 
		} else {
			ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//平年出生日期的合法性正则表达式 
		}
		if (ereg.test(idcard)) {//测试出生日期的合法性
                                    //计算校验位 
			S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7 + (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9 + (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10 + (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5 + (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8 + (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4 + (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2 + parseInt(idcard_array[7]) * 1 + parseInt(idcard_array[8]) * 6 + parseInt(idcard_array[9]) * 3;
			Y = S % 11;
			M = "F";
			JYM = "10X98765432";
			M = JYM.substr(Y, 1);//判断校验位 
			if (M == idcard_array[17]) {
				return Errors[0];
			} else {
				return Errors[3];
			}
		} else {
			return Errors[2];
		}
		break;
	  default:
		return Errors[1];
		break;
	}
}
function check(obj) {
	var error = checkIdcard(obj.value);
	if(error!=""||error!=undefined){
	$("error").innerText = error;
	}
}
 //以上是身份证验证
   
            //全选，全不选
function check_all(obj, cName) {
	var checkboxs = document.getElementsByName(cName);
	for (var i = 0; i < checkboxs.length; i++) {
		checkboxs[i].checked = obj.checked;
	}
}



function fn() {
	var isHidden = event.srcElement.value == 1 ? true : false;
	if (isHidden) {
		$("postcard").show();
	} else {
		$("postcard").hide();
	}
}

function isDelay(){
 var hasDelay = event.srcElement.value==1?true:false;
 if(hasDelay){
 	$('delay').show();
 	$('delay').innerHTML='<input type="text" name="administrativeCase.timeExtend" class="inputTextNormal" onfocus="WdatePicker()">';
 }else{
    $('delay').hide();
    $('delay').innerHTML="";
 }
 
}
