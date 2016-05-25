<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'passwordForm'"  action ="'setUserPage'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">  
   <tr>     
        <td>${action.getText("current.location")}:${action.getText("userpage.title")}</td>
   </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
<#list mainFuncSet as mainMenu>
     <TR>
       <TD>${mainMenu.name}:</TD>
     </TR>
        <#assign key = mainMenu.name>
		<#assign submenus = funcList[key]>
		 <#assign count = 0>
		<#list submenus as submenu>
		<#if count%7==0>   
        <tr>
      
        </#if>    
          <td> 
     	   <input type="radio" name="userPage" value="${submenu.id}" <#if curPage == submenu.id> checked </#if> >${submenu.name}</input>
         </td>
       <#if (count-6)%7==0>
     
       </tr>
       </#if>        
       <#assign count = count+1> 
		</#list>
       <#if (count-7)%7!=0>
  
       </tr>
       </#if> 
</#list>    
 </table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td> 
         
          <input name="Button32" type="submit" class="button" value="${action.getText("update.text")}">  
 
    </td>
  </tr>
</table>
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