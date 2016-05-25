<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<#assign gatherabbr = "${plugin.gatherAbbr}" >
${r"<#assign"} query = "true">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../${r"${Session['_USER_STYLE_'].jsPath}"}/tigra_tables.js"></script>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:查询明细</td>
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


<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
  <tr class="trcolor">
      <td class="tdFormleft">提交时间</td>
      <td class="tdFormRight">	${r"<@ww.textfield"} name="'${objectName}.${objectName}CheckHistory.applyTime'" cssClass="'inputTextLong'" disabled="'true'" /></td>
  </tr>
   <tr class="trwhite">
      <td class="tdFormleft">审核人</td>
	  <td class="tdFormRight">${r"<@ww.textfield"} name="'reporter'" cssClass="'inputTextLong'"  disabled="'true'" />
  </tr>
   <tr class="trcolor">
      <td class="tdFormleft">审核级别</td>
	  <td class="tdFormRight">${r"<@ww.textfield"} name="'department'" cssClass="'inputTextLong'"  disabled="'true'" />
  </tr>
  <tr class="trcolor">
		<td class="tdFormleft">审核时间</td>
		<td class="tdFormRight">
			${r"<@ww.textfield"} name="'${objectName}.${objectName}CheckHistory.checkTime'" cssClass="'inputTextLong'" disabled="'true'" />
		</td>
  </tr>
  <tr class="trwhite">
		<td class="tdFormleft">审核意见</td>
		<td class="tdFormRight">
			${r"<@ww.textfield"} name="'${objectName}.${objectName}CheckHistory.advice'" cssClass="'inputTextLong'" disabled="'true'" />
		</td>
  </tr>
   </table>
${r"<#include"} "${objectName}Property.ftl">

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>     
      <input type="Button" name="button" class="button" value="${r"${action.getText('close.text')}"}" onclick="javascript:window.close();"></input>
      </td>
    </tr>
</table>


 <input type="hidden" name="operationCode" value="${gatherabbr}"></input>
 <br>
</div>
</body>
</html>