
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
<input type="hidden" name="funcCode" value="${funcCode}"/>
<#include "header.ftl">
<script>
function chageChannel(){
	//document.getElementById("totallist").style.display="none";
}
function openEms() {
 	window.open("/xzfy/ssoServlet?LinkID=mhsms&LinkType=online","emsPlatform","");
}
</script>
<div class="wal">
<div class="pageBg2">
<!--wal-->
<div class="fl w198">
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
	            <li><a href="javascript:chageChannel();" <#if isSoft!="1">class="aNow"</#if>>资料共享</a></li>
	            <li><a href="javascript:chageChannel();">本单位不公开资料</a></li>
	            <li><a href="javascript:chageChannel();" <#if isSoft=="1">class="aNow"</#if>>软件下载</a></li>
	            <li><a href="javascript:chageChannel();">电话本</a></li>
				<li><a href="/xzfy/ssoServlet?LinkID=mhsms&LinkType=online" target='_blank'>短信平台</a></li>
            </ul>
      </div>
</div>
<div class="fr w771">
	<div class="pageNow">当前位置：<a href="../website/zlk.action?funcCode=${funcCode}">资料库</a></div>
	<div class="pageDiv" <#if isSoft!="1">style="display:block"</#if>>
	   <#if key==1>
	   		<iframe frameborder="0" height="900" scrolling="no" width="100%" src="../material/showMyMaterialList.action?funcCode=${funcCode}"></iframe>
	   <#else>
	   		<iframe frameborder="0" height="900" scrolling="no" width="100%" src="../material/showMaterialList.action?funcCode=${funcCode}"></iframe>
  	   </#if>
  	</div>
  	<div class="pageDiv" >
	   		<iframe frameborder="0" height="900" scrolling="no" width="100%" src="../material/showMyOrgMaterialList.action?funcCode=${funcCode}"></iframe>
  	</div>
	  
	  <div class="pageDiv" <#if isSoft=="1">style="display:block"</#if>>
      <iframe frameborder="0" height="900" scrolling="no" width="100%" src="../web/softwareIndex.action?funcCode=${funcCode}"></iframe>
	  </div>
	  <div class="pageDiv">
	  	  <iframe frameborder="0" height="900" scrolling="no" width="100%" src="../tongJi/dianHuaBen.action?funcCode=${funcCode}"></iframe>
	  </div>

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