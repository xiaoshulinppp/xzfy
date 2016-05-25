<html>
<#include "head.ftl">
<!--javascript脚本添加位置结束-->
<body  bgcolor="#FFFFFF" text="#000000" >
<@ww.form  name="'AppLogForm'"  method="'post'"  action="'../system/queryAppLog.action?funcCode=${funcCode}&type=${type}'">
<table border="0" cellspacing="0" cellpadding="0" class="tdMain2j">
  <tr>
    <td class="td2jYourYlace">您的位置:日志管理 --&gt; 查询</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>  

<table width="98%" cellpadding="1" cellspacing="0" class="tabout">
<#if type==1><#-- 系统日志 -->
	<tr>
		<td class="tdFormText">操作者</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="log.creatorName"></td>
	</tr>
	<tr>
		<td class="tdFormText">操作名</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="log.typeName"></td>
	</tr>	
	<tr>
		<td class="tdFormText">操作内容</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="log.content"></td>
	</tr>
	<tr>
		<td class="tdFormText">操作时间</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="log.createTime" onfocus="WdatePicker()" readonly></td>
	</tr>
<#elseif type==2><#-- 应用日志 -->
	<tr>
		<td class="tdFormText">操作者</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.creator"></td>
	</tr>
	<tr>
		<td class="tdFormText">操作名</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.op" ></td>
	</tr>	
	<tr>
		<td class="tdFormText">操作模块</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.module"></td>
	</tr>
	<tr>
		<td class="tdFormText">操作内容</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.content"></td>
	</tr>	
	<tr>
		<td class="tdFormText">操作时间</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.createTime" onfocus="WdatePicker()" readonly></td>
	</tr>
</#if>
<input name="checkHql" value="1" type="hidden">
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tdMain2j">
  <tr>
    <td align="center">
        <input name="Button32" type="submit" class="button" value="查 询">
      	<input name="Button42" type="reset" class="button" value="重 置" >
      	<input type="button" name="btn_insert" value="返回" class="button" onclick="window.location='../system/getAppLogList.action?funcCode=${funcCode}&pageNum=${pageNum}&type=${type}'"></td>
   </td>
  </tr>
</table>
<SCRIPT LANGUAGE="JavaScript">
	
</SCRIPT>
</@ww.form>
</body>
</html>