<!--************************************************************ -->
<!--* 文件创建日期：2010-12-08                                 * -->
<!--* 功能描述：系统HEAD部分                                   * -->
<!--************************************************************ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>北京市法制办信息平台</title>
<link rel="stylesheet" href="../${Session["_USER_STYLE_"].cssPath}/head_style.css" type="text/css">
<script language="javascript" src="../${Session["_USER_STYLE_"].jsPath}/card_li.js" type="text/javascript"></script>

  

<BODY>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="topTabOut bgTopright">
  <tr>
    <td colspan="2" width="279" valign="top" rowspan="2" class="titleLogo">
	<img src="../images/16B/logo.png"/>
	</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
</table>

<input type="hidden" id="mainMenuId" value="" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="contBarOut">
  <tr>
    <td width="65%" align="left"><ul class="topCardUl">
    <#if topFuncList?has_content>
		<#assign seq =1>
	    <#list topFuncList as mainMenu>
	    	<!-- #if mainMenu.id==funcCode -->
	    	<li class="topCardOff" onClick="changeCard(this,'topCard'),changeFrame('${mainMenu.id}')">
	          <span>${mainMenu.name}</span>
	        </li>
	    <#assign seq = seq + 1>
	    </#list>
    </#if>
    </td>
   	 <td width="35%" align="right">用户：${userName}  |<a href="#" onclick="gongZuoTai();">工作台</a>|   <a href="../unLogin.action" target="_top">退出登录</a></td>
  </tr>
</table>

</BODY>
<SCRIPT language="javascript">
var temp=document.getElementsByTagName("li");
changeCard(temp[0],'topCard');
function changeFrame(tempId){
	parent.mainFrame.leftFrame.mainFrame.location='../system/getMenuAction.action?parentMenuId='+tempId;
	document.getElementById("mainMenuId").value=tempId;
}
function gongZuoTai(){
	parent.mainFrame.mainPage.location='../fzb/gongZuoTai.action?funcCode=${funcCode}';
	
}

</SCRIPT>
