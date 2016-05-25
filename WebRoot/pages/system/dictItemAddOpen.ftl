<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}V2.0</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'dictItemForm'" action ="'doCreateDictItemOpen'" validate="'true'" disableSubmit="'saveid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
    <td height="20">${action.getText("current.location")}:${action.getText("dictitem.title")}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("dictitem.dictiteminfo")}</td>
  </tr>
</table>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td width="10" class="cardActive">${action.getText("dictitem.dictitembaseinfo")}</td>
        </tr>
  </table>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainCard">
        <tbody>
          <tr>
            <td valign="top" class="cardBody">
            <#include 'dictItemProperty.ftl'>
          </td>
          </tr>
  </tbody> </table>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
        <tr>
          <td><input id = "saveid" name="Button26" type="submit" class="button" value="${action.getText("submit.text")}">
             <input name="Button262" type="button" class="button" value="${action.getText("close.text")}" onClick="window.close()"></td>
 
        </tr>
      </table>
      <br>
<script>
    function submitDisableButton() { 
      document.getElementById("saveid").disabled = true;
   }
</script>      
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<@ww.hidden name ="'dictId'"/>
<@ww.hidden name ="'parentId'"/>
</@ww.form>

</body>
</html>
