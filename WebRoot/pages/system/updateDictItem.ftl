<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'dictItemForm'"  action ="'doUpdateDictItem'" validate="'true'" disableSubmit="'saveid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
           <td>${action.getText("current.location")}:${action.getText("dictitem.title")}</td>
      </tr>
   
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center">
    </td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td align="right">
    <#if (dictType != "0" && dictType != "single") || dictItemId == 0>
    <input type="button" class="button" value="${action.getText("create.text")}" onclick = "window.location='../system/createDictItem.action?funcCode=${funcCode}&dictId=${dictId}&parentId=${entityId}&opName=create'">
    </#if>
    <#if entityId != 0>
    <input type="button" class="button" value="${action.getText("delete.text")}" onclick = "window.location='../system/deleteDictItem.action?funcCode=${funcCode}&dictId=${dictId}&parentId=${entityId}&entityId=${entityId}&selectRecord=${entityId}&opName=delete'">
    </#if>
    </td>
  </tr>
</table>
<#if entityId != 0>
<#include "dictItemProperty.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <#if opName == "update">
      <input id = "saveid" name="Button32" type="submit" class="button" value="${action.getText("update.text")}">
      </#if>
    </td>
  </tr>
</table>
</#if>
<br>
<script>
    function returnPage() {
     submitDisableButton();
     document.location.href="../system/listDictItem.action?funcCode=${funcCode}&dictId=${dictId}&pageNum=${pageNum}";
    }
    function submitDisableButton() { 
      <#if opName == "update">
      document.getElementById("saveid").disabled = true;
      </#if>
   }
</script>
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<@ww.hidden name ="'dictId'"/>
<@ww.hidden name ="'entityId'"/>
</@ww.form>
</body>
</html>