<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form  >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
      <tr>
        
      </tr>
    
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
  
    </td>
  </tr>
</table>
<br>


<#if stack.context["session"]?exists>
<input type ='hidden' name ='userId' value='${Session["_USER_LOGIN_"].id?default('')}'>
</#if>
</form>
</body>
</html>