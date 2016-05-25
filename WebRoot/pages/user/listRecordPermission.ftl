<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'recordPermListForm'"   validate="'true'"  method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
        <td width="30" align="center"><img src="../${Session['_USER_STYLE_'].imagePath}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${action.getText("current.location")}:${action.getText("recordperm.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("recordperm.title")}</td>
  </tr>
</table>
<table width="98%" border="1" align="center" cellpadding="3" cellspacing="0" class="tabout">
<tr><td align='left'>
${action.getText("recordperm.tablename")}<@ww.select name="'permTableName'" list="getAllTable()" theme ="simple" onchange="'javascript:flush()'"/><font color=red>**</font>&nbsp;
${action.getText("recordperm.fieldname")}<@ww.select name="'field'"  list="getAllField()" theme ="simple"/><font color=red>**</font>&nbsp;
${action.getText("recordperm.rule")}<@ww.textarea name="'rule'"  cols="40" rows="5" cssClass="textarea" tabindex = "3"  theme="simple"/>&nbsp;
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
   <#list displayInfo.fieldValueList as recordValueList >  
   <tr class="trcolor">
    <#assign keyColumn = recordValueList[0]>
      <td class="tdlistCenter"><input type="checkbox" name="selectRecordPerm" value=${keyColumn}></td>
    <#assign seq = 1>
    <#list recordValueList as field>
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
<@pagnation.pagnation formName="recordPermListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../user/listRecordPermission.action" params="funcCode=${funcCode}&permId=${permId}"/>

<script>
  function FormSubmit(opName) {
     window.recordPermListForm.action="../user/"+opName+"RecordPermission.action?opName="+opName;
     window.recordPermListForm.submit();
  }
   function flush() {
     window.recordPermListForm.action="../user/listRecordPermission.action";
     window.recordPermListForm.submit();
  }
</script>

<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
<input type ='hidden' name ='permId' value='${permId}'>
</@ww.form>
</body>
</html>