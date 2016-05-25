<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>行政复议系统</title>
		<link rel="stylesheet" href="../${Session["_USER_STYLE_"].cssPath}/head_style.css" type="text/css">
		<script language="javascript" src="../${Session["_USER_STYLE_"].jsPath}/card_li.js" type="text/javascript"></script>
	<BODY>
	
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bgTopright">
<tr>
<td>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="topTabOut">
  <tr>
    <td colspan="2" width="279" valign="top" rowspan="2" class="titleLogo">
	<img src="../${Session["_USER_STYLE_"].imagePath}/logo.png"/>
	</td>
    <td width="20%" class="tdSmenu"><span><a class="aQuit" href="../" target="_top">退出</a></span><span><a class="aZx" href="#">注销</a></span></td>
  </tr>
  <tr><td height="34">&nbsp;</td></tr>
</table>	
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="contBarOut">
			<tr>
				<td width="100%" align="center">
					<ul class="topCardUl">
						<#if topFuncList?has_content>
						<#assign seq =1>
						<#list topFuncList as mainMenu>
						<li class="topCardOff" onClick="changeCard(this,'topCard'),changeFrame('${mainMenu.id}');">
							<span>${mainMenu.name}</span>
						</li>
						<#assign seq = seq + 1>
						</#list>
						</#if>
					</ul>
				</td>
				</tr>
</table>
</td>
</tr>
	</BODY>
	<SCRIPT language="javascript">
		function changeFrame(tempId){
			parent.mainFrame.leftFrame.location='../system/getMenuAction.action?parentMenuId='+tempId;
		}
	</SCRIPT>
