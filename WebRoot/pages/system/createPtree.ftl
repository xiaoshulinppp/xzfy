<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<@ww.form  name="'ptreeForm'" action ="'doCreatePtree'" validate="'true'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
   <tr>
        <td>${action.getText("current.location")}:${action.getText("ptree.title")}</td>
      </tr>
    
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id=control class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<#include 'ptreeProperty.ftl'>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
     
      <input name="Button22" type="submit" class="button" value="${action.getText("save.text")}" > 
      <input name="Button42" type="button" class="button" value="${action.getText("return.text")}" onClick ="document.location.href='../system/listPtree.action?funcCode=${funcCode}&positionId=${positionId}&pageNum=${pageNum}'">
    </td>
  </tr>
</table>
<br>

<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<@ww.hidden name ="'positionId'"/>
<@ww.hidden name ="'parentId'"/>
<@ww.hidden name ="'lastParentId'"/>
</@ww.form>
</body>
</html>