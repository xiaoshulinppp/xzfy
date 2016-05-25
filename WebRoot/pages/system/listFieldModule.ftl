<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="fieldListForm" method="post">

<@head.head  title="域表字段管理"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
          <input name ="Button" type ="button" class ="button" value="设计器" onclick="window.open('../FormLayoutClient/formLayoutEditor.ftl?tableName=${fieldTableName}','','width=1000,height=1000,resizable=1,scrollbars=1,left=100,top=100')">
          <#list displayInfo.operationList as op>            
            <#if op.single!=1>
              <input id ="${op.abbr}Id" name="Button" type="button" class="button" value="${op.name}" onclick="FormSubmit('${op.abbr}')">
            </#if>
          </#list>
              <input id ="uptopage" name ="Button" type ="button" class ="button" value="${action.getText("uptopage")}" onclick="uptopageiscp()">
            </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" id="color_table">
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
       <#if op.abbr =="delete">
       <td class="tdlistCenter"><a href="javascript:deleteFunction('${op.abbr}');"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/${op.image}" alt="${op.name}" width="16" height="16" border="0"></a></td>       
       <#else>       
       <td class="tdlistCenter"><a href="../system/${op.abbr}Field.action?opName=${op.abbr}&entityId=${keyColumn}&funcCode=${funcCode}&pageNum=${pageNum}&tableId=${tableId}&returnPageNum=${returnPageNum}"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/${op.image}" alt="${op.name}" width="16" height="16" border="0"></a></td>
       </#if>
       </#if>
    </#list>
  </tr>
  </#list>
</table>

<@pagnation.pagnation formName="fieldListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listField.action" params="funcCode=${funcCode}&tableId=${tableId}&returnPageNum=${returnPageNum}"/>

<script>

  function deleteFunction(opabbr) {
  if(confirm("确定要删除么?"))
       window.location="../system/"+opabbr+"Field.action?opName="+opabbr+"&entityId=${keyColumn?default('')}&funcCode=${funcCode}&pageNum=${pageNum}&tableId=${tableId}&returnPageNum=${returnPageNum}";
  }
  function uptopageiscp() {
  submitDisableButton();
  document.location.href="../system/listMappingTable.action?funcCode=${funcCode}&pageNum=${returnPageNum}";
  }
  function FormSubmit(opName) {
     if((opName =="delete" ) && (!confirm("确定要删除么?"))) {
      return;
     }
     submitDisableButton();
     window.fieldListForm.action="../system/"+opName+"Field.action?opName="+opName+"&returnPageNum=${returnPageNum}";
     window.fieldListForm.submit();
  }

   function submitDisableButton() {
   <#list displayInfo.operationList as op>
    <#if op.single!=1>
      var buttonid ="${op.abbr}Id";
      document.getElementById(buttonid).disabled = true;
    </#if>
    </#list> 
      document.getElementById("uptopage").disabled = true;   
  } 
</script>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
<input type ='hidden' name ='returnPageNum' value='${returnPageNum}'>
<input type ='hidden' name ='tableId' value='${tableId}'>
</form>
</body>
</html>