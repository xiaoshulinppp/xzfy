<html>
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>${action.getText("platform.name")}</title>
		<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../plugs/xyTree-4.1/DivTree.js"></script>
		<script type="text/javascript" src="../plugs/xyTree-4.1/Tree.js"></script>
		<script type="text/javascript" src="../plugs/xyTree-4.1/Node.js"></script>
	</head>
	<body>
		<@ww.form  name="'userForm'" action ="'doCreateUser'" validate="'true'" disableSubmit="'saveid,returnid'" method="'post'">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
			<tr>
				<td>${action.getText("current.location")}:${action.getText("user.title")}</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td height="24" align="center"></td>
			</tr>
		</table>
		<#include 'userProperty.ftl'>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<!--
					<input id = "saveid" name="Button22" type="submit" class="button" value="${action.getText("save.text")}" >
					-->
					<input id = "saveid" name="Button22" type="button" class="button" value="${action.getText("save.text")}" onclick="gotoSave();" >
					<input id = "returnid" name="Button42" type="button" class="button" value="${action.getText("return.text")}" onClick ="returnPage()">
				</td>
			</tr>
		</table>
		<br>
		<script>
			//window.document.getElementById("theIframe").src = "../relation/showTree.action?funcCode=${funcCode}";
		
			function returnPage() {
				submitDisableButton();
				document.location.href="../user/listUser.action?funcCode=${funcCode}&pageNum=${pageNum}&orgId=${orgId}";
			}
			
			function submitDisableButton() { 
				document.getElementById("saveid").disabled = true;
				document.getElementById("returnid").disabled = true;
			}
			
			function gotoSave(){
				//window.document.getElementsByName("selectedPart")[0].value = selectParts();
				window.userForm.submit();
			}
		</script>
		<@ww.hidden name ="'funcCode'"/>
		<@ww.hidden name ="'pageNum'"/>
		<@ww.hidden name ="'orgId'"/>
		</@ww.form>
	</body>
</html>