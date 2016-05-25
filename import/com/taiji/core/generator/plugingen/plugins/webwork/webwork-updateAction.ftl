<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/formControl.js"></script>
<script language="javascript" type="text/javascript" src="../common/calendar1.js"></script>
<script language="javascript" type="text/javascript" src="../common/Comm.js"></script>
<script language="javascript" type="text/javascript" src="../common/PopupDlg.js"></script>
<body>
${r"<@ww.form"}  name="'form'"  action ="'doUpdate${className}'" validate="'true'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:${plugin.functionName}</td>
      </tr>
    </table></td>
  </tr>
</table>
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10);  left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id=control class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

${r"<#include"} "${objectName}Property.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      ${r"<#if opName"} == "update">
      <input name="Button32" type="submit" class="button" value="${r"${action.getText('update.text')}"}">
      ${r"</#if>"}
      <input name="Button42" type="reset" class="button" value="${r"${action.getText('return.text')}"}" onclick="document.location.href='../info/list${className}.action?funcCode=${r"${funcCode}"}&pageNum=${r"${pageNum}"}'">
    </td>
  </tr>
</table>
<br>

</div>
${r"<@ww.hidden"} name ="'funcCode'"/>
${r"<@ww.hidden"} name ="'pageNum'"/>
<input type ='hidden' name ='entityId' value='${r"${"}${objectName}${r".id}"}'>
${r"</@ww.form>"}
</body>
</html>