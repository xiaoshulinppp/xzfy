<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<#assign flag ="n">
<#assign relationObjectName="">
<#list table.relationshipRoles as relationshipRole >
      <#if relationshipRole.enabled>
       <#assign originMany = relationshipRole.originMany>
       <#assign relationObjectName = table.getVariableName(relationshipRole)>
      </#if>	
 
</#list>
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
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10); z-index:1; left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle" id="control">
  <tr>
    <td>业务管理列表</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
           ${r"<#if"} opName!="view"&&opName!='submit'>
          ${r"<#list"} displayInfo.operationList as op>
            ${r"<#if"} op.single!=1 >
              <input name="Button" type="button" class="button" value="${r"${op.name}"}" onclick="FormSubmit('${r"${op.abbr}"}','${r"${funcCode}"}','${r"${opName}"}','${r"${"}${relationObjectName}Id${r"}')"}">
            ${r"</#if>"}
          ${r"</#list>"}
          ${r"</#if>"}

          </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" id="color_table">
    <tr>
      <th width="40" class="thListNormal">${r"${action.getText('select.text')}"}</th>
      ${r"<#list"} displayInfo.fieldNameList as fieldName>
      <th class="thListNormal">${r"${fieldName}"}</th>
      ${r"</#list>"}
       ${r"<#if"} opName!="view"&&opName!='submit'>
       ${r"<#list"} displayInfo.operationList as op>
            ${r"<#if"} op.single!=0  >
             <th width="40" class="thListNormal">${r"${op.name}"}</th>
            ${r"</#if>"}
       ${r"</#list>"}
       ${r"</#if>"}
        ${r"<#if"} opName=='view'||opName=='submit'>
         <th width="40" class="thListNormal">查看</th>
        ${r"</#if>"}
   </tr>
  
   ${r"<#list"} displayInfo.fieldValueList as recordValueList >  
   <tr class="trcolor">
    ${r"<#assign"} keyColumn = recordValueList[0]>
    <td class="tdlistCenter"><input type="checkbox" name="selectRecord" value=${r"${keyColumn}"}></td>
    ${r"<#assign"} seq = 1>
    ${r"<#list"} recordValueList as field>
    ${r"<#if"} seq != 1>
    ${r"<#if field?has_content>"}
     <td class="tdlistCenter">${r"${field}"}</td>
     ${r"<#else>"}
     <td class="tdlistCenter">&nbsp;</td> 
      ${r"</#if>"} 
    ${r"</#if>"}
    ${r"<#assign"} seq = seq +1>
    ${r"</#list>"}
    ${r"<#if"} opName!='view'&&opName!='submit'&&opName!="check">
    ${r"<#list"} displayInfo.operationList as op>
       ${r"<#if"}  op.single!=0  >
       <td class="tdlistCenter">
       ${r"<#if"} op.abbr=='submit'>
       ${r"</#if>"}
       ${r"<#if"} op.abbr!='submit'>
       <a href="javascript:FormClick('${r"${op.abbr}"}','${r"${keyColumn}"}','${r"${funcCode}"}','${r"${"}${relationObjectName}Id${r"}"}','${r"${pageNum}"}')"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/sicons/${r"${op.image}"}" alt="${r"${op.name}"}" width="16" height="16" border="0"></a></td>
       ${r"</#if>"}
       ${r"</#if>"}
    ${r"</#list>"}
    ${r"</#if>"}
    ${r"<#if"} opName=="check">
    ${r"<#list"} displayInfo.operationList as op>
       ${r"<#if"} op.single!=0>
       <td class="tdlistCenter"><a href="javascript:FormClick('${r"${op.abbr}"}','${r"${keyColumn}"}','${r"${funcCode}"}','${r"${"}${relationObjectName}Id${r"}"}','${r"${pageNum}"}')">${r"<#if"} op.abbr=="check">修改${r"</#if>"}${r"<#if"} op.abbr!="check"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/sicons/${r"${op.image}"}" alt="${r"${op.name}"}" width="16" height="16" border="0">${r"</#if>"}</a></td>
       ${r"</#if>"}
    ${r"</#list>"}
    ${r"</#if>"}
    ${r"<#if"} opName=='view'||opName=='submit'>
       <td class="tdlistCenter">
       <a href="javascript:FormClick('view','${r"${keyColumn}"}','${r"${funcCode}"}','${r"${"}${relationObjectName}Id${r"}"}','${r"${pageNum}"}')"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/sicons/search.gif" alt="查看" width="16" height="16" border="0"></a></td>
        ${r"<#if"} displayInfo.operationList.size()==5>
	<td class="tdlistCenter"></td>
        <td class="tdlistCenter"></td>  
	 ${r"</#if>"}
	${r"<#if"} displayInfo.operationList.size()==2>
	<td class="tdlistCenter"></td>
	 ${r"</#if>"}
    ${r"</#if>"}
  </tr>
  ${r"</#list>"}
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><table  border="0" align="right" cellpadding="3" cellspacing="2">
      <tr align="center">
        ${r"<#assign totalPage = displayInfo.totalPage >"}
        <td align="center">${r"${action.getText('di')}"}${r"${pageNum}"}/${r"${totalPage}"}${r"${action.getText('page')}"}</td>
        <td align="center"><a href ="../info/list${className}InLine.action?pageNum=1&funcCode=${r"${funcCode}"}&opName=${r"${opName}"}&${relationObjectName}Id=${r"${"}${relationObjectName}Id${r"}"}">${r"${action.getText('firstpage')}"}</a></td>
         ${r"<#assign"} upPage = pageNum -1>
        ${r"<#if"} upPage <1 >
          ${r"<#assign"} upPage = 1>
        ${r"</#if>"}       
        <td align="center"><a href ="../info/list${className}InLine.action?pageNum=${r"${upPage}"}&funcCode=${r"${funcCode}"}&opName=${r"${opName}"}&${relationObjectName}Id=${r"${"}${relationObjectName}Id${r"}"}">${r"${action.getText('uptopage')}"}</a></td>
        ${r"<#assign"} downPage = pageNum +1>
	
        ${r"<#if"} (downPage > totalPage)>
          ${r"<#assign"} downPage = totalPage >
        ${r"</#if>"}
        <td align="center"><a href ="../info/list${className}InLine.action?pageNum=${r"${downPage}"}&funcCode=${r"${funcCode}"}&opName=${r"${opName}"}&${relationObjectName}Id=${r"${"}${relationObjectName}Id${r"}"}">${r"${action.getText('downtopage')}"}</a></td>
        <td align="center"><a href ="../info/list${className}InLine.action?pageNum =${r"${totalPage}"}&funcCode=${r"${funcCode}"}&opName=${r"${opName}"}&${relationObjectName}Id=${r"${"}${relationObjectName}Id${r"}"}">${r"${action.getText('endpage')}"}</a></td>
        <td>${r"${action.getText('di')}"}</td>
        <td width="20"><input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3"></td>
        <td>${r"${action.getText('page')}"}</td>
        <td><a href="#" onclick="gotoPage('${r"${totalPage}"}','${r"${funcCode}"}','${r"${opName}"}','${r"${"}${relationObjectName}Id${r"}"}')">GO</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>
  function FormSubmit(opName,funcCode,opName1,info1Id) {
 if(opName == 'delete') {
      window.${objectName}ListForm.action=opName+"${className}InLine.action?opName="+opName1+"&${relationObjectName}Id="+info1Id;
      window.${objectName}ListForm.submit();
      }else if(opName1=='create'){
     window.open("../info/"+opName+"${className}InLine.action?opName="+opName+"&funcCode="+funcCode,'popwin','scrollbars=yes,resizable=yes,width=800,height=600')
     }else{
    window.open("../info/"+opName+"${className}InLine.action?opName="+opName+"&funcCode="+funcCode+"&${relationObjectName}Id="+info1Id,'popwin','scrollbars=yes,resizable=yes,width=800,height=600')
     }
  }
  function FormClick(opName,${objectName}Id,funcCode,info1Id,pageNum){
   if(opName == 'delete') {
      window.${objectName}ListForm.action=opName+"${className}InLine.action?opName="+opName+"&{relationObjectName}Id="+info1Id+"&entityId="+${objectName}Id;
      window.${objectName}ListForm.submit();
      } 
      else{
  window.open("../info/"+opName+"${className}InLine.action?opName="+opName+"&funcCode="+funcCode+"&entityId="+${objectName}Id+"&${relationObjectName}Id="+info1Id+"&pageNum="+pageNum,'popwin','scrollbars=yes,resizable=yes,width=800,height=600')
     }
  }
  function gotoPage(pMax,funcCode,opName,info1Id) {
   
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
    
    window.location="../info/list${className}InLine.action?pageNum="+window.${objectName}ListForm.gotoPageNum.value+"&funcCode="+funcCode+"&opName="+opName+"&${relationObjectName}Id="+info1Id;
  }
</script>
<script language="javascript" type="text/javascript" src="../${r"${Session['_USER_STYLE_'].jsPath}"}/color_table.js"></script>
</div>
<input type ='hidden' name ='funcCode' value='${r"${funcCode}"}'>
<input type ='hidden' name ='pageNum' value='${r"${pageNum}"}'>
</form>
</body>
</html>