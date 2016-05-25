<table>
<tbody id="task">
<tr>
 <#list fieldList as field>
<th class="thListNormal">${field["byname"]}</th>
</#list>
</tr>
   
<#assign initCount =9>
<#list 0..initCount as count>
<tr class="trcolor">
<#list fieldList as field>
 <td class="tdlistCenter">
 <#assign showType = field["fieldshowtype"]>
 <#assign fieldName = field["name"]>
   <#if showType == "select">
   <#assign dictAbbr = field["dictlistid"]>
${r"<@ww.select"}  name="'${tableName}sList[${count}].${fieldName}'" list="getDictMap('${dictAbbr}')" onchange="'count(this)'"/>
   </#if>
   <#if showType == "input">
	${r"<@ww.textfield"} name="'${tableName}sList[${count}].${fieldName}'" onchange="count(this)"/>
   </#if>   
</td>
</#list>
</tr>
</#list>   
 
</tbody>
</table>
<input type=button onclick="addRow()" value="增加一行" id="addLine" class="button">

<input type="hidden" id="stSize" name="stSize" value="10"/>
<br>
<script language="javascript">

function addRow(){
var row = document.createElement("tr");
var j=task.rows.length;
<#assign count =0>
<#list fieldList as field>
 <#assign fieldName = field["name"]>
var newTD${count} = task.childNodes[1].childNodes[${count}].cloneNode(true);
newTD${count}.firstChild.name="${tableName}sList["+j+"].${fieldName}";
newTD${count}.firstChild.value="";
row.appendChild(newTD${count});
<#assign count = count +1>
</#list>

document.getElementById("task").appendChild(row);
var stSize_ = document.getElementById("stSize");
stSize_.value=task.rows.length-1;
}
	
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
