/*****************************************************************************
函数名称：CheckBlur
处理机能：模糊查询

日期	：2008/12/29

******************************************************************************/
function CheckBlur2() {
  	if(document.getElementById("checkbox2").checked==true){
		document.getElementById("organCode.orgCode").value+="%";
	}else{
		len=document.getElementById("organCode.orgCode").value.length-1;
		document.getElementById("organCode.orgCode").value=(document.getElementById("organCode.orgCode").value).substring(0,len);
	}
}
function CheckBlur3() {	
	if(document.getElementById("checkbox3").checked==true){
		document.getElementById("organCode.orgTypeCode").value+="%";
	}else{
		len=document.getElementById("organCode.orgTypeCode").value.length-1;
		document.getElementById("organCode.orgTypeCode").value=(document.getElementById("organCode.orgTypeCode").value).substring(0,len);
	}
}
function CheckBlur4() {	
	if(document.getElementById("checkbox4").checked==true){
		document.getElementById("organCode.orgName").value+="%";
	}else{
		len=document.getElementById("organCode.orgName").value.length-1;
		document.getElementById("organCode.orgName").value=(document.getElementById("organCode.orgName").value).substring(0,len);
	}
}
function CheckBlur5() {	
	if(document.getElementById("checkbox5").checked==true){
		document.getElementById("organCode.ecnomicIndustryCode").value+="%";
	}else{
		len=document.getElementById("organCode.ecnomicIndustryCode").value.length-1;
		document.getElementById("organCode.ecnomicIndustryCode").value=(document.getElementById("organCode.ecnomicIndustryCode").value).substring(0,len);
	}
}
function CheckBlur6() {	
	if(document.getElementById("checkbox6").checked==true){
		document.getElementById("organCode.areaCode").value+="%";
	}else{
		len=document.getElementById("organCode.areaCode").value.length-1;
		document.getElementById("organCode.areaCode").value=(document.getElementById("organCode.areaCode").value).substring(0,len);
	}
}
function CheckBlur7() {	
	if(document.getElementById("checkbox7").checked==true){
		document.getElementById("organCode.orgAddress").value+="%";
	}else{
		len=document.getElementById("organCode.orgAddress").value.length-1;
		document.getElementById("organCode.orgAddress").value=(document.getElementById("organCode.orgAddress").value).substring(0,len);
	}
}
function CheckBlur8() {	
	if(document.getElementById("checkbox8").checked==true){
		document.getElementById("organCode.telNo").value+="%";
	}else{
		len=document.getElementById("organCode.telNo").value.length-1;
		document.getElementById("organCode.telNo").value=(document.getElementById("organCode.telNo").value).substring(0,len);
	}
}
function CheckBlur9() {
  	if(document.getElementById("checkbox9").checked==true){
		document.getElementById("organCode.regNo").value+="%";
	}else{
		len=document.getElementById("organCode.regNo").value.length-1;
		document.getElementById("organCode.regNo").value=(document.getElementById("organCode.regNo").value).substring(0,len);
	}
}
function CheckBlur10() {	
	if(document.getElementById("checkbox10").checked==true){
		document.getElementById("organCode.businessScope").value+="%";
	}else{
		len=document.getElementById("organCode.businessScope").value.length-1;
		document.getElementById("organCode.businessScope").value=(document.getElementById("organCode.businessScope").value).substring(0,len);
	}
}
function CheckBlur11() {	
	if(document.getElementById("checkbox11").checked==true){
		document.getElementById("organCode.ecnomicTypeCode").value+="%";
	}else{
		len=document.getElementById("organCode.ecnomicTypeCode").value.length-1;
		document.getElementById("organCode.ecnomicTypeCode").value=(document.getElementById("organCode.ecnomicTypeCode").value).substring(0,len);
	}
}
function CheckBlur12() {	
	if(document.getElementById("checkbox12").checked==true){
		document.getElementById("organCode.regMoney").value+="%";
	}else{
		len=document.getElementById("organCode.regMoney").value.length-1;
		document.getElementById("organCode.regMoney").value=(document.getElementById("organCode.regMoney").value).substring(0,len);
	}
}
function CheckBlur13() {	
	if(document.getElementById("checkbox13").checked==true){
		document.getElementById("organCode.moneyCode").value+="%";
	}else{
		len=document.getElementById("organCode.moneyCode").value.length-1;
		document.getElementById("organCode.moneyCode").value=(document.getElementById("organCode.moneyCode").value).substring(0,len);
	}
}
function CheckBlur14() {	
	if(document.getElementById("checkbox14").checked==true){
		document.getElementById("organCode.legalPerson").value+="%";
	}else{
		len=document.getElementById("organCode.legalPerson").value.length-1;
		document.getElementById("organCode.legalPerson").value=(document.getElementById("organCode.legalPerson").value).substring(0,len);
	}
}
function CheckBlur15() {	
	if(document.getElementById("checkbox15").checked==true){
		document.getElementById("organCode.organCode").value+="%";
	}else{
		len=document.getElementById("organCode.organCode").value.length-1;
		document.getElementById("organCode.organCode").value=(document.getElementById("organCode.organCode").value).substring(0,len);
	}
}
function select_tree(funcCode,field_name,field_id,flag){
	window.open("../frk/showTreeDictItemTree.action?funcCode="+funcCode+"&fieldName=" + field_name + "&fieldId=" + field_id+ "&dictType=" + flag,"","width=300,height=500,resizable=1,scrollbars=1,left=50,top=50");
		
}
