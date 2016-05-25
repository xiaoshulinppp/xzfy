<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'functionForm'"  action ="'doUpdateUserInfo'" validate="'true'" disableSubmit="'saveid,returnid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
      <tr>
        <td>${action.getText("current.location")}:${action.getText("user.title")}</td>
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
      <td class ="tdFormLeft">用户名</td>
      <td class="tdFormRight"><input type="text"  name="user.name"  class ="inputTextNormal"   value="${Session["_UPDATE_USERINFO_"].name}" /><font color=red>**</font></td>
   </tr>
  <tr class="trwhite">
      <td class="tdFormleft">登录名</td>
      <td class="tdFormRight"><input type="text"   name="user.logName"  class ="inputTextNormal"   value="${Session["_UPDATE_USERINFO_"].logName}" /><#include "/common/actionerrors.ftl"><font color=red>**</font></td>
  </tr>
   
  <tr class="trcolor">
      <td class="tdFormleft">固定电话</td>
      <td class="tdFormRight"><input type="text" name="user.phone"   class="inputTextNormal" value="${Session["_UPDATE_USERINFO_"].phone}"    /> </td>
      
  </tr>
   <tr class="trcolor">
      <td class="tdFormleft">手机</td>
      <td class="tdFormRight"><input type="text" name="user.mphone"   class="inputTextNormal" value="${Session["_UPDATE_USERINFO_"].mphone}"    /></td>
  </tr>
    <tr class="trcolor">
      <td class="tdFormleft">地址</td>
      <td class="tdFormRight"><input type="text" name="user.address"   class="inputTextNormal" value="${Session["_UPDATE_USERINFO_"].address}'"    /></td>
  </tr>
    <tr class="trcolor">
      <td class="tdFormleft">邮编</td>
      <td class="tdFormRight"><input type="text" name="user.postMan"   class="inputTextNormal"    value="${Session["_UPDATE_USERINFO_"].postMan}" /></td>
  </tr>
    <tr class="trcolor">
      <td class="tdFormleft">EMail</td>
      <td class="tdFormRight"><input type="text" name="user.email"   class="inputTextNormal"    value="${Session["_UPDATE_USERINFO_"].email}" /><#include "/common/actionerrors.ftl"><font color=red>**</font></td>
  </tr>
 </table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <input id = "saveid" name="Button32" type="submit" class="button" value="${action.getText("update.text")}">
    </td>
  </tr>
</table>
<br>


<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<input type ='hidden' name ='userId' value='${Session["_USER_LOGIN_"].id}'>
</@ww.form>
</body>
</html>