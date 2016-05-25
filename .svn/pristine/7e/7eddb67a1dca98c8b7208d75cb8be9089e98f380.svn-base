<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="styleListForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
           <td>${action.getText("current.location")}:${action.getText("userstyle.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("userstyle.title")}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
  <tr>
   <#list styleList.items as item > 
      <td align="center" ><img src="${item.preImage}" width="220" height="169"></td>  
   </#list>
  </tr>
  <tr>
     <#list styleList.items as item > 
      <td align="center" >
         <input name="Submit2" type="button" class="button" value="${action.getText("userstyle.preview")}" onclick="javascript:window.open('../prestyle/${item.preFile}')">
         <input name="Submit3" type="button" class="button" value="${action.getText("userstyle.confirm")}" onclick="document.location.href='../user/setUserStyle.action?userStyle=${item.id}'">
      </td>  
   </#list>
  </tr>
 
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><table  border="0" align="right" cellpadding="3" cellspacing="2">
      <tr align="center">
        <#assign totalPage = styleList.totalPage >
        <td align="center">${action.getText("di")}${pageNum}/${totalPage}${action.getText("page")}</td>
        <td align="center"><a href ="../user/viewSetUserStyle.action?pageNum=1">${action.getText("firstpage")}</a></td>
         <#assign upPage = pageNum -1>
        <#if upPage <1 >
          <#assign upPage = 1>
        </#if>       
        <td align="center"><a href ="../user/viewSetUserStyle.action?pageNum=${upPage}">${action.getText("uptopage")}</a></td>
        <#assign downPage = pageNum +1>
	
        <#if (downPage > totalPage)>
          <#assign downPage = totalPage >
        </#if>
        <td align="center"><a href ="../user/viewSetUserStyle.action?pageNum=${downPage}">${action.getText("downtopage")}</a></td>
        <td align="center"><a href ="../user/viewSetUserStyle.action?pageNum =${totalPage}">${action.getText("endpage")}</a></td>
        <td>${action.getText("di")}</td>
        <td width="20"><input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3"></td>
        <td>${action.getText("page")}</td>
        <td><a href="#" onclick="gotoPage('${totalPage}')">GO</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>
  function FormSubmit(opName) {
     window.styleListForm.action="../user/setUserStyle.action";
     window.styleListForm.submit();
  }
  function gotoPage(pMax,funcCode) {
   
    var pLastNum = window.styleListForm.gotoPageNum.value ;
  
    for(var ii =0; ii<pLastNum.length; ii++) {			
      if(pLastNum.charCodeAt(ii)>57 || pLastNum.charCodeAt(ii)<48)
        return false;	
    }
    if(pLastNum=='')
      return false ;
    if(pLastNum>pMax) {
      window.styleListForm.gotoPageNum.value = pMax ;		
    }
    if(pLastNum == '0')
      window.styleListForm.gotoPageNum.value = 1;
    
    window.location="../user/viewSetUserStyle.action?pageNum="+window.roleListForm.styleListForm.value;
  }
</script>
</form>
</body>
</html>