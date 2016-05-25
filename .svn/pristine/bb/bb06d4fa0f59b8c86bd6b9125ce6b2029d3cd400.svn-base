
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
<input type="hidden" name="funcCode" value="${funcCode}"/>
<#include "header.ftl">
<script>
function chageChannel(){
	document.getElementById("totallist").style.display="none";
}
</script>
<div class="wal">
	<div class="pageBg2">
<!--wal-->
		<div class="fl w198">
			<div class="sideNav">
		    	<div class="title">请选择栏目</div>
		       	<ul>
		        	<li><a href="javascript:chageChannel()" class="aNow">创建新闻</a></li>
		            <li><a href="javascript:chageChannel()">个人已发布新闻列表</a></li>
		            <#list permissionList as p>
		            <#if p=='0'>
		            <li><a href="javascript:chageChannel()">待发布新闻列表</a></li>
		            <#else>
		            <li><a href="javascript:chageChannel();"><#if p=="11">图片动态待发布列表<#elseif p=="12">工作动态待发布列表<#elseif p=="21">领导讲话待发布列表
                 <#elseif p=="22">法制舆情摘报待发布列表<#elseif p=="31">法律法规待发布列表<#elseif p=="41">行政处罚待发布列表<#elseif p=="42">行政许可待发布列表
                 <#elseif p=="43">行政强制实施<#elseif p=="44">行政不作为<#elseif p=="45">行政征收<#elseif p=="46">行政确权
                 <#elseif p=="47">干预经营自主权待发布列表<#elseif p=="48">信息公开待发布列表<#elseif p=="49">其他典型案例待发布列表</#if></a></li>
		            </#if>
		            </#list>
		            <#list permissionList as p>
		            <#if p=='0'>
		            <li><a href="javascript:chageChannel()">已发布列表管理</a></li>
		            <#else>
		            <li><a href="javascript:chageChannel();"><#if p=="11">图片动态列表管理<#elseif p=="12">工作动态列表管理<#elseif p=="21">领导讲话列表管理
                 <#elseif p=="22">法制舆情摘报列表管理<#elseif p=="31">法律法规列表管理<#elseif p=="41">行政处罚列表管理<#elseif p=="42">行政许可列表管理
                 <#elseif p=="43">行政强制实施列表管理<#elseif p=="44">行政不作为列表管理<#elseif p=="45">行政征收列表管理<#elseif p=="46">行政确权列表管理
                 <#elseif p=="47">干预经营自主权列表管理<#elseif p=="48">信息公开列表管理<#elseif p=="49">其他典型案例列表管理</#if></a></li>
		            </#if>
		            </#list>
		        </ul>
		    </div>
		</div>
		<div class="fr w771">
			<div class="pageNow">当前位置：<a href="../website/articleAreaOnFrontPage.action?funcCode=${funcCode}">工作管理</a></div>
			<div class="pageDiv" style="display:block">
			<iframe frameborder="0" height="700" scrolling="auto" width="100%" src="../website/gotoCreate.action?funcCode=${funcCode}"></iframe>
			</div>
			<div class="pageDiv" >
			<iframe frameborder="0" height="1200" scrolling="auto" width="100%" src="../website/myReleasedList.action?funcCode=${funcCode}"></iframe>
			</div>
			<#list permissionList as p>
		    <#if p=='0'>
		    <div class="pageDiv" >
		    <iframe frameborder="0" height="1200" scrolling="auto" width="100%" src="../website/showUnreleasedList.action?funcCode=${funcCode}"></iframe>
		    </div>
		    <#else>
		    <div class="pageDiv" >
		    <iframe frameborder="0" height="1200" scrolling="auto" width="100%" src="../website/showUnreleasedList.action?funcCode=${funcCode}&columnType=${p}"></iframe>
		    </div>
		    </#if>
		    </#list>
		    <#list permissionList as p>
		    <#if p=='0'>
		    <div class="pageDiv" >
		    <iframe frameborder="0" height="1200" scrolling="auto" width="100%" src="../website/showReleasedList.action?funcCode=${funcCode}"></iframe>
		    </div>
		    <#else>
		    <div class="pageDiv" >
		    <iframe frameborder="0" height="1200" scrolling="auto" width="100%" src="../website/showReleasedList.action?funcCode=${funcCode}&column=${p}"></iframe>
		    </div>
		    </#if>
		    </#list>
		</div>
		<span class="clear_f"></span>
		<div class="h50"></div>
<!--walEnd-->
	</div>
</div>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>