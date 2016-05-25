<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<#assign keyColumn = table.pkColumn >
<#assign keyvar = "${keyColumn.variableName}">
<#assign flag ="n">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/formControl.js"></script>
<body>
${r"<@ww.form"} name="'form'" action ="'doSubmit${className}'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:${r"${action.getText('platform.name')}"}</td>
      </tr>
    </table></td>
  </tr>
</table>
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10); z-index:1; left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id=control class="tabtitle">
  <tr>
    <td height="24" align="center"></td>    
  </tr>	
  <tr>
	<td>
		${r"<@ww.select"} name="'${objectName}Check.nextPosition'" list="getPositionMap()"/>
	</td>
	</tr>

</table>
 
${r"<#include"} "${objectName}Property.ftl">
<table width="100%"><tbody>
	<tr height = "26">
		<td>业务申请人名称</td>
		<td>
            ${r"<@ww.textfield"} name="UserName" value="getUserName()" cssClass="'inputTextLong'" disabled ="'true'" />
			
		</td>

	</tr>
 </tr>

${r"<#if"} ${objectName}Check.reject==1>
 <tr height = "26">
 <td>被驳回申请
 </td>
 </tr>
 ${r"</#if>"}
</tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
  	<input type="submit" name="${r"${action.getText('submit.text')}"}" value="${r"${action.getText('submit.text')}"}" class="button"></input>
  	<input name="Button42" type="reset" class="button" value="${r"${action.getText('return.text')}"}" onclick="document.location.href='../infogather/list${flag}${className}.action?funcCode=${r"${funcCode}"}&pageNum=${r"${pageNum}"}'">
    </td>
  </tr>
</table>
<br>

</div>

${r"<@ww.hidden"} name ="'funcCode'"/>
${r"<@ww.hidden"} name ="'pageNum'"/>
<input type ='hidden' name ='entityId' value='${r"${"}${objectName}.${keyvar}${r"}"}'>
${r"</@ww.form>"}
</body>
</html>