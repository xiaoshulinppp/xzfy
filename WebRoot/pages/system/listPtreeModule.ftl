<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="ptreeListForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
          <td>${action.getText("current.location")}:${action.getText("ptreelist.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("ptreelist.title")}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
          <#list displayInfo.operationList as op>
            <#if op.single!=1>
              <input name="Button" type="button" class="button" value="${op.name}" onclick="FormSubmit('${op.abbr}')">
            </#if>
          </#list>
          <#if parentId != 0>
              <input name ="Button" type ="button" class ="button" value="${action.getText("uptopage")}" onclick="document.location.href='../system/listPtree.action?funcCode=${funcCode}&positionId=${positionId}&parentId=${lastParentId}'">
          </#if>
          <#if parentId == 0>
              <input name ="Button" type ="button" class ="button" value="${action.getText("uptopage")}" onclick="document.location.href='../system/listPosition.action?funcCode=${funcCode}&positionId=${positionId}'">
          </#if>
            </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
    <tr>
      <th width="40" class="thListNormal">${action.getText("select.text")}</th>
      <#list displayInfo.fieldNameList as fieldName>
      <th class="thListNormal">${fieldName}</th>
      </#list>
       <#list displayInfo.operationList as op>
            <#if op.single!=0 >
             <th width="40" class="thListNormal">${op.name}</th>
            </#if>
       </#list>
   </tr>
  
   <#list displayInfo.fieldValueList as recordValueList >   
   <tr class="trcolor">
    <#assign keyColumn = recordValueList[0]>
    <td class="tdlistCenter"><input type="checkbox" name="selectRecord" value=${keyColumn}></td>
    <#assign seq = 1>
    <#list recordValueList as field>
    <#if seq != 1>
	<td class="tdlistCenter"><a href ="../system/listPtree.action?funcCode=${funcCode}&lastParentId=${parentId}&parentId=${keyColumn}&positionId=${positionId}">     
	<#if field?has_content>
         ${field}
       <#else>
         &nbsp;
       </#if></a></td>
    </#if>
    <#assign seq = seq +1>
    </#list>
    <#list displayInfo.operationList as op>
       <#if op.single!=0 >
       <td class="tdlistCenter"><a href="../system/${op.abbr}Ptree.action?opName=${op.abbr}&lastParentId=${parentId}&entityId=${keyColumn}&funcCode=${funcCode}&pageNum=${pageNum}&positionId=${positionId}&parentId=${parentId}"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/${op.image}" alt="${op.name}" width="16" height="16" border="0"></a></td>
       </#if>
    </#list>
  </tr>
  </#list>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
        <#assign totalPage = displayInfo.totalPage >
        ${action.getText("di")}${pageNum}/${totalPage}${action.getText("page")}
        <a href ="../system/listPtree.action?pageNum=1&funcCode=${funcCode}&positionId=${positionId}">${action.getText("firstpage")}</a>
         <#assign upPage = pageNum -1>
        <#if upPage <1 >
          <#assign upPage = 1>
        </#if>      
        <a href ="../system/listPtree.action?pageNum=${upPage}&funcCode=${funcCode}&positionId=${positionId}">${action.getText("uptopage")}</a>
        <#assign downPage = pageNum +1>
	
        <#if (downPage > totalPage)>
          <#assign downPage = totalPage >
        </#if>
        <a href ="../system/listPtree.action?pageNum=${downPage}&funcCode=${funcCode}&positionId=${positionId}&parentId=${parentId}">${action.getText("downtopage")}</a>
        <a href ="../system/listPtree.action?pageNum =${totalPage}&funcCode=${funcCode}&positionId=${positionId}&parentId=${parentId}">${action.getText("endpage")}</a>
        ${action.getText("di")}
        <input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3">
        ${action.getText("page")}
        <a href="#" onclick="gotoPage('${totalPage}')">GO</a>
      </td>
  </tr>
</table>
<script>
  function FormSubmit(opName) {
     window.ptreeListForm.action="../system/"+opName+"Ptree.action?opName="+opName;
     window.ptreeListForm.submit();
  }
  function gotoPage(pMax) {
   
    var pLastNum = window.ptreeListForm.gotoPageNum.value ;
  
    for(var ii =0; ii<pLastNum.length; ii++) {			
      if(pLastNum.charCodeAt(ii)>57 || pLastNum.charCodeAt(ii)<48)
        return false;	
    }
    if(pLastNum=='')
      return false ;
     if(parseInt(pLastNum)>parseInt(pMax)){
      pLastNum = pMax ;		
    }
    if(pLastNum == '0')
      pLastNum = 1;
    
    window.location="../system/listPtree.action?pageNum="+pLastNum+"&funcCode=${funcCode}&positionId=${positionId}";
  }
</script>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
<input type ='hidden' name ='positionId' value='${positionId}'>
<input type ='hidden' name ='parentId' value='${parentId}'>
</form>
</body>
</html>