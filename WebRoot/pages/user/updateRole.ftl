<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<@ww.form  name="'roleForm'"  action ="'doUpdateRole'" validate="'true'" disableSubmit="'saveid,returnid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  
      <tr>
          <td>${action.getText("current.location")}:${action.getText("role.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<#include "roleProperty.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <#if opName == "update">
      <input id = "saveid" name="Button32" type="submit" class="button" value="${action.getText("update.text")}">
      <input id = "addUserId" name="Button32" type="button" class="button" value="添加用户" onclick="addUser()">
      </#if>
      <input id = "returnid" name="Button42" type="reset" class="button" value="${action.getText("return.text")}" onclick="returnPage()">
    </td>
  </tr>
</table>
<br>
<script>
    function returnPage() {
    submitDisableButton();
     document.location.href="../user/listRole.action?funcCode=${funcCode}&pageNum=${pageNum}&orgId=${orgId}";
    }
    function submitDisableButton() { 
      <#if opName == "update">
      document.getElementById("saveid").disabled = true;
      </#if>
      document.getElementById("returnid").disabled = true;
   }
   function addUser() {
      window.open("../user/showUserForRole.action?funcCode=${funcCode}&entityId=${role.id}&orgId=${orgId}&opName=update","addUserForRole","status=yes,scrollbars=yes,resiza");
   }
 </script>

<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<input type ='hidden' name ='entityId' value='${role.id}'>
<@ww.hidden name ="'orgId'"/>
</@ww.form>
</body>
</html>