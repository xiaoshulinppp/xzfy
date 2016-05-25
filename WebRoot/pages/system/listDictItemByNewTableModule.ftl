<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="dictItemListForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
        <td>${action.getText("current.location")}:${action.getText("dictitemlist.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("dictitemlist.title")}</td>
  </tr>
</table>
 <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td width="10" class="cardNormal"><a href="../system/viewDictItemByNewTable.action?dictId=${dictId}&dictItemId=${parentId}&funcCode=${funcCode}&opName=update&dictType=0" class="cardLink">${action.getText("dictitem.dictitembaseinfo")}</a></td>
          <td width="100" class="cardActive">${action.getText("dictitem.dictitemsubinfo")}</td>
	  <td class="cardTh">&nbsp;</td>
        </tr>
  </table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
          <#list displayInfo.operationList as op>
            <#if op.single!=1>
              <#if op.abbr == "create">
              <input id ="${op.abbr}Id" name="Button" type="button" class="button" value="${op.name}" onclick="MM_openBrWindow('createDictItemOpenByNewTable.action?funcCode=${funcCode}&dictId=${dictId}&parentId=${parentId}&opName=create','creatSub','status=yes,scrollbars=yes,resizable=yes,width=550,height=350')">
              <#else>
              <input id ="${op.abbr}Id" name="Button" type="button" class="button" value="${op.name}" onclick="FormSubmit('${op.abbr}')">
	      </#if>
            </#if>
          </#list>
            </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" id="color_table">
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
     <td class="tdlistCenter">     
     <#if field?has_content>
         ${field}
       <#else>
         &nbsp;
       </#if></td>
    </#if>
    <#assign seq = seq +1>
    </#list>
    <#list displayInfo.operationList as op>
       <#if op.single!=0 >
       <td class="tdlistCenter"><a href="#"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/${op.image}" alt="${op.name}" width="16" height="16" border="0" onClick="MM_openBrWindow('../system/${op.abbr}DictItemOpenByNewTable.action?opName=${op.abbr}&dictItemId=${keyColumn}&funcCode=${funcCode}&pageNum=${pageNum}&dictId=${dictId}&parentId=${parentId}')"></a></td>
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
        <a href ="../system/listDictItemByNewTable.action?pageNum=1&funcCode=${funcCode}&dictId=${dictId}&parentId=${parentId}">${action.getText("firstpage")}</a>
         <#assign upPage = pageNum -1>
        <#if upPage <1 >
          <#assign upPage = 1>
        </#if>      
        <a href ="../system/listDictItemByNewTable.action?pageNum=${upPage}&funcCode=${funcCode}&dictId=${dictId}&parentId=${parentId}">${action.getText("uptopage")}</a>
        <#assign downPage = pageNum +1>
	
        <#if (downPage > totalPage)>
          <#assign downPage = totalPage >
        </#if>
        <a href ="../system/listDictItemByNewTable.action?pageNum=${downPage}&funcCode=${funcCode}&dictId=${dictId}&parentId=${parentId}">${action.getText("downtopage")}</a>
        <a href ="../system/listDictItemByNewTable.action?pageNum =${totalPage}&funcCode=${funcCode}&dictId=${dictId}&parentId=${parentId}">${action.getText("endpage")}</a>
        ${action.getText("di")}
        <input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3">
        ${action.getText("page")}
        <a href="#" onclick="gotoPage('${totalPage}')">GO</a>
      </td>
  </tr>
</table>
<script>
  function FormSubmit(opName) {
     submitDisableButton();
     window.dictItemListForm.action="../system/"+opName+"DictItemByNewTable.action?opName="+opName;
     window.dictItemListForm.submit();
  }

    function submitDisableButton() {
   <#list displayInfo.operationList as op>
    <#if op.single!=1>
      var buttonid ="${op.abbr}Id";
      document.getElementById(buttonid).disabled = true;
    </#if>
    </#list>    
  }
  function gotoPage(pMax) {
   
    var pLastNum = window.dictItemListForm.gotoPageNum.value ;
  
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
    
    window.location="../system/listDictItemByNewTable.action?pageNum="+pLastNum+"&funcCode=${funcCode}&dictId=${dictId}&parentId=${parentId}";
  }
  function MM_openBrWindow(theURL,winName,features) { 
  window.open(theURL,winName,features);
}
</script>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
<input type ='hidden' name ='dictId' value='${dictId}'>
<input type ='hidden' name ='parentId' value='${parentId}'>
</form>
</body>
</html>