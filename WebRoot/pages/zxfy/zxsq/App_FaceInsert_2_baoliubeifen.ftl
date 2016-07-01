<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<script language="JavaScript">
/*****************身份证阅读器读取js代码*************************/
	function HideActiveX() {
	   //CVR_IDCard.Visible=false; 
	   ClearIDCard();
//	   ClearForm(); 
//	   document.all['ReadResult'].value ="等待验证";
	   document.getElementById("ReadResult").innerHTML ="<font color='orange'>等待读取身份证信息...</font>";
	   document.getElementById("ReadResult2").innerHTML ="<font color='orange'>等待读取身份证信息...</font>";
//	   $('#ReadResult').text('等待验证');
//	   return true;
	}

	function ClearIDCard() {
	   CVR_IDCard.Name="";
//	   CVR_IDCard.NameL="";
	   CVR_IDCard.Sex="";   
	   //CVR_IDCard.SexL="";   
	   CVR_IDCard.Nation="";
	   //CVR_IDCard.NationL="";
	   CVR_IDCard.Born="";
	   //CVR_IDCard.BornL="";
	   CVR_IDCard.Address="";
	   CVR_IDCard.CardNo="";
	   CVR_IDCard.Police="";
	   CVR_IDCard.Activity="";
	   CVR_IDCard.NewAddr="";
	  
//	   return true;
	}

	function ClearForm() {
	   document.all['bjdr1'].value = ""; 
	   document.all['bsex'].value = ""; 
//	   document.all['Nation'].value = ""; 
//	   document.all['Born'].value = ""; 
//	   document.all['Address'].value = ""; 
	   document.all['bnum'].value = ""; 
	   document.all['baddress'].value = "";
	   
//	   document.all['Police'].value = ""; 
//	   document.all['Activity'].value = ""; 
//	   document.all['NewAddr'].value = "";    
//	   document.all['ActivityLFrom'].value = ""; 
//	   document.all['ActivityLTo'].value = ""; 
//	   document.all['PhotoBuffer'].value = ""; 
	      
//	   return true;
	}

	function FillForm() {
	  var pName=CVR_IDCard.Name; //var pNameL=CVR_IDCard.NameL;

	  
	  var pSex=CVR_IDCard.Sex;   //var pSexL=CVR_IDCard.SexL;


	  var pAddress=CVR_IDCard.Address;	  

	  
	  var pCardNo=CVR_IDCard.CardNo;	


//	  document.all['bjdr1'].value = pName;  //document.all['Name'].value = pNameL;
	  document.getElementById(idArray[0]).value = pName;
	  
//	  document.all['bsex'].value = pSex;    // document.all['Sex'].value = pSexL; 
	  document.getElementById(idArray[2]).value = pSex;

//	  document.all['baddress'].value = pAddress; 
	  document.getElementById(idArray[3]).value = pAddress;
	  
//	  document.all['bnum'].value = pCardNo; 
	  document.getElementById(idArray[1]).value = pCardNo;

	  
	  //显示照片Servlet

//	  return true;
	}
	
	function FillForm2() {
	  var pName=CVR_IDCard.Name; //var pNameL=CVR_IDCard.NameL;
	  pName=pName;
	  
	  var pSex=CVR_IDCard.Sex;   //var pSexL=CVR_IDCard.SexL;
	  pSex=pSex;

	  var pAddress=CVR_IDCard.Address;
	  pAddress=pAddress;
	  
	  var pCardNo=CVR_IDCard.CardNo;
	  pCardNo=pCardNo;

//	  document.all['bjdr1'].value = pName;  //document.all['Name'].value = pNameL;
	  document.getElementById(idArray2[0]).value = pName;
	  
//	  document.all['bsex'].value = pSex;    // document.all['Sex'].value = pSexL; 
	  document.getElementById(idArray2[2]).value = pSex;

//	  document.all['baddress'].value = pAddress; 
	  document.getElementById(idArray2[3]).value = pAddress;
	  
//	  document.all['bnum'].value = pCardNo; 
	  document.getElementById(idArray2[1]).value = pCardNo;

	  
	  //显示照片Servlet

//	  return true;
	}

	function ReadIDCard() {   
//	   CVR_IDCard.PhotoPath=document.all['PhotoPath'].value;
//	   CVR_IDCard.TimeOut=5;
	   ClearIDCard(); 
//	   ClearForm(); 
//	   document.all['ReadResult'].value ="请在5s时间内扫描身份证信息...";
//	   document.getElementById("ReadResult").innerHTML ="<font color='red'>请在5s时间内扫描身份证信息...</font>";
	   
//	   var strReadResult=-100;
	   
	   strReadResult=CVR_IDCard.ReadCard();
	   
	   if(strReadResult=='卡认证失败，无卡或卡片已读过。'){			   
//		   document.all['ReadResult'].value ="<font color='red'>身份证阅读器未成功连接，请检查！</font>";
		   document.getElementById("ReadResult").innerHTML ="<font color='red'>读卡失败，请重新读取！</font>";
		   return;
	   }
	   else{
	   	   if(i==0 && flagOfFirstPerson==1){
	   	   		i++;
	   	   }
	   	   else{
	   	   		addUserSpecial();
	   	   }
	   	   document.getElementById("ReadResult").innerHTML ="<font color='green'>身份证信息读取成功！</font>";
	   }

	   FillForm();  

//	   document.all['ReadResult'].value ="返回值:"+strReadResult;
	   //alert(strReadResult);  
	   

//	   return true;
	}
	
	function ReadIDCard2() {   
//	   CVR_IDCard.PhotoPath=document.all['PhotoPath'].value;
//	   CVR_IDCard.TimeOut=5;
	   ClearIDCard(); 
//	   ClearForm(); 
//	   document.all['ReadResult'].value ="请在5s时间内扫描身份证信息...";
//	   document.getElementById("ReadResult2").innerHTML ="<font color='red'>请在5s时间内扫描身份证信息...</font>";
	   
	   strReadResult=CVR_IDCard.ReadCard(); 
	   
	   if(strReadResult=='卡认证失败，无卡或卡片已读过。'){			   
//		   document.all['ReadResult'].value ="<font color='red'>身份证阅读器未成功连接，请检查！</font>";
		   document.getElementById("ReadResult2").innerHTML ="<font color='red'>读卡失败，请重新读取！</font>";
		   return;
	   }
	   else{
	   	    if(j==0 && flagOfFirstPerson2==1){
	   	   		j++;
	   	   }
	   	   else{
	   	   		addAppSpecial();
	   	   }
	   	   document.getElementById("ReadResult2").innerHTML ="<font color='green'>身份证信息读取成功！</font>";
	   }

	   FillForm2();  

//	   document.all['ReadResult'].value ="返回值:"+strReadResult;
	   //alert(strReadResult);  
	   

//	   return true;
	}	

	function Save_IDCard() {   
	  var pName=CVR_IDCard.Name; 
	  var pSex=CVR_IDCard.Sex;
	  var pNation=CVR_IDCard.Nation;
	  var pBorn=CVR_IDCard.Born;
	  var pAddress=CVR_IDCard.Address;
	  var pCardNo=CVR_IDCard.CardNo;
	  var pPolice=CVR_IDCard.Police;
	  var pActivity=CVR_IDCard.Activity;
	  var pNewAddr=CVR_IDCard.NewAddr;
	  var pActivityLFrom=CVR_IDCard.ActivityLFrom; 
	  var pActivityLTo=CVR_IDCard.ActivityLTo; 
	  var pPhotoBuffer=CVR_IDCard.GetPhotoBuffer; 

	  if (pName == "") {    
	      ClearForm();
	      alert('读卡内容为空，无法保存数据！请先读卡，再保存。'); 
	      return false;
	  }
	  document.all['Name'].value = pName; 
	  document.all['Sex'].value = pSex; 
	  document.all['Nation'].value = pNation; 
	  document.all['Born'].value = pBorn; 
	  document.all['Address'].value = pAddress; 
	  document.all['CardNo'].value = pCardNo; 
	  document.all['Police'].value = pPolice;  
	  document.all['Activity'].value = pActivity; 
	  document.all['NewAddr'].value = pNewAddr;
	  document.all['ActivityLFrom'].value = pActivityLFrom; 
	  document.all['ActivityLTo'].value = pActivityLTo; 
	  document.all['PhotoBuffer'].value = pPhotoBuffer; 

	  //相片文件默认保存在 CVR_IDCard.PhotoPath

	  ClearIDCard(); 
	  return true;
	}

	/********************************/
	var idArray = new Array();
	var idArray2 = new Array();
	var i = 0;//按顺序赋id
	var j = 0;//按顺序赋id
	var flagOfFirstPerson=1;//判断第一个身份证姓名是否为空（默认）
	var flagOfFirstPerson2=1;//判断第一个身份证姓名是否为空（默认）

	function addUserSpecial(){
		var ob1=document.getElementById("app");
		var ins=document.getElementById("ins");
		var tuser=document.getElementById("tuser");
		ob1=ob1.cloneNode(true);
		
		/*****	
		var name=ob1.getElementByName("bjdr1");
		name.id=i++;//姓名
		idArray[0]= i-1;
		
		var sex=ob1.getElementByName("bsex");
		sex.id=i++;//性别
		idArray[1]= i-1;
		
		var IdCardNum=ob1.getElementByName("bnum");
		IdCardNum.id=i++;//身份证号
		idArray[2]= i-1;
		
		var addressItem=ob1.getElementByName("baddress");
		addressItem.id=i++;//住址
		idArray[3]= i-1;
		****/
		
		var handleList=ob1.getElementsByTagName("input");
		handleList.item(0).value="";
		handleList.item(0).id=i++;//姓名
		idArray[0]= i-1;
		
		handleList.item(1).value="";
		handleList.item(1).id=i++;//身份证号
		idArray[1]= i-1;
		
		handleList.item(2).value="";
		handleList.item(3).value="";
		
		var handleList1=ob1.getElementsByTagName("select");
		handleList1.item(0).value="";
		handleList1.item(0).id=i++;//性别
		idArray[2]= i-1;
		
		var handleList2=ob1.getElementsByTagName("textarea");
		handleList2.item(0).value="";
		handleList2.item(0).id=i++;//住址
		idArray[3]= i-1;
		
		tuser.insertBefore(ob1,ins);
	}
	
	function addAppSpecial(){
		var ob1=document.getElementById("appapp");
		var ins=document.getElementById("insapp");
		var tuser=document.getElementById("tapp");
		ob1=ob1.cloneNode(true);		
		
		var handleList=ob1.getElementsByTagName("input");
		handleList.item(0).value="";
		handleList.item(0).id=j++;//姓名
		idArray2[0]= j-1;
		
		handleList.item(1).value="";
		handleList.item(1).id=j++;//身份证号
		idArray2[1]= j-1;
		
		handleList.item(2).value="";
		handleList.item(3).value="";
		
		var handleList1=ob1.getElementsByTagName("select");
		handleList1.item(0).value="";
		handleList1.item(0).id=j++;//性别
		idArray2[2]= j-1;
		
		var handleList2=ob1.getElementsByTagName("textarea");
		handleList2.item(0).value="";
		handleList2.item(0).id=j++;//住址
		idArray2[3]= j-1;
		
		tuser.insertBefore(ob1,ins);
	}
	
	//读取身份证操作，若为第一次，则仅仅读取身份证信息，否则新增信息块的同时读取身份证信息
	function readIdCardAddedToOperation(){		
		if(i==0 && (document.getElementById("app").getElementsByTagName("input").item(0).value == null||document.getElementById("app").getElementsByTagName("input").item(0).value == "")){						
			idArray[0]=-1;
			idArray[1]=-2;
			idArray[2]=-3;
			idArray[3]=-4;
			document.getElementById("app").getElementsByTagName("input").item(0).id="-1";
			document.getElementById("app").getElementsByTagName("input").item(1).id="-2";
			document.getElementById("app").getElementsByTagName("select").item(0).id="-3";
			document.getElementById("app").getElementsByTagName("textarea").item(0).id="-4";
			
			ReadIDCard();
		}
		else{
			if((document.getElementById("app").getElementsByTagName("input").item(0).value != null && document.getElementById("app").getElementsByTagName("input").item(0).value != "")){
				flagOfFirstPerson = 0;
			}
			ReadIDCard();
		}
	}
	
	//读取身份证操作，若为第一次，则仅仅读取身份证信息，否则新增信息块的同时读取身份证信息
	function readIdCardAddedToOperation2(){		
		if(j==0 && (document.getElementById("appapp").getElementsByTagName("input").item(0).value == null||document.getElementById("appapp").getElementsByTagName("input").item(0).value == "")){
			idArray2[0]=-11;
			idArray2[1]=-22;
			idArray2[2]=-33;
			idArray2[3]=-44;
			document.getElementById("appapp").getElementsByTagName("input").item(0).id="-11";
			document.getElementById("appapp").getElementsByTagName("input").item(1).id="-22";
			document.getElementById("appapp").getElementsByTagName("select").item(0).id="-33";
			document.getElementById("appapp").getElementsByTagName("textarea").item(0).id="-44";
			
			ReadIDCard2();
		}
		else{
			if((document.getElementById("appapp").getElementsByTagName("input").item(0).value != null && document.getElementById("appapp").getElementsByTagName("input").item(0).value != "")){
				flagOfFirstPerson2 = 0;
			}
			ReadIDCard2();
		}
	}
	
	function addUserManually(){
	    i++;
		var ob1=document.getElementById("app");
		var ins=document.getElementById("ins");
		var tuser=document.getElementById("tuser");
		ob1=ob1.cloneNode(true);
		var handleList=ob1.getElementsByTagName("input");
		handleList.item(0).value="";
		handleList.item(1).value="";
		handleList.item(2).value="";
		handleList.item(3).value="";
		
		var handleList1=ob1.getElementsByTagName("select");
		handleList1.item(0).value="";
		
		var handleList2=ob1.getElementsByTagName("textarea");
		handleList2.item(0).value="";
		
		tuser.insertBefore(ob1,ins);
	}
	
	function addAppManually(){
     	j++;
		var ob1=document.getElementById("appapp");
		var ins=document.getElementById("insapp");
		var tuser=document.getElementById("tapp");
		ob1=ob1.cloneNode(true);
		var handleList=ob1.getElementsByTagName("input");
		handleList.item(0).value="";
		handleList.item(1).value="";
		handleList.item(2).value="";
		handleList.item(3).value="";
		
		var handleList1=ob1.getElementsByTagName("select");
		handleList1.item(0).value="";		
		
		var taList=ob1.getElementsByTagName("textarea");
		taList.item(0).value="";
		tuser.insertBefore(ob1,ins);
	}
/****************************end***************************/
</script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
	
<title>当面申请行政复议</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />


<SCRIPT src="../css/01/setday.js"></SCRIPT> 
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/function.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/prototype.js"></script>

<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>


<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>

<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 

<#--
<script type="text/javascript" src="../js/effects.js"></script>
<script type="text/javascript" src="../js/validation_cn_utf-8.js"></script>
-->
<style>
.diva{
BORDER:#dcdcdc 1px solid;
height:22;
FILTER:progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr='#ddecfb',endColorStr='#ffffff');
PADDING-TOP: 3px; 
width:600px;
padding:20px 0px 20px 50px;
}
.divb{
BORDER: #dcdcdc 1px solid;
PADDING-TOP: 10px; 
PADDING-LEFT: 10px;
FONT-SIZE: 12px;
HEIGHT: 100px;
width:180;
border-top:0;
}

</style>
<!--javascript脚本添加位置。-->
<SCRIPT LANGUAGE="JavaScript">


function checkdlr(a){
	if(a==1){
		document.getElementById("isdlr").value = "1";
		document.getElementById("jddlr").style.display="block";
	}else{
		document.getElementById("isdlr").value = "0";
		document.getElementById("jddlr").style.display="none";
		document.getElementById("jddlr1").style.display="none";
	}
}

function checkdlr1(){

	if(document.getElementById("dlrsq").value==3){
		document.getElementById("jddlr1").style.display="block";
	}else{
		document.getElementById("jddlr1").style.display="none";
	}
}

function check_request(){
	if(document.getElementById("request").value==2){
		document.getElementById("requesttype2").style.display="block";
	}else{
		document.getElementById("requesttype2").style.display="none";
	}
}


function check_pc(cv){
	if(cv==1)
	{
		document.getElementById("peichang_div").style.display="block";
	}else{
		document.getElementById("peichang_div").style.display="none";
	}
}

</script>
<!--javascript脚本添加位置结束。-->
</head>


<body onload="HideActiveX()">
<#include "../website/header.ftl">
<#--第一步：加载CAB包OCX控件-->
<OBJECT classid="clsid:10946843-7507-44FE-ACE8-2B3483D179B7"
	  id="CVR_IDCard" name="CVR_IDCard" width="0" height="0" >
</OBJECT>
<#--end-->

<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->

<!--您的位置表格结束-->
<!--标题表格开始-->

<!--标题表格结束-->
<!--主体内容、列表显示区域-->

<input id="conutAppname" type=hidden name="conutAppname">

<#--
<input name="app_face.TAdd" type="hidden" id="Tadd" value="0"/ >
<input id="appstring" type=hidden name="appString">
<input name="app_face.appType" type="hidden" value="1" id="appType"/ >
<input type="hidden" name="appType" id="appType" value="1" />
<input name="app_face.TId" type="hidden"  title="请输入正确的姓名，格式在20个汉字以内" value="">
<input type="hidden" name="date" value="${date}" id="facedate"/>
<input name="app_face.TAppFyOrg" type="hidden"  value='6' />
-->

<!-- 被申请人部门id -->
<input name="xzfyInfo.tAppDeptId" type="hidden"  id="deptid" />
<!-- 状态 -->
<input type="hidden" name="sta" id="sta" value="11" />
<input id="xzfyId" name="xzfyInfo.id" value="${xzfyId}" type="hidden">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="xzfyInfo.receive_type" value="1" />
<input type="hidden" name="xzfyInfo.receive_real_date" value="${todate?default('')}" />
<input type="hidden" id="require_fy" name="xzfyInfo.require_fy" value="">
<input type="hidden" id="buzheng_from" name="xzfyInfo.buzheng_from" value=""> 

<input type="hidden" id="buzheng_from" name="xzfyInfo.yuedusj" value="${yuedusj}"> 
<div class="wal pageNow2">
      <div class="fl">当前位置：&nbsp;&nbsp;<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a> >&nbsp;&nbsp;  <a href="../xzfy/openReceive.action?funcCode=${funcCode}">接收/新增案件</a>  >&nbsp;&nbsp; 当面接收复议申请</div>

</div>

<div class="" style="padding-top:0px;">

<div class="wal">
<!--wal-->

 <div class="formTitle2">请填写复议申请信息</div>

	<div class="form2">
	<div class="bg">
	 <div border="0" >
	<div class="btn" >
	<div class="fl" >
		<!--<a href="../xzfy/tiquFaceList.action?funcCode=${funcCode}" title="案件提取"  >案件提取</a>-->
	</div>
	</div>
</div>
	<table width="95%">
		
  <tr >
	   <th><font color="red">*</font>申请人类别：</th>
	   <td>
	   <@ww.select  name="'xzfyInfo.app_type'" id="applicationtype" headerKey="''" headerValue=""  list="getDictMap('sqrlb')" value="" onchange="'checksqr()'"/>
	   
	   <#--
	   <select name="app_face.applicationtype" id="applicationtype" class="selectStyleNormal" ischeck="y" altname="申请人类别" onchange="checksqr()">
		   <option value="1" selected>公民</option>
		   <option value="2">法人或其他组织</option>
	   </select>
	   -->
	   </td>
	   </tr>
	   <tr>
	   <th><font color="red">*</font>申请人人数：</th>
    <td><input class="input2" ischeck="y" altname="申请人人数"  name="xzfyInfo.renCount" id="rencount" onBlur="renCount();" onchange="setCountAppname('shenqingren','rencount');countNum('rencount')"   type="text"  altname="申请人人数"></td>
   </tr>
   <#--
    <tr  id="shenqingren1">
  	<th><font color="red">*</font>申请人：</th>
    <td colspan=3>
    <a href="javascript:opendg('xzfy/addApp.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=shenqingren&countId=rencount',900,600)"  style="display:block" id="appspan1">添加</a>
    <a href="javascript:opendg('xzfy/addLegal.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=2&textId=shenqingren&countId=rencount',900,600)"  style="display:none" id="appspan2">添加</a>
    <textarea name="xzfyInfo.appdetail" type="text" class="textarea" id="shenqingren" ischeck="y" altname="申请人" ></textarea>
    </td>
   </tr>
   -->
   <tr  id="shenqingren1">
  	<th ><font color="red">*</font>申请人：</th>
    <td  colspan=3>
    <a href="javascript:setApp('#appDiv',1)" style="display:block" id="appspan">添加</a>
    <textarea name="xzfyInfo.appdetail" type="text" class="textarea" style="border:0px" onchange="setCountAppname('shenqingren','rencount')" id="shenqingren"  altname="申请人" style="overflow-y:visible;" readonly></textarea>
    </td>
    </tr>
   <tr class="trwhite" id="sqr" style="display:none">
    <th><font color="red">*</font>申请人名称：</th>
    <td colspan=3>
	<a href="javascript:setFr('#frDiv',1)" id="frspan" >添加</a><br>
    <textarea name="xzfyInfo.agentDetail" type="text" id="appname" style="border:0px"  class="textarea" altname="法人" style="overflow-y:visible;" readonly></textarea>
    </td>
   </tr>		
		<!--<tr >
			<th ><font color="red">*</font>被接待人：</th>
			<td  >
			<a href="javascript:setUser1('#userDiv')" style="display:block" id="userspan">添加</a>
			<textarea name="xzfyInfo.jddetail" type="text" class="textarea"  id="user" ischeck="y" altname="被接待人" style="overflow-y:visible;"></textarea>
			</td>
			<th><font color="red">*</font>被接待人数：</th>
			<td><input name="xzfyInfo.jdRenshu" onchange="countNum('applicationsum')" type="text" id="applicationsum" class="input2" ischeck="y" altname="接待人数" >
			</td>  
		</tr>-->
		<tr  style="display:none">
			<th>多人复议：</td>
			<td>
			<input name="xzfyInfo.isMany" id="duoren_y" value="否" class="input2">
			</td>
		</tr>
		<tr >
	<!--<th><font color="red">*</font>涉及安全：</th>
    <td  colspan=3>
        <input name="xzfyInfo.issafe" id="anquany_y"  value="是" onclick="setAqf(1)" type="radio" ><label for="isting_y">是</label>
        <input name="xzfyInfo.issafe" id="anquany_n"  value="否" onclick="setAqf(2)" type="radio"  checked><label for="isting_n">否</label>
        <span id="aqspan"  style="display:none">
		  <a href="javascript:setAqf(1)">添加</a><br>
		  <textarea name="xzfyInfo.safeContent" type="text" class="textarea"  id="aqcontent" altname="安全隐患" style="overflow-y:visible;" onchange="textCounter(this.form.comment,1000);"></textarea>
		</span>
    </td>
</tr>-->
  <input type="hidden" id="tiqu" value="0">
   <tr id="daibiaorendiv" style="display:none"> 
	<th>代表人：</th>
	<td  colspan=3>
		    <a href="javascript:setDeputy('#deputyDiv',1)" style="display:block" id="deputyspan">添加</a>
		<#--<a href="javascript:opendg('xzfy/addDeputy.action?xzfyId=${xzfyId}&funcCode=${funcCode}&protype=1&textId=deputy&deputy=1',900,600)"  style="display:block" id="appspan1">添加</a>
		-->
    	<textarea name="xzfyInfo.dbrDetail" type="text" class="textarea"  id="deputy" ischeck="y" altname="代表人" style="overflow-y:visible;" readonly></textarea>
	</td>	    
   </tr>
  
  
  <tr >
   <th><font color="red">*</font>是否有代理人：</th>
    <td>
     <input name="xzfyInfo.agent" id="isdlr_y"  value="1" onclick="checkdlr(1)" type="radio" ><label for="isdlr_y">有</label>
        <input name="xzfyInfo.agent" id="isdlr_n"  value="0" onclick="checkdlr(0)" type="radio"  checked><label for="isdlr_n">无</label>
        
     <input type="hidden" id="isdlr" value="0">
     
    </td>
    </tr>
    
    <tr id="jddlr" style="display:none">
    <th>委托代理人姓名a：</th>
    
    
    <td>
    <input name="xzfyInfo.agent_name" type="text" id="dlrname"  ischeck="y" class="input2" ischeck="y" 
     altname="委托代理人姓名项"   onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999" ></td>
    </td>
   
    </tr>
    
    
    
    
    <tr>
    <!--
    <th>代理人：</td>
	<td><input class="input2" name="app_face.TAgent"  type="text"  altname="代理人" maxlength="50" value='无'></td>
  -->
<th><font color="red">*</font>是否申请行政赔偿：</td>
  <td  >
 <input type="radio" name="xzfyInfo.ismoney" value="是" id="peichang_y" ischeck="y" altname="是否行政赔偿" onclick="check_pc(1)">
		      <label for="peichang_y">是</label>
		      <input type="radio" checked name="xzfyInfo.ismoney" value="否" id="peichang_n" ischeck="y" altname="是否行政赔偿" onclick="check_pc(2)">
		      <label for="peichang_n">否</label>

  </td>
  </tr>	
   <tr style="display:none" id="peichang_div">
	  <th>赔偿金额：</th>
	    <td>
	    	 <input class="input2" ischeck="y"  type="text" name="xzfyInfo.money_detail" id="peichang_count">
	    </td>
	    </tr>
	    <tr>
	   <th>受损证明材料：</td>
  <td  >
  <textarea name="xzfyInfo.money_file" id="peichang_file" class="textarea" style="overflow-y:visible;"></textarea>

  </td>
    </tr>
  <tr class="trwhite" id="jddlr1" style="display:none">
    <th>委托时间：</th>
    <td>
     <select name="wtsj1" id="wtsj1" onchange='setWtDate1()' retSelect="1">
	    	<option value="0">选择年</option>
			<option value="1997">1997</option>
	    	<option value="1998">1998</option>
		 	<option value="1999">1999</option>
		 	<option value="2000">2000</option>
		 	<option value="2001">2001</option>
		 	<option value="2002">2002</option>
		 	<option value="2003">2003</option>
		 	<option value="2004">2004</option>
		 	<option value="2005">2005</option>
		 	<option value="2006">2006</option>
		 	<option value="2007">2007</option> 
		 	<option value="2008">2008</option>
		 	<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
	</select>
	<select name="wtsj2" id="wtsj2" onchange='setWtDate1()' retSelect="1">
			<option value="0">选择月</option>
	    	<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
	</select>
	<select name="wtsj3" id="wtsj3" onchange='setWtDate1()' retSelect="1">
			<option value="0">选择日</option>
	    	<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select>
    <input name="xzfyInfo.agent_date" type="hidden" id="wtsj" class="input2"></td>
    <th>地点：</th>
    <td>
    <input name="xzfyInfo.agent_address" type="text" id="wtdd"
     altname="地点" class="input2"></td>
    </tr>
    
<tr >
   <th><font color="red">*</font>被申请人种类：</th>
   <td >
  <select name="xzfyInfo.defendant_type" id="beapptype" onchange="aaa()">
    <option value="0">--请选择--</option>
	<#list zlList as zl>
	<option value="${zl.value}" >${zl.name}</option>
    </#list>
</select>    

   </td>
   </tr>
   <tr>
     <th><font color="red">*</font>被申请人名称：</th>
     <td  style="display:none;" id="beappnametd" width="25%">   
     <input name="ssss" type="text"  id="beappnameinput" altname="被申请人名称" class="input2">
     </td> 
    <td  style="display:block;" id="beappnamesel">  
    
    <select name="xzfyInfo.defendant_name" ischeck="y" id="beappname"
     onchange="beappcode()" altname="被申请人名称" class="selectStyleNormal">
      <option value="0" deptcode="0">----请选择----</option>     	 
    </select>    
    </td>
    
    <td  style="display:none;" id="beappnametd">
   <input name="sss" type="text"  id="beappname2" >
    </td>
    </tr>
    
  <tr  id="mingan">
    <th><font color="red">*</font>是否行政不作为：</th>
    <td>
     <input name="xzfyInfo.ismanage" id="requestrrr_y"  value="2" onclick="szfyqq(2)" type="radio" ><label for="requestrrr_y">是</label>
     <input name="xzfyInfo.ismanage" id="requestrrr_n"  value="0" onclick="szfyqq(0)" type="radio" checked ><label for="requestrrr_n">否</label>
     <input type="hidden" id="requestrrr" value="0">
	</td>
	
	</tr>
	<tr>
     <th><span id="jutixingzheng"><font color="red">*</font>要求复议的具体行政行为情况：</span></th>
	    <td>
	    <span id="jutixingzheng1">
	      <a href="javascript:getBzw()" id="getBzw" style="display:none">添加 </a>
  	 	  <a href="javascript:closeBzw()" id="closeBzw" style="display:none">完成 </a>
		  <span id='xwspan'><a href="javascript:openXw('#xwDiv')">添加</a></span>
		  <span id="xw_an">
		  </span>
		  </span>
	    </td>
	   </tr>
  <tr  style="display:none">
    <th>被复议的具体行为-名称：</th>
    <td><input name="app_face.shenqingrenplace" id="xingwei1" type="text" class="input2"></td>
     <th>知道时间：</th>
    <td><input name="app_face.renpost" type="text" id="xingwei2" class="input2" ></td>
  </tr>

  <tr  style="display:none">
    <th>被复议的具体行为-名称：</th>
    <td><input name="app_face.TBeName" class="input2" id="xingwei" type="text"  altname="被复议的具体行为-名称"  title="请输入正确的名称"></td>
     <th>被复议的具体行为-文号：</th>
    <td><input name="app_face.annum" type="text" id="annum"  class="input2"  altname="文号" ></td>
  </tr>
  
  <tr  style="display:none">
	<th>知道时间：</td>
	    <td>
	    	<input name="app_face.zhidaodate" type="text"
		     id="zhidaodate"  
		      altname="知道时间" class="input2">
	    </td>
	    <th>要求被申请人履行日期aa：</th> 
	    <td>
		<input name="xzfyInfo.execute_date" type="text"
		     id="usedate" 
		      altname="要求被申请人履行日期" class="input2">
	   </td>
  </tr>

  <tr class="trwhite" id="requesttype2" style="display:none">
   <th>不作为事项：</td>
   <td>

  <select name="xzfyInfo.matter_type" id="use_type"  onchange="setBzw()">
         <option value="0">----请选择----</option>
	 <option value="不颁发证照">不颁发证照</option>
	 <option value="不审批登记">不审批登记</option>
	 <option value="不保护人身权">不保护人身权</option>
	 <option value="不保护其他财产权">不保护其他财产权</option>
	 <option value="不保护受教育权">不保护受教育权</option>
	 <option value="不发放抚恤金">不发放抚恤金</option>
	 <option value="不发放社会保险金">不发放社会保险金</option>
	 <option value="不发放最低生活保障费">不发放最低生活保障费</option>
	 <option value="不履行信息公开职责">不履行信息公开职责</option>
	 <option value="其他">其他</option>
  </select>
  <textarea class="textarea" name="xzfyInfo.matter_detail" id="bzwbc" style="overflow-y:visible;"></textarea>
  </span>
  </td>
	    </tr>    
	    <tr  id="requesttype3" style="display:none">
	    <th>要求被申请人履行日期：</th>
	    <td >
	    <select name="knowy2" id="knowy12" onchange='setKnowDate1()' retSelect="1">
	   		<option value="0">选择年</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
			<option value="2018">2018</option>
			<option value="2019">2019</option>
			<option value="2020">2020</option>
		</select>
		<select name="knowm2" id="knowm12" onchange='setKnowDate1()' retSelect="1">
			<option value="0">选择月</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<select name="knowd2" id="knowd12" onchange='setKnowDate1()' retSelect="1">
			<option value="0">选择日</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select>
	    </td>
	    
	   </tr>


 <tr >
 <th><font color="red">*</font>行政复议请求：
  </th>
   <!--<td  ><@ww.select  name="'xzfyInfo.xzfy_requset'" id="request2yiban" headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('xzfyqq')" onchange="'ryq();closeBzw1()'"/>-->
   
    <td ><select name="xzfyInfo.xzfy_requset" id="request2yiban"     onchange="ryq();closeBzw1()" >
      
      <option   value="0">--请选择--</option>
       <option id="q_3_1" class="q_3"  value="1" >撤销该具体行政行为</option>
       <option id="q_3_2" class="q_3" value="2" >变更该具体行政行为</option>
       <option id="q_3_3" class="q_3" value="3" >确认该具体行政行为违法</option>
       <option id="h_2_1" value="4"  disabled="disabled">责令被申请人履行法定职责</option>
       <option  id="h_2_2" value="5" disabled="disabled">确认被申请人不履行法定职责违法</option>
           
      </select>
     
    <textarea name="xzfyInfo.xzfy_requset_retail" id="xzfyqq1" type="text"  style="overflow-y:visible;" class="textarea" ischeck="y" altname="行政复议请求" onchange="closeBzw1()"></textarea>
  </td>
  </tr>
  <tr>
	  <th>是否申请听证：</td>
	    <td>
	    	  <input type="radio" name="xzfyInfo.istingzheng" value="是" id="tingzheng_y" ischeck="y" altname="是否听证" >
		      <label for="isting_y">是</label>
		      <input type="radio" checked name="xzfyInfo.istingzheng" value="否" id="tingzheng_n" ischeck="y" altname="是否听证">
		      <label for="isting_n">否</label>
	    </td>
	   
    </tr>
 

 <tbody id="check_select" style="display:none">
  <tr >
    <th>接待类别：</td>
    <td>
<select name="app_face.othertype" class="selectStyleNormal" retSelect="1">
      <option value="0">----请选择----</option>
	    <option value="1">无明确申请人及被申请人</option>
	    <option value="2">无厉害关系</option>
	    <option value="3">无具体的行政复议请求和理由</option>
	    <option value="4">没有在法定申请期限内提出</option>
	    <option value="5">不属于行政复议范围</option>
	    <option value="6">不属于职责范围</option>
	    <option value="7">其他机关尚未受理的行政诉讼</option>

    </select>
    </td>
   <th>处理：</td>
   <td>
	   <select name="app_face.otherhandle" class="selectStyleNormal">
	      <option value="0">----请选择----</option>
		    <option value="1">劝解并告知途径</option>
		    <option value="2">劝解</option>
		    <option value="3">其他</option>
	    </select>
    </td>
    <tr>
    	<th>劝解并告知途径：</td>
   		<td>
	   		<select name="app_face.gaozhi" class="selectStyleNormal">
		      <option value="0">----请选择----</option>
			    <option value="1">通过司法途径</option>
			    <option value="2">通过民事诉讼途径</option>
			    <option value="3">通过刑事诉讼途径</option>
			    <option value="4">通过行政诉讼途径</option>
			    <option value="5">通过信访途径</option>
			    <option value="6">通过当地政府反映问题</option>
			    <option value="5">通过有关部门举报问题</option>
			    <option value="5">通过纪检监察反映问题</option>
		    </select>
    	</td>
    	<th>&nbsp;</td>
  		 <td>&nbsp;</td>
    </tr>
  </tr>
</tbody>
	<tr >
        <th>是否申请对规范性<br>文件审查：</th>
	    <td><input type="radio" name="xzfyInfo.ischeck" nbzcheck="y" altname="对规范性文件审查" value="是" id="gfsc_y" onclick="check_shencha('1')">
	        <label for="gfsc_y">是 </label>
	        <input type="radio" name="xzfyInfo.ischeck" altname="对规范性文件审查" value="否" nbzcheck="y"  id="gfsc_n" checked onclick="check_shencha('2')">
	        <label for="gfsc_n">否</label>
			<span id="shencha" style="display:none">
			规范文件：<textarea name="xzfyInfo.check_file" class='textarea' id="post2"  class="input2"></textarea>
			</span>
	    </td>
		
	</tr>
  </tr>
 
  <tr >
  
  		<th>是否愿意接受调解：</td>
    <td>
    <@ww.select name="'xzfyInfo.istiaojie'" id="tiaojie" headerKey="" headerValue="" value="'3'.toString()" list="getDictMap('sftj')" onchange="'showTiaojie();;closeBzw1()'"/>
   
    </td>
    </tr>
    <tr>
	<th>其他复议机关、法院是否受理同一复议申请：</td>
    <td>
    <input type="radio" name="xzfyInfo.issame"  value="是" id="isshouli_y" onclick="check_qtfyjg('1')">
	        <label for="isshouli_y">是 </label>
	<input type="radio" name="xzfyInfo.issame"  value="否"  checked id="isshouli_n" onclick="check_qtfyjg('0')">
	        <label for="isshouli_n">否</label>
    <br>
    <#--
    <@ww.select name="'xzfyInfo.issame'" id="isshouli" headerKey="''" headerValue=""  list="getDictMap('sfslfysq')" value="'否'.toString()" />
    <select name="xzfyInfo.issame" id="isshouli" >
    <option value="否">否</option>
    <option value="是">是</option>
    </select>-->
    <span id="qtfyjg" style="display:none">
    <textarea name="xzfyInfo.issame_detail" class="textarea" id="shuoming" style="overflow-y:visible;" altname="说明"></textarea>
    </span>
    </td>
</tr>

<tbody id="otherDetail" style="display:none">	  
	<tr>
		<th colspan=4>调解日期自：
	    <input name="xzfyInfo.tiaojie_from" id="addbegin" type="text" onClick="WdatePicker()" size='10' value='${todate[0..9]}' >
	    至：
	    <input name="xzfyInfo.tiaojie_to" id="addend1" type="text"  onClick="WdatePicker()" size='10'>
	    我们将于收到申请材料后<input name="xzfyInfo.tiaojie_count" type="text" id="tiaojieDate" size=2>个工作日内尝试案前调解工作，调解期间不计入行政复议受理审查或者行政复议审理期限。
		</th>
	</tr>
</tbody>

<tbody id="otherDetail2" style="display:none">	
</tbody>
 <tr >
  <th><font color="red">*</font>接待情况：</td>
    <td> 
    
<a href="javascript:updateFile()" style="display:block" id="filespan">接收材料</a>

 <textarea name="xzfyInfo.jdFileContent" id="filedetail" type="text" class='textarea' style="overflow-y:visible;display:block"></textarea>
 
</td> 
</tr>
<tr>
 <th>被接待人意见：<br>(鼠标双击添加对话)</td>
    <td> 
    
    <textarea name="xzfyInfo.app_advice_detail" id="otheradvice" class="textarea" style="overflow-y:visible;" altname="意见" ondblclick="getValue1(this)">答：同意。</textarea>
    </td>
 </tr>
 <tr >
  <th>受理机关：</td>
    <td><select name="sljg" id="sljg" >
	   <option value="${localBm}" selected>${localName}</option>
	   <#if localBm != "0000" && localBm[0..1]?number<19 >
	    <option value="${upBm}">${upName}</option>
	   </#if>
    	</select>
    </td> 
   
 
 </tr>
 <tr  style="display:none">
	
	    <th>知道该行政行为时间：</th> 
	    <td>
		<input name="xzfyInfo.zhidaosj" type="text"
		     id="zhidaosj" 
		      altname="要求被申请人履行日期" class="input2">
	   </td>
  </tr>
 
 <tr  id="requesttype4" >
	    <th>知道该行政行为时间：</th>
	    <td >
	    <select name="knowy" id="knowy2" onchange='setKnowDate2()' retSelect="1">
	   		<option value="0">选择年</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
			<option value="2018">2018</option>
			<option value="2019">2019</option>
			<option value="2020">2020</option>
		</select>
		<select name="knowm" id="knowm2" onchange='setKnowDate2()' retSelect="1">
			<option value="0">选择月</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<select name="knowd" id="knowd2" onchange='setKnowDate2()' retSelect="1">
			<option value="0">选择日</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select>
	    </td>
	    
	   </tr>

<tr  id="mingan">
    <th><font color="red">*</font>复议申请方式：</th>
    <td>
        <input name="xzfyInfo.fuyifs" id="fuyifs_y"  value="1" onclick="szfyqq(4)" type="radio" checked><label for="requestrrr_y">当面复议</label>
        <input name="xzfyInfo.fuyifs" id="fuyifs_n"  value="2" onclick="szfyqq(3)" type="radio"  ><label for="requestrrr_n">来信复议</label>
        
        <input type="hidden" id="requestrrr" value="0">
	</td>
   
	   
	   
	   <tr class="trwhite" id="requesttype_1" style="display:none">
   <th>请填写事实与理由(100字以内)：</td>
   <td>

  <textarea class="textarea" name="xzfyInfo.shishiyuly" id="bzwbc" style="overflow-y:visible;"></textarea>
  </span>
  </td>
	</tr>   
<tr>
<th>请输入联系手机号码：</th>

<td><input name="xzfyInfo.yanzhengsj" type="text" id="annum"    altname="手机号" >
   &nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  onclick="">获取验证码</button>
</td>
</tr>	   
<tr>
<th>请输入验证码：</th>

<td>
<input name="yanzhenma" type="text" id="annum"    altname="手机号" >


   &nbsp;&nbsp;&nbsp;&nbsp;<button type="button"  onclick="">确认</button>
</td>
</tr>		   
 
 <!--
 <tr>
 <th>上传申请书、申请人<br>身份证明、委托手续：</th>
 <td><input name="upFile1" type="file" class="file" id="upFile1" /></td>
 <th>上传其他证据材料：</th>
 <td>
	<a href="#" onclick="addattachment(this.form);return false;" title="添加">添加</a>
	<table id="upFile2T" class="upLoadTable" >
		<tr >
			<td  >
				<input style='width:190px' name="upFile2" type="file" class="file" id="upFile2" />
			</td>
		</tr>
	</table>
    
 </td> 
 </tr>
-->
     <tbody id="youxing" style="display:none;">
      <tr >
	 <th>是否游行示威：</td>
	 <td> 
	  <input type="radio" name="xzfyInfo.tPoliceIsParade"  value="1" id="yxsw_y" altname="是否游行示威" >
      <label for="xzpc_y">是 </label>
      <input type="radio" name="xzfyInfo.tPoliceIsParade"  value="0" id="yxsw_n" altname="是否游行示威" checked>
      <label for="xzpc_n">否</label></td>
		 <th>&nbsp;</td>
	 <th>&nbsp;</td>
	 </tr>
	 </tbody>

<input name="xzfyInfo.menu" type="hidden" id="menuSave">

                  </table>
                   <br>
                   
<div border="0" >
	<div class="btn" >
	<div class="fl" >
		<a href="#" title="请确认接待笔录无误，并由申请人在笔录所有页签字后，再点击提交。一旦提交，接待信息将无法修改。"  onclick="javascript:saveNew('${xzfyId}')">提交</a>
		<a href="#" title="返回"  onclick="javascript:back()">返回</a>
	</div>
	</div>
</div>

	</div>
</div>
</div>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>

<div id="count1Div1" style="position:absolute;display:none;" class="diva">
	<table  border="1px solid #999999'" align="center" cellpadding="1" cellspacing="1" id="keyword1">
	<tr onclick="javascript:closeKey1Div('count1Div1')">完成</tr>
 <tr>
 <td>
 <table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1">
  <tr>
  <td onmouseover="leibieClose()" height=40>
 申请复议事项：
</td>
 </tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(1)"  height=40 onmouseout="this.style.backgroundColor='#ddecfb'">行政处罚&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='1' onclick="sqfysx(1)" id='sqfysx1'>
	<img src="../images/icon_work/icon_nextpage.gif" /></td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(2)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	行政强制措施&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='2' onclick="sqfysx(2)" id='sqfysx2'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(3)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	行政征收&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='3' onclick="sqfysx(3)" id='sqfysx3'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(4)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'">
	行政许可&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='4' onclick="sqfysx(0)" id='sqfysx4'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(5)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	行政确权&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='5' onclick="sqfysx(0)" id='sqfysx5'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(6)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	干预经营自主权&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='6' onclick="sqfysx(0)" id='sqfysx6'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(7)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'">
	信息公开&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='7' onclick="sqfysx(0)" id='sqfysx7'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(8)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	行政不作为&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='8' onclick="sqfysx(0)" id='sqfysx8'><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';sqfysx(0);checkFysx(9)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'">
	其他&nbsp<input name="xzfyInfo.casetype"  type="radio" altname="申请复议事项" value='9' onclick="sqfysx(0)" id='sqfysx9'><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
	</td>
</table>
</td>
<td>
<table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1">
<tbody id="xzfysx2xzcf" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(1)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(1)">
	拘留&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='1' onclick="setSqfy2(1)" ><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(2)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(2)">
	没收&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='2' onclick="setSqfy2(2)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(3)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(3)">
	罚款&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='3' onclick="setSqfy2(3)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(4)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(4)">
	其他&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='4' onclick="setSqfy2(4)"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
	</tbody>
<tbody id="xzfysx2xzqzcs" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(5)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(5)">
	对人身的强制措施&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='5' onclick="setSqfy2(5)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(6)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(6)">
	对不动产的强制措施&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='6' onclick="setSqfy2(6)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(7)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(7)">
	对其它财产的强制措施&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='7' onclick="setSqfy2(7)"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
</tbody>
<tbody id="xzfysx2xzsx" style="display:none">
<tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(8)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(8)">
	征收土地&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='8' onclick="setSqfy2(8)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(9)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(9)">
	版税&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='9' onclick="setSqfy2(9)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(10)" height=40   onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(10)">
	收费&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='10' onclick="setSqfy2(10)"><img src="../images/icon_work/icon_nextpage.gif" />
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';setSqfy2(11)" height=40  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="setSqfy2(11)">
	要求履行其他义务&nbsp<input name="xzfyInfo.casetype2"  type="radio" altname="申请复议事项" value='11' onclick="setSqfy2(11)"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
</tbody>
	</table>
	</td>
 <td>
 <table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1" id="leibieTable" style="display:none">
 行政管理类别：
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(1)" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" >公安&nbsp
	<input type="radio" name="xzfyInfo.refer" value="1"  id="1refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('2refer')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">国家安全&nbsp
	<input type="radio" name="xzfyInfo.refer" value="2"  id="2refer" onclick="closeKey1Div('count1Div1')">
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('3refer')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">劳动和社会保障&nbsp
	<input type="radio" name="xzfyInfo.refer" value="3"  id="3refer">
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('4refer')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">司法行政&nbsp
	<input type="radio" name="xzfyInfo.refer" value="4"  id="4refer" onclick="closeKey1Div('count1Div1')">
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('5refer')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">民政&nbsp
	<input type="radio" name="xzfyInfo.refer" value="5"  id="5refer" onclick="closeKey1Div('count1Div1')">
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(6)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >农林环资&nbsp
	<input type="radio" name="xzfyInfo.refer" value="6"  id="6refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(7)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >城建&nbsp
	<input type="radio" name="xzfyInfo.refer" value="7"  id="7refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(8)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >工交商事&nbsp
	<input type="radio" name="xzfyInfo.refer" value="8"  id="8refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(9)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >财政金融&nbsp
	<input type="radio" name="xzfyInfo.refer" value="9"  id="9refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(10)" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" >教科文卫&nbsp
	<input type="radio" name="xzfyInfo.refer" value="10"  id="10refer"><img src="../images/icon_work/icon_nextpage.gif" />
	</td>
</tr>
 <tr>
	<td onmouseover="this.style.backgroundColor='#bfceff';setxz(0);checkxz('11refer')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="closeKey1Div('count1Div1')">其他&nbsp
	<input type="radio" name="xzfyInfo.refer" value="11"  id="11refer" onclick="closeKey1Div('count1Div1')">
	</td>
</tr>
</table>
</td>
<td>

<table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1" id="leibie2Table" style="display:none">
<tbody id="" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('1refer','refer21')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('1refer','refer21')">
	治安<input type="radio" name="xzfyInfo.refer2" value="1" id="refer21" onclick="checkRefer2('1refer','refer21')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('1refer','refer22')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('1refer','refer22')">
	劳教<input type="radio" name="xzfyInfo.refer2" value="2" id="refer22" onclick="checkRefer2('1refer','refer22')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('1refer','refer23')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('1refer','refer23')">
	其他<input type="radio" name="xzfyInfo.refer2" value="3" id="refer23" onclick="checkRefer2('1refer','refer23')">
</td>
</tr>
</tbody>
<tbody id="ajgllbnlhz" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer29')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer29')">
	土地<input type="radio" name="xzfyInfo.refer2" value="9" id="refer29" onclick="checkRefer2('6refer','refer29')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer210')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer210')">
	地矿<input type="radio" name="xzfyInfo.refer2" value="10" id="refer210" onclick="checkRefer2('6refer','refer210')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer211')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer211')">
	环保<input type="radio" name="xzfyInfo.refer2" value="11" id="refer211" onclick="checkRefer2('6refer','refer211')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer212')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer212')">
	农业<input type="radio" name="xzfyInfo.refer2" value="12" id="refer212" onclick="checkRefer2('6refer','refer212')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer213')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer213')">
	水利<input type="radio" name="xzfyInfo.refer2" value="13" id="refer213" onclick="checkRefer2('6refer','refer213')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer214')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer214')">
	林业<input type="radio" name="xzfyInfo.refer2" value="14" id="refer214" onclick="checkRefer2('6refer','refer214')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('6refer','refer215')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('6refer','refer215')">
	其他<input type="radio" name="xzfyInfo.refer2" value="15" id="refer215" onclick="checkRefer2('6refer','refer215')">
</td>
</tr>
</tbody>

<tbody id="ajgllbcj" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('7refer','refer217')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('7refer','refer217')">
	规划<input type="radio" name="xzfyInfo.refer2" value="17" id="refer217" onclick="checkRefer2('7refer','refer217')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('7refer','refer218')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('7refer','refer218')">
	拆迁<input type="radio" name="xzfyInfo.refer2" value="18" id="refer218" onclick="checkRefer2('7refer','refer218')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('7refer','refer219')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('7refer','refer219')">
	房屋登记<input type="radio" name="xzfyInfo.refer2" value="19" id="refer219" onclick="checkRefer2('7refer','refer219')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('7refer','refer220')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('7refer','refer220')">
	其他<input type="radio" name="xzfyInfo.refer2" value="20" id="refer220" onclick="checkRefer2('7refer','refer220')">
</td>
</tr>
</tbody>

<tbody id="ajgllbgjss" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer222')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer222')">
	工商<input type="radio" name="xzfyInfo.refer2" value="22" id="refer222" onclick="checkRefer2('8refer','refer222')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer223')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer223')">
	质监<input type="radio" name="xzfyInfo.refer2" value="23" id="refer223" onclick="checkRefer2('8refer','refer223')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer224')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer224')">
	商务<input type="radio" name="xzfyInfo.refer2" value="24" id="refer224" onclick="checkRefer2('8refer','refer224')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer225')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer225')">
	物价<input type="radio" name="xzfyInfo.refer2" value="25" id="refer225" onclick="checkRefer2('8refer','refer225')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer226')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer226')">
	能源<input type="radio" name="xzfyInfo.refer2" value="26" id="refer226" onclick="checkRefer2('8refer','refer226')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer227')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer227')">
	交通<input type="radio" name="xzfyInfo.refer2" value="27" id="refer227" onclick="checkRefer2('8refer','refer227')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer228')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer228')">
	信息产业<input type="radio" name="xzfyInfo.refer2" value="28" id="refer228" onclick="checkRefer2('8refer','refer228')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer229')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer229')">
	邮政<input type="radio" name="xzfyInfo.refer2" value="29" id="refer229" onclick="checkRefer2('8refer','refer229')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('8refer','refer230')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('8refer','refer230')">
	烟草专买<input type="radio" name="xzfyInfo.refer2" value="30" id="refer230" onclick="checkRefer2('8refer','refer230')">
</td>
</tr>
</tbody>

<tbody id="ajgllbczjr" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer232')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer232')">
	税务<input type="radio" name="xzfyInfo.refer2" value="32" id="refer232" onclick="checkRefer2('9refer','refer232')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer233')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer233')">
	人民银行<input type="radio" name="xzfyInfo.refer2" value="33" id="refer233" onclick="checkRefer2('9refer','refer233')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer234')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer234')">
	证监<input type="radio" name="xzfyInfo.refer2" value="34" id="refer234" onclick="checkRefer2('9refer','refer234')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer235')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer235')">
	保监<input type="radio" name="xzfyInfo.refer2" value="35" id="refer235" onclick="checkRefer2('9refer','refer235')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer236')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer236')">
	银监<input type="radio" name="xzfyInfo.refer2" value="36" id="refer236" onclick="checkRefer2('9refer','refer236')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer237')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer237')">
	外汇<input type="radio" name="xzfyInfo.refer2" value="37" id="refer237" onclick="checkRefer2('9refer','refer237')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer238')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer238')">
	财政<input type="radio" name="xzfyInfo.refer2" value="38" id="refer238" onclick="checkRefer2('9refer','refer238')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer239')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer239')">
	统计<input type="radio" name="xzfyInfo.refer2" value="39" id="refer239" onclick="checkRefer2('9refer','refer239')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer240')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer240')">
	审计<input type="radio" name="xzfyInfo.refer2" value="40" id="refer240" onclick="checkRefer2('9refer','refer240')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer241')" height=30  onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer241')">
	海关<input type="radio" name="xzfyInfo.refer2" value="41" id="refer241" onclick="checkRefer2('9refer','refer241')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('9refer','refer242')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('9refer','refer242')">
	商检<input type="radio" name="xzfyInfo.refer2" value="42" id="refer242" onclick="checkRefer2('9refer','refer242')">
</td>
</tr>
</tbody>

<tbody id="ajgllbjkww" style="display:none">
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer244')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer244')">
	药监<input type="radio" name="xzfyInfo.refer2" value="44" id="refer244" onclick="checkRefer2('10refer','refer244')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer245')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer245')">
	卫生<input type="radio" name="xzfyInfo.refer2" value="45" id="refer245" onclick="checkRefer2('10refer','refer245')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer246')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer246')">
	计划生育<input type="radio" name="xzfyInfo.refer2" value="46" id="refer246" onclick="checkRefer2('10refer','refer246')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer247')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer247')">
	教育<input type="radio" name="xzfyInfo.refer2" value="47" id="refer247" onclick="checkRefer2('10refer','refer247')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer248')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer248')">
	文化<input type="radio" name="xzfyInfo.refer2" value="48" id="refer248" onclick="checkRefer2('10refer','refer248')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer249')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer249')">
	专利<input type="radio" name="xzfyInfo.refer2" value="49" id="refer249" onclick="checkRefer2('10refer','refer249')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer250')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer250')">
	商标<input type="radio" name="xzfyInfo.refer2" value="50" id="refer250" onclick="checkRefer2('10refer','refer250')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer251')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer251')">
	版权<input type="radio" name="xzfyInfo.refer2" value="51" id="refer251" onclick="checkRefer2('10refer','refer251')">
</td>
</tr>
<tr >
	<td onmouseover="this.style.backgroundColor='#bfceff';checkRefer('10refer','refer252')" height=30 onmouseout="this.style.backgroundColor='#ddecfb'" onclick="checkRefer2('10refer','refer252')">
	旅游<input type="radio" name="xzfyInfo.refer2" value="52" id="refer252" onclick="checkRefer2('10refer','refer252')">
</td>
</tr>

</tbody>
</table>

</td>
	</tr>
	</table>
</div>
<div id="count2Div1" style="position:absolute;display:none;" class="diva">
 <table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1">
 <tr onclick="javascript:closeKey1Div('count2Div1')">完成</tr>
 <tr>
	<td>申请复议事项：</td>
	<td >
	.抽象行政行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='1'><br>
	.行政处分、人事处理决定&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='2'><br>
	.行政机关对民事纠纷作出的调解、处理&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='3'><br>
	.国防、外交等国家行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='4'><br>
	.交通、医疗、火灾事故责任认定&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='5'><br>
	.司法鉴定&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='6'><br>
	.涉及刑事行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='7'><br>
	.民事行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='8'><br>
	.司法行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='9'><br>
	.对当事人权利不产生影响的信访行为&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='10'><br>
	.不具有强制力的行政指导&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='11'><br>
	.其他行政复议机关对复议申请的处理&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='12'><br>
	.涉及市政府行政复议工作的来信&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='13'><br>
	.其他&nbsp<input name="xzfyInfo.keyword2"  type="radio" altname="申请复议事项" value='14'><br>
	</td>
	</tr>
 <tr>
	<td >接待处理：</td>
	<td >口头告知&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='4'><br>
	.接收复议申请材料&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='5'><br>
	.接收行政复议监督案件&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='6'><br>
	.接收其他来信、电子邮件&nbsp<input name="xzfyInfo.reception"  type="radio" altname="接待处理" value='7'><br>
	</td>
	</tr>
</table>

</div>

<div id="count3Div1" style="position:absolute;display:none;" class="diva">
 <table  border="1px solid #999999'" align="center" cellpadding="0" cellspacing="1">
 <tr onclick="javascript:closeKey1Div('count3Div1')">完成</tr>
 <tr>
	<td>复议审理方式：</td>
	<td>送达&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='1'><br>
	询问案件进展情况&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='2'><br>
	阅卷&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='3'><br>
	谈话、调查&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='4'><br>
	当面补交申请材料、明确有关事项&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='5'><br>
	来信补交申请材料&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='6'><br>
	当面代为接转其他材料&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='7'><br>
	来信、邮件提交其他材料&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='8'><br>
	其他涉及案件审理的事项&nbsp<input name="xzfyInfo.keyword3"  type="radio" altname="复议审理方式" value='9'><br>
	</td>
	</tr>
</table>

</div>

<div id="frDiv" style="position:absolute;display:none;" class="formDiv">
 <div class="btn">
                       <div class="fl">
<a href="javascript:addFr()">继续添加</a>
</div>
<div class="fr">
<a href="javascript:checkFr();closeDivById('frDiv')">完成</a>
<a href="javascript:closeDivById('frDiv')">关闭</a>
                       </div>
                  </div>
</table>
<table width="90%">
<tr>
<td id="tfaren">
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="appfaren">
<tr>
<th >
申请人：</th>
<td colspan=3>
<input name="frsqr" isUser="true" size="50" value="" onchange="checkComma(this)"/>
</td>
</tr>
<tr>
<th>
	代表人类别：</th>
<td>
<select name="fzrlb" isUser="true" retSelect="1">
<option value="法定代表人">法定代表人</option>
	<option value="负责人">负责人</option>
    <option value="执行合伙事务的合伙人">执行合伙事务的合伙人</option>
    <option value="合伙人">合伙人</option>
    <option value="主要负责人">主要负责人</option>
    <option value="被共同推选的非法人组织其他成员">被共同推选的非法人组织其他成员</option>
	</select>

	</td>
<th width="18%">
代表人姓名：
</th>
<td width="32%"><input name="fuzeren" isUser="true" value="" onchange="checkComma(this)"/>
</td>

</tr>
	<tr>
	<th width="18%">
	送达地址：</th>
<td width="32%">
<textarea name="fzraddress" isUser="true" onchange="checkComma(this)"></textarea>
<!--<input name="fzraddress" isUser="true" value="" size=30/>-->
	</td>
	<th>
	邮编：</th>
<td><input name="fzrpost" isUser="true" value="" onchange="checkComma(this)"/>
	</td>	
	</tr>
	<tr>
	<th>
	电话：</th>
<td><input name="fzrtele" isUser="true" value="" onchange="checkComma(this)"/>
	</td>
</tr>
<tr>
<th>
	其他情形：
	</th>
<td colspan=2><select name="fzrother" isUser="true" retSelect="1">
	 <option value="0">无</option>
    <option value="由股东代表大会以股份制企业名义提出申请">由股东代表大会以股份制企业名义提出申请</option>
    <option value="由董事会以股份制企业名义提出申请">由董事会以股份制企业名义提出申请</option>
    <option value="其他">其他</option>
	</select>
	
	</td>
<td align='left'><input value="删除" type="button" class="btn1" onclick="deleteFr(this)"></td>

</tr>
</table>
<table  id="insfaren">
&nbsp;
</table>
</td></tr>
</table>
</div>


<div id="xwDiv" style="position:absolute;display:none;" class="formDiv">
	<div class="btn">
		<div class="fl">
		<a href="javascript:addXw()">继续添加</a>
		</div>
		<div class="fr">
		<a href="javascript:closeDivXw()">完成</a>
		<a href="javascript:closeDivById('xwDiv')">关闭</a>
		</div>
	</div>

<table width="90%">
<tr>
	<td id="txw">
<table  id="xwapp">
	<tr>
		<th style="width:25%">
			被复议的具体行为-名称：
		</th>
		<td>
		<input name="xzfyInfo.xwname" id="xwname" size='60' isUser="true"  value="" />
		</td>
	</tr>
	<tr>
		<th>被复议的具体行为-文号：</th>
		<td>
			<input name="xzfyInfo.xwnum" isUser="true" size='50' id="xwnum" value=""  />&nbsp;<!--<a href="#" onclick="anNumConfirm();return false;" title="检测重复"  >检测重复</a>-->
		</td>
	</tr>
	
<tr>
<th>
知道时间：
</td>
<td>
<select name="zd1" id="zd1" retSelect=1>
			<option value="0">选择年</option>
			<option value="1997">1997</option>
	    	<option value="1998">1998</option>
		 	<option value="1999">1999</option>
		 	<option value="2000">2000</option>
		 	<option value="2001">2001</option>
		 	<option value="2002">2002</option>
		 	<option value="2003">2003</option>
		 	<option value="2004">2004</option>
		 	<option value="2005">2005</option>
		 	<option value="2006">2006</option>
		 	<option value="2007">2007</option> 
		 	<option value="2008">2008</option>
		 	<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
		</select>	
		<select name="zd2" id="zd2" retSelect=1>
			<option value="0">选择月</option>
	    	<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<select name="zd3" id="zd3" retSelect=1>
			<option value="0">选择日</option>
	    		<option value="1">01</option>
		 	<option value="2">02</option>
		 	<option value="3">03</option>
		 	<option value="4">04</option>
		 	<option value="5">05</option>
		 	<option value="6">06</option>
		 	<option value="7">07</option>
		 	<option value="8">08</option>
		 	<option value="9">09</option>
		 	<option value="10">10</option>
		 	<option value="11">11</option>
			<option value="12">12</option>
		 	<option value="13">13</option>
		 	<option value="14">14</option>
		 	<option value="15">15</option>
		 	<option value="16">16</option>
		 	<option value="17">17</option>
		 	<option value="18">18</option>
		 	<option value="19">19</option>
		 	<option value="20">20</option>
		 	<option value="21">21</option>
			<option value="22">22</option>
		 	<option value="23">23</option>
		 	<option value="24">24</option>
		 	<option value="25">25</option>
		 	<option value="26">26</option>
		 	<option value="27">27</option>
			<option value="28">28</option>
		 	<option value="29">29</option>
		 	<option value="30">30</option>
			<option value="31">31</option>
		</select>
</td>
</tr>
<tr>
<th>
得知该具体行为途径：</td>
<td><input name="tujing" id="tujing" isUser="true" value='' /></td>
</tr>
<tr>
<td align="center" colspan=2>
<a href="#" onclick="deleteXw(this);return false;" title="删除"  >删除</a>
</td>
</tr>
</table>
</td></tr>
</table>
</div>

<div id="userDiv" style="position:absolute;display:none;" class="formDiv" >
	<div class="btn"><div class="fl">
		<#if localBm == '0000'>
		<a href="javascript:addUserManually()" title="点击手动继续添加"  >继续添加</a>	
		<#else>
		<a href="javascript:addUser()" title="点击继续添加"  >继续添加</a>
		</#if>	
	</div>

	<div class="fr">
		<a href="javascript:addUser:closeDiv1()" title="完成"  >完成</a>
		<a href="javascript:closeDivById('userDiv')" title="关闭"  >关闭</a>
	</div>
	<#if localBm == '0000'>
	<div class="fr">
		<a href="javascript:readIdCardAddedToOperation()" title="点击开始读取身份证信息"  >读取身份证</a>				
	</div>
	</#if>
</div>

<table width="90%">
	<tr >
		<td id="tuser">
		<table id="app">
			<tr  >
				<th width="15%" >被接待人：</th>
				<td width="35%" ><input name="bjdr1" isUser="true" value=""/></td>
				
				<#if localBm == '0000'>
				<th width="10%">性别：</th>
				<td width="40%">
					<select name="bsex" isUser="true" retSelect="1" ><option value=""></option><option value="男">男</option><option value="女">女</option></select>
				</td>
				<#else>
				<th width="10%">性别：</th>
				<td width="40%">
					<select name="bsex" isUser="true" retSelect="1" ><option value="男">男</option><option value="女">女</option></select>
				</td>
				</#if>
				
			</tr>
			<tr>
				<th>身份证号：</th>
				<td><input name="bnum" isUser="true" value="" /></td>
				<th>通信地址：</th>
				<td><textarea name="baddress" type="text" isUser="true" ></textarea></td>	
			</tr>
			<tr>
				<th>邮编：</th>
				<td><input name="bpost" isUser="true" value="" />
				</td>
				<th>电话：</th>
				<td>
					<input name="bphone" isUser="true" value='' />&nbsp;&nbsp;<a href="#" onclick="deleteUser(this);return false;" title="删除">删除</a>
				</td>
			</tr>
		</table>
		
		<#if localBm == '0000'>
		<table  id="ins">
			<tr>
				<th width="15%">操作提示：</th>
				<td  width="85%">
					<#--<input type="text" name="ReadResult"  />-->
					<div id="ReadResult"></div>
				</td>
			</tr>		
		</table>		
		<#else>
		<table  id="ins">
		</table>
		</#if>
		
		</td>
	</tr>
</table>
</div>
<script>


</script>
<div id="appDiv" style="position:absolute;display:none;" class="formDiv">
<div class="btn">
<div class="fl">
<#if localBm == '0000'>
<a href="javascript:addAppManually()" title="点击手动继续添加">继续添加</a>
<#else>
<a href="javascript:addApp()" title="点击继续添加">继续添加</a>
</#if>
</div>
<div class="fr">
<a href="javascript:addApp:closeApp()" id="appEnd">完成</a>
<a href="javascript:addUser:closeDivById('appDiv')">关闭</a>
</div>

	<#if localBm == '0000'>
	<div class="fr">
		<a href="javascript:readIdCardAddedToOperation2()" title="点击开始读取身份证信息"  >读取身份证</a>				
	</div>
	</#if>
</div>

<table width="90%" >
<tr>
<td id="tapp">
<table   width="100%"  id="appapp">
<tr>
<th>申请人：</th>
<td><input name="appsqr" isUser="true" value="" onchange="checkComma(this)"/></td>
	<#if localBm == '0000'>
	<th>性别：</th>
	<td>
		<select name="appsex" isUser="true" retSelect="1" style="display:block">
			<option value=""></option>
			<option value="男">男</option>
			<option value="女">女</option>
		</select>
				
	</td>	
	<#else>
		<th>性别：</th>
		<td>
			<select name="appsex" isUser="true" retSelect="1" style="display:block">
				<option value="男">男</option>
				<option value="女">女</option>
			</select>
		</td>
	</#if>
</tr>
<tr>
	<th>身份证号：</th>
	<td><input name="appnum" isUser="true" value="" onchange="checkComma(this)"/>
	</td>
	<th>
	送达地址：
	</th>
	<td>
	<textarea name="appaddress" type="text" isUser="true" onchange="checkComma(this)"></textarea>
	</td>
</tr>
<tr>
	<th>
	邮编：
	</th>
	<td><input name="apppost" isUser="true" value="" onchange="checkComma(this)"/>
	</td>
	<th>
	电话：
	</th>
	<td><input name="appphone" isUser="true" value='' onchange="checkComma(this)"/>
	<a href="#" onclick="deleteApp(this);return false;" title="删除"  >删除</a>
	</td>
</tr>
</table>

		<#if localBm == '0000'>
		<table  id="insapp">
			<tr>
				<th width="12%">操作提示：</th>
				<td width="88%">
					<div id="ReadResult2"></div>
				</td>
			</tr>		
		</table>		
		<#else>
		<table  id="insapp">
		</table>
		</#if>
		
</td></tr>
</table>
</div>

<div id="deputyDiv" style="width:610px;position:absolute;display:none;" class="formDiv">
	<div class="btn">
		<div class="fr">
			<a href="javascript:addApp:closeDep()">完成</a>
			<a href="javascript:addUser:closeDivById('deputyDiv')">关闭</a>
		</div>
	</div>
</tr>
<table   id="dep" style="width:600px;">
	<tr style="width:600px;">
		<th style="width:30%">
		请选择代表人：
		</th>
		<td id="xuandbr">

		</td>
	</tr>
</table>
</div>

<#--
<div id="deputyDiv" style="width:370px;position:absolute;display:none;" class="formDiv">
	<div class="btn">
		<div class="fl">
			<a href="javascript:addDep()" width=100>继续添加</a>
		</div>
		<div class="fr">
			<a href="javascript:addApp:closeDep()">完成</a>
			<a href="javascript:addUser:closeDivById('deputyDiv')">关闭</a>
		</div>
	</div>
</tr>
<table  style="width:330px;">
<tr style="width:330px;">
<td id="tdep" style="width:330px;">

<table   id="dep" style="width:330px;">
	<tr style="width:330px;">
		<th style="width:50%">
		请选择代表人：
		</th>
		<td>
		<select name="depsqr" id="deputySqr" isUser="true" retSelect="1" >
		</select>
		&nbsp;&nbsp;<a href="#" onclick="deleteDep(this);return false;" title="删除">删除</a>
		</td>
	</tr>
</table>
<table  id="insdep" style="width:330px;">
</table>

</td>
</tr>
</table>
</div>
-->
<div id="fileDiv" style="position:absolute;display:none;width:800px" class="formDiv">
	<div class="btn">
		<div class="fl">
		<a href="javascript:addFile()">继续添加</a>
		</div>
		<div class="fr">
		<a href="javascript:closeFile()">完成</a>
		<a href="javascript:resetFile1()">不添加</a>
		</div>
	</div>

<table style="width:790px">
	<tr>
		<td id="tfile">
		<table  id="fileapp" isfilediv="1" style="width:760px">
			<tr>
				<th style="width:200px">
				文件名：
				</th>
				<td  style="width:150px">
					<input name="filemodel" isUser="true" value=""/>
				</td>
				<th style="width:120px">
				类型：
				</th>
				<td  >
					<select name="filetype" isUser="true" retSelect="1">
					<option value="（复印件）" selected>复印件</option>
					<option value="（原件）">原件</option>
					</select>
				</td>
				<th style="width:120px">
				页数：
				</th>
				<td style="width:50px"><input name="filepage" isUser="true" value='' size=2 />
				</td>
				<th style="width:120px">
				份数：
				</th>
				<td style="width:150px"><input name="filecount" isUser="true" value="" size=2/>
				<a href="#" onclick="deleteFile(this);return false;" title="删除"  >删除</a>
				</td>
			</tr>
	</table>
		</td>
	</tr>
</table>
</div>

<div id="answerDiv" style="position:absolute;display:none;" class="diva">
<table width="320">
<tr><td align="left" width=100>
<a href="javascript:addAnswer()">继续添加</a></td>
<td width=100>注意标点符号</td>
<td align="right"  width=50><a href="javascript:closeAnswer()">完成</a></td>
<td align="right" width=50><a href="javascript:closeDivById('answerDiv')">关闭</a></td>
</tr>

</table>

	<table >
		<tr>
		<td id="tanswer">
		<table  id="answerapp" isfilediv="1">
		<tr>
	<td>
	<input name="answer" isUser="true" value='问：'/>
	</td>
	<td>
	<input name="answerto" isUser="true" value='答：'/>
	<input value="删除" type="button" class="buttonNormal" onclick="deleteAnswer(this)">
	</td></tr>
	</table>
<table  id="inanswer">
&nbsp;
</table>
</td></tr>
</table>
</div>

<div id="adviceDiv" style="position:absolute;display:none;" class="diva">
<table width="300">
<tr>
<td align="left"><a href="javascript:addUser:rechekAadvice()">重填</a></td>
<td align="right"><a href="javascript:addUser:closeAdvice()">完成</a></td>
</tr>

</table>

<table width="600" border='1'>
<tr><td align="left">
（一）该行政复议申请没有明确的申请人，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请没有明确的申请人，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（二）该行政复议申请没有符合规定的被申请人，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请没有符合规定的被申请人，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（三）申请人与具体行政行为没有利害关系，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('申请人与具体行政行为没有利害关系，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（四）该行政复议申请没有具体的行政复议请求和理由，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请没有具体的行政复议请求和理由，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（五）该行政复议申请未在法定申请期限内提出，不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请未在法定申请期限内提出，不符合行政复议受理条件。')">
</td></tr>
<tr><td align="left">
（六）该行政复议申请是——（以下内容），不属于行政复议法规定的行政复议范围。<br>
1、国防、外交等国家行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——国防、外交等国家行为，不属于行政复议法规定的行政复议范围。')">
<br>
2、抽象行政行为（非可附带审查的规范性文件）<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——抽象行政行为（非可附带审查的规范性文件），不属于行政复议法规定的行政复议范围。')">
<br>
3、行政机关的行政处分或者其他人事处理决定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——行政机关的行政处分或者其他人事处理决定，不属于行政复议法规定的行政复议范围。')">
<br>
 4、法律所确定的终局裁决行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——法律所确定的终局裁决行为，不属于行政复议法规定的行政复议范围。')">
<br>
5、公安、国家安全等机关依照刑事诉讼法的明确授权实施的刑事司法行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——公安、国家安全等机关依照刑事诉讼法的明确授权实施的刑事司法行为，不属于行政复议法规定的行政复议范围。')">
<br>
6、行政机关对民事纠纷作出的调解或其他处理<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——行政机关对民事纠纷作出的调解或其他处理，不属于行政复议法规定的行政复议范围。')">
<br>
7、不具强制力的行政指导行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——不具强制力的行政指导行为，不属于行政复议法规定的行政复议范围。')">
<br>
8、驳回当事人对行政行为提起申诉的重复处理行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——驳回当事人对行政行为提起申诉的重复处理行为，不属于行政复议法规定的行政复议范围。')">
<br>
9、医疗事故鉴定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——医疗事故鉴定，不属于行政复议法规定的行政复议范围。')">
<br>
10、火灾事故责任认定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——火灾事故责任认定，不属于行政复议法规定的行政复议范围。')">
<br>
11、交通事故责任认定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——交通事故责任认定，不属于行政复议法规定的行政复议范围。')">
<br>
12、劳动能力鉴定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——劳动能力鉴定，不属于行政复议法规定的行政复议范围。')">
<br>
12、劳动能力鉴定<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——劳动能力鉴定，不属于行政复议法规定的行政复议范围。')">
<br>
13、单独对规范性文件提出附带审查的申请<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——单独对规范性文件提出附带审查的申请，不属于行政复议法规定的行政复议范围。')">
<br>
14、司法鉴定行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——司法鉴定行为，不属于行政复议法规定的行政复议范围。')">
<br>
15、历史遗留问题<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——历史遗留问题，不属于行政复议法规定的行政复议范围。')">
<br>
16、司法行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——司法行为，不属于行政复议法规定的行政复议范围。')">
<br>
17、信访行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——信访行为，不属于行政复议法规定的行政复议范围。')">
<br>
18、其他对公民、法人或者其他组织权利义务不产生实际影响的行为<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请是——其他对公民、法人或者其他组织权利义务不产生实际影响的行为，不属于行政复议法规定的行政复议范围。')">
<br>
</td></tr>
<tr><td align="left">
（七）该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围。')">
</td></tr>
<tr><td align="left">
（七）该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围。')">
</td></tr>
<tr><td align="left">
（八）其他行政复议机关已经受理同一行政复议申请，人民法院已经受理同一主体就同一事实提起的行政诉讼，该申请不符合行政复议受理条件。<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('其他行政复议机关已经受理同一行政复议申请，人民法院已经受理同一主体就同一事实提起的行政诉讼，该申请不符合行政复议受理条件.')">
</td></tr>
<tr><td align="left">
（九）其他<input value="添加" type="button" class="buttonNormal" onclick="addAdvice('其他.')">
</td></tr>
</table>
</div>

<div id="bzDiv" style="position:absolute;display:none;" class="diva">
<table width="300">
<tr>
<td align="left"><a href="javascript:addUser:recheckBz()">重填</a></td>
<td align="right"><a href="javascript:addUser:closeBz()">完成</a></td>
<td align="right"><a href="javascript:xbz()">关闭</a></td>
</tr>

</table>
<table width="600" border='1'>
<tr><td align="left">
（一）申请人是公民，无申请人身份证明；<input value="申请人是公民，无申请人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（一）申请人是公民，无申请人身份证明；')" isbz=1>
</td></tr>
<tr><td align="left">
（二）申请人是法人或者其他组织，无工商营业执照副本复印件或者设立登记证明复印件；<input value="申请人是法人或者其他组织，无工商营业执照副本复印件或者设立登记证明复印件；" type="checkbox" class="checkbox"  onclick="addbz('（二）申请人是法人或者其他组织，无工商营业执照副本复印件或者设立登记证明复印件；')">
</td></tr>
<tr><td align="left">
（三）申请人是法人或者其他组织，无法定代表人或者负责人身份证明；<input value="申请人是法人或者其他组织，无法定代表人或者负责人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（三）申请人是法人或者其他组织，无法定代表人或者负责人身份证明；')">
</td></tr>
<tr><td align="left">
（四）股份制企业的股东大会、股东代表大会、董事会以企业的名义申请行政复议，无相应的会议决议或其他证明文件材料；<input value="股份制企业的股东大会、股东代表大会、董事会以企业的名义申请行政复议，无相应的会议决议或其他证明文件材料；" type="checkbox" class="checkbox" onclick="addbz('（四）股份制企业的股东大会、股东代表大会、董事会以企业的名义申请行政复议，无相应的会议决议或其他证明文件材料；')">
</td></tr>
<tr><td align="left">
（五）合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明；<input value="合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（五）合伙企业申请行政复议，无企业核准登记证明复印件和执行合伙事务的合伙人身份证明；')">
</td></tr>
<tr><td align="left">
（六）其他合伙组织申请行政复议，无全体合伙人身份证明；<input value="其他合伙组织申请行政复议，无全体合伙人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（六）其他合伙组织申请行政复议，无全体合伙人身份证明；')">
</td></tr>
<tr><td align="left">
（七）不具备法人资格的其他组织申请行政复议，无该组织主要负责人身份证明；<input value="不具备法人资格的其他组织申请行政复议，无该组织主要负责人身份证明；" type="checkbox" class="checkbox" onclick="addbz('（七）不具备法人资格的其他组织申请行政复议，无该组织主要负责人身份证明；')">
</td></tr>
<tr><td align="left">
（八）该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围；<input value="该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围；" type="checkbox" class="checkbox" onclick="addbz('（八）该行政复议申请不属于收到行政复议申请的行政复议机构的职责范围；')">
</td></tr>
<tr><td align="left">
（九）不具备法人资格的其他组织申请行政复议，没有主要负责人，由共同推选的其他成员代表该组织参加行政复议，无推选证明文件和被推选者身份证明；<input value="不具备法人资格的其他组织申请行政复议，没有主要负责人，由共同推选的其他成员代表该组织参加行政复议，无推选证明文件和被推选者身份证明；" type="checkbox" class="checkbox" onclick="addbz('（九）不具备法人资格的其他组织申请行政复议，没有主要负责人，由共同推选的其他成员代表该组织参加行政复议，无推选证明文件和被推选者身份证明；')">
</td></tr>
<tr><td align="left">
（十）没有明确的被申请人；<input value="没有明确的被申请人；" type="checkbox" class="checkbox" onclick="addbz('没有明确的被申请人；')">
</td></tr>
<tr><td align="left">
（十一）没有适格的被申请人；<input value="没有适格的被申请人；" type="checkbox" class="checkbox" onclick="addbz('没有适格的被申请人；')">
</td></tr>
<tr><td align="left">
（十二）行政复议请求不明确或者不符合法律规定；<input value="行政复议请求不明确或者不符合法律规定；" type="checkbox" class="checkbox" onclick="addbz('行政复议请求不明确或者不符合法律规定；')">
</td></tr>
<tr><td align="left">
（十三）申请人申请行政复议的具体行政行为不明确；<input value="申请人申请行政复议的具体行政行为不明确；" type="checkbox" class="checkbox" onclick="addbz('申请人申请行政复议的具体行政行为不明确；')">
</td></tr>
<tr><td align="left">
（十四）申请人知道具体行政行为的时间不明确；<input value="申请人知道具体行政行为的时间不明确；" type="checkbox" class="checkbox" onclick="addbz('申请人知道具体行政行为的时间不明确；')">
</td></tr>
<tr><td align="left">
（十五）申请人对规划行政许可、房屋登记、土地登记等具体行政行为不服申请行政复议，无房屋所有权证复印件、土地证书复印件、派出所证明等证明申请人与该具体行政行为有利害关系的证据材料；<input value="申请人对规划行政许可、房屋登记、土地登记等具体行政行为不服申请行政复议，无房屋所有权证复印件、土地证书复印件、派出所证明等证明申请人与该具体行政行为有利害关系的证据材料；" type="checkbox" class="checkbox" onclick="addbz('十五）申请人对规划行政许可、房屋登记、土地登记等具体行政行为不服申请行政复议，无房屋所有权证复印件、土地证书复印件、派出所证明等证明申请人与该具体行政行为有利害关系的证据材料；')">
</td></tr>
<tr><td align="left">
（十六）申请人认为被申请人不履行法定职责，未提供曾经要求被申请人履行法定职责而被申请人未履行的证明材料；<input value="申请人认为被申请人不履行法定职责，未提供曾经要求被申请人履行法定职责而被申请人未履行的证明材料；" type="checkbox" class="checkbox" onclick="addbz('（十六）申请人认为被申请人不履行法定职责，未提供曾经要求被申请人履行法定职责而被申请人未履行的证明材料；')">
</td></tr>
<tr><td align="left">
（十七）申请行政复议时一并提出行政赔偿请求，未提供受具体行政行为侵害而造成损害的证明材料；<input value="申请行政复议时一并提出行政赔偿请求，未提供受具体行政行为侵害而造成损害的证明材料；" type="checkbox" class="checkbox" onclick="addbz('申请行政复议时一并提出行政赔偿请求，未提供受具体行政行为侵害而造成损害的证明材料；')">
</td></tr>
<tr><td align="left">
（十八）委托代理人申请行政复议，无授权委托书；<input value="委托代理人申请行政复议，无授权委托书；" type="checkbox" class="checkbox" onclick="addbz('委托代理人申请行政复议，无授权委托书；')">
</td></tr>
<tr><td align="left">
（十九）委托代理人为公民，无代理人身份证或者户口本复印件；<input value="委托代理人为公民，无代理人身份证或者户口本复印件；" type="checkbox" class="checkbox" onclick="addbz('（十九）委托代理人为公民，无代理人身份证或者户口本复印件；')">
</td></tr>
<tr><td align="left">
（二十）委托代理人为律师，无律师事务所指派函原件和律师执业证复印件；<input value="委托代理人为律师，无律师事务所指派函原件和律师执业证复印件；" type="checkbox" class="checkbox" onclick="addbz('（二十）委托代理人为律师，无律师事务所指派函原件和律师执业证复印件；')">
</td></tr>
<tr><td align="left">
（二十一）申请人为无民事行为能力人或者限制民事行为能力人，无户籍证明复印件、结婚证复印件等法定代理相关证明材料；<input value="申请人为无民事行为能力人或者限制民事行为能力人，无户籍证明复印件、结婚证复印件等法定代理相关证明材料；" type="checkbox" class="checkbox" onclick="addbz('（二十一）申请人为无民事行为能力人或者限制民事行为能力人，无户籍证明复印件、结婚证复印件等法定代理相关证明材料；')">
</td></tr>
<tr><td align="left">
（二十二）同一行政复议案件申请人超过5人，没有推选1至5名代表参加行政复议；<input value="同一行政复议案件申请人超过5人，没有推选1至5名代表参加行政复议；" type="checkbox" class="checkbox" onclick="addbz('（二十二）同一行政复议案件申请人超过5人，没有推选1至5名代表参加行政复议。')">
</td></tr>
<tr><td align="left">
（二十三））同一行政复议案件申请人超过5人，推选1至5名代表参加行政复议，但是缺少有全体申请人签字的推选书；<input value="同一行政复议案件申请人超过5人，推选1至5名代表参加行政复议，但是缺少有全体申请人签字的推选书；" type="checkbox" class="checkbox" onclick="addbz('（二十三）同一行政复议案件申请人超过5人，推选1至5名代表参加行政复议，但是缺少有全体申请人签字的推选书；')">
</td></tr>
<tr><td align="left">
（二十四）申请人对两个和两个以上的具体行政行为不服申请行政复议，没有分别提出行政复议申请；<input value="申请人对两个和两个以上的具体行政行为不服申请行政复议，没有分别提出行政复议申请；" type="checkbox" class="checkbox" onclick="addbz('（二十四）申请人对两个和两个以上的具体行政行为不服申请行政复议，没有分别提出行政复议申请；')">
</td></tr>
<tr><td align="left">
（二十五）其他需要补正的情形。<input value="其他需要补正的情形。" type="checkbox" class="checkbox" onclick="addbz('（二十五）其他需要补正的情形。')">
</td></tr>
</table>
</div>

<div id="aqDiv" style="position:absolute;display:none;" class="formDiv">
	<div class="btn">
	<div class="fr">
		<a href="javascript:addUser:recheckAq()">重填</a>
		<a href="javascript:addUser:closeAq()">完成</a>
	</div>
	</div>
	<table width="90%" border='0' >
		<tr>
			<td align="left">
			1、当事人扬言去天安门等敏感地区自杀、自焚，扬言暴力报复相关人，或者对接待人员的言辞、行为反应激烈，辱骂接待人员，试图闯入工作区域，以及其他可能构成安全隐患的情况；
			<input value="当事人扬言去天安门等敏感地区自杀、自焚，扬言暴力报复相关人，或者对接待人员的言辞、行为反应激烈，辱骂接待人员，试图闯入工作区域，以及其他可能构成安全隐患的情况；" type="checkbox" class="checkbox"  onclick="addAq('当事人扬言去天安门等敏感地区自杀、自焚，扬言暴力报复相关人，或者对接待人员的言辞、行为反应激烈，辱骂接待人员，试图闯入工作区域，以及其他可能构成安全隐患的情况；')">
			</td>
		</tr>
		<tr>
			<td align="left">
			2、当事人宣称有精神病史，或者多次来访且精神状态可疑的；<input value="当事人宣称有精神病史，或者多次来访且精神状态可疑的；" type="checkbox" class="checkbox" onclick="addAq('当事人宣称有精神病史，或者多次来访且精神状态可疑的；')">
			</td>
		</tr>
		<tr>
			<td align="left">
			3、遇有大规模群体上访或者群体复议情况；<input value="遇有大规模群体上访或者群体复议情况；" type="checkbox" class="checkbox" onclick="addAq('遇有大规模群体上访或者群体复议情况；')">
			</td>
		</tr>
		<tr>
			<td align="left">
			4、遇有其他安全隐患；<input value="遇有其他安全隐患；" type="checkbox" class="checkbox" onclick="addAq('遇有其他安全隐患；')">
			</td>
		</tr>
		<tr>
			<td align="left">
			5、当事人未经许可闯入工作区域；<input value="当事人未经许可闯入工作区域；" type="checkbox" class="checkbox" onclick="addAq('当事人未经许可闯入工作区域；')">
			</td>
		</tr>
		<tr>
			<td align="left">
			6、当事人在等候、接待区域情绪异常(过于激烈或者沉默，或者有明显精神病症状) ，举止可疑、有寻衅滋事征兆（如试图闯入工作区，敲击门窗、触摸屏、桌椅等未造成损坏的）等行为；
			<input value="当事人在等候、接待区域情绪异常(过于激烈或者沉默，或者有明显精神病症状) ，举止可疑、有寻衅滋事征兆（如试图闯入工作区，敲击门窗、触摸屏、桌椅等未造成损坏的）等行为；" type="checkbox" class="checkbox" onclick="addAq('当事人在等候、接待区域情绪异常(过于激烈或者沉默，或者有明显精神病症状) ，举止可疑、有寻衅滋事征兆（如试图闯入工作区，敲击门窗、触摸屏、桌椅等未造成损坏的）等行为；')">
			</td>
		</tr>
		<tr>
			<td align="left">
			7、当事人携带可疑物品（携带棍、条状物品，携带酒瓶或可疑容器，携带可疑包裹）；
<input value="当事人携带可疑物品（携带棍、条状物品，携带酒瓶或可疑容器，携带可疑包裹）；" 
type="checkbox" class="checkbox" onclick="addAq('当事人携带可疑物品（携带棍、条状物品，携带酒瓶或可疑容器，携带可疑包裹）；')">
</td></tr>
<tr><td align="left">
8、当事人扬言当场自杀、自残、自焚；
<input value="当事人扬言当场自杀、自残、自焚；" 
type="checkbox" class="checkbox" onclick="addAq('当事人扬言当场自杀、自残、自焚；')">
</td></tr>
<tr><td align="left">
9、事人携带管制刀具、棍棒、有毒有害气体液体等危险物品；
<input value="事人携带管制刀具、棍棒、有毒有害气体液体等危险物品；" 
type="checkbox" class="checkbox" onclick="addAq('事人携带管制刀具、棍棒、有毒有害气体液体等危险物品；')">
</td></tr>
<tr><td align="left">
10、当事人在等候、接待区域有对接待人员企图进行人身伤害的（亮出棍棒、刀具、可燃气体、液体等凶器；或者扬言伤害，并采取了肢体动作）；
<input value="当事人在等候、接待区域有对接待人员企图进行人身伤害的（亮出棍棒、刀具、可燃气体、液体等凶器；或者扬言伤害，并采取了肢体动作）；" 
type="checkbox" class="checkbox" onclick="addAq('当事人在等候、接待区域有对接待人员企图进行人身伤害的（亮出棍棒、刀具、可燃气体、液体等凶器；或者扬言伤害，并采取了肢体动作）；')">
</td></tr>
<tr><td align="left">
11、当事人在工作区域有对接待人员企图进行人身伤害的（亮出棍、刀具、可燃液体等凶器；或者扬言伤害，并采取了肢体动作）；
<input value="当事人在工作区域有对接待人员企图进行人身伤害的（亮出棍、刀具、可燃液体等凶器；或者扬言伤害，并采取了肢体动作）；" 
type="checkbox" class="checkbox" onclick="addAq('当事人在工作区域有对接待人员企图进行人身伤害的（亮出棍、刀具、可燃液体等凶器；或者扬言伤害，并采取了肢体动作）；')">
</td></tr>
<tr><td align="left">
12、出现当事人故意毁坏公私财物事件或者盗窃、抢夺事件；
<input value="出现当事人故意毁坏公私财物事件或者盗窃、抢夺事件；" 
type="checkbox" class="checkbox" onclick="addAq('出现当事人故意毁坏公私财物事件或者盗窃、抢夺事件；')">
</td></tr>
</table>
</div>

</form>
</body>

<script language="javascript">
function opendg(dgurl,dgw,dgh)
{
  $.dialog({ 
    title:'申请人管理',
    width: dgw,
    height: dgh,
    content:'url:'+ dgurl});
}
	function xbz(){
		var selectList=document.getElementsByTagName("select");
		for(var i=0;i<selectList.length;i++){
			if(selectList.item(i).retSelect){

			}else{
				selectList.item(i).style.display="block";
			}
		}
		document.getElementById("bzDiv").style.display="none";	
		var userspan=document.getElementById("bzspan");
		userspan.style.display="block";
		document.getElementById("bzDiv").style.display="none";
	}


function szfyqq(a){
	

	if(a=="2"){
		document.getElementById("requestrrr").value="2";
		document.getElementById("requesttype2").style.display="block";
		document.getElementById("requesttype3").style.display="block";
		document.getElementById("closeBzw").style.display="block";
		document.getElementById("getBzw").style.display="none";
		document.getElementById("xwspan").style.display="none";
		document.getElementById("xw_an").innerHTML="";
		document.getElementById("jutixingzheng").style.display="none";
		document.getElementById("jutixingzheng1").style.display="none";
		
		document.getElementById("q_3_1").disabled="disabled";
		document.getElementById("q_3_2").disabled="disabled";
		document.getElementById("q_3_3").disabled="disabled";
        document.getElementById("h_2_1").disabled="";
		document.getElementById("h_2_2").disabled="";
		
		
		//document.getElementByClassName("q_3").style.display="none";
		//document.getElementByClassName("h_2").style.display="block";
	}
	if(a=="0")
	{
		document.getElementById("requestrrr").value="0";
		document.getElementById("requesttype2").style.display="none";
		document.getElementById("requesttype3").style.display="none";
		document.getElementById("xwspan").style.display="block";
		document.getElementById("closeBzw").style.display="none";
		document.getElementById("getBzw").style.display="none";
		document.getElementById("xw_an").innerHTML="";
		document.getElementById("jutixingzheng").style.display="block";
		document.getElementById("jutixingzheng1").style.display="block";
		
		document.getElementById("q_3_1").disabled="";
		document.getElementById("q_3_2").disabled="";
		document.getElementById("q_3_3").disabled="";
        document.getElementById("h_2_1").disabled="disabled";
		document.getElementById("h_2_2").disabled="disabled";
		
		
	}
	if(a=="3")
	{
		document.getElementById("requesttype_1").style.display="block";
	}
	if(a=="4")
	{
		document.getElementById("requesttype_1").style.display="none";
	}
	
}


function setNotsend_n(){
	document.getElementById("scresult").value=0;
}
function setNotsend(){
   //document.getElementById("scresult").value=5;
   document.getElementById("ajsjfm1").value=0;
   document.getElementById("dlr1").value="";
   document.getElementById("dsdlr1").value="";
   document.getElementById("bfyjtxwah1").value="";
   document.getElementById("xzfyqq1").value="";
   document.getElementById("bfyjtxwmc1").value="";
   document.getElementById("addbegin").value="";
   document.getElementById("addend1").value="";
   document.getElementById("cbrsubdate").value="";
   document.getElementById("cbropinion").value="";
   
   
   //document.getElementById("di3ren_y").checked=false;
  // document.getElementById("di3ren_n").checked=false;
   document.getElementById("xzpc_y").checked=false;
   document.getElementById("xzpc_n").checked=false;
   document.getElementById("TIsadd_y").checked=false;
   document.getElementById("TIsadd_n").checked=false;
   document.getElementById("gfsc_n").checked=false;
   document.getElementById("gfsc_n").checked=false;
   
}
function test(){
	//alert(document.getElementById("deptid").value);
}

subcat = new Array();
var count=0;

<#list bList as dl>	
       subcat[${dl_index}]=new Array("${dl.type}","${dl.name}","${dl.value}"); 
       count++;    
</#list>


function aaa() {
	var aaa = document.getElementById('beapptype').value;
	if(aaa==8||aaa==11){//8--‘其他’
		document.getElementById("beappnameinput").setAttribute("ischeck","y");
		document.getElementById("beappnametd").style.display="block";
		document.getElementById("beappnamesel").style.display="none";
		document.getElementById("beappnameinput").name="xzfyInfo.defendant_name";
		document.getElementById("beappname").name="ssss";
		document.getElementById("beappname").removeAttribute("ischeck");
	} else {
		document.getElementById("beappname").setAttribute("ischeck","y");
	    document.getElementById("beappnamesel").style.display="block";
		document.getElementById("beappnametd").style.display="none";
		document.getElementById("beappname").name="xzfyInfo.defendant_name";
		document.getElementById("beappnameinput").name="ssss";
		document.getElementById("beappnameinput").removeAttribute("ischeck");
		document.getElementById('beappname').length = 0; 
		document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
       var x;
        for (x=0; x < count; x++)
         {
            if (subcat[x][0] == aaa)

               {   var tempOption=new Option(subcat[x][1], subcat[x][1]);
               	   tempOption.deptcode=subcat[x][2];
                   document.getElementById('beappname').options[document.getElementById('beappname').length] = tempOption;
                } 
           }
	}
}
<#--    
function aaa()
{
 	var ss = document.getElementById('beapptype').options[document.getElementById('beapptype').selectedIndex].value;
    if( document.getElementById('beapptype').value==9){
    document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	document.getElementById("beappname").name="xzfyInfo.defendant_name";
	document.getElementById("beappnameinput").name="ssss";
	document.getElementById("beappnameinput").removeAttribute("ischeck");	
	
    document.getElementById('beappname').length=0;
    //var tempOption=new Option("市经济技术开发区管委会","市经济技术开发区管委会");
    document.getElementById('beappname').options[0] = new Option("----请选择-----", "0");
   // document.getElementById('beappname').options[1] = tempOption;
   }
    else if(document.getElementById('beapptype').value==1||document.getElementById('beapptype').value==2||document.getElementById('beapptype').value==3||document.getElementById('beapptype').value==4||document.getElementById('beapptype').value==8){
	document.getElementById("beappnameinput").setAttribute("ischeck","y");
	document.getElementById("beappnametd").style.display="block";
	document.getElementById("beappnamesel").style.display="none";
	document.getElementById("beappnameinput").name="xzfyInfo.defendant_name";
	document.getElementById("beappname").name="ssss";
	document.getElementById("beappname").removeAttribute("ischeck");
   
   }
    else{
   	document.getElementById("beappname").setAttribute("ischeck","y");
    document.getElementById("beappnamesel").style.display="block";
	document.getElementById("beappnametd").style.display="none";
	document.getElementById("beappname").name="xzfyInfo.defendant_name";
	document.getElementById("beappnameinput").name="ssss";
	document.getElementById("beappnameinput").removeAttribute("ischeck");
	document.getElementById('beappname').length = 0; 
	document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
        var locationid=locationid;
		var x;
        for (x=0; x < count; x++)
         {
            if (subcat[x][0] == ss)

               {   var tempOption=new Option(subcat[x][1], subcat[x][1]);
               	   tempOption.deptcode=subcat[x][2];
                   document.getElementById('beappname').options[document.getElementById('beappname').length] = tempOption;
                } 
           }
	}
}
-->
function beappcode(){
	var code=document.getElementById('beappname').options[document.getElementById('beappname').selectedIndex].deptcode;	
	//alert(document.getElementById('beappname').value)
	if(document.getElementById('beappname').value!=''){
	//var code=document.getElementById('beappname').deptcode;
	document.getElementById('deptid').value=code;	}
}


function addchecked(){
	document.getElementById("scresult").value="0";
	document.getElementById("cbrsubdate").value="";
	document.getElementById("cbropinion").value="";
	//document.getElementById("caseyj").value="";
	//document.getElementById("casebrief").value="";
	document.getElementById("gfsc_y").checked=false;
	document.getElementById("gfsc_n").checked=false;
}
function addnotchecked(){

	document.getElementById("addbegin").value="";
	document.getElementById("addend1").value="";
	
}

function checkfysx(){


	return true;
}
function checkajgllb(){
	if((document.getElementById("ajsjfm1").value==1&&document.getElementById("ajgllbga").value==0)||(document.getElementById("ajsjfm1").value==6&&document.getElementById("ajgllbnlhz").value==0)||(document.getElementById("ajsjfm1").value==7&&document.getElementById("ajgllbcj").value==0)||(document.getElementById("ajsjfm1").value==8&&document.getElementById("ajgllbgjss").value==0)||(document.getElementById("ajsjfm1").value==9&&document.getElementById("ajgllbczjr").value==0)||(document.getElementById("ajsjfm1").value==10&&document.getElementById("ajgllbjkww").value==0))
	
	{return false;}
	
	else{

	return true;
	}
}


function check_remark(){
	if(document.getElementById("handle").value==0){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		//document.getElementById("otherAdvice").style.display="none";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("bznr").style.display="none";
		document.getElementById("bzspan").style.display="none";
		
	}else
	if(document.getElementById("handle").value==1){
		document.getElementById("handle_detail").style.display="block";
		document.getElementById("advicespan").style.display="block";
		//document.getElementById("check_select").style.display="block";
		//document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("bznr").style.display="none";
		document.getElementById("bzspan").style.display="none";
		
	}else if(document.getElementById("handle").value==3){
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		//document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="block";
		document.getElementById("filespan").style.display="block";
		document.getElementById("bznr").style.display="none";
		document.getElementById("bzspan").style.display="none";
		updateFile();
	}else{
		document.getElementById("handle_detail").style.display="none";
		document.getElementById("advicespan").style.display="none";
		document.getElementById("check_select").style.display="none";
		//document.getElementById("otherAdvice").style.display="block";
		document.getElementById("filedetail").style.display="none";
		document.getElementById("filespan").style.display="none";
		document.getElementById("bznr").style.display="block";
		document.getElementById("bzspan").style.display="block";
		
	}
}

function checknull()
{	
	//if(document.getElementById("user").value==""){alert("请填写被接待人!");return;}
	if (document.getElementById("applicationtype").value==1){
		if(document.getElementById("shenqingren").value==""){alert("请填写申请人!");return;}
	} else {
		if(document.getElementById("appname").value==""){alert("请填写申请人!");return;}
	}
	var intReg=/^[0-9]*[1-9][0-9]*$/;
	//if(!intReg.test(document.getElementById("applicationsum").value)){alert("请填写接待人人数");return;}
	if(!intReg.test(document.getElementById("rencount").value)){alert("请填写申请人人数");return;}
	var a=document.getElementsByTagName("input");	
	for(var i=0;i<a.length;i++)
		if(a.item(i).ischeck)
		{
		    if(a.item(i).type=="radio")
			{
			if(!(((document.getElementsByName(a.item(i).name)[0]).checked)||((document.getElementsByName(a.item(i).name)[1]).checked)))
				{
					alert("请填写1:"+document.getElementsByName(a.item(i).name)[0].altname+"!");return false;
				}			
			}
			else if(a.item(i).value=="")
				{
					alert("请填写2:"+a.item(i).altname+"!");return false;
				}
		}	
	
	
	if(document.getElementById("xzfyqq1").value==""){alert("请填写行政复议请求!");return;}
	if(document.getElementById("beapptype").value==0) {alert("请填写被申请人种类!");return false;}
	
	if(!checkfysx()){
		alert("请填写申请复议事项!");
		return;	
	}

	var a=document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++)
	{
		if(a.item(i).ischeck)
		{
			if(a.item(i).value=="0"){alert("请您填写3:"+a.item(i).altname+"!");return false;	}			
		}
	}
	
	//if(document.getElementById("requestrrr").value=="0"){
	//	if(document.getElementById("xingwei1").value==""){alert("请填写要求复议的具体行政行为情况!");return;}
	//}
	
	if(document.getElementById("zhidaosj").value==""){
		alert("请填写知道该行政行为时间!");return;
	}
	return true;
}


//申请复议事项非空判断
function fysxCheck(){
    var refer=0;
	var disList2 = document.getElementsByName("xzfyInfo.casetype");
	for(var i=0;i<disList2.length;i++){
		if(disList2.item(i).checked==true){
			refer=disList2.item(i).value;

		}
	}
	if(refer==0){
		return false;
	}
	return true;
}
//行政类别非空判断
function xzlbCheck(){
    var refer=0;
	var disList2 = document.getElementsByName("xzfyInfo.refer");
	for(var i=0;i<disList2.length;i++){
		if(disList2.item(i).checked==true){
			refer=disList2.item(i).value;

		}
	}
	if(refer==0){
		return false;
	}
	return true;
}
<#--
function getUser(){
	var name =encodeURIComponent(document.getElementById("appstring").value);
	if(name==""){
		alert("请填写被接待人！")
	}else{
		window.open ("../jds/checkApplication.action?appString="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}

function getUser1(){
       
	var name = encodeURIComponent(document.getElementById("appname").value);	
	if(name==""){
		alert("请填写代表人名称！")
	}else{
	window.open ("../jds/dupdenamecheck.action?TDeputy="+name,'newwindow','height=300,width=400,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}
}
-->

function saveNew(id){ 
	setCountAppname('shenqingren','rencount');
    if(checknull()){
		listForm_= document.getElementById("form1");
		listForm_.action="../xzfy/saveFace.action?funcCode=${funcCode}&&xzfyId=" + id;
			if(confirm("您确认提交吗?"))
			listForm_.submit();
	}
}

function saveJD(){ 
    
	listForm_= document.getElementById("form1");	
	document.getElementById("sta").value="11";
	
		listForm_.action="../jds/App_FaceSaveAction.action";
		if(confirm("您确认保存吗?")){
		//	document.getElementById("appType").value="7";
			listForm_.submit();
		}
		
	}
	function subNew(){ 
	    listForm_= document.getElementById("form1");
	    	document.getElementById("sta").value="12";
			listForm_.action="../jds/App_FaceSaveAction.action";
			var valid = new Validation("form1");
	        var result = valid.validate();
	        if(result==true&&confirm("您确认提交为复议申请吗?"))
				
				{		
				listForm_.submit();
				}		
		}
	
	function subjiandu(){ 
    listForm_= document.getElementById("form1");
    	document.getElementById("sta").value="13";
		listForm_.action="../jds/App_FaceSaveAction.action";
		var valid = new Validation("form1");
	        var result = valid.validate();
		
        if(result==true&&confirm("您确认提交为监督案件吗?"))
			
			{		
				listForm_.submit();
			}		
	}
	
function sendchecknull(){
/*
	if(document.getElementById("user").value=="") {alert("请填写申请人!");return false;}
	else if(document.getElementById("receivedate").value=="") {alert("请填写收案日期!");return false;}
	else if(document.getElementById("handlesecond").value=="") {alert("请填写第二承办人姓名!");return false;}
	else if(document.getElementById("applicationtype").value==0) {alert("请填写申请人类别!");return false;}
	
	else if(!document.getElementById("duoren_y").checked&&!document.getElementById("duoren_n").checked) {alert("请填写多人复议!");return false;}
	else if(document.getElementById("beapptype").value==0) {alert("请填写被申请人种类!");return false;}
	else if((document.getElementById("beappname").value==0)&&(document.getElementById("beappname2").value=="")) {alert("请填写被申请人名称!");return false;}
	
	else if(document.getElementById("xzfysx").value==0) {alert("请填写申请复议事项!");return false;}
	else if(!document.getElementById("fyqz_y").checked&&!document.getElementById("fyqz_n").checked) {alert("请填写复议前置!");return false;}
	else if(document.getElementById("senddept3").value=="") {alert("请填写转送机构名称!");return false;}
	*/
	return true;
	
}
<#--
function scjlchange(){
	if(document.getElementById("scresult").value==4){
	senddept.style.display='block';
	senddept1.style.display='block';
	document.getElementById("sendtbody").style.display="block";
	//sendnotuse.style.display='none';
	//shencha.style.display='none';
	//buzheng.style.display='none';
	//setNotsend();
	}
	else{
	senddept.style.display='none';
	senddept1.style.display='none';
	document.getElementById("sendtbody").style.display="none";
	document.getElementById("senddept3").value="";
	//sendnotuse.style.display='block';
	//shencha.style.display='block';
	//setNotsend_n();
	}
}
-->

function setBuzheng(ev){
	var udiv=document.getElementById("bzDiv");
	var userspan=document.getElementById("bzspan");
	var areaObject=document.getElementById("bznr");
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	if(udiv.style.display!="block"){
		ev = ev || window.event;
		var mousePos = getPosition(areaObject);
		udiv.style.position = "absolute";
		udiv.style.top      = mousePos.y+20;
		udiv.style.left     = mousePos.x+20;
		udiv.style.display="block";
		userspan.style.display="none";
		closeSelect();
	}
}



function setAdvice(ev){
	var udiv=document.getElementById("adviceDiv");
	var userspan=document.getElementById("advicespan");
	var areaObject=document.getElementById("quanyi");
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	if(udiv.style.display!="block"){
	ev = ev || window.event;
	var mousePos = getPosition(areaObject);
	udiv.style.position = "absolute";
	udiv.style.top      = mousePos.y+20;
	udiv.style.left     = mousePos.x+180;
	udiv.style.display="block";
	userspan.style.display="none";
	closeSelect();
	}
}

function addbz(advice){
	var bzDiv=document.getElementById("bzDiv");
	var filelist=bzDiv.getElementsByTagName("input");
	var bzString="该行政复议申请中有如下材料欠缺或表达不清，根据《中华人民共和国行政复议法实施条例》第29条的规定，请申请人于接待之日起5个工作日内补正。无正当理由逾期不补正的，视为放弃行政复议申请。补正申请材料所用时间不计入行政复议案件审理期限。补正内容：\n";
	var count=1;
	for(var j=0;j<filelist.length;j++){
		if(filelist.item(j).type=="checkbox"){
			if(filelist.item(j).checked==true){
				bzString=bzString+"    "+count+"、"+filelist.item(j).value+"\n";
				count++;
			}
		}
	}
	document.getElementById("bznr").value=bzString;
	//document.getElementById("bznr").value=document.getElementById("bznr").value+advice+"\n";
}

function closeAdvice(){
	var userspan=document.getElementById("advicespan");
	userspan.style.display="block";
	document.getElementById("adviceDiv").style.display="none";
	openSelect();
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="block";
		}
	}
}

function closeBz(){
	var userspan=document.getElementById("bzspan");
	userspan.style.display="block";
	document.getElementById("bzDiv").style.display="none";
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="block";
		}
	}
	openSelect();
}
function recheckBz(){
	document.getElementById("bznr").value="该行政复议申请中有如下材料欠缺或表达不清，根据《中华人民共和国行政复议法实施条例》第29条的规定，请申请人于接待之日起5个工作日内补正。无正当理由逾期不补正的，视为放弃行政复议申请。补正申请材料所用时间不计入行政复议案件审理期限。补正内容：\n";
}

function rechekAadvice(){
	document.getElementById("handle_detail").value="";

}

function addAdvice(advice){
	document.getElementById("handle_detail").value=advice;
}

function showTiaojie(){
	var tiaojie = document.getElementById("tiaojie").value;
	if(tiaojie=="1"){
		document.getElementById("otherDetail").style.display="block";	
		document.getElementById("otherDetail2").style.display="block";
	}else{
		document.getElementById("otherDetail").style.display="none";
		document.getElementById("otherDetail2").style.display="none";	
	}
}



function key(ev){
	var key1 = document.getElementById("keyword").value;
	if(key1=="1")
	{
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
		udiv=document.getElementById("key1Div");
		var areaObject=document.getElementById("keyword");
		if(udiv.style.display!="block"){
			ev = ev || window.event;
			var mousePos = getPosition(areaObject);
			var h=document.body.clientHeight 
			udiv.style.position = "absolute";
			udiv.style.top = mousePos.y-150;
			udiv.style.left = mousePos.x-95;
			udiv.style.display="block";
		}
		document.getElementById("key2Div").style.display="none";
		document.getElementById("key3Div").style.display="none";
	}
	else{
	if(key1=="2"){
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
		udiv=document.getElementById("key2Div");
		var areaObject=document.getElementById("keyword");
		if(udiv.style.display!="block"){
			ev = ev || window.event;
			var mousePos = getPosition(areaObject);
			var h=document.body.clientHeight 
			udiv.style.position = "absolute";
			udiv.style.top = mousePos.y-130;
			udiv.style.left = mousePos.x-95;
			udiv.style.display="block";
		}
	document.getElementById("key1Div").style.display="none";
	document.getElementById("key3Div").style.display="none";
	}
		else{
			if(key1=="3"){

			var selectList=document.getElementsByTagName("select");
			for(var i=0;i<selectList.length;i++){
				if(selectList.item(i).retSelect){

				}else{
					selectList.item(i).style.display="none";
				}
			}
			udiv=document.getElementById("key3Div");
			var areaObject=document.getElementById("keyword");
			if(udiv.style.display!="block"){
				ev = ev || window.event;
				var mousePos = getPosition(areaObject);
				var h=document.body.clientHeight 
				udiv.style.position = "absolute";
				udiv.style.top = mousePos.y-105;
				udiv.style.left = mousePos.x-95;
				udiv.style.display="block";
			}

			document.getElementById("key1Div").style.display="none";
			document.getElementById("key2Div").style.display="none";
				}
			else{
			var selectList=document.getElementsByTagName("select");
			for(var i=0;i<selectList.length;i++){
				if(selectList.item(i).retSelect){

				}else{
					selectList.item(i).style.display="block";
				}
			}
				document.getElementById("key1Div").style.display="none";
				document.getElementById("key2Div").style.display="none";
				document.getElementById("key3Div").style.display="none";
			}
			}
	}
}
function dispose()
{
	var disList = document.getElementsByName("xzfyInfo.reception");
	for(var i=0;i<disList.length;i++){
		if(disList.item(i).checked==true){
			if(disList.item(i).value=="1"){
				document.getElementById("reception1").style.display="block";
			}else{
				document.getElementById("reception1").style.display="none";
			}
		}
	}
}

function checkRefer(refer1Id,refer2Id){
	if(refer2Id!=0){
	document.getElementById(refer2Id).checked=true;
	}
	document.getElementById(refer1Id).checked=true;
	if(document.getElementById(refer1Id).value==1){
	document.getElementById("youxing").style.display="block";
	}else{
	document.getElementById("youxing").style.display="none";
	}
}

function checkRefer1(refer1Id){
	document.getElementById(refer1Id).checked=true;
}


function checkCase(case2Id,caseId){
	document.getElementById(case2Id).checked=true;
	document.getElementById(caseId).checked=true;
}

function checkCase1(caseId){
	document.getElementById(caseId).checked=true;
}

function checkReception(reception2Id,receptionId){
	document.getElementById(reception2Id).checked=true;
	document.getElementById(receptionId).checked=true;
}

function checkReception1(receptionId){
	document.getElementById(receptionId).checked=true;
}

function lian1(){
		if(document.getElementById("kkk1").style.display="block")
		{
		document.getElementById("kkk1").style.display="none";
		document.getElementById("kkk2").style.display="block";
		}
	}
function lian2(){		
		if(document.getElementById("kkk2").style.display="block")
		{
		document.getElementById("kkk2").style.display="none";
		document.getElementById("kkk1").style.display="block";
		
		}
}
function renCount()
{

	var cc = document.getElementById("rencount").value;
		for(var j=0; j<cc.length; j++)
		{
			if(cc.charAt(j)<'0' || cc.charAt(j)>'9')
			{
				alert("请输入数字");
				document.getElementById("rencount").value=1;
				return false;
			}else{
					if(cc>=6)
					{	
						document.getElementById("duoren_y").value="是";
						document.getElementById("daibiaorendiv").style.display="block";
					}
					else
					{
						document.getElementById("duoren_y").value="否";
						document.getElementById("daibiaorendiv").style.display="none";
					}
			}
		}


}
function ryq(){
	var request2yiban=document.getElementById("xzfyqq1");
	var requestValue=document.getElementById("request2yiban").value;
				if(requestValue==0){
					request2yiban.value="无";
					request2yiban.innerHTML="";
				}else if(requestValue==1){
					request2yiban.value="请求撤销该具体行政行为";
				}else if(requestValue==2){
					request2yiban.value="请求变更该具体行政行为";
				}else if(requestValue==3){
					request2yiban.value="请求确认该具体行政行为违法";
				}else if(requestValue==4){
					request2yiban.value="请求责令被申请人履行法定职责";
				}else if(requestValue==5){
					request2yiban.value="请求确认被申请人不履行法定职责违法";
				}

}
function ryq2(){
	document.getElementById("mingque").value=document.getElementById("ismingque").value;
}

function closeBzw(){
	document.getElementById("requesttype2").style.display="none";
	//document.getElementById("requesttype3").style.display="none";
	document.getElementById("closeBzw").style.display="none";
	document.getElementById("getBzw").style.display="block";

	var menuString;
	var use_type=document.getElementById("use_type").value;
	menuString="行政不作为事项："+use_type+"；<br>";
	var usedate=document.getElementById("usedate").value;
	menuString=menuString+"履行日期："+usedate+"；<br>";
	var mingque=document.getElementById("mingque").value;
	menuString=menuString+"证明材料："+mingque;
	document.getElementById("xw_an").innerHTML=menuString;
	document.getElementById("require_fy").value=menuString;
}

function closeBzw1(){
	if(document.getElementById("requestrrr").value==2){
	//document.getElementById("requesttype2").style.display="none";
	//document.getElementById("requesttype3").style.display="none";
	document.getElementById("closeBzw").style.display="none";
	document.getElementById("getBzw").style.display="block";
	var menuString;
	var use_type=document.getElementById("use_type").value;
	menuString="行政不作为事项："+use_type+"；<br>";
	var usedate=document.getElementById("usedate").value;
	menuString=menuString+"履行日期："+usedate+"；<br>";
	var mingque=document.getElementById("mingque").value;
	menuString=menuString+"证明材料："+mingque;
	document.getElementById("xw_an").innerHTML=menuString;
	document.getElementById("require_fy").value=menuString;
	}
}

function getBzw(){
	document.getElementById("requesttype2").style.display="block";
	//document.getElementById("requesttype3").style.display="block";
	document.getElementById("closeBzw").style.display="block";
	document.getElementById("getBzw").style.display="none";
}

function setKnowDate(){
	var year=document.getElementById("knowy").value;
	var month=document.getElementById("knowm").value;
	var day=document.getElementById("knowd").value;
	var knowDate="";
	if(year!=0){
		knowDate=year+"年";
		if(month!=0){
			knowDate=knowDate+month+"月";
			if(day!=0){
				knowDate=knowDate+day+"日";
			}
		}
	}
	document.getElementById("zhidaodate").value=knowDate;
}

function setKnowDate1(){
	var year=document.getElementById("knowy1").value;
	var month=document.getElementById("knowm1").value;
	var day=document.getElementById("knowd1").value;
	var knowDate="";
	if(year!=0){
		knowDate=year+"年";
		if(month!=0){
			knowDate=knowDate+month+"月";
			if(day!=0){
				knowDate=knowDate+day+"日";
			}
		}
	}
	document.getElementById("usedate").value=knowDate;
}
function setKnowDate2(){
	var year=document.getElementById("knowy2").value;
	var month=document.getElementById("knowm2").value;
	var day=document.getElementById("knowd2").value;
	var knowDate="";
	if(year!=0){
		knowDate=year+"年";
		if(month!=0){
			knowDate=knowDate+month+"月";
			if(day!=0){
				knowDate=knowDate+day+"日";
			}
		}
	}
	document.getElementById("zhidaosj").value=knowDate;
}
function check_shencha(idValue){
	if(idValue==1)
		document.getElementById("shencha").style.display="block";
	else
		document.getElementById("shencha").style.display="none";
		document.getElementById("post2").value="";
}

 function getPosition1(obj){
  //alert(obj.tagName);
  var result = 0;
  if(obj.selectionStart){ //非IE浏览器
   result = obj.selectionStart
  }else{ //IE
   var rng;
   if(obj.tagName == "TEXTAREA"){ //如果是文本域
    rng = event.srcElement.createTextRange();
    //rng.moveToPoint(20,20);
   }else{ //输入框
    rng = document.selection.createRange();
   }
   rng.moveStart("character",-event.srcElement.value.length);
   result = rng.text.length;
  }
  return result;
 }

 function getValue1(obj){
     var pos = getPosition1(obj);
	 var answerValue=document.getElementById("otheradvice");
	 if(answerValue.value.length>0){
		var v1=answerValue.value.substring(0,pos);
		var v2=answerValue.value.substring(pos,answerValue.length);
		if(pos==answerValue.value.length)
			answerValue.value=v1+"\n问：\n答：";
		else
			answerValue.value=v1+"\n问：\n答："+v2;
	 }else{
		answerValue.value="问：\n答：";
	 }
 }

 function setWtDate1(){
	var year=document.getElementById("wtsj1").value;
	var month=document.getElementById("wtsj2").value;
	var day=document.getElementById("wtsj3").value;
	var knowDate="";
	if(year!=0){
		knowDate=year+"年";
		if(month!=0){
			knowDate=knowDate+month+"月";
			if(day!=0){
				knowDate=knowDate+day+"日";
			}
		}
	}
	document.getElementById("wtsj").value=knowDate;
 }
 
 function ajgllb(){
	
	if(document.getElementById("ajsjfm1").value==1){		
		
		document.getElementById("ajgllbga").style.display="block";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="xzfyInfo.refer2";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";

		
	}
	if(document.getElementById("ajsjfm1").value==6){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="block";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="xzfyInfo.refer2";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";



	}
	if(document.getElementById("ajsjfm1").value==7){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="block";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="xzfyInfo.refer2";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";
	}

	if(document.getElementById("ajsjfm1").value==8){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="block";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="xzfyInfo.refer2";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="sss";
	}
	if(document.getElementById("ajsjfm1").value==9){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="block";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="xzfyInfo.refer2";
		document.getElementById("ajgllbjkww").name="sss";
	}
	if(document.getElementById("ajsjfm1").value==10){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="block";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="xzfyInfo.refer2";
	}

	if(!(document.getElementById("ajsjfm1").value==1||document.getElementById("ajsjfm1").value==6||document.getElementById("ajsjfm1").value==7||document.getElementById("ajsjfm1").value==8||document.getElementById("ajsjfm1").value==9||document.getElementById("ajsjfm1").value==10))
	{
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="ss";
	}
	
	if(document.getElementById("ajsjfm1").value==11){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		document.getElementById("xzgllbinput").style.display="block";
		
		document.getElementById("ajgllbga").name="sss";
		document.getElementById("ajgllbnlhz").name="sss";
		document.getElementById("ajgllbcj").name="sss";
		document.getElementById("ajgllbgjss").name="sss";
		document.getElementById("ajgllbczjr").name="sss";
		document.getElementById("ajgllbjkww").name="ss";
	}
}
 
 function anNumConfirm(){
 	var name=document.getElementById("xwname").value;
 	var num=document.getElementById("xwnum").value;
 	var dname="";
 	if( document.getElementById('beapptype').value==8){
   		dname = document.getElementById("beappnameinput").value;
   } else{
		dname = document.getElementById("beappname").value;
	}
	
	if (name==""){
		alert("请填写被复议的具体行为-名称！");
		return false;
	} else if (num=="") {
		alert("请填写被复议的具体行为-文号！");
		return false;
	}else if (dname=="0"||dname=="") {
		alert("请填写被申请人名称！");
		return false;
	}

 	url="anNumConfirm.action?funcCode=${funcCode}&xwNum="+encodeURI(num)+"&xwName="+encodeURI(name)+"&dname="+encodeURI(dname);
                  var myAjax = 	new Ajax.Request(
                  url, // 请求的URL
                {
                    method: 'get', // 使用post方式发送HTTP请求
                    onComplete: anNumConfirmReturn // 指定请求成功完成时需要执行的方法
                }
            );
 }
 

//查询
function anNumConfirmReturn(response) {
	var name=document.getElementById("xwname").value;
 	var num=document.getElementById("xwnum").value;
 	var dname="";
 	if( document.getElementById('beapptype').value==8){
   		dname = document.getElementById("beappnameinput").value;
   } else{
		dname = document.getElementById("beappname").value;
	}
	
	var n = response.responseText.split(",");
	var n1 = n[0];
	var n2 = n[1];
	window.open ("openXw.action?funcCode=${funcCode}&xwNum="+encodeURI(num)+"&xwName="+encodeURI(name)+"&dname="+encodeURI(dname)+"&n1="+n1+"&n2="+n2,'newwindow','height=300,width=400,top=300,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=yes'); 
 
}

function saveDoc(){
	setCountAppname('shenqingren','rencount');
    if(checknull()){
    	var options = {
		url:'shengchengshouju.action', //提交给哪个执行 
		type:'POST',
		success: callbackfun2 //显示操作提示 
	};
	$('#form1').ajaxSubmit(options);
	return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
    }
}

function callbackfun1(){
	var url ="../fzb_default_dafutongzhi.jsp?action=new&d_filetype=doc&d_templateid=20131014160005&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=shouju";
	window.open(url,'mainwindow2','location=no,resizable=yes');
}

function saveDoc2(){
				var options = { 
					url:'shengchengshouju.action', //提交给哪个执行 
					type:'POST', 
					success: callbackfun1 //显示操作提示 
				}; 
				$('#form1').ajaxSubmit(options); 
				return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
}

function callbackfun2(){
	var url ="../fzb_default_dafutongzhi.jsp?&d_filetype=doc&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=jiedaibilu";
	window.open(url,'mainwindow1','location=no,resizable=yes');
}

function saveDoc3(){
	var renCountTemp = document.getElementById("rencount").value;
	if(renCountTemp==null||renCountTemp==""){
		alert("请填写申请人人数");
		return;
	}
	var dlr=document.getElementById("isdlr").value;
	var dlrName=document.getElementById("dlrname").value;
	var xingwei=document.getElementById("xingwei1").value;
	var receivedate=document.getElementById("receivedate").value;
	var dsrAddress="";
	/*
	if(renCountTemp>=1 && renCountTemp<=5){
		dsrAddress=document.getElementById("shenqingren").value;
		if(dsrAddress==null || dsrAddress=="")
		{
			alert("请填写申请人");
			return;
		}
	}
	*/
	if(renCountTemp>5){
		dsrAddress=document.getElementById("deputy").value;
		if(dsrAddress==null || dsrAddress=="")
		{
			alert("请填写代表人");
			return;
		}
	}
	var jdrName=document.getElementById("admit2").value;
	var jdrName2=document.getElementById("admit").value;
	if(jdrName2!=""){
	jdrName=jdrName+","+jdrName2;
	}
	
	if(dlr==1)
	{
		if(dlrName==null||dlrName==""){
			alert("请填写代理人");
			return;
		}
	}	
	var options = { 
		url:'songdaqueren.action', //提交给哪个执行 
		type:'POST', 
		success: callbackfun3 //显示操作提示 
	}; 
	$('#form1').ajaxSubmit(options); 
	return false; //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 
}

function callbackfun3(){
	var url ="../fzb_default_dafutongzhi.jsp?action=read&d_filetype=doc&d_templateid=20131021132019&d_username=${Session['_USER_LOGIN_'].id}&caseId=${xzfyId}&mstype=songdadizhiquerenshu";
	window.open(url,'mainwindow3','location=no,resizable=yes');
}
<#--
function depChange(){
	if (document.getElementById("applicationtype").value==1){
		appsqr=document.getElementsByName("appsqr");
		appsex=document.getElementsByName("appsex");
		appnum=document.getElementsByName("appnum");
		appaddress=document.getElementsByName("appaddress");
		apppost=document.getElementsByName("apppost");
		appphone=document.getElementsByName("appphone");
	} else {
		appsqr=document.getElementsByName("frsqr");
	}
	for(var j=0;j<=appsqr.length;j++){
		alert("appsqr:"+appsqr.item(j).value);
		alert("deputySqr:"+document.getElementById("deputySqr").value);
		if(appsqr.item(j).value == document.getElementById("deputySqr").value){
				document.getElementById("depsex1").value = appsex.item(j).value
				if(appnum.length >= j){ 
					document.getElementById("depnum1").value = appnum.item(j).value
				}
				if(appaddress.length >= j){ 
					document.getElementById("depaddress1").value = appaddress.item(j).value
				}
				if(apppost.length >= 1){ 
					document.getElementById("deppost1").value = apppost.item(j).value
				}
				if(appphone.length >= j){ 
					document.getElementById("depphone1").value = appphone.item(j).value
				}
				break;
		}  else {
				document.getElementById("depsex1").value = "";
				document.getElementById("depnum1").value = "";
				document.getElementById("depaddress1").value = "";
				document.getElementById("deppost1").value = "";
				document.getElementById("depphone1").value = "";
		}
	}
}
-->

	var count11 = 1;
	function addattachment(){
		<#--
		var a=document.createElement('div');
		a.id="div"+count11;
		a.innerHTML="<input name='upFile2' type='file' class='file' id='upFile2' /><input type='button' value='删除' onclick=del("+ a +") >";
		alert(a.innerHTML);
		document.getElementById("newdiv").appendChild(a);
		count11++;
			
		-->
		
		var tabObj = document.getElementById("upFile2T");//获取表格对象
		var newRow = tabObj.insertRow(tabObj.rows.length);//插入行对象
		newRow.width='100%';
		//行数据
		var valueArr = new Array("<input style='width:190px' name='upFile2' type='file' class='file' id='upFile2'  /><a href='#' onclick='del(this);return false;' title='删除'>删除</a>" )
		var tempCell = new Array();
		for (var i = 0; i < valueArr.length; i++) {
			tempCell[i] = newRow.insertCell(i);//插入单元格
			tempCell[i].innerHTML = valueArr[i];//插入内容
		}
		tempCell[0].className="upLoad";//设置单元格class
		tempCell[0].width = "50%";//设置单元格width
		
	}
	
	function del(obj) {
	<#--
		var e = document.getElementById(id.id);
		document.getElementById("newdiv").removeChild(e);
		count11--;
	-->
	//if (confirm("\u786e\u8ba4\u5220\u9664\uff1f")) {
		obj.parentNode.parentNode.removeNode(true);
	//}
}
	
	function dangmian(){
		window.location.href("../xzfy/appFYfaceInsert.action?funcCode=${funcCode}");
	}
	
	function laixin() {
		window.location.href("../xzfy/appPaperInsert.action?funcCode=${funcCode}");
	}
	
	function sqfysx(){
	if(document.getElementById("xzfysx").value==1){
	document.getElementById("xzfysx2xzcf").style.display="block";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzcf").name="xzfyInfo.casetype2";
	}
	if(document.getElementById("xzfysx").value==2){	
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="block";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzqzcs").name="xzfyInfo.casetype2";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	}
	if(document.getElementById("xzfysx").value==3){
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="block";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	document.getElementById("xzfysx2xzsx").name="xzfyInfo.casetype2";
	}
	if(!(document.getElementById("xzfysx").value==1||document.getElementById("xzfysx").value==2||document.getElementById("xzfysx").value==3))
	{
	document.getElementById("xzfysx2xzcf").style.display="none";
	document.getElementById("xzfysx2xzqzcs").style.display="none";
	document.getElementById("xzfysx2xzsx").style.display="none";
	document.getElementById("xzfysx2xzcf").name="sss";
	document.getElementById("xzfysx2xzsx").name="sss";
	document.getElementById("xzfysx2xzqzcs").name="sss";
	}
}
</script>
</html>