<html>
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>${action.getText("platform.name")}</title>
		<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<@ww.form  name="'functionForm'"  action ="'doUpdateUser'" validate="'true'" disableSubmit="'saveid,returnid'" method="'post'">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
			<tr>
				<td>${action.getText("current.location")}:${action.getText("user.title")}</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
			<tr>
				<td height="24" align="center"></td>
			</tr>
		</table>
		<#include "userProperty.ftl">
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<#if opName == "update">
					<!--
					<input id = "saveid" name="Button32" type="submit" class="button" value="${action.getText("update.text")}">
					-->
					<input id = "saveid" name="Button32" type="button" class="button" value="${action.getText("update.text")}" onclick="gotoSave();">
					<input id = "initid" name="Button32" type="button" class="button" value="初始化密码" onclick="initPassword()">
					</#if>
					<input id = "returnid" name="Button42" type="reset" class="button" value="${action.getText("return.text")}" onclick="returnPage()">
				</td>
			</tr>
		</table>
		<br>
		<script>
			window.document.getElementById("theIframe").src = "../relation/showTree.action?funcCode=${funcCode}&userId=${userVO.id?default(userId)}";
			
			function returnPage() {
				submitDisableButton();
				document.location.href="../user/listUser.action?funcCode=${funcCode}&pageNum=${pageNum}&orgId=${orgId}";
			}
			
			function submitDisableButton() { 
				<#if opName == "update">
				document.getElementById("saveid").disabled = true;
				document.getElementById("initid").disabled = true;
				</#if>
				document.getElementById("returnid").disabled = true;
			}
			
			function initPassword() {
				submitDisableButton();
				window.functionForm.action="../user/initUserPassword.action";
				window.functionForm.submit();
			}
			
			function gotoSave(){
				//window.document.getElementsByName("selectedPart")[0].value = selectParts();
				window.functionForm.submit();
			}
		</script>
		<@ww.hidden name ="'funcCode'"/>
		<@ww.hidden name ="'pageNum'"/>
		<@ww.hidden name ="'orgId'"/>
		<input type ='hidden' name ='entityId' value='${user.id}'>
		</@ww.form>
	</body>
</html>