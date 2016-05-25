<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<title></title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
	</head>
	<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="../sys_theme/js/jquery.form.js"></script>
	
<body>
<#include "../website/header.ftl">
<!--标题开始-->
	<div class="wal pageNow2">
		<div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=480">首页  </a>--新增用户：</div>
	    <div class="fr"></div>
	</div>
	      
                       
<div class="formDiv">
<form name="form" id="form" action="doGfbAddUser.action" method="post">
            <input type="hidden" name="funcCode" value="${funcCode}">
   <table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
      <tr>       
         <th width="20%">
         	登录名：
         </th>
         <td align="left">
             <input class="inputTextNormal" type="text" name="loginname" id="loginname" value="${loginname?default('')}" onblur="checkLoginName();" onfocus="tip(this.id)"/><font id='loginnamefont' color='red'>用作登录系统，建议使用中文全拼</font>
         </td>
      </tr>
      
      <tr>       
         <th>
                                   用户姓名：
         </th>
         <td align="left">
             <input class="inputTextNormal" type="text" name="realname" id="realname" value="" onblur="checkname();" onfocus="tip(this.id)"/><font id='realnamefont' color='red'>用于系统里面显示</font>
         </td>
      </tr>
      <tr>       
         <th>
                                   默认密码：
         </th>
         <td align="left">
             <input class="inputTextNormal" type="text" name="passwd" id="passwd" value="${passwd?default('123456')}" onblur="checkPassword();" onfocus="tip(this.id)"/><font id='passwdfont' color='green'>正确</font>
         </td>
      </tr>
   </table>
   <table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
    <tr>
       <td>    
	        <input type="button" style="border:1px solid;color:white;background:green;padding:3px;font-size:15px;width:60px;" value="提交" onClick="doGfbAddUser()" />
	        <input type="button" style="border:1px solid;color:white;background:green;padding:3px;font-size:15px;width:60px;" value="返回" onClick="history.back()" />
	   </td>
    </tr>
   </table>
  </form>
</body> 
	<script type="text/javascript">
	var s1=false,s2=false,s3=true;
	  function doGfbAddUser(){
	  	if(!s1){
	  		alert("请检查登录名");
	  	}else if(!s2){
	  		alert("请检查用户姓名");
	  	}else if(!s3){
	  		alert("请检查密码");
	  	}else{
		  	if(confirm("确定提交？"))
		  		document.form.submit();
		}
	  }
	  function checkLoginName(){
		s1=false;
		//document.getElementById("loginnamefont").innerHTML="";
		var loginName = $.trim($("#loginname").val());
		if(loginName==""){
			return;
		}
		$("#loginnamefont").text("认证中……");  
		$.ajax({
	    	type:"post",
	        url:"check.action",
            datatype:"text",
            data:"loginname="+loginName,
            success:function(msg){
            	if(msg=='1'){
            		$("#loginnamefont").text("该登录名已被占用,可以在后面添加数字、字母");
            	}else if(msg=='0'){
            		document.getElementById("loginnamefont").color="green";
            		$("#loginnamefont").text("正确");
            		s1=true;
            	}
            }
        })
	}
	function checkname(){
		if($.trim($("#realname").val())!=""){
			document.getElementById("realnamefont").color="green";
           	$("#realnamefont").text("正确");
			s2=true;
		}else{
			document.getElementById("realnamefont").color="red";
           	$("#realnamefont").text("用于系统里面显示");
			s2=false;
		}
	}
	function checkPassword(){
		if($.trim($("#passwd").val())!=""){
			document.getElementById("passwdfont").color="green";
           	$("#passwdfont").text("正确");
			s2=true;
		}else{
			document.getElementById("passwdfont").color="red";
           	$("#passwdfont").text("建议默认，用于登录系统，创建后用户可以自行修改");
			s3=false;
		}
	}
	function tip(id){
	 	var eid = id+"font";
	 	var str="";
		document.getElementById(eid).color="red";
		if(id=="loginname"){
			str="用作登录系统，建议使用中文全拼";
		}else if(id=="realname"){
			str="用于系统里面显示"
		}else{
			str="建议默认，用于登录系统，创建后用户可以自行修改";
		}
        $("#"+eid).text(str);
	}
     </script>