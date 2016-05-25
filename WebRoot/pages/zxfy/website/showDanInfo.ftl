<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title></title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
</head>
<body>
<#include "../website/header.ftl">
</div>
<!-- 需在各页面body上加  onload="startTime()"  -->
<script type="text/javascript">
			function startTime()
			{
			var today=new Date()
			var y=today.getFullYear()
			var month=today.getMonth()+1
			var d=today.getDate()
			var h=today.getHours()
			var m=today.getMinutes()
			var s=today.getSeconds()
			// add a zero in front of numbers<10
			m=checkTime(m)
			s=checkTime(s)
			document.getElementById('time').innerHTML="当前时间："+y+"年"+month+"月"+d+"日"+h+"点"+m+"分"+s+"秒"
			t=setTimeout('startTime()',500)
			}
			
			function checkTime(i)
			{
			if (i<10) 
			  {i="0" + i}
			  return i
			}
		</script>
<div class="" style="padding-top:0px;">

<div class="wal">


      <iframe frameborder="0" id="ifm" name="ifm"  scrolling="" height="1000px"
       width="100%" src="../wyxx/showCorpInfo.action?funcCode=${funcCode}"</iframe>
</div>

</div>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>

</body>
<script>
function dyniframesize(down) { 
	var pTar = null; 
	if (document.getElementById){ 
		pTar = document.getElementById(down); 
	} 
	else{ 
		eval('pTar = ' + down + ';'); 
	} 
	if (pTar && !window.opera){ 
	//begin resizing iframe 
		pTar.style.display="block" 
		if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
	//ns6 syntax 
			pTar.height = pTar.contentDocument.body.offsetHeight +20; 
			pTar.width = pTar.contentDocument.body.scrollWidth+20; 
		} 
		else if (pTar.Document && pTar.Document.body.scrollHeight){ 
	//ie5+ syntax 
			pTar.height = pTar.Document.body.scrollHeight; 
			pTar.width = pTar.Document.body.scrollWidth; 
		} 
	} 
} 
</script>
</html>