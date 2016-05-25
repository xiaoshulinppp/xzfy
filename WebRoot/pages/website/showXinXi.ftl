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
<form name="form" id="form" action="updateXinXi.action" method="post" ENCTYPE="multipart/form-data">
<input type="hidden" name="funcCode" value="${funcCode}"/>
<input type="hidden" name="articleInfo.id" value="${articleInfo.id}"/>
<input type="hidden" name="articleInfo.firstImage" value="${articleInfo.firstImage}"/>
<#include "header.ftl">
<#assign flag="${isView?default('0')}">
<div class="wal">
	<div class="pageBg2">
<!--wal-->
		<div class="fl w198">
        	<div class="sideNav">
            	<div class="title">请选择栏目</div>
            	<ul>
	            	<li><a href="../website/xinXiBaoSong.action?funcCode=${funcCode}">信息报送</a> </li>
	            	<li><a href="../website/xinXiLieBiao.action?funcCode=${funcCode}">全市信息列表</a> </li>
	            	<li><a href="../website/benDanWeiLieBiao.action?funcCode=${funcCode}">本单位信息列表</a> </li>
            	</ul>
      		</div>
		</div>
		<div class="fr w771">
			<div class="pageNow">当前位置：<a href="../website/xinXiBaoSong.action?funcCode=${funcCode}">信息报送</a></div>
		</div>
		<div class="searchForm">
			<ul>
				<li style="width:180px">
					<div class="name">报送单位：</div>
					<input type="text" name="articleInfo.resource" value="${articleInfo.resource}" <#if flag=='0'>readonly</#if>>
				</li>
				<li style="width:180px">
					<div class="name">报送时间：</div>
					<input type="text" name="articleInfo.createdDate" value="${articleInfo.createdDate}" onClick="WdatePicker()">
				</li>
				<li style="width:180px">
					<div class="name">信息标题：</div>
					<input type="text" name="articleInfo.title" id="title" value="${articleInfo.title}" <#if flag=='0'>readonly</#if>>
				</li>
				<li style="width:180px">
					<div class="name">报送人：</div>
					<input type="text" name="articleInfo.author" value="${articleInfo.author?default('')}" <#if flag=='0'>readonly</#if>>
				</li>
				<li style="width:360px;height:100px;">
					<div class="name">信息文件：</div>
					<input type="file" name="upFile" id="upFile" value="" <#if flag=='0'>style="display:none"</#if>><a href="${articleInfo.firstImage}" target="blank">点击下载附件</a>
					<textarea name="articleInfo.keyword" style="width:350px;height:70px;" <#if flag=='0'>readonly</#if>>${articleInfo.keyword?default('')}</textarea>
				</li>
				<li style="width:40px;height:100px;">
				</li>
			</ul>
			<span class="clear_f"></span>
			<div class="btnDiv" id="btnDiv" style="padding-left:260px">
				<input type="button" class="btn1" value="修改" onclick="tijiao()" <#if flag=='0'>style="display:none"</#if>><input type="button" class="btn2 btn1" value="返回" onclick="history.back();">
			</div>
		</div>
<!--walEnd-->
	</div>
</div>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</form>
</body>
<script>
function tijiao(){
	if(confirm("确认修改？"))
		document.form.submit();
}
</script>	
</html>