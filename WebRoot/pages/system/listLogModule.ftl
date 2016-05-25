<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="logListForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
        <td>${action.getText("current.location")}:${action.getText("loglist.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("loglist.title")}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
             <input id ="outputId" name="Button" type="button" class="button" value="导出" onclick="outputLog()">
          </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
    <tr>
      <th width="40" class="thListNormal">&nbsp;</th>
      <#list displayInfo.fieldNameList as fieldName>
      <th class="thListNormal">${fieldName}</th>
      </#list>
       <#list displayInfo.operationList as op>
            <#if op.single!=0 >
             <th width="40" class="thListNormal">${op.name}</th>
            </#if>
       </#list>
   </tr>
  <#assign count=0>
   <#list displayInfo.fieldValueList as recordValueList >   
     <tr class="trcolor">
    <#assign keyColumn = recordValueList[0]>
    <#assign value = typeNameValueList.get(count)>
      <td class="tdlistCenter"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/${value}.gif"  width="16" height="16" border="0"></td>
      <#assign count= count+1>
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
       <td class="tdlistCenter"><a href="../system/${op.abbr}Log.action?opName=${op.abbr}&entityId=${keyColumn}&funcCode=${funcCode}&pageNum=${pageNum}"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/${op.image}" alt="${op.name}" width="16" height="16" border="0"></a></td>
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
        <a href ="../system/listLog.action?pageNum=1&funcCode=${funcCode}">${action.getText("firstpage")}</a>
         <#assign upPage = pageNum -1>
        <#if upPage <1 >
          <#assign upPage = 1>
        </#if>       
        <a href ="../system/listLog.action?pageNum=${upPage}&funcCode=${funcCode}">${action.getText("uptopage")}</a>
        <#assign downPage = pageNum +1>
	
        <#if (downPage > totalPage)>
          <#assign downPage = totalPage >
        </#if>
        <a href ="../system/listLog.action?pageNum=${downPage}&funcCode=${funcCode}">${action.getText("downtopage")}</a>
        <a href ="../system/listLog.action?pageNum =${totalPage}&funcCode=${funcCode}">${action.getText("endpage")}</a>
        ${action.getText("di")}
        <input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3">
        ${action.getText("page")}
        <a href="#" onclick="gotoPage('${totalPage}')">GO</a>
      </td>
  </tr>
</table>
<script>

  function outputLog() {
     window.open("../system/outputLogEditCon.action?funcCode=${funcCode}","","width=300,height=200,resizable=1,scrollbars=1,left=50,top=50");
  }

  function gotoPage(pMax) {
   
    var pLastNum = window.logListForm.gotoPageNum.value ;
  
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
    
    window.location="../system/listLog.action?pageNum="+pLastNum+"&funcCode=${funcCode}";
  }
</script>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>

</form>
</body>
</html>
