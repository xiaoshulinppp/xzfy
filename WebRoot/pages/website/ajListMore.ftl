<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body>
<form name="form" method="post">
<input type="hidden" name="funcCode" value="${funcCode}"/>
<input type="hidden" name="pNum" id="pNum">
<input type="hidden" name="p" id="p" value="${p}">
<#include "header.ftl">
<script>
function chageChannel(){
	document.getElementById("totallist").style.display="none";
}
</script>
<div class="wal">

	
	<div class="pageBg1">
<!--wal-->
		<div class="fl w198">
      		<div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
            	<li><a href="../website/ajListMore.action?funcCode=${funcCode}&p=1" <#if p==1>class="aNow"</#if>>案卷未上传</a></li>
            	<li><a href="../website/ajListMore.action?funcCode=${funcCode}&p=2" <#if p==2>class="aNow"</#if>>案卷已上传</a></li>
            </ul>
      		</div>
			</div>
 		
		<div class="fr w771">
			<div class="pageNow">当前位置：<a href="../website/showAjList.action?funcCode=${funcCode}">行政复议案卷管理</a></div>

           
			<#if list1.size()!=0>
			<#if p==1>
				
     			<div class="pageBox">
            		<div class="searchList">
            		<table width="100%" border="0" cellpadding="0" cellspacing="0">
            			<tr>  
							<th >序号</th>
							<th >立案日期</th>
							<th >申请人</th>
							<th>被申请人</th>
							<th >案号</th>
							<th >承办人</th>
							<th >案件状态</th>
							<th >案件信息</th>
							<th >案卷管理</th>
						</tr>
						<#list list1 as info>
						<tr>
							<td>&nbsp;${info_index+1}</td>
					    	<td>&nbsp;<#if info.lian_date?has_content>${info.lian_date}</#if></td>
							<td>&nbsp;<#if info.app_show?has_content>${info.app_show}</#if></td>
							<td>&nbsp;<#if info.defendant_name?has_content>${info.defendant_name}</#if></td>
							<td>&nbsp;<#if info.tjzfzh?has_content>${info.tjzfzh}</#if></td>
							<td>&nbsp;<#if info.user2_name?has_content>${info.user2_name}</#if></td>
							<td>&nbsp;案卷未上传</td>
							<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${info.id}">查看</a></td>
							<td><a href="javascript:opendg('../ajgl/gotoUpload.action?funcCode=${funcCode}&xzfyId=${info.id}',1000,600)"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
						</tr>
						</#list>
					</table>
					</div>
				</div>

			<#else>
			
     			<div class="pageBox">
            		<div class="searchList">
            		<table width="100%" border="0" cellpadding="0" cellspacing="0">
            			<tr>  
							<th >序号</th>
							<th>立案日期</th>
							<th>申请人</th>
							<th>被申请人</th>
							<th>案号</th>
							<th>承办人</th>
							<th>案件状态</th>
							<th>案卷维护</th>
							<th>案卷</th>
							<th>案件信息</th>
						</tr>
						<#list list1 as info>
						<tr>
							<td>&nbsp;${info_index+1}</td>
					    	<td>&nbsp;<#if info.lian_date?has_content>${info.lian_date}</#if></td>
							<td>&nbsp;<#if info.app_show?has_content>${info.app_show}</#if></td>
							<td>&nbsp;<#if info.defendant_name?has_content>${info.defendant_name}</#if></td>
							<td>&nbsp;<#if info.tjzfzh?has_content>${info.tjzfzh}</#if></td>
							<td>&nbsp;<#if info.user2_name?has_content>${info.user2_name}</#if></td>
							<td>&nbsp;案卷已上传</td>
							<td><a href="javascript:opendg('../ajgl/viewAttachment.action?funcCode=${funcCode}&xzfyId=${info.id}',1000,600)"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
							<td><a href="javascript:opendg('../ajgl/appAnjuView.action?funcCode=${funcCode}&xzfyId=${info.id}',1000,600)">查看</a></td>
							<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${info.id}" target="blank">查看</a></td>
						</tr>
						</#list>
					</table>
					</div>
				</div>
		
			</#if>
			</#if>  
				
     <div class="pageNum">
	               共有${pageList.getTotalCount()}条
	                	<#assign upPage = pNum -1>
						<#if upPage lt 1 >
						<#assign upPage = 1>
						</#if>
						<#assign downPage = pNum +1>
						<#if (downPage gt totalPage)>
						<#assign downPage = totalPage>
						</#if>　
	      <a href="javascript:search(${upPage})">上一页</a>　<a href="javascript:search(${downPage})">下一页</a>　
	      <span>第<input class="input1" type="text" name="gotoPageNum" id="gotoPageNum"/>页</span>　<a href="javascript:gotoPages()">跳转</a>
      </div>
		</div>
		
</div>	
</div>	
	

</div>
</div>

<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</form>
</body>
<script language="javascript">
			function opendg(dgurl,dgw,dgh)
			{
  				$.dialog({ 
    			title:'上传案卷',
    			width: dgw,
    			height: dgh,
    			content:'url:'+ dgurl});
			}
			function gotoPages(){
				var inputPage = window.document.getElementById("gotoPageNum").value;
				if(!inputPage.match("[\\d+]+")){
					alert("页数必须为整数！");
					return;
				}else{
					for(var i=0;i<inputPage.length;i++){
						if(inputPage.charCodeAt(i)>57 || inputPage.charCodeAt(i)<48){
							alert("页数必须为整数！");
							return;
						}
					}
				}
				if(inputPage > ${totalPage}){
					alert("输入的页数不能超过总页数！");
				}else if(inputPage < 1){
					alert("输入的页数不能少于1页！");
				}else{
					search(inputPage);
				}
				return;
			}
			function search(pNum){
				document.getElementById("pNum").value=pNum;
				document.form.action="ajListMore.action"
				document.form.submit();
			}
			function clear(){
				document.getElementById("liAnDate").value="";
				document.getElementById("appName").value="";
				document.getElementById("admit").value="";
				document.getElementById("defendant").value="";
			}
</script>
</html>