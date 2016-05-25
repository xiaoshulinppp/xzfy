<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>信息系统构架平台V2.0</title>
<link rel="stylesheet" href="../${Session["_USER_STYLE_"].cssPath}/head_style.css" type="text/css">
<script language="javascript" src="../${Session["_USER_STYLE_"].jsPath}/card_li.js" type="text/javascript"></script>
<BODY>
<div class="topTabOut">
    <div class="titleLogo">
	<div class="topTitleChn">信息系统构架平台V2.0</div>
	<div class="topTitleEng">Information System Conformation Platform </div>
	</div>
    <div class="menuDiv">
    <div class="tdSmenu"><a href="#" class="toplink">快捷通道<img src="../${Session["_USER_STYLE_"].imagePath}/arrow_top_link.png" width="7" height="4" border="0" align="absmiddle"></a> | <a href="#" class="toplink">主页</a> | <a href="#" class="toplink">帮助?</a></div>


    <div class="listDiv"><ul class="topCardUl">
    <#if topFuncList?has_content>
	<#assign seq =1>
    <#list topFuncList as mainMenu>
   
    	<li class="topCardOff" onClick="changeCard(this,'topCard'),changeFrame('${mainMenu.id}')">
          <span>${mainMenu.name}</span>
    	</li>

    <#assign seq = seq + 1>
    </#list>
    </#if>
      </ul></div>
  </div>
</div>
<div class="contBarOut">
	<div class="contBarIn">
	<div class="loginTime">用户：${userName} | 登录时间：${loginTime} </div>
	<div class="userInfo"><a href="#">修改资料</a> | <a href="../unLogin.action" target="_top">退出登录</a></div>
	</div>
</div>
</BODY>
