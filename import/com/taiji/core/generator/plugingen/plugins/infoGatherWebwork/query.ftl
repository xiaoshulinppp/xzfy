<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<#assign gatherabbr = "${plugin.gatherAbbr}" >
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
<link href="../common/calendar.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../${r"${Session['_USER_STYLE_'].jsPath}"}/tigra_tables.js"></script>
<script language="javascript" type="text/javascript" src="../common/calendar.js"></script>
<body>
<form  name="doQuery"  action ="do${className}Query.action"  method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control >
  <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_']"}.imagePath}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:查询历史列表</td>
      </tr>
</table>
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10);  left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle" id ="control">
  <tr>
    <td>查询</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">   
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<table align="center" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
   <tr>
      <th colspan="4" class="thListNormal"></th>
      
   </tr>
<tr>
	<td class="tdFormText">审核状态：</td>
	<td class="tdFormInput">
		<select name="queryTerm.isFinished">
			<option value="1">已审核完毕</option>
			<option value="0">未审核完毕</option>
		</select>
	</td>
	<td class="tdFormText">提交人姓名：</td>
	<td class="tdFormInput">
		<input type="text" name="referrerName" class="inputTextLong"></input>
	</td>
<tr class="trColor">
	<td class="tdFormText">提交起始日期：</td>
	<td class="tdFormInput">
		<input type="text" name="queryTerm.beginDate" class="inputTextLong"></input><input type="button" value=">>" class="button" onclick="return showCalendar('queryTerm.beginDate','yyyy-mm-dd')">
	</td>
	<td class="tdFormText">提交结束日期：</td>
	<td class="tdFormInput">
		<input type="text" name="queryTerm.endDate" class="inputTextLong"></input><input type="button" value=">>" class="button" onclick="return showCalendar('queryTerm.endDate','yyyy-mm-dd')">
	</td>
</tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td >
      <input name="Button22" type="submit" class="button" value="${r"${action.getText('submit.text')}"}" > 
    </td>
  </tr>
</table>
</div>
${r"<@ww.hidden"} name ="'funcCode'"/>
<input type="hidden" name="flag" value="1"></input>
<input type="hidden" name="operationCode" value="info"></input>
</form>
</body>
</html>