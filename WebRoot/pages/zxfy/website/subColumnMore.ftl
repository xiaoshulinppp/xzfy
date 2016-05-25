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
<input type="hidden" name="pNum" id="pNum"/>
<input type="hidden" name="column" value="${column}" />
<input type="hidden" name="subColumn" value="${subColumn}"/>
<#include "header.ftl">
<div class="wal">
	<div class="pageBg2">
<!--wal-->
		<div class="fl w198">
      		<div class="sideNav">
            	<div class="title">请选择栏目</div>
            		<ul>
			            <#list list as a> 
			                 <li><a href="../website/subColumnMore.action?funcCode=${funcCode}&column=${column}&subColumn=${a}" <#if subColumn==a>class="aNow"</#if>><#if a=="11">图片动态<#elseif a=="12">工作动态<#elseif a=="21">领导讲话
			                 <#elseif a=="22">法制舆情摘报<#elseif a=="31">法律法规<#elseif a=="41">行政处罚<#elseif a=="42">行政许可
			                 <#elseif a=="43">行政强制实施<#elseif a=="44">行政不作为<#elseif a=="45">行政征收<#elseif a=="46">行政确权
			                 <#elseif a=="47">干预经营自主权<#elseif a=="48">信息公开
			                 <#elseif a=="49">其他
			   <#elseif a=="50">基层法院
             <#elseif a=="51">中级法院
             <#elseif a=="52">高级法院
             <#elseif a=="53">市政府
             <#elseif a=="54">区县政府
             <#elseif a=="55">各位委办局
			                 
			                 
			                 </#if></a></li>
			            </#list>
		            </ul>
      			</div>
			</div>
			<div class="fr w771">
				<div class="pageNow">当前位置：<a href="../website/showColumn.action?funcCode=${funcCode}&column=${column}"><#if column=="1">复议动态<#elseif column=="2">时政快递<#elseif column=="3">法律法规<#elseif column=="4">典型案例
      				<#elseif column=="5">统计查询<#elseif column=="6">工作管理<#elseif column=="7">在线调查
      				<#elseif column=="8">软件资料
      				<#elseif column=="11">行政诉讼文书
      				<#elseif column=="12">行政复议文书
      				</#if></a>
      			</div>
    			<div class="dataListTitle"><h1><#if subColumn=="11">图片动态<#elseif subColumn=="12">工作动态<#elseif subColumn=="21">领导讲话
                 <#elseif subColumn=="22">法制舆情摘报<#elseif subColumn=="31">法律法规<#elseif subColumn=="41">行政处罚<#elseif subColumn=="42">行政许可
                 <#elseif subColumn=="43">行政强制实施<#elseif subColumn=="44">行政不作为<#elseif subColumn=="45">行政征收<#elseif subColumn=="46">行政确权
                 <#elseif subColumn=="47">干预经营自主权<#elseif subColumn=="48">信息公开
                 <#elseif subColumn=="49">其他
            
             <#elseif subColumn=="50">基层法院
             <#elseif subColumn=="51">中级法院
             <#elseif subColumn=="52">高级法院
             <#elseif subColumn=="53">市政府
             <#elseif subColumn=="54">区县政府
             <#elseif subColumn=="55">各位委办局
                 
                 
                 </#if></h1>
            	</div>
            
     		<#if subColumn=="11">
     		<div class="imgList">
     			<ul>
				    <#list articleList as a>
				    	<li>
				        	<div class="imgDiv"><a  href="../website/showArticle.action?funcCode=${funcCode}&articleId=${a.id}" target="blank"><img src="${a.firstImage}" alt="" width="120" /></a></div>
				        	<div class="name"><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${a.id}" target="blank">${a.title}</a></div>
				        </li>
				     	</#list>
     			</ul>
     			<span class="clear_f"></span>
     		</div>
     		<#else>
     		<div class="dataList">
     			<ul>
				    <#list articleList as a>
				    	<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${a.id}" target="blank">${a.title}</a><span>${a.releaseDate?default('')}</span></li>
				    </#list>
     			</ul>
     		</div>
     		</#if>
     		<div class="dataListB"></div>
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
				document.form.action="subColumnMore.action"
				document.form.submit();
			}
</script>
</html>