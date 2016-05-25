<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<#assign keyColumn = table.pkColumn >
<#assign keyvar = "${keyColumn.variableName}">
<#assign flag ="c">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/formControl.js"></script>
<body>
${r"<@ww.form"} name="'form'"  method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:信息业务审核</td>
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
<table width="100%"><tbody>

 	<tr>
		<td>审核级别</td>
		<td>
       ${r"<@ww.textfield"} name="name" value="getName()" cssClass="'inputTextLong'"   disabled ="'true'" />
		</td>
		<td>审核状态</td>
		<td>
       ${r"<#if"} ${objectName}Check.state==1>
			<select name="${objectName}Check.state" disabled>
			<option value="1" selected>未审核</option>
			</select>
		${r"</#if>"}	
		${r"<#if"} ${objectName}Check.state==2>
			<select name="${objectName}Check.state" disabled>
			<option value="2" selected>同意</option>
			</select>
		${r"</#if>"}
		${r"<#if"}  ${objectName}Check.state==3>
			<select name="${objectName}Check.state" disabled>
			<option value="3" selected>不同意</option>
			</select>
		${r"</#if>"}
			
		</td>

	</tr>
	<tr>
	<td>审核意见</td>
		<td>
			${r"<@ww.textarea"} name="'${objectName}Check.advice'" cssClass="'inputTextLong'" rows="'50'" cols ="'40'" disabled ="'true'"/>
		</td>
	</tr>
	<tr>
	<td>申请人</td>
		<td>
			${r"<@ww.textfield"} name="'name1'" cssClass="'inputTextLong'" disabled ="'true'" value="getUserN()"/>
		</td>
		<td>业务申请时间</td>
		<td>
			${r"<@ww.textfield"} name="'${objectName}Check.applyTime'" cssClass="'inputTextLong'"   disabled ="'true'" />
		</td>
	</tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
<tr>
<td>
	<input name="Button" type="button" class="button" value="${r"${action.getText('return.text')}"}" onClick ="document.location.href='list${flag}${className}.action?funcCode=${r"${funcCode}"}&pageNum=${r"${pageNum}"}'">
</td>
</tr>
</table>
<br>
${r"</@ww.form>"}
</body>
</html>