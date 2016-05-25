<html>
<#include "head.ftl">
<SCRIPT LANGUAGE="JavaScript">
	function fnStatistics(){
	  	var valid = new Validation("StatForm");
   		var result = valid.validate();
   		if(result==true){
			window.StatForm.action="../system/appLogStatistics.action?funcCode=${funcCode}";
			window.StatForm.submit();
		}
	}
</SCRIPT>
<body>
<form name="StatForm"  method="post">
<table border="0" cellspacing="0" cellpadding="0" class="tdMain2j">
  <tr>
    <td class="td2jYourYlace">您的位置:日志管理 --&gt 统计</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table> 

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">

	<tr>
		<td class="tdFormText">选择模块</td>
		<td class="tdFormInput">
	    	<select name="appLog.module" class="selectStyleNormal required">
	    		<option value="" selected >---请选择---</option>
	    		<option value="登录" <#if module == '登录'>selected</#if> >登录</option>
	    		<option value="指标管理"  >行政复议管理</option>
	    		<option value="算法管理"  >自办案件管理</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="tdFormText">选择日期</td>
		<td class="tdFormInput">
			<input type="text" class="inputTextNormal required validate-date" name="appLog.createTime" value="${createTime}" onfocus="WdatePicker()"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" class="text" align="center"> <div id="Div" align="center">
        FusionCharts.</div>
      <script type="text/javascript">
		   var chart = new FusionCharts("../fusioncharts/chartsflash/Column3D.swf", "Div", "600", "400", "0", "0");
		   chart.setDataURL("../fusioncharts/chartsdata/appLog.xml");		   
		   chart.render("Div");
		</script>
	</td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tdMain2j">
  <tr>
    <td align="center">
      <input name="Button22" type="button" class="button" value="统 计" onClick="fnStatistics()">
      <input type="button" name="send" value="关闭" class="button" onClick="window.close();">
    </td>
  </tr>
</table>
<br>

</form>
</body>
</html>