<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<#assign flag ="c">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
</head>
<!--javascript脚本添加位置-->
<script language="javascript" type="text/javascript" src="../${r"${Session['_USER_STYLE_'].jsPath}"}/tigra_tables.js"></script>
<!--javascript脚本添加位置结束-->
<body>
<form name="${objectName}ListForm" method="post">
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control >
  <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:采集管理列表</td>
      </tr>
</table>
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10); z-index:1; left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle" id=control>
  <tr>
    <td>采集管理列表</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
          ${r"<#list displayInfo.operationList as op>"}
           ${r"<#if op.single!=1 >"}
              <input name="Button" type="button" class="button" value="${r'${op.name}'}" onclick="${r"FormSubmit('${op.abbr}')"}">
            ${r"</#if>"}
          ${r"</#list>"}
          </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" id="color_table">
    <tr>
      <th width="40" class="thListNormal">${r"${action.getText('select.text')}"}</th>
      ${r"<#list displayInfo.fieldNameList as fieldName>"}
      <th class="thListNormal">${r"${fieldName}"}</th>
      ${r"</#list>"}
       ${r"<#list displayInfo.operationList as op>"}
             ${r"<#if op.single!=0 >"}
             <th width="40" class="thListNormal"></th>
            ${r"</#if>"}
       ${r"</#list>"}
   </tr>
  
   ${r"<#list displayInfo.fieldValueList as recordValueList >"}  
   <tr class="trcolor">
    ${r"<#assign keyColumn = recordValueList[0]>"}
    <td class="tdlistCenter"><input type="checkbox" name="selectRecord" value=${r"${keyColumn}"}></td>
    ${r"<#assign seq = 1>"}
    ${r"<#list recordValueList as field>"}
    ${r"<#if seq != 1>"}
      ${r"<#if field?has_content>"}
     <td class="tdlistCenter">${r"${field}"}</td>
     ${r"<#else>"}
     <td class="tdlistCenter">&nbsp;</td> 
      ${r"</#if>"} 
      ${r"</#if>"} 
    ${r"<#assign seq = seq +1>"}
    ${r"</#list>"}
    ${r"<#list displayInfo.operationList as op>"}
        ${r"<#if op.single!=0 >"}
       <td class="tdlistCenter"><a href="../infogather/${r"${op.abbr}"}${flag}${className}.action?opName=${r"${op.abbr}"}&entityId=${r"${keyColumn}"}&funcCode=${r"${funcCode}"}&pageNum=${r"${pageNum}"}">${r"${op.name}"}</a></td>
       ${r"</#if>"}
    ${r"</#list>"}
  </tr>
  ${r"</#list>"}
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><table  border="0" align="right" cellpadding="3" cellspacing="2">
      <tr align="center">
        ${r"<#assign totalPage = displayInfo.totalPage >"}
        <td align="center">${r"${action.getText('di')}"}${r"${pageNum}/${totalPage}"}${r"${action.getText('page')}"}</td>
        <td align="center"><a href ="../infogather/list${flag}${className}.action?pageNum=1&funcCode=${r"${funcCode}"}">${r"${action.getText('firstpage')}"}</a></td>
         ${r"<#assign upPage = pageNum -1>"}
        ${r"<#if upPage <1 >"}
          ${r"<#assign upPage = 1>"}
        ${r"</#if>"}       
        <td align="center"><a href ="../infogather/list${flag}${className}.action?pageNum=${r"${upPage}"}&funcCode=${r"${funcCode}"}">${r"${action.getText('uptopage')}"}</a></td>
        ${r"<#assign downPage = pageNum +1>"}
	
        ${r"<#if (downPage > totalPage)>"}
          ${r"<#assign downPage = totalPage >"}
        ${r"</#if>"}
        <td align="center"><a href ="../infogather/list${flag}${className}.action?pageNum=${r"${downPage}"}&funcCode=${r"${funcCode}"}">${r"${action.getText('downtopage')}"}</a></td>
        <td align="center"><a href ="../infogather/list${flag}${className}.action?pageNum =${r"${totalPage}"}&funcCode=${r"${funcCode}"}">${r"${action.getText('endpage')}"}</a></td>
        <td>${r"${action.getText('di')}"}</td>
        <td width="20"><input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3"></td>
        <td>${r"${action.getText('page')}"}</td>
        <td><a href="#" onclick="gotoPage(${r"'${totalPage}'"},${r"'${funcCode}'"})"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/button_go.gif" alt="${r"${action.getText('goto.text')}"}" width="20" height="16" border="0"></a></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>
  function FormSubmit(opName) {
     window.${objectName}ListForm.action="../infogather/"+opName+"${className}.action?opName="+opName;
     window.${objectName}ListForm.submit();
  }
  function gotoPage(pMax,funcCode) {
   
    var pLastNum = window.${objectName}ListForm.gotoPageNum.value ;
  
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
    
    window.location="../infogather/list${flag}${className}.action?pageNum="+window.${objectName}ListForm.gotoPageNum.value+"&funcCode="+funcCode;
  }
</script>
<script language="javascript" type="text/javascript" src="../${r"${Session['_USER_STYLE_'].jsPath}"}/color_table.js"></script>
</div>
<input type ='hidden' name ='funcCode' value='${r"${funcCode}"}'>
<input type ='hidden' name ='pageNum' value='${r"${pageNum}"}'>
</form>
</body>
</html>