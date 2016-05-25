<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="funcListForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
        <td>${action.getText("current.location")}:${action.getText("funclist.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("funclist.title")}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
          <#list displayInfo.operationList as op>
            <#if op.single!=1>
              <input id ="${op.abbr}Id" name="Button" type="button" class="button" value="${op.name}" onclick="FormSubmit('${op.abbr}')">
            </#if>
          </#list>
          <#if parentId!=0>
              <input id="uptopage" name ="Button" type ="button" class ="button" value="${action.getText("uptopage")}" onclick="uptopageiscp()">
          </#if>
          </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
    <tr>
      <th width="40" class="thListNormal"><input type="checkbox" name="selectAllCheckbox" onclick="selectAll('selectAllCheckbox','selectRecord')"></th>
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
     <td class="tdlistCenter"><a href ="../system/listFunction.action?funcCode=${funcCode}&parentId=${keyColumn}&backId=${parentId}">     
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
       <td class="tdlistCenter"><a href="../system/${op.abbr}Function.action?opName=${op.abbr}&entityId=${keyColumn}&funcCode=${funcCode}&pageNum=${pageNum}&parentId=${parentId}"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/${op.image}" alt="${op.name}" width="16" height="16" border="0"></a></td>
       </#if>
    </#list>
  </tr>
  </#list>
</table>
<#assign totalPage = displayInfo.totalPage>
<@pagnation.pagnation formName="funcListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listFunction.action" params="funcCode=${funcCode}&parentId=${parentId}"/>


<script>
  function uptopageiscp() {
  submitDisableButton();
  document.location.href="../system/listFunction.action?funcCode=${funcCode}&parentId=${backId}";
  }
  function FormSubmit(opName) {
     submitDisableButton();
     window.funcListForm.action="../system/"+opName+"Function.action?opName="+opName;
     window.funcListForm.submit();
  }
   function submitDisableButton() {
   <#list displayInfo.operationList as op>
    <#if op.single!=1>
      var buttonid ="${op.abbr}Id";
      document.getElementById(buttonid).disabled = true;
    </#if>
    </#list> 
    <#if parentId!=0>
      document.getElementById("uptopage").disabled = true;  
    </#if> 
  }  
</script>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
<input type ='hidden' name ='parentId' value='${parentId}'>
</form>
</body>
</html>
