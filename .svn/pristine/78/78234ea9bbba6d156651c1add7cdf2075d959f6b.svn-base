<html>
<#include "head.ftl">
<body  bgcolor="#FFFFFF" text="#000000" >
<@ww.form  name="'AppLogForm'"  method="'post'" >
<table border="0" cellspacing="0" cellpadding="0" class="tdMain2j">
  <tr>
    <td class="td2jYourYlace">您的位置:日志管理 --&gt; 查看</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>  

<table width="98%" cellpadding="1" cellspacing="0" class="tabout">

<#if type==1><#-- 系统日志 -->
	<tr>
		<td class="tdFormText">操作者</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="log.creatorName" value="${log.creatorName?default("")}" readonly></td>
	</tr>
	<tr>
		<td class="tdFormText">操作名</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="log.typeName" value="${log.typeName?default("")}" readonly></td>
	</tr>	
	<tr>
		<td class="tdFormText">操作内容</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="log.content" value="${log.content?default("")}" readonly></td>
	</tr>
	<tr>
		<td class="tdFormText">操作时间</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="log.createTime" value="${log.createTime?default("")}" readonly></td>
	</tr>
<#elseif type==2><#-- 应用日志 -->
	<tr>
		<td class="tdFormText">操作者</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.creator" value="${appLog.creator?default("")}" readonly></td>
	</tr>
	<tr>
		<td class="tdFormText">操作名</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.op" value="${appLog.op?default("")}" readonly></td>
	</tr>	
	<tr>
		<td class="tdFormText">操作模块</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.module" value="${appLog.module?default("")}" readonly></td>
	</tr>
	<tr>
		<td class="tdFormText">操作内容</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.content" value="${appLog.content?default("")}" readonly></td>
	</tr>	
	<tr>
		<td class="tdFormText">操作时间</td>
		<td class="tdFormInput"><input type="text" class="inputTextNormal" name="appLog.createTime" value="${appLog.createTime?default("")}" readonly></td>
	</tr>
</#if>

</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tdMain2j">
  <tr>
    <td align="center">
      	<input type="button" name="send" value="关闭" class="button" onClick="window.close();">
   </td>
  </tr>
</table>
<SCRIPT LANGUAGE="JavaScript">
	
</SCRIPT>
</@ww.form>
</body>
</html>