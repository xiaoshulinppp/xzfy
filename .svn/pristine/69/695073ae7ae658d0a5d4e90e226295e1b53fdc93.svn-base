<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="regionListForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace"  >
  <tr>
         <td>${action.getText("current.location")}:区域管理</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>区域管理</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
          <#list displayInfo.operationList as op>
            <#if !op.single >
              <input id ="${op.abbr}Id" name="Button" type="button" class="button" value="${op.name}" onclick="FormSubmit('${op.abbr}')">
            </#if>
          </#list>
            <#if parentId!=0>
              <input id ="uptopage" name ="uptopage" type ="button" class ="button" value="上一页" onclick="uptopageiscp()">
          </#if>
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
            <#if op.single >
             <th width="40" class="thListNormal">&nbsp;</th>
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
     <td class="tdlistCenter"><a href ="../user/listRegion.action?funcCode=${funcCode}&parentId=${keyColumn}&backId=${parentId}">     <#if field?has_content>
         ${field}
       <#else>
         &nbsp;
       </#if></a></td>
    </#if>
    <#assign seq = seq +1>
    </#list>
    <#list displayInfo.operationList as op>
       <#if op.single >
       <td class="tdlistCenter"><a href="../user/${op.abbr}Region.action?opName=${op.abbr}&entityId=${keyColumn}&funcCode=${funcCode}&pageNum=${pageNum}&parentId=${parentId}">${op.name}</a></td>
       </#if>
    </#list>
  </tr>
  </#list>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><table  border="0" align="right" cellpadding="3" cellspacing="2">
      <tr align="center">
        <#assign totalPage = displayInfo.totalPage >
        <td align="center">${action.getText("di")}${pageNum}/${totalPage}${action.getText("page")}</td>
        <td align="center"><a href ="../user/listRegion.action?pageNum=1&funcCode=${funcCode}&parentId=${parentId}">${action.getText("firstpage")}</a></td>
         <#assign upPage = pageNum -1>
        <#if upPage <1 >
          <#assign upPage = 1>
        </#if>       
        <td align="center"><a href ="../user/listRegion.action?pageNum=${upPage}&funcCode=${funcCode}&parentId=${parentId}">${action.getText("uptopage")}</a></td>
        <#assign downPage = pageNum +1>
	
        <#if (downPage > totalPage)>
          <#assign downPage = totalPage >
        </#if>
        <td align="center"><a href ="../user/listRegion.action?pageNum=${downPage}&funcCode=${funcCode}&parentId=${parentId}">${action.getText("downtopage")}</a></td>
        <td align="center"><a href ="../user/listRegion.action?pageNum =${totalPage}&funcCode=${funcCode}&parentId=${parentId}">${action.getText("endpage")}</a></td>
        <td>${action.getText("di")}</td>
        <td width="20"><input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3"></td>
        <td>${action.getText("page")}</td>
        <td><a href="#" onclick="gotoPage('${totalPage}')">GO</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>
  function uptopageiscp() {
   submitDisableButton();
  document.location.href="../user/listRegion.action?funcCode=${funcCode}&parentId=${backId}";
  }
  function FormSubmit(opName) {
     submitDisableButton();
     window.regionListForm.action="../user/"+opName+"Region.action?opName="+opName;
     window.regionListForm.submit();
  }

   function submitDisableButton() {
   <#list displayInfo.operationList as op>
    <#if !op.single >
      var buttonid ="${op.abbr}Id";
      document.getElementById(buttonid).disabled = true;
    </#if>
    </#list> 
    <#if parentId!=0>
    document.getElementById("uptopage").disabled = true;   
    </#if>
  }
  function gotoPage(pMax) {
   
    var pLastNum = window.regionListForm.gotoPageNum.value ;
  
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
    
    window.location="../user/listRegion.action?pageNum="+pLastNum+"&funcCode=${funcCode}&parentId=${parentId}";
  }
</script>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
<input type ='hidden' name ='parentId' value='${parentId}'>
</form>
</body>
</html>