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
<script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body onload="startTime()">
<form name="form" method="post">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="pNum" id="pNum" value="${pNum}"/>
<#include "header.ftl">
<div class="wal">
	<div class="pageBg2">
		<div class="fl w198">
      		<div class="sideNav">
            	<div class="title">请选择栏目</div>
            		<ul>
			            <li><a href="../website/xinXiBaoSong.action?funcCode=${funcCode}">信息报送</a> </li>
	            		<li><a href="../website/xinXiLieBiao.action?funcCode=${funcCode}">全市信息列表</a></li>
	            		<li><a href="../website/benDanWeiLieBiao.action?funcCode=${funcCode}" class="aNow">本单位信息列表</a> </li>
		            </ul>
      			</div>
			</div>
			<div class="fr w771">
				<div class="pageNow">当前位置：<a href="../website/xinXiBaoSong.action?funcCode=${funcCode}">信息报送</a></div>
			</div>
            <div class="searchList">
	            <table align="right" width="78%" border="0.5" cellpadding="0.5" cellspacing="0.5">
	            	<tr>
						<th width="5%">序号</th>
						<th width="20%">报送单位</th>
						<th width="10%">报送时间</th>
						<th width="25%">信息标题</th>
						<th width="5%">报送人</th>
						<th width="5%">查看</th>
						<th width="5%">删除</th>
						<th width="5%">修改</th>	
					</tr>
					<#list articleList as a>
					<tr>
						<td>&nbsp;${a_index+1}</td>
						<td>&nbsp;<#if a.resource?has_content&&a.resource.length() gt 14>${a.resource[0..13]}..<#else>${a.resource?default('')}</#if></td>
						<td>&nbsp;${a.createdDate?default('')}</td>
						<td>&nbsp;<#if a.title?has_content&&a.title.length() gt 18>${a.title[0..17]}...<#else>${a.title?default('')}</#if></td>
						<td>&nbsp;${a.author?default('')}</td>
						<td><a href="../website/showXinXi.action?funcCode=${funcCode}&articleId=${a.id}&isView=0">查看</a></td>
						<td><a href="javascript:del(${a.id})">删除</a></td>
						<td><a href="../website/showXinXi.action?funcCode=${funcCode}&articleId=${a.id}&isView=1">修改</a></td>
					</tr>
					</#list>
				</table>
			</div>
		</div>
		<div class="pageNum">
		 第${pNum}/${totalPage}页      共${pageList.getTotalCount()}条    
	                	<#assign upPage = pNum -1>
						<#if upPage lt 1 >
						<#assign upPage = 1>
						</#if>
						<#assign downPage = pNum +1>
						<#if (downPage gt totalPage)>
						<#assign downPage = totalPage>
						</#if>
						<a href="javascript:search(1)">首页</a>　
	      				<a href="javascript:search(${upPage})">上一页</a>
	      				<a href="javascript:search(${downPage})">下一页</a>
	      				<a href="javascript:search(${totalPage})">尾页</a>　
	  	<span>第<input class="input1" type="text" name="gotoPageNum" id="gotoPageNum"/>页</span>　<a href="javascript:gotoPages()">跳转</a>
      		
		</div>
	</div>
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
<script language="javascript">
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
				document.form.action="benDanWeiLieBiao.action"
				document.form.submit();
			}
			function del(id){
				if(confirm("确定删除？")){
					window.location="../website/deleteXinXi.action?funcCode=${funcCode}&articleId="+id;
				}
			}
</script>
</html>