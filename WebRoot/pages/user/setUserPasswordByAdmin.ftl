<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'passwordForm'"  action ="'setUserPasswordByAdmin'"   method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
 <tr>
     
        <td>${action.getText("current.location")}:${action.getText("userpwd.title")}</td>
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
      <td class ="tdFormLeft">用户登录名</td>
      <td class="tdFormRight"><@ww.textfield  name="'userLogName'"  cssClass ="'inputTextNormal'"   required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
   <tr class="trcolor">
      <td class ="tdFormLeft">新密码</td>
      <td class="tdFormRight"><@ww.password   name="'newPassword'"  cssClass ="'inputTextNormal'"   required = "'true'" theme="simple"/><font color=red>**</font></td>
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
<@ww.hidden name ="'funcCode'"/>
</@ww.form>
</body>
</html>