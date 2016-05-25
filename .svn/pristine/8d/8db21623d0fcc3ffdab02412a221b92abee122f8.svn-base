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
   <TR>
    <td align="center">
    <#list mainFuncSet as mainMenu>
      <fieldset class="fieldsetStyle">
      <legend>${mainMenu.name}</legend>
      <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <#assign key = mainMenu.name>
		<#assign submenus = funcList[key]>
		 <#assign count = 0>
		<#list submenus as submenu>
		<#if count%5==0>   
        <tr>      
        </#if>    
          <td width="20%"> 
     	   <input type="radio" name="userPage" value="${submenu.id}" <#if curPage == submenu.id> checked </#if> >${submenu.name}</input>
         </td>
       <#if (count-4)%5==0>     
       </tr>
       </#if>        
       <#assign count = count+1> 
		</#list>
	  <#if count%7!=0>
	   <#assign spacecount = 5-count%5>
	   <#list 1..spacecount as x>
         <td width="20%"> &nbsp;</td>
       </#list>
	  </tr>
	  </#if>	
	   </table>
      </fieldset>
</#list>   
  </td>
  </tr>
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