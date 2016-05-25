<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}V2.0</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'regionForm'" action ="'doCreateRegion'" validate="'true'" disableSubmit="'saveid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
    <td height="20">${action.getText("current.location")}:区域管理</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>区域管理信息</td>
  </tr>
</table>
      <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td width="15" class="cardActive">区域管理基本信息</td>
        </tr>
  </table>
<#include 'regionProperty.ftl'>     
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
        <tr>
          <td><input id = "saveid" name="Button26" type="submit" class="button" value="${action.getText("submit.text")}">
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
<@ww.hidden name ="'parentId'"/>
<@ww.hidden name ="'opName'" value="'create'"/>
</@ww.form>

</body>
</html>
