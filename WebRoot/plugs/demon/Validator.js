//********Validator.js******** 
//@Author ComDeng 
//@Copyright www.runweb.cn 
//@Version 1.0 
//验证类 
function Validator(formId){ 
var _form; 
var _base=this; 
//验证类型-验证函数的hash表 
var _hashValidEvent={ 
"empty":"ValidEmpty", 
"email":"ValidEmail", 
"number":"ValidNumber", 
"compare":"ValidCompare", 
"regex":"ValidRegex", 
"custom":"ValidCustom", 
"chinese":"ValidChinese", 
"length":"ValidLength" 
}; 
//控件Id-验证事件的hash表 
var _hashControlEvent=[]; 
//临时验证消息显示的控件列表 
var _tempControlList=[]; 

if(formId && document.getElementById(formId)){ 
_form=document.getElementById(formId); 
}else if(document.forms[0]){ 
_form=document.forms[0]; 
}else{ 
alert("不存在你制定的表单或者调用页面中不存在表单"); 
} 

//当验证开始时调用的函数 
this.onValidBegin=null; 

//当验证完毕时调用的函数 
this.onValidEnd=null; 

//提交时进行验证 
_form.onsubmit=function(){ 
var pass=true; 
if(_base.onValidBegin!=null){ 
_base.onValidBegin(); 
} 

for(id in _hashControlEvent){ 
if(!document.getElementById(id).onblur() && pass) 
pass=false; 
} 

if(_base.onValidEnd!=null){ 
_base.onValidEnd(); 
} 
return pass; 
}; 


//添加验证事件 
this.add=function(controlId,type,msg,target,operator,helpVar,helpValue){ 
this.addItem(controlId,new ValidItem(type,msg,target,operator,helpVar,helpValue)); 
} 

//添加验证项 
this.addItem=function(controlId,item){ 
if(!document.getElementById(controlId)){ 
alert("您指定的表单中不存在ID为" + controlId + "的控件！"); 
return; 
} 
if(!_hashControlEvent[controlId]){ 
_hashControlEvent[controlId]=[]; 
} 
_hashControlEvent[controlId].push(item); 
} 


//初始化验证类 
this.format=function(){ 
for(id in _hashControlEvent){ 
initControlValid(id); 
} 
} 

//注册验证事件 
this.registValidEvent=function(name,func){ 
_hashValidEvent[name]=func; 
this[func]=null; 
}; 

//添加临时错误信息显示的公用函数 
this.addTemp=function(controlId,msg,hint){ 
var ctl=document.getElementById(controlId); 
if(!ctl){ 
alert("不存在ID为" + controlId + "的控件！"); 
return; 
} 
var span=document.createElement("span"); 
span.style.color="red"; 
span.style.marginLeft="4px"; 
if(msg){ 
span.innerHTML=msg; 
} 
if(hint){ 
span.title=hint; 
} 
if(ctl.nextSibling){ 
ctl.parentNode.insertBefore(span,ctl.nextSibling); 
}else{ 
ctl.parentNode.appendChild(span); 
} 
_tempControlList.push(span); 
} 

//初始化控件的验证函数 
function initControlValid(controlId){ 
var ctl=document.getElementById(controlId); 
var vldArray=_hashControlEvent[controlId]; 

for(var i=0;i<vldArray.length;i++){ 
var span=document.createElement("span"); 
span.style.color="red"; 
span.style.marginLeft="4px"; 
if(vldArray[i].Hint){ 
span.title=vldArray[i].Hint; 
} 
if(vldArray[i].Type=="empty"){ 
span.innerHTML="*"; 
} 

if(ctl.nextSibling){ 
ctl.parentNode.insertBefore(span,ctl.nextSibling); 
}else{ 
ctl.parentNode.appendChild(span); 
} 

vldArray[i].SpanCtl=span; 
} 

ctl.onblur=function(){ 
if(_tempControlList && _tempControlList.length>0){ 
for(var i=0;i<_tempControlList.length;i++){ 
_tempControlList[i].parentNode.removeChild(_tempControlList[i]); 
} 
_tempControlList=null; 
} 
var pass=true; 
for(var i=0;i<vldArray.length;i++){ 
var item=vldArray[i]; 
var func=_hashValidEvent[item.Type]; 
if(func && !_base[func].apply(this,[item]) && pass){ 
pass=false; 
} 
} 
return pass; 
} 
} 

//验证是否为空 
this.ValidEmpty=function(item){ 
if(!this.options){ //如果不是select控件 
return Validator.ShowMsg(this.value.replace(/(^\s*)|(\s*$)/g, "")!="",item); 
}else{ 
return Validator.ShowMsg(this.selectedIndex>0,item); 
} 
} 

//验证是否是Email 
this.ValidEmail=function(item){ 
return Validator.ShowMsg(this.value=="" || /\w+@\w+.\w+/.test(this.value),item); 
} 

//验证是否为数字 
this.ValidNumber=function(item){ 
return Validator.ShowMsg(this.value=="" || /\d+/.test(this.value),item); 
} 

//比较 
this.ValidCompare=function(item){ 
var pass; 
var sValue,cValue; 
var method=item.HelpType; 
var target=item.Target; 
if(!method) method="number"; 
switch(method){ 
case "number": //进行数值的比较 
sValue=new Number(this.value); 
cValue=target; 
break; 
case "string": //进行字符串的比较 
sValue=this.value; 
cValue=target; 
break; 
case "ctl": //进行控件的值的比较 
sValue=new String(this.value); 
cValue=document.getElementById(target).value; 
break; 
} 
if(!item.HelpValue){ //如果类型辅助值为空 
switch(item.Operator){ 
case "=": 
return Validator.ShowMsg(sValue==cValue,item); 
break; 
case "<": 
return Validator.ShowMsg(sValue<cValue,item); 
break; 
case ">": 
return Validator.ShowMsg(sValue>cValue,item); 
break; 
case "<=": 
return Validator.ShowMsg(sValue<=cValue,item); 
break; 
case ">=": 
return Validator.ShowMsg(sValue>=cValue,item); 
break; 
case "!=": 
return Validator.ShowMsg(sValue!=cValue,item); 
break; 
} 
}else{ 
var mValue=item.HelpValue; 
switch(item.Operator){ 
case "<>": 
return Validator.ShowMsg(sValue<cValue || sValue>mValue,item); 
break; 
case "<=>": 
return Validator.ShowMsg(sValue<=cValue || sValue>mValue,item); 
break; 
case "<>=": 
return Validator.ShowMsg(sValue<cValue || sValue>=mValue,item); 
break; 
case "<=>=": 
return Validator.ShowMsg(sValue<=cValue || sValue>=mValue,item); 
break; 
case "><": 
return Validator.ShowMsg(sValue>cValue && sValue<mValue,item); 
break; 
case ">=<": 
return Validator.ShowMsg(sValue>=cValue && sValue<mValue,item); 
break; 
case "><=": 
return Validator.ShowMsg(sValue>cValue && sValue<=mValue,item); 
break; 
case ">=<=": 
return Validator.ShowMsg(sValue>=cValue && sValue<=mValue,item); 
break; 
case "!=": 
return Validator.ShowMsg(sValue!=cValue && sValue!=mValue,item); 
break; 
} 
} 
} 

//验证正则表达式 
this.ValidRegex=function(item){ 
return Validator.ShowMsg(item.Target.test(this.value),item); 
} 

//验证是否为中文 
this.ValidChinese=function(item){ 
return Validator.ShowMsg(/[\u4e00-\u9fa5]+/.test(this.value),item); 
} 

//自定义验证方式 
this.ValidCustom=function(item){ 
return item.Target.apply(this,[item]); 
} 

//验证长度 
this.ValidLength=function(item){ 
if(this.value=="") return true; 
var length=this.value.replace(/[^\x00-\xff]/g, "aa").length; //将一个汉字算作两个字符的长度 
var target=item.Target; 
if(!item.HelpValue){ //如果类型辅助变量为空 
switch(item.Operator){ 
case "=": 
return Validator.ShowMsg(length==target,item); 
break; 
case "<": 
return Validator.ShowMsg(length<target,item); 
break; 
case ">": 
return Validator.ShowMsg(length>target,item); 
break; 
case "<=": 
return Validator.ShowMsg(length<=target,item); 
break; 
case ">=": 
return Validator.ShowMsg(length>=target,item); 
break; 
case "!=": 
return Validator.ShowMsg(length!=target,item); 
break; 
} 
}else{ 
var helpTarget=item.HelpValue; 
switch(item.Operator){ 
case "<>": 
return Validator.ShowMsg(length<target || length>helpTarget,item); 
break; 
case "<=>": 
return Validator.ShowMsg(length<=target || length>helpTarget,item); 
break; 
case "<>=": 
return Validator.ShowMsg(length<target || length>=helpTarget,item); 
break; 
case "<=>=": 
return Validator.ShowMsg(length<=target || length>=helpTarget,item); 
break; 
case "><": 
return Validator.ShowMsg(length>target && length<helpTarget,item); 
break; 
case ">=<": 
return Validator.ShowMsg(length>=target && length<helpTarget,item); 
break; 
case "><=": 
return Validator.ShowMsg(length>target && length<=helpTarget,item); 
break; 
case ">=<=": 
return Validator.ShowMsg(length>=target && length<=helpTarget,item); 
break; 
case "!=": 
return Validator.ShowMsg(length!=target && length!=helpTarget,item); 
break; 
} 
} 
} 
} 
//用来显示错误信息的公用函数 
Validator.ShowMsg=function(pass,item){ 
var msg=item.Msg; 
if(item.Icon){ 
msg=("<img src=\"" + item.Icon + "\">" + msg); 
} 

item.SpanCtl.style.display=(pass?"none":""); 
item.SpanCtl.innerHTML=(!pass?msg:""); 
return pass; 
} 

//验证项，存储验证事件的信息 
//@msg  验证未通过时显示的信息 
//@type 验证的类型 
//@target 验证的目标 
//@operator 验证的操作符 
//@helpType 对类型进行辅助的变量 
//@helpValue对应辅助变量的值 
function ValidItem(type,msg,target,operator,helpType,helpValue){ 
this.Type=type; 
this.Msg=msg; 
this.Target=target; 
this.Operator=operator; 
this.HelpType=helpType; 
this.HelpValue=helpValue; 
}