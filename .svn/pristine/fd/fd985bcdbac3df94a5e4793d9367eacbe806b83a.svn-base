<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		 
		<title></title>
		<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
		<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
	</head>
	
<body>
<#include "../website/header.ftl">
<!--标题开始-->
	<div class="wal pageNow2">
		<div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=480">首页  </a>--修改密码：</div>
	    <div class="fr"></div>
	</div>
	      
                       
<div class="formDiv">
<form name="form" id="form" action="doChange.action" method="post" >
            <input type="hidden" name="funcCode" value="${funcCode}">
   
   <table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
      <tr>       
         <th width="20%">
                                   原密码：
         </th>
         <th>
             <input class="inputTextNormal" type="password" name="passwordOld" id="passwordOld" value=""/>
         </th>
      </tr>
      
      <tr>       
         <th>
                                   新密码：
         </th>
         <th>
             <input class="inputTextNormal" type="password" name="passwordNew" id="passwordNew" value=""/>
         </th>
      </tr>
      <tr>       
         <th>
                                   重复新密码：
         </th>
         <th>
             <input class="inputTextNormal" type="password" name="passwordNew1" id="passwordNew1" value=""/>
         </th>
      </tr>
   </table>
   <table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
    <tr>
       <td>    
	        <input type="button" style="border:1px solid;color:white;background:green;padding:3px;font-size:15px;width:60px;" value="修改" onClick="gotoUpdate()" />
	        <input type="button" style="border:1px solid;color:white;background:green;padding:3px;font-size:15px;width:60px;" value="返回" onClick="gotoBack()" />
	   
	   <#if userid=4>
	        <span style="float:right;"><input type="button" style="border:1px solid;color:white;background:green;padding:3px;font-size:15px;width:80px;" value="账号管理" onClick="addUser()" /></span>
   		</#if>
   		</td>
    </tr>
   </table>
  </form>
</body> 
	<script type="text/javascript">
	    function checkpassword(){
	    	var passwd1 = document.getElementById("passwordOld").value;
	    	var passwd2 = document.getElementById("passwordNew").value;
	    	var passwd3 = document.getElementById("passwordNew1").value;
	        if(passwd1.length<1){
		        alert("请输入原密码！");
		        return false;
	        }else if(passwd2.length<1){
	        	alert("请输入新密码！");
	        	return false;
	        }else if(passwd3.length<1){
		        alert("请重复新密码！");
		        return false;
	        }else if(passwd2!=passwd3){
	        	alert("两次密码不一致");
	        	return false;
	        }
	        return true;
        }
        
		function gotoUpdate(){
			 //document.form.action="showImprovment.action";
			 if(checkpassword()){
			 	document.form.submit();
			 }	
	    }
	    
	    function gotoBack(){
	         parent.window.location="../xzfy/gotoIndex.action?funcCode=${funcCode}";		     
	    }
	    function addUser(){
	    	document.form.action="gfbUserList.action";
	    	document.form.submit();
	    }
     </script>