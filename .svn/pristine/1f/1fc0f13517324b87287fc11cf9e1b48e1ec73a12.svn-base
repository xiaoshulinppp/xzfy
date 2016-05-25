<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'dictItemForm'" action ="'doCreateDictItemNew'" validate="'true'" disableSubmit="'saveid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
         <td>${action.getText("current.location")}:${action.getText("dictitem.title")}</td>
      </tr>
   
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<#include 'dictItemProperty.ftl'>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
       <input id = "saveid" name="Button22" type="submit" class="button" value="${action.getText("save.text")}" > 
     </td>
  </tr>
</table>
<br>
<script>
    function returnPage() {
    submitDisableButton();
     document.location.href="../system/listDictionary.action?funcCode=${funcCode}&pageNum=${pageNum}";
    }
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