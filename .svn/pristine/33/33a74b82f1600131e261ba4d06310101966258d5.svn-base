<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}V2.0</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<!--javascript脚本添加位置。-->
<SCRIPT language=JavaScript src="../${Session["_USER_STYLE_"].jsPath}/showSearch.js"></SCRIPT>
<!--javascript脚本添加位置结束。-->
<body>
<form name="form1" action="../system/fieldSelected.aciton">
<!--您的位置表格开始-->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("fieldselect")}</td>   
  </tr>
</table>
<!--主体内容、列表显示区域。注意上边的区域定义必须保持-->
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
    <tr>
      <th width="40" class="thListNormal">${action.getText("select.text")}</th>
      <th class="thListNormal">${action.getText("fieldname")}</th>
      <th width="40" class="thListNormal">${action.getText("select.text")}</th>
      <th class="thListNormal">${action.getText("fieldname")}</th>
    </tr>
    <#assign count=0>
    <#list selectFieldList as field>
    <#if count%2==0>
     <tr class="trcolor">
    </#if>
      <td class="tdlistCenter"><input type="checkbox" name="fieldSelect" value="${field.id}"></td>
      <td class="tdListLeft">${field.name}</td>
      <#if (count-1)%2==0>     
       </tr>
       </#if>     
    </#list> 
 	  <#if count%2!=0>
	   <#assign spacecount = 2-count%2>
	   <#list 1..spacecount as x>
         <td>&nbsp;</td>
       </#list>
	  </tr>
	  </#if> 
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><input name="Button32" type="submit" class="button" value="${action.getText("submit.text")}">
        <input name="Button42" type="button" class="button" value="${action.getText("close.text")}" onClick="window.close()"></td>
  </tr>
</table>
<!--主体内容、列表显示区域结束-->
</form>
</body>
</html>
