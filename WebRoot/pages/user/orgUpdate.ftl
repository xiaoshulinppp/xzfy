<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}V2.0</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'orgForm'" action ="'doUpdateOrg'" validate="'true'" disableSubmit="'saveid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
    <td height="20">${action.getText("current.location")}:${action.getText("org.title")}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("org.orginfo")}</td>
  </tr>
</table>
 <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td width="10" class="cardActive">${action.getText("org.orgbaseinfo")}</td>
          <td width="100" class="cardNormal"><a href="../user/listOrg.action?parentId=${entityId}&pageNum=${pageNum}&funcCode=${funcCode}" class="cardLink">${action.getText("org.orgsubinfo")}</a></td>
		  <td class="cardTh">&nbsp;</td>
        </tr>
  </table>
<#include 'orgProperty.ftl'>    
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
        <tr>
          <td><input id = "saveid" name="Button26" type="submit" class="button" value="${action.getText("submit.text")}">
          <input name="Button262" type="button" class="button" value="${action.getText("org.delitem")}" onClick="delItem()"></td>
        </tr>
      </table>
      <br>
<script>
    function delItem() {
    submitDisableButton();
    window.location='../user/deleteOrg.action?funcCode=${funcCode}&parentId=${entityId}&entityId=${entityId}&selectRecord=${entityId}&opName=delete';
    }
    function submitDisableButton() { 
      document.getElementById("saveid").disabled = true;
   }
</script>      
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<@ww.hidden name ="'parentId'"/>
<@ww.hidden name ="'entityId'"/>
</@ww.form>

</body>
</html>
