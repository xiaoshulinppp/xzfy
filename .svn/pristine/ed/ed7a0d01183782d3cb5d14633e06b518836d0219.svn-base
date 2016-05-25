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
        <td>${action.getText("current.location")}:复杂查询结果</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>复杂查询结果</td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" id="color_table">
    <tr>
      <th width="40" class="thListNormal">序号</th>
      <#list displayInfo.fieldNameList as fieldName>
      <th class="thListNormal">${fieldName}</th>
      </#list>
      <th width="40" class="thListNormal">查看</th>
   </tr>
 
   <#assign count=1>
   <#list displayInfo.fieldValueList as recordValueList >   
   <tr class="trcolor">
    <#assign keyColumn = recordValueList[0]>
        <#assign seq = 1>
    <td class="tdlistCenter">${count}</td>

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
       <td class="tdlistCenter"><a href="#"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/view.gif" alt="查看" width="16" height="16" border="0" onClick="MM_openBrWindow('${viewLink}&entityId=${keyColumn}&funcCode=${funcCode}&pageNum=${pageNum}&flag=open')"></a></td>
  </tr>
   <#assign count = count +1>
  </#list>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
        <#assign totalPage = displayInfo.totalPage >
        ${action.getText("di")}${pageNum}/${totalPage}${action.getText("page")}
        <a href ="../system/doAdvsearch.action?pageNum=1&funcCode=${funcCode}">${action.getText("firstpage")}</a>
         <#assign upPage = pageNum -1>
        <#if upPage <1 >
          <#assign upPage = 1>
        </#if>      
        <a href ="../system/doAdvsearch.action?pageNum=${upPage}&funcCode=${funcCode}">${action.getText("uptopage")}</a>
        <#assign downPage = pageNum +1>
	
        <#if (downPage > totalPage)>
          <#assign downPage = totalPage >
        </#if>
        <a href ="../system/doAdvsearch.action?pageNum=${downPage}&funcCode=${funcCode}">${action.getText("downtopage")}</a>
        <a href ="../system/doAdvsearch.action?pageNum =${totalPage}&funcCode=${funcCode}">${action.getText("endpage")}</a>
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
     window.dictItemListForm.action="../system/"+opName+"${appClassName}.action?opName="+opName;
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
    
    window.location="../system/doAdvsearch.action?pageNum="+pLastNum+"&funcCode=${funcCode}";
  }
  function MM_openBrWindow(theURL,winName,features) { 
  window.open(theURL,winName,features);
}
</script>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
</form>
</body>
</html>