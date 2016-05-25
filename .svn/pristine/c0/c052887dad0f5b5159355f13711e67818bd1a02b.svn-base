<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'orgForm'"  action ="'doUpdateOrg'" validate="'true'" disableSubmit="'saveid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
           <td>${action.getText("platform.name")}:${action.getText("platform.name")}</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center">
    </td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
   <td align="right">
     <input type="button" class="button" value="${action.getText("create.text")}" onclick = "window.location='../user/createOrg.action?funcCode=${funcCode}&&parentId=${entityId}&opName=create'">
     <input type="button" class="button" value="${action.getText("delete.text")}" onclick = "window.location='../user/deleteOrg.action?funcCode=${funcCode}&parentId=${entityId}&entityId=${entityId}&selectRecord=${entityId}&opName=delete'">
    </td>
  </tr>
</table>
<#include "orgProperty.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <input id = "saveid" name="Button32" type="submit" class="button" value="${action.getText("update.text")}">
    </td>
  </tr>
</table>
<br>
<script>
    function submitDisableButton() { 
      <#if opName == "update">
      document.getElementById("saveid").disabled = true;
      </#if>
   }
</script>
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<@ww.hidden name ="'entityId'"/>
<@ww.hidden name ="'opName'" value ="'update'"/>
</@ww.form>
</body>
</html>