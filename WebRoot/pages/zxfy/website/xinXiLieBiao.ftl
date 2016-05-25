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
	            		<li><a href="../website/xinXiLieBiao.action?funcCode=${funcCode}" class="aNow">全市信息列表</a></li>
	            		<li><a href="../website/benDanWeiLieBiao.action?funcCode=${funcCode}">本单位信息列表</a> </li>
		            </ul>
      			</div>
			</div>
			<div class="fr w771">
				<div class="pageNow">当前位置：<a href="../website/xinXiBaoSong.action?funcCode=${funcCode}">信息报送</a></div>
			</div>
            <div class="searchForm">
                <ul>
                    <li style="width:180px;height:25px">
                       	<div class="name">报送单位:</div>
                     	<input class="ui-input-wdm" type="text" name="orgName" value="${orgName?default('')}"/>
                   	</li>
                   	<li style="width:180px;height:25px">  
                       	<div class="name">报送时间:</div>
                      	<input class="ui-input-wdm" type="text" onClick="WdatePicker()" name="todate" value="${todate?default('')}"/>
                    </li>
                    <li style="width:180px;height:25px">
                       	<div class="name">信息标题:</div>
                       	<input class="ui-input-wdm" type="text" name="title" value="${title?default('')}"/>
                     </li>
                     <li style="width:180px;height:25px">
                       	<div class="name">报送人:</div>
                       	<input class="ui-input-wdm" type="text" name="userName" value="${userName?default('')}"/>
                    </li>
				</ul>
                <div class="btnDiv" style="padding-left:100px">
                	<input type="button" name="button" class="btn1" value="搜索" onclick="search(1)" />
                	<input type="reset" class="btn1 btn2" value="重置" />
                </div>
                <span class="clear_f"></span>
            </div>
    		
	    	<div class="searchList">
	            <table align="right" width="78%" border="0.5" cellpadding="0.5" cellspacing="0.5">
	            	<tr>
						<th width="5%">序号</th>
						<th width="20%">报送单位</th>
						<th width="10%">报送时间</th>
						<th width="30%">信息标题</th>
						<th width="5%">报送人</th>
						<th width="5%">查看</th>	
					</tr>
					<#list articleList as a>
					<tr>
						<td>&nbsp;${a_index+1}</td>
						<td>&nbsp;<#if a.resource?has_content&&a.resource.length() gt 15>${a.resource[0..14]}..<#else>${a.resource?default('')}</#if></td>
						<td>&nbsp;${a.createdDate?default('')}</td>
						<td>&nbsp;<#if a.title?has_content&&a.title.length() gt 23>${a.title[0..22]}...<#else>${a.title?default('')}</#if></td>
						<td>&nbsp;${a.author?default('')}</td>
						<td><a href="../website/showXinXi.action?funcCode=${funcCode}&articleId=${a.id}&isView=0">查看</a></td>
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
				document.form.action="xinXiLieBiao.action"
				document.form.submit();
			}
</script>
</html>