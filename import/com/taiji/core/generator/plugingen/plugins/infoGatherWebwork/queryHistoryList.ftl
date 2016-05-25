<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<#assign keyColumn = table.pkColumn >
<#assign keyvar = "${keyColumn.variableName}">
<#assign gatherabbr = "${plugin.gatherAbbr}" >
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
<!--您的位置表格开始-->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id=control >
  <tr>
        <td width="30" align="center"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/icon_yourplace.gif" width="14" height="12"></td>
        <td>${r"${action.getText('current.location')}"}:查询历史列表</td>
      </tr>
</table>
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10); z-index:1; left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle" id="control">
  <tr>
    <td>查询历史列表</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">   
 
          </td>
        </tr>
    </table></td>
  </tr>
</table>

<form name="opListForm" method="post">
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
     <th class="thListNormal">审核级别</th>
       ${r"<#list displayInfo.operationList as op>"}
            ${r"<#if op.single!=0 >"}
             ${r" <#if"} op.abbr != "history">
             <th width="40" class="thListNormal"></th>
             ${r"</#if>"}
            ${r"</#if>"}
       ${r"</#list>"}
   </tr>
   ${r"<#assign count =0>"}
  ${r"<#list displayInfo.fieldValueList as recordValueList >"}  
   <tr class="trcolor">
    ${r"<#assign keyColumn = recordValueList[0]>"}
    ${r"<#assign record = pList.get(count)>"}  
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
    <td class="tdlistCenter">${r"${record}"}</td>
    ${r"<#list displayInfo.operationList as op>"}
       ${r"<#if op.single!=0 >"}
       ${r"<#if"} op.abbr != "history">
       <td class="tdlistCenter"><a href="javascript:popwin('${r"${op.abbr}"}','${r"${keyColumn}"}','${r"${funcCode}"}','${r"${pageNum}"}')">${r"${op.name}"}</a></td>
     ${r"</#if>"}
     ${r"</#if>"}
    ${r"</#list>"}
     ${r"<#assign count = count +1>"}
  </tr>
  ${r"</#list>"}
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><table  border="0" align="right" cellpadding="3" cellspacing="2">
      <tr align="center">
        ${r"<#assign totalPage = queryHistoryList.totalPage >"}
        <td align="center">${r"${action.getText('di')}"}${r"${pageNum}/${totalPage}"}${r"${action.getText('page')}"}</td>
        <td align="center"><a href ="historyGet${className}QueryDetail.action?pageNum=1&funcCode=${r"${funcCode}"}&operationCode=${gatherabbr}&infoId=${r"${"}infoId${r"}"}">${r"${action.getText('firstpage')}"}</a></td>
         ${r"<#assign upPage = pageNum -1>"}
       ${r" <#if upPage <1 >"}
          ${r"<#assign upPage = 1>"}
        ${r"</#if>"}       
        <td align="center"><a href ="historyGet${className}QueryDetail.action?pageNum=${r"${upPage}"}&funcCode=${r"${funcCode}"}&operationCode=${gatherabbr}&infoId=${r"${"}infoId${r"}"}">${r"${action.getText('uptopage')}"}</a></td>
        ${r"<#assign downPage = pageNum +1>"}
	
        ${r"<#if (downPage > totalPage)>"}
          ${r"<#assign downPage = totalPage >"}
        ${r"</#if>"}
        <td align="center"><a href ="historyGet${className}QueryDetail.action?pageNum=${r"${downPage}"}&funcCode=${r"${funcCode}"}&operationCode=${gatherabbr}&infoId=${r"${"}infoId${r"}"}">${r"${action.getText('downtopage')}"}</a></td>
        <td align="center"><a href ="historyGet${className}QueryDetail.action?pageNum =${r"${totalPage}"}&funcCode=${r"${funcCode}"}&operationCode=${gatherabbr}&infoId=${r"${"}infoId${r"}"}">${r"${action.getText('endpage')}"}</a></td>
        <td>${r"${action.getText('di')}"}</td>
        <td width="20"><input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3"></td>
        <td>${r"${action.getText('page')}"}</td>
        <td><a href="#" onclick="gotoPage('${r"${totalPage}"}','${r"${funcCode}"}','${r"${infoId}"}')"><img src="../${r"${Session['_USER_STYLE_'].imagePath}"}/button_go.gif" alt="${r"${action.getText('goto.text')}"}" width="20" height="16" border="0"></a></td>
      </tr>
    </table></td>
  </tr>
</table>
<script>
  function FormSubmit(opName) {
     window.opListForm.action="../user/"+opName+"doQuery.action?opName="+opName;
     window.opListForm.submit();
  }
  function gotoPage(pMax,funcCode,infoId) {
   
    var pLastNum = window.opListForm.gotoPageNum.value ;
  
    for(var ii =0; ii<pLastNum.length; ii++) {			
      if(pLastNum.charCodeAt(ii)>57 || pLastNum.charCodeAt(ii)<48)
        return false;	
    }
    if(pLastNum=='')
      return false ;
    if(pLastNum>pMax) {
      window.opListForm.gotoPageNum.value = pMax ;		
    }
    if(pLastNum == '0')
      window.opListForm.gotoPageNum.value = 1;
    
    window.location="historyGet${className}QueryDetail.action?pageNum="+window.opListForm.gotoPageNum.value+"&funcCode="+funcCode+"&infoId="+infoId+"&operationCode=${gatherabbr}";
  }
  function popwin(op,infoId,funcCode,pageNum){
  	window.open(op+"Get${className}QueryDetail.action?opName="+op+"&infoId="+infoId+"&funcCode="+funcCode+"&pageNum="+pageNum+"&operationCode=${gatherabbr}","","width=800,height=500,resizable=1,scrollbars=1,left=120,top=100");
  }
</script>
<script language="javascript" type="text/javascript" src="../${r"${Session['_USER_STYLE_'].jsPath}"}/color_table.js"></script>
</div>
<input type ='hidden' name ='funcCode' value='${r"${funcCode}"}'>
<input type ='hidden' name ='pageNum' value='${r"${pageNum}"}'>

</form>
</body>
</html>