<html>
<#include "head.ftl">
<!--javascript脚本添加位置结束-->
<body  bgcolor="#FFFFFF" text="#000000" >
<form name="listForm" method="post">
<table border="0" cellspacing="0" cellpadding="0" class="tdMain2j">
  <tr>
    <td class="td2jYourYlace">您的位置:日志管理 --&gt 列表</td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table> 
<#--选卡头 begin-->
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
	<tr>
	  
	 
	 <td width="100" <#if type==1>class="midCardOn16"<#else>class="midCardOff16"</#if> >
	  
	      <a href="../system/getAppLogList.action?funcCode=${funcCode}&type=1&pageNum=1" class="cardLink">系统日志</a></td>
	  
	  <td width="100" <#if type==2>class="midCardOn16"<#else>class="midCardOff16"</#if> >
	  
	      <a href="../system/getAppLogList.action?funcCode=${funcCode}&type=2&pageNum=1" class="cardLink">应用日志</a></td>
	  
	   <td class="cardTh">&nbsp;</td>
	</tr>
</table>
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainCard">
	<tbody>
		<tr>
			<td valign="top" class="cardBody">
<#--选卡头 end--> 
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
	<td> &nbsp;
    </td>
    <td align="right">
		<input type="button" name="btn_insert" value="查 询" class="button" onclick="window.location='../system/appLogQueryBegin.action?funcCode=${funcCode}&type=${type}'">
   		&nbsp;&nbsp;
   		<#if type==2>
   		<input name="Button" type="button" class="button" value="统 计" onclick="fnStat()">
    	</#if>
    </td>
	<td>&nbsp;&nbsp;</td>
  </tr>
</table>
<table width="100%" cellpadding="1" cellspacing="0" align="center" class="tabout">
<tr>
	<th width="5%" class="thListNormal">序号</th>
	<#list displayInfo.fieldNameList as fieldName>
	<th class="thListNormal">${fieldName}</th>
	</#list><#-- 显示列名 -->
	<th width="5%" class="thListNormal">查看</th>
</tr>
	<#assign count = 0><#-- count：外层循环的循环变量 -->
	<#list displayInfo.fieldValueList as recordValueList ><#-- 外层循环tr，循环所有的记录 -->  
	<#assign keyColumn = recordValueList[0]><#-- keyColumn：每条记录的id 用于查一条，修改，删除 -->
	<tr class="trcolor">
	    <#assign seq = 1><#-- seq：内层循环的循环变量 -->
	    <td align="center" class="tdlistCenter">${(pageNum-1)*10+count+1}</td><#-- seq=1 是序号列 -->
	    <#list recordValueList as field><#-- 内层循环td，循环每条记录的各个字段 -->
	    <#if seq != 1>
		    
		    <td class="tdlistCenter">
		      <#if field?has_content>
		         ${field}
		      <#else>
		         &nbsp;
		      </#if>
		    </td>
		    
	    </#if>
	    <#assign seq = seq + 1>
	    
	    </#list><#-- 内层循环结尾 -->
	 	<#-- 操作 -->
	    <td align="center" class="tdlistCenter"><a href="#"><img src="../images/16B/sicons/search.gif" alt="${"查看"}" width="16" height="16" border="0"  onclick="fnView(${keyColumn})"></a></td>
	</tr>
 	<#assign count = count + 1>
  	</#list><#-- 外层循环结尾 -->
  	
  	<#assign countNum = 10><#-- 记录数不够15，补空 -->
   	<#if count<countNum >
  	<#assign temp=countNum-count>
  	<#list 1..temp as x><#-- 外层循环tr -->  
   	<tr class="trcolor">
	    <#assign seq1 = 1>
	    <td align="center" class="tdlistCenter"></td>
	    <#list displayInfo.fieldNameList as field><#-- 内层循环td --> 
	    <td class="tdlistCenter">
	         &nbsp;   
	    </td>
	    <#assign seq1 = seq1 + 1>
	    </#list>  
		<td align="center" class="tdlistCenter"></td>
	</tr>
	</#list>
  	</#if>
</table>
<#-- 翻页部分 -->
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr align="center">
  <#assign totalPage = displayInfo.totalPage >
    <td>
         第${pageNum}/${totalPage}页
        <a href ="../system/getAppLogList.action?funcCode=${funcCode}&type=${type}&pageNum=1">首页</a>
         <#assign upPage = pageNum -1>
        <#if upPage <1 >
          <#assign upPage = 1>
        </#if>       
       <a href ="../system/getAppLogList.action?funcCode=${funcCode}&type=${type}&pageNum=${upPage}">上一页</a>
        <#assign downPage = pageNum +1>
	
        <#if (downPage > totalPage)>
          <#assign downPage = totalPage >
        </#if>
        <a href ="../system/getAppLogList.action?funcCode=${funcCode}&type=${type}&pageNum=${downPage}">下一页</a>
        <a href ="../system/getAppLogList.action?funcCode=${funcCode}&type=${type}&pageNum =${totalPage}">末页</a>
        第
        <input name="gotoPageNum" type="text" class="inputTextSmall" maxlength="3">
        页
        <a href="#" onclick="gotoPage('${totalPage}')">跳转</a>
     </td>
  </tr>
</table>
<#--选卡尾　begin-->
			</td>
		</tr>
	</tbody>
</table>
<br>
<#--选卡尾　end-->
<script>
  	function gotoPage(pMax) {
	    var pLastNum = window.listForm.gotoPageNum.value;
	    for(var ii =0; ii<pLastNum.length; ii++) {		
	      if(pLastNum.charCodeAt(ii)>57 || pLastNum.charCodeAt(ii)<48)
	        return false;	
	    }
	    if(pLastNum=='')
	      return false ;
	    if(parseInt(pLastNum)>parseInt(pMax)) {
	      window.listForm.gotoPageNum.value = pMax ;		
	    }
	    if(pLastNum == '0')
	      window.listForm.gotoPageNum.value = 1;
    	window.location="../system/getAppLogList.action?funcCode=${funcCode}&type=${type}&pageNum="+window.listForm.gotoPageNum.value;
  	}
  	
	function fnView(id){
		openwindowMiddle('../system/appLogView.action?entityId='+id+'&funcCode=${funcCode}&pageNum=${pageNum}&type=${type}');
	}	
	
	function fnStat(){
		openwindowWholeScreen('../system/appLogStatBegin.action?funcCode=${funcCode}&type=${type}')
	}
</script>
</form>
</body>
</html>