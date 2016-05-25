<table>
<tbody id="task">
  ${r"<#assign"} ${tableName}ListDictLevel = ${tableName}ListDict.get(0).maxLevel+1>
  <tr>
    <#list fieldList as field>
    <#assign showType = field["fieldshowtype"]>
     <#if showType=="dict">
  	<th class="thListNormal" colspan="${r"${"}${tableName}ListDictLevel${r"}"}">${field["byname"]}</th>
  	 </#if>
  	</#list>
    <#list fieldList as field>
    <#assign showType = field["fieldshowtype"]>
    <#if showType!="dict">
    <th class="thListNormal">${field["byname"]}</th>
    </#if>
    </#list>
  </tr>
  ${r"<#assign dictCount=0>"}
  
  ${r"<#list"} ${tableName}ListDict as ${tableName}ListDictItem>
  	 <tr class="trcolor">
  		${r"${"}${tableName}ListDictItem.express${r"}"}
        <#list fieldList as field>
        <td class="tdlistCenter">
           <#assign showType = field["fieldshowtype"]>
           <#assign fieldName = field["name"]>
           <#if showType == "select">
           <#assign dictAbbr = field["dictlistid"]>
           ${r"<@ww.select"}  name="'${tableName}sList[${r"${dictCount}"}].${fieldName}'" list="getDictMap('${dictAbbr}')" value="'${r"${"}${tableName}ListDictItem.value.${fieldName}?if_exists{{r"}"}'" onchange="'count(this)'" disabled ="'${r"${showState}"}'"/>
          </#if>
          <#if showType == "input">
	      ${r"<@ww.textfield"} name="'${tableName}sList[${r"${dictCount}"}].${fieldName}'" value="'${r"${"}${tableName}ListDictItem.value.${fieldName}?if_exists${r"}"}'" onchange="count(this)" disabled ="'${r"${showState}"}'"/>
          </#if>  
           
      </td>
          <#if showType == "dict">
          <td style="display:none">
	      ${r"<@ww.textfield"} name="'${tableName}sList[${r"${dictCount}"}].${fieldName}'"  value="${r"${"}${tableName}ListDictItem.dictItemId${r"}"}"/>
	      </td>
          </#if> 
      </#list>
     </tr>
	 ${r"<#assign dictCount=dictCount+1>"}
  ${r"</#list>"}

</tbody>
</table>
</td><td></td></tr>
</table>
<input type="hidden" id="stSize" name="stSize" value="${r"${dictCount}"}"/>
<br>
<script language="javascript">

function count(data){
var nodeCount = data.parentNode.parentNode.childNodes.length;
<#assign count = fieldList?size+1>
<#list fieldList as field>
 <#assign fieldName = field["name"]>
 <#if field["script"]?has_content>
 <#assign script = field["script"]>
  var a_${count} = data.parentNode.parentNode.childNodes[nodeCount-${count}].firstChild;
 </#if>
  var ${fieldName} = data.parentNode.parentNode.childNodes[nodeCount-${count}].firstChild.value;
  if(check(${fieldName})){
    ${fieldName}=parseInt(${fieldName});
  }
<#assign count = count -1>
</#list>

<#assign count =fieldList?size+1>
<#list fieldList as field>
 <#if field["script"]?has_content>
 <#assign script = field["script"]>
 if(a_${count}!=data) {
    if(${script}) {
     a_${count}.value=${script};
   }
 }
 </#if>   
<#assign count = count -1>
</#list>
var stSize_ = document.getElementById("stSize");
stSize_.value=${r"${dictCount}"};
}


 function check(name) {
    for(var ii =0; ii<name.length; ii++) {
      if(name.charCodeAt(ii)>57 || name.charCodeAt(ii)<48)
        return false;
    }
    if(name.value==''){
      return false ;
	}
	return true;
	
	}
</script>
</div>