<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'positionForm'"  action ="'doUpdatePosition.action'" validate="'true'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
   <tr>
          <td>${action.getText("current.location")}:${action.getText("position.title")}</td>
      </tr>
    
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<#include "positionProperty.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <#if opName == "update">
      <input name="Button32" type="submit" class="button" value="${action.getText("update.text")}">
      </#if>
      <input name="Button42" type="reset" class="button" value="${action.getText("return.text")}" onclick="document.location.href='../system/listPosition.action?funcCode=${funcCode}&pageNum=${pageNum}'">
    </td>
  </tr>
</table>
<br>

<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<input type ='hidden' name ='entityId' value='${position.id}'>
</@ww.form>
</body>
</html>