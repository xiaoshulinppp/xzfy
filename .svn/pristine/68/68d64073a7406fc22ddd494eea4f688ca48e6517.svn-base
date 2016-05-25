<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'passwordForm'"  action ="'setUserPassword'"   validate="'true'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
     
        <td>${action.getText("current.location")}:${action.getText("userpwd.title")}</td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr>
      <th class="thFormNormal"></th>
      <th class="thFormNormal"></th>
      </tr>
   <tr class="trwhite">
      <td class ="tdFormLeft">${action.getText("userpwd.oldpwd")}</td>
      <td class="tdFormRight"><@ww.password  name="'oldPassword'"  cssClass ="'inputTextNormal'"   required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
   <tr class="trcolor">
      <td class ="tdFormLeft">${action.getText("userpwd.newpwd")}</td>
      <td class="tdFormRight"><@ww.password   name="'newPassword'"  cssClass ="'inputTextNormal'"   required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
   <tr class="trwhite">
      <td class ="tdFormLeft">${action.getText("userpwd.confirmpwd")}</td>
      <td class="tdFormRight"><@ww.password   name="'confirmPassword'"  cssClass ="'inputTextNormal'"   required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
 
 </table>
 <#include "/common/actionerrors.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td> 
      <input name="Button32" type="submit" class="button" value="${action.getText("update.text")}">  
 
    </td>
  </tr>
</table>
<br>

 <script type="text/javascript">
  var checkSubmitFlg = false;
  function updatePassword_checkSubmit() {
   if(checkSubmitFlg == true) {
     return false;
    }
   checkSubmitFlg = true;
   }
   document.ondbclick = function docondblclick() {
   widow.event.returnValue = false;
  }
  document.onclick = function dbconclick() {
   if(checkSubmitFlg) {
     window.event.returnValue = false;
   }
  }

   </script>
</@ww.form>
</body>
</html>