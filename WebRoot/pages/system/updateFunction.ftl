<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'functionForm'"  action ="'doUpdateFunction'" validate="'true'" disableSubmit="'saveid,returnid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
          <td>${action.getText("current.location")}:${action.getText("func.title")}</td>
      </tr>
    
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<#include "functionProperty.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <#if opName == "update">
      <input id = "saveid" name="Button32" type="submit" class="button" value="${action.getText("update.text")}">
      </#if>
      <input id = "returnid" name="Button42" type="reset" class="button" value="${action.getText("return.text")}" onclick="returnPage()">
    </td>
  </tr>
</table>
<br>
<script>
    function returnPage() {
    submitDisableButton();
     document.location.href="../system/listFunction.action?funcCode=${funcCode}&parentId=${parentId}&pageNum=${pageNum}";
    }
    function submitDisableButton() { 
      <#if opName == "update">
      document.getElementById("saveid").disabled = true;
      </#if>
      document.getElementById("returnid").disabled = true;
   }
</script>
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<@ww.hidden name ="'parentId'"/>
<input type ='hidden' name ='entityId' value='${func.id}'>
</@ww.form>
</body>
</html>
