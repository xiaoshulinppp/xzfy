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
${r"<@ww.form"}  name="'form'"  action ="'${className}Query'" validate="'true'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:${plugin.functionName}${r"${action.getText('search.text')}"}</td>
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
<table width="100%"><tbody>
   <tr height="1"><td></td>
      <td width="40%"></td>
      <td width="60%"></td>
   </tr>
${r"<#assign variableNames = queryTermList?keys>"}
${r"<#list variableNames as columnVariableName>"}
${r"<#assign field = queryTermList[columnVariableName]>"}
  <tr height = "26">
   <td></td>
      <td class="tdFormText" align="right">${r"${"}field.showName${r"}"}</td>
      <td class="tdFormInput">${r"<@ww.textfield"} name="'${objectName}.${r"${columnVariableName}"}'" cssClass="'inputTextLong'" tabindex="'2'"  /></td>
   </tr>  
${r"</#list>"}
</tbody></table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
        <input name="Button32" type="submit" class="button" value="${r"${action.getText('search.text')}"}">
    </td>
  </tr>
</table>
<br>
</div>
${r"<@ww.hidden"} name ="'funcCode'"/>
${r"</@ww.form>"}
</body>
</html>