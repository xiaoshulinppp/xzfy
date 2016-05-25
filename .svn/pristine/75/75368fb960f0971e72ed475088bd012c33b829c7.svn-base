<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'assignForm'" action ="'savePostUser'" validate="'true'" method="'get'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
         <td>${action.getText("current.location")}--${action.getText("postassign.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("postassign.post")}:${postName}</td>
  </tr>
</table>

<table>
<#assign count =0>
<#list assignedUserList as user>
 <#if count%7==0>   
     <tr height = "26">
     </#if>   
    <td><input type=checkbox name="userId" value="${user.id}" checked>${user.name}</td> 
 <#if (count-6)%7==0>
     </tr>
 </#if> 
 <#assign count = count+1>    
</#list>

<#list unassignedUserList as user>
 <#if count%7==0>   
     <tr height = "26">
 </#if>   
 <td><input type=checkbox name="userId" value="${user.id}">${user.name}</td>
 <#if (count-6)%7==0>
     </tr>
 </#if> 
 <#assign count = count+1> 
</#list>
</table>
<input type=hidden name="ptreeId" value=${ptreeId}>
<input type=hidden name="positionId" value=${positionId}>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr><td><input name="Button22" type="submit" class="button" value="${action.getText("save.text")}"></td></tr>
</table>
<br>

<@ww.hidden name ="'funcCode'"/>
</@ww.form>
</body>
</html>
