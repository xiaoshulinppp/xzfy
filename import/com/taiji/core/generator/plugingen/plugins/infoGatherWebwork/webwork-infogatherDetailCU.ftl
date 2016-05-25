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
${r"<@ww.form"} name="'form'" action ="'check${className}'" method="'post'" validate="'true'">
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
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot" id=control>
	<tr>
	${r"<#if"} rootId!="0">
		<td>
		${r"<@ww.select"} name="'${objectName}Check.nextPosition'" list="getPositionMap()"/>
		</td>
	${r"</#if>"}
	${r"<#if"} rootId=="0">
		<input name="${objectName}Check.nextPosition" value="${0}" type="hidden"></input>
	${r"</#if>"}
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
		${r"<#if"} ${objectName}Check.state==2||${objectName}Check.state==1>
			<select name="${objectName}Check.state">
			<option value="2" >同意</option>
		    <option value="3" >不同意</option>
			</select>
		${r"</#if>"}
		${r"<#if"}  ${objectName}Check.state==3>
			<select name="${objectName}Check.state" >
		    <option value="3" >不同意</option>				
			<option value="2" >同意</option>
			</select>
		${r"</#if>"}
		</td>

	</tr>
	<tr>
	${r"<#if"} rootId=="0">
		<td>审核结果</td>
		<td>
		   <select name="${objectName}Check.reject">
			<option value="0" selected>未驳回</option>
			<option value="1">驳回</option>
			</select>
		</td>
	${r"</#if>"}
    ${r"<#if"} rootId!="0">
			<input name="${objectName}Check.reject" value="${0}" type="hidden"></input>
	${r"</#if>"}
	<td>审核意见</td>
		<td>
			${r"<@ww.textarea"} name="'${objectName}Check.advice'" cssClass="'inputTextLong'" rows="'200'" cols ="'200'" />
		</td>
	</tr>
		<tr height = "26">
		<td>业务申请人名称</td>
		<td>
        ${r"<@ww.textfield"} name="name" value="getName()" cssClass="'inputTextLong'"   disabled ="'true'" />
		</td>
		<td>业务申请时间</td>
		<td>
			${r"<@ww.textfield"} name="'${objectName}Check.applyTime'" cssClass="'inputTextLong'"   disabled ="'true'" />
		</td>
	</tr>
 </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
<tr>
<td>
    <input type="submit" class="button" name="${r"${action.getText('check.text')}"}" value="${r"${action.getText('check.text')}"}"></input>
	<input name="Button" type="button" class="button" value="${r"${action.getText('return.text')}"}" onClick ="document.location.href='list${flag}${className}.action?funcCode=${r"${funcCode}"}&pageNum=${r"${pageNum}"}'">

</td>
</tr>
</table>
<br>
${r"<@ww.hidden"} name ="'funcCode'"/>
${r"<@ww.hidden"} name ="'pageNum'"/>
	<input type ='hidden' name ='entityId' value='${r"${"}${objectName}.${keyvar}${r"}"}'>
${r"</@ww.form>"}
</body>
</html>