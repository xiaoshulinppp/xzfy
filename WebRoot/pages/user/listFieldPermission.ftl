<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'fieldPermListForm'"   validate="'true'"  method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
        <td width="30" align="center"><img src="../${Session['_USER_STYLE_'].imagePath}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${action.getText("current.location")}:字段权限管理</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>字段权限管理</td>
  </tr>
</table>
<table width="98%" border="1" align="center" cellpadding="3" cellspacing="0" class="tabout">
<tr><td align='left'>
数据表名:<@ww.select name="'permTableName'" list="getAllTable()" theme ="simple" onchange="'javascript:flush()'"/><font color=red>**</font>&nbsp;
字段名:<@ww.select name="'field'"  list="getAllField()" theme ="simple"/><font color=red>**</font>&nbsp;
操作类型:<@ww.select name="'type'"  list="getDictMap('fieldPermType')" theme ="simple"/><font color=red>**</font>&nbsp;
</td>
</tr>
<tr>
<td>
<#list displayInfo.operationList as op>
<#if op.single!=1>
     <input id ="${op.abbr}Id" name="Button" type="button" class="button" value="${op.name}" onclick="FormSubmit('${op.abbr}')">
</#if>
</#list>
     <input name="Button" type="button" class="button" value="${action.getText("close.text")}" onclick="javascirpt:window.close()">
</td></tr>
<#include "/common/actionerrors.ftl">
</table>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
    <tr>
      <th width="40" class="thListNormal">${action.getText("select.text")}</th>
      <#list displayInfo.fieldNameList as fieldName>
      <th class="thListNormal">${fieldName}</th>
      </#list>

   </tr>
   <#assign count =0>
   <#list displayInfo.fieldValueList as fieldValueList >  
   <tr class="trcolor">
    <#assign keyColumn = fieldValueList[0]>
      <td class="tdlistCenter"><input type="checkbox" name="selectFieldPerm" value=${keyColumn}></td>
    <#assign seq = 1>
    <#list fieldValueList as field>
    <#if seq != 1>
       <td class="tdlistCenter">   
    <#if field?has_content>${field}
    <#else>&nbsp;
    </#if></td>
    </#if>
    <#assign seq = seq +1>
    </#list>
  </tr>
  <#assign count = count +1>
  </#list>
</table>
<@pagnation.pagnation formName="fieldPermListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../user/listFieldPermission.action" params="funcCode=${funcCode}&permId=${permId}"/>

<script>
  function FormSubmit(opName) {
     window.fieldPermListForm.action="../user/"+opName+"FieldPermission.action?opName="+opName;
     window.fieldPermListForm.submit();
  }
   function flush() {
     window.fieldPermListForm.action="../user/listFieldPermission.action";
     window.fieldPermListForm.submit();
  }
 
  
</script>

<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
<input type ='hidden' name ='permId' value='${permId}'>
</@ww.form>
</body>
</html>