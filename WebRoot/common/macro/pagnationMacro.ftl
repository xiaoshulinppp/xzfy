<#macro pagnation formName currentPage totalPage reqUrl params> <#assign
currentPageInt =currentPage?number> <#assign totalPageInt
=totalPage?number>

<table width="98%" border="0" align="center" cellpadding="0"
	cellspacing="0" class="tabMainBot">
	<tr>
		<td>
			${action.getText("di")}${currentPageInt}/${totalPageInt}${action.getText("page")}
			<#if (pageNum >1)> <a href="${reqUrl}?pageNum=1&${params}">${action.getText("firstpage")}</a>
			</#if> <#assign upPage = currentPageInt -1> <#if (upPage>=1)> <a
			href="${reqUrl}?pageNum=${upPage}&${params}">${action.getText("uptopage")}</a>
			</#if> <#assign downPage = currentPageInt +1> <#if (downPage <=
			totalPageInt)> <a href="${reqUrl}?pageNum=${downPage}&${params}">${action.getText("downtopage")}</a>
			</#if> <#if (pageNum < totalPageInt)> <a
			href="${reqUrl}?pageNum =${totalPageInt}&${params}">${action.getText("endpage")}</a>
			</#if> ${action.getText("di")} <input name="gotoPageNum" type="text"
			class="inputTextSmall" maxlength="3">
			${action.getText("page")} <a href="#" id="gotopage"
			onclick="gotoPage('${currentPageInt}','${totalPageInt}')">GO</a>
		</td>
	</tr>
</table>
<script>
function   document.onkeydown()     
          {  
                  var   e=event.srcElement;     
                  if(event.keyCode==13)     
                  {     
                          document.getElementById("gotopage").click();     
                          return   false;     
                  }     
          }
function gotoPage(currentPage,pMax) {
 
    var pLastNum = document.getElementById("${formName}").gotoPageNum.value ;
    
    for(var ii =0; ii<pLastNum.length; ii++) {			
      if(pLastNum.charCodeAt(ii)>57 || pLastNum.charCodeAt(ii)<48){
        alert("页码只能是大于等于1的数字,请重新输入页码!");
        return false;	
        }
    }
    
    if(pLastNum == '0' || pLastNum==''){
     alert("页码只能是大于等于1的数字,请重新输入页码!");
       return false;	
    }
   if(parseInt(pLastNum)>parseInt(pMax)) {
      alert("超过最大页数,请重新输入页码!");
      return false;	
    }
    if(parseInt(currentPage) == parseInt(pLastNum)){
     alert("输入的页面为当前页,请重新输入页码!");
     return false;
    }
    window.location="${reqUrl}?pageNum="+pLastNum+"&${params}";
   
  }
</script>
</#macro>
