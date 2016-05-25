<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<@ww.form  name="'roleForm'"  method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
          <td>${action.getText("current.location")}:${action.getText("role.title")}</td>
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
      <td class="tdFormleft">用户</td>
      <td class="tdFormRight"><@ww.checkboxlist name="'selectUser'"   tabindex = "4"  list="getAllUser()"  value="getAllCutsomUser()" theme="simple"/></td>
  </tr>
 </table>
 
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <#if opName == "update">
        <input id = "addUserId" name="addUserId" type="button" class="button" value="添加用户" onclick="addUser()">
      </#if>
        <input id = "closeWindow" name="closeWindow" type="button" class="button" value="关闭" onclick="window.close()">
       </td>
  </tr>
</table>
<br>
<script>
   function addUser() {
      window.roleForm.action="../user/addUserForRole.action";
      window.roleForm.submit();
   }
 </script>
<@ww.hidden name ="'funcCode'"/>
<input type ='hidden' name ='entityId' value='${role.id}'>
</@ww.form>
</body>
</html>