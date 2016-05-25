<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../common/calendar1.js"></script>
<script language="javascript" type="text/javascript" src="../common/Comm.js"></script>
<script language="javascript" type="text/javascript" src="../common/PopupDlg.js"></script>
<body>
<@ww.form  name="'fieldForm'" action ="'doCreateField'" validate="'true'" disableSubmit="'saveid,returnid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
        <td width="30" align="center"><img src="../${Session["_USER_STYLE_"].imagePath}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${action.getText("current.location")}:${action.getText("field.title")}</td>
      </tr>
    
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<#include 'fieldProperty.ftl'>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
     
      <input id = "saveid" name="Button22" type="submit" class="button" value="${action.getText("save.text")}" > 
      <input id = "returnid" name="Button42" type="button" class="button" value="${action.getText("return.text")}" onClick ="returnPage()">
    </td>
  </tr>
</table>
<br>
<script>
    function returnPage() {
    submitDisableButton();
     document.location.href="../system/listField.action?funcCode=${funcCode}&tableId=${tableId}&pageNum=${pageNum}&returnPageNum=${returnPageNum}";
    }
    function submitDisableButton() { 
      document.getElementById("saveid").disabled = true;
      document.getElementById("returnid").disabled = true;
   }
</script>
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<@ww.hidden name ="'returnPageNum'"/>
<@ww.hidden name ="'tableId'"/>
</@ww.form>
</body>
</html>