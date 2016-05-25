<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<#assign keyColumn = table.pkColumn >
<#assign keyvar = "${keyColumn.variableName}">
<#assign flag ="n">
<#assign relationObjectName ="">
<#list table.relationshipRoles as relationshipRole >
      <#if relationshipRole.enabled>
       <#assign originMany = relationshipRole.originMany>
       <#assign relationObjectName = table.getVariableName(relationshipRole)>
      </#if>	
 
</#list>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/formControl.js"></script>
<body>
${r"<@ww.form"} name="'form'" validate="'true'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:业务管理</td>
      </tr>
    </table></td>
  </tr>
</table>
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10); z-index:1; left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id=control class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

${r"<#include"} "${objectName}Property.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr align="center">
    <td>
     ${r"<#if"} opName=="update"||opName="check">
      <input name="Button22" type="submit" class="button" value="${r"${action.getText('save.text')}"}" onclick="FormSubmit(this.form)"> 
      ${r"</#if>"}
       <input name="Button42" type="reset" class="button" value="${r"${action.getText('close.text')}"}" onclick="javascript:window.close()">
        </td>
  </tr>
</table>
<br>
<script language="javascript">
function FormSubmit(form){
window.form.action="../infogather/doUpdate${className}InLine.action";
window.form.submit;
}
</script>
</div>
${r"<@ww.hidden"} name ="'funcCode'"/>
${r"<@ww.hidden"} name ="'pageNum'"/>
${r"<#if"} ${relationObjectName}Id?has_content>
<input type=hidden name="${relationObjectName}Id" value="${r"${"}${relationObjectName}Id${r"}"}">
${r"</#if>"}
<input type=hidden name ="entityId" value="${r"${"}entityId${r"}"}"/>
${r"</@ww.form>"}
</body>
</html>