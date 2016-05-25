<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'permForm'"  action ="'doUpdatePermission'" validate="'true'" disableSubmit="'saveid,returnid,savepermid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
   <tr>
            <td>${action.getText("current.location")}:${action.getText("perm.title")}</td>
      </tr>
    
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<#include "permissionProperty.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <#if opName == "update">
       <input id = "savepermid" name="Button33" type="button" class="button" value="${action.getText("perm.functionperm")}" onclick="updateMenuPermission('${perm.id}','${funcCode}')">
       <input id = "recordpermid" name="Button34" type="button" class="button" value="${action.getText("perm.recordperm")}" onclick="updateRecordPermission()">
        <input id = "fieldpermid" name="Button35" type="button" class="button" value="修改字段权限" onclick="updateFieldPermission()">
      <input id = "saveid" name="Button32" type="submit" class="button" value="${action.getText("update.text")}" >
      </#if>
      <input id = "returnid" name="Button42" type="reset" class="button" value="${action.getText("return.text")}" onclick="returnPage()">
    </td>
  </tr>
</table>
<br>

<script>
  function updateMenuPermission(permid,func) {
     window.open("../user/viewMenuPermission.action?permId="+permid+"&funcCode="+func);
    }
   function updateRecordPermission(permid) {
     window.open("../user/listRecordPermission.action?permId=${perm.id}&funcCode=${funcCode}");
    }
    function updateFieldPermission(permid) {
     window.open("../user/listFieldPermission.action?permId=${perm.id}&funcCode=${funcCode}");
    }   
    
    function returnPage() {
    submitDisableButton();
     document.location.href="../user/listPermission.action?funcCode=${funcCode}&pageNum=${pageNum}";
    }
    function submitDisableButton() { 
      <#if opName == "update">
      document.getElementById("saveid").disabled = true;
      document.getElementById("savepermid").disabled = true;
      document.getElementById("recordpermid").disabled = true;
      </#if>
      document.getElementById("returnid").disabled = true;
     
   }
</script>
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<input type ='hidden' name ='entityId' value='${perm.id}'>
</@ww.form>
</body>
</html>