<#macro table formName displayInfo funcCode pageNum nameSpace actionName params> 
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
       <td class="tdlistCenter"><a href="#"><img src="../${Session["_USER_STYLE_"].imagePath}/sicons/${op.image}" alt="${op.name}" width="16" height="16" border="0" onClick="MM_openBrWindow('../${nameSpace}/${op.abbr}${actionName}?opName=${op.abbr}&entityId=${keyColumn}&funcCode=${funcCode}&pageNum=${pageNum}${params}')"></a></td>
       </#if>
    </#list>
  </tr>
  </#list>
</table>

<script>
  function FormSubmit(opName) {  
     MM_openBrWindow("../${nameSpace}/"+opName+"${actionName}?opName="+opName+"&funcCode=${funcCode}${params}");
  }
  function MM_openBrWindow(theURL,winName,features) { 
  window.open(theURL,winName,features);
}
</script>

<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
</#macro>