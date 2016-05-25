<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
</head>
<!--javascript脚本添加位置-->
<script language="javascript" type="text/javascript" src="../${r"${Session['_USER_STYLE_'].jsPath}"}/tigra_tables.js"></script>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<!--javascript脚本添加位置结束-->
<body>
<form name="${objectName}ListForm" method="post">

<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control >
  <tr>
      <td height="20">${r"${action.getText('current.location')}"}:${plugin.functionName}</td>
      </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle" id=control>
  <tr>
    <td>${plugin.functionName}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
           <input name="Button52" type="button" class="button" onClick="MM_openBrWindow('../system/fieldSelected.action?tableName=${r"${tableName}"}','selectzd','status=yes,scrollbars=yes,resizable=yes,width=450,height=600')" value=${r"$"}{action.getText("fieldselect")${r"}"}>
          ${r"<#list displayInfo.operationList as op>"}
            ${r"<#if op.single!=1>"}
              <input name="Button" type="button" class="button" value="${r'${op.name}'}" id ="${r"${op.abbr}"}Id" onclick="${r"FormSubmit('${op.abbr}')"}">
            ${r"</#if>"}
          ${r"</#list>"}
          </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" id="color_table">
    <tr>
      <th width="40" class="thListNormal"><input type="checkbox" name="selectAllCheckbox" onclick="selectAll('selectAllCheckbox','selectRecord')"></th>
      ${r"<#list displayInfo.fieldNameList as fieldName>"}
      <th class="thListNormal">${r"${fieldName}"}</th>
      ${r"</#list>"}
       ${r"<#list displayInfo.operationList as op>"}
            ${r"<#if op.single!=0 >"}
             <th width="40" class="thListNormal">${r"${op.name}"}</th>
            ${r"</#if>"}
       ${r"</#list>"}
   </tr>
   ${r"<#assign count =0>"}
   ${r"<#list displayInfo.fieldValueList as recordValueList >"}  
   <tr class="trcolor">
    ${r"<#assign keyColumn = recordValueList[0]>"}
    ${r" <#assign"} record = resultList.items.get(count)>
    ${r"<#if record.submitflag?has_content>"}
    ${r"<#assign flag = record.submitflag>"}
    ${r" <#else>"}
    ${r" <#assign flag = 1>"}
    ${r"  </#if>"}
    <td class="tdlistCenter"><input type="checkbox" name="selectRecord" value=${r"${keyColumn}"}></td>
    ${r"<#assign seq = 1>"}
    ${r"<#list recordValueList as field>"}
    ${r"<#if seq != 1>"}
    ${r"<#if flag != 0>"}
     <td class="tdlistCenter">
    ${r"<#else>"}
       <td class="tdlistCenterRed">
     ${r"</#if>"}
     ${r"<#if field?has_content>"}
     ${r"${field}"}</td>
     ${r"<#else>"}
    &nbsp;</td> 
      ${r"</#if>"} 
    ${r"</#if>"}
    ${r"<#assign seq = seq +1>"}
    ${r"</#list>"}
    ${r"<#list displayInfo.operationList as op>"}
       ${r"<#if op.single!=0 >"}
          <td class="tdlistCenter"><a href="../info/${r"${op.abbr}"}${className}.action?opName=${r"${op.abbr}"}&entityId=${r"${keyColumn}"}&funcCode=${r"${funcCode}"}&pageNum=${r"${pageNum}"}"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/sicons/${r"${op.image}"}" alt="${r"${op.name}"}" width="16" height="16" border="0"></a></td>
       ${r"</#if>"}
    ${r"</#list>"}
  </tr>
  ${r"<#assign count = count +1>"}
  ${r"</#list>"}
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><table  border="0" align="right" cellpadding="3" cellspacing="2">
      <tr align="center">
        ${r"<#assign totalPage = displayInfo.totalPage >"}
        <td align="center">${r"${action.getText('di')}"}${r"${pageNum}/${totalPage}"}${r"${action.getText('page')}"}</td>
        <td align="center"><a href ="../info/list${className}.action?pageNum=1&funcCode=${r"${funcCode}"}">${r"${action.getText('firstpage')}"}</a></td>
         ${r"<#assign upPage = pageNum -1>"}
        ${r"<#if upPage <1 >"}
          ${r"<#assign upPage = 1>"}
        ${r"</#if>"}       
        <td align="center"><a href ="../info/list${className}.action?pageNum=${r"${upPage}"}&funcCode=${r"${funcCode}"}">${r"${action.getText('uptopage')}"}</a></td>
        ${r"<#assign downPage = pageNum +1>"}
	
        ${r"<#if (downPage > totalPage)>"}
          ${r"<#assign downPage = totalPage >"}
        ${r"</#if>"}
        <td align="center"><a href ="../info/list${className}.action?pageNum=${r"${downPage}"}&funcCode=${r"${funcCode}"}">${r"${action.getText('downtopage')}"}</a></td>
        <td align="center"><a href ="../info/list${className}.action?pageNum =${r"${totalPage}"}&funcCode=${r"${funcCode}"}">${r"${action.getText('endpage')}"}</a></td>
        <td>${r"${action.getText('di')}"}</td>
        <td width="20"><input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3"></td>
        <td>${r"${action.getText('page')}"}</td>
        <td><a href="#" onclick="gotoPage(${r"'${totalPage}'"},${r"'${funcCode}'"})">GO</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>
  function FormSubmit(opName) {
      submitDisableButton();
     window.${objectName}ListForm.action="../info/"+opName+"${className}.action?opName="+opName;
     window.${objectName}ListForm.submit();
  }
   function submitDisableButton() {
   ${r"<#list displayInfo.operationList as op>"} 
    ${r"<#if op.single!=1>"} 
      var buttonid ="${r"${op.abbr}"}Id";
      document.getElementById(buttonid).disabled = true;
    ${r"</#if>"} 
    ${r"</#list>"}  
   
  }
  function gotoPage(pMax,funcCode) {
   
    var pLastNum = window.${objectName}ListForm.gotoPageNum.value;
  
    for(var ii =0; ii<pLastNum.length; ii++) {			
      if(pLastNum.charCodeAt(ii)>57 || pLastNum.charCodeAt(ii)<48)
        return false;	
    }
    if(pLastNum=='')
      return false ;
    if(pLastNum>pMax) {
      window.${objectName}ListForm.gotoPageNum.value = pMax ;		
    }
    if(pLastNum == '0')
      window.${objectName}ListForm.gotoPageNum.value = 1;
    
    window.location="../info/list${className}.action?pageNum="+window.${objectName}ListForm.gotoPageNum.value+"&funcCode="+funcCode;
  }
  function MM_openBrWindow(theURL,winName,features) {
  window.open(theURL,winName,features);
  }
  
  function setShowFieldValue(showFieldValue){
     window.${objectName}ListForm.action="../info/list${className}.action?showFieldString="+showFieldValue;
     window.${objectName}ListForm.submit();
  }
</script>
<script language="javascript" type="text/javascript" src="../${r"${Session['_USER_STYLE_'].jsPath}"}/color_table.js"></script>
<input type ='hidden' name ='funcCode' value='${r"${funcCode}"}'>
<input type ='hidden' name ='pageNum' value='${r"${pageNum}"}'>
</form>
</body>
</html>