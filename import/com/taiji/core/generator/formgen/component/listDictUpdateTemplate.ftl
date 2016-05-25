<table id='task'>

${r"<#assign index=0>"}
${r"<#list "} ${tableName}sList as st>
<tr class="trcolor">
<#list fieldList as field>
 <td class="tdlistCenter">
 <#assign showType = field["fieldshowtype"]>
 <#assign fieldName = field["name"]>
  <#if showType == "select">
   <#assign dictAbbr = field["dictlistid"]>
${r"<@ww.select"}  name="'${tableName}sList[${r"${index}"}].${fieldName}'" disabled ="'${r"${showState}"}'" list="getDictMap('${dictAbbr}')" onchange="'count(this)'"/>
   </#if>
   <#if showType == "input">
	${r"<@ww.textfield"} name="'${tableName}sList[${r"${index}"}].${fieldName}'" disabled ="'${r"${showState}"}'" onchange="count(this)"/>
   </#if>   
</td>

</#list>
</tr>
${r"<@ww.hidden"} name ="'${tableName}sList[${r"${index}"}].${id}'"/>
${r"<#assign index=index+1>"}
${r"</#list>"}
</ul>
</table>

<input type="hidden" id="stSize" name="stSize" value="10"/>
<br>
<script language="javascript">

function count(data){

<#assign count =0>
<#list fieldList as field>
 <#assign fieldName = field["name"]>
 <#if field["script"]?has_content>
 <#assign script = field["script"]>
  var a_${count} = data.parentNode.parentNode.childNodes[${count}].firstChild;
 </#if>
  var ${fieldName} = data.parentNode.parentNode.childNodes[${count}].firstChild.value;
  if(check(${fieldName})){
    ${fieldName}=parseInt(${fieldName});
  }
<#assign count = count +1>
</#list>

<#assign count =0>
<#list fieldList as field>
 <#if field["script"]?has_content>
 <#assign script = field["script"]>
 if(a_${count}!=data) {
    if(${script}) {
     a_${count}.value=${script};
  }
 }
 </#if> 
  
<#assign count = count +1>
</#list>
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
