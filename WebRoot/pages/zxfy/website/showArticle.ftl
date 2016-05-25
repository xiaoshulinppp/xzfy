<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
</head>
<body onload="startTime()">
<form name="form" action ="../website/saveComment.action" validate="true" method="post">
<#include "header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../website/showColumn.action?funcCode=${funcCode}&column=${articleInfo.column}"><#if articleInfo.column=="1">复议动态<#elseif articleInfo.column=="2">时政快递<#elseif articleInfo.column=="3">法律法规<#elseif articleInfo.column=="4">典型案例
      <#elseif articleInfo.column=="5">统计查询<#elseif articleInfo.column=="6">工作管理
      
      <#elseif articleInfo.column=="7">在线调查
      <#elseif articleInfo.column=="11">行政诉讼文书
      <#elseif articleInfo.column=="12">行政复议文书
      <#elseif articleInfo.column=="8">软件资料</#if></a> 
      -- <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=${articleInfo.column}&subColumn=${articleInfo.subColumn}">
      <#if articleInfo.subColumn=="11">图片动态<#elseif articleInfo.subColumn=="12">行政复议工作动态<#elseif articleInfo.subColumn=="21">领导讲话
                 <#elseif articleInfo.subColumn=="22">法制舆情摘报<#elseif articleInfo.subColumn=="31">法律法规<#elseif articleInfo.subColumn=="41">行政处罚<#elseif articleInfo.subColumn=="42">行政许可
                 <#elseif articleInfo.subColumn=="43">行政强制实施<#elseif articleInfo.subColumn=="44">行政不作为<#elseif articleInfo.subColumn=="45">行政征收<#elseif articleInfo.subColumn=="46">行政确权
                 <#elseif articleInfo.subColumn=="47">干预经营自主权<#elseif articleInfo.subColumn=="48">信息公开<#elseif articleInfo.subColumn=="49">其他<#elseif articleInfo.subColumn=="50">基层法院<#elseif articleInfo.subColumn=="51">中级法院<#elseif articleInfo.subColumn=="52">高级法院<#elseif articleInfo.subColumn=="53">市政府<#elseif articleInfo.subColumn=="54">区县政府<#elseif articleInfo.subColumn=="55">各位委办局</#if></a></div>
</div>


<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="articleId" value="${articleId}">
<div class="pageBg1">
<div class="wal">
      <div class="h10"></div>
      <div class="pageBg3"></div>
      <div class="pageBg5 newShow">
				<div class="title">${articleInfo.title}</div>
				<div class="time">来源：${articleInfo.resource?default('')}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布者：${articleInfo.author}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      时间：    ${articleInfo.releaseDate?default('')}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;阅读次数：${articleInfo.viewCount?default(0)}</div>
				<div class="content">${content?default('')}</div>
	  </div>
	  
	  <div class="pageBg4"></div>
	  <div class="h25"></div>
	  <div  <#if articleInfo.column!="4">style="display:none"</#if>>                            <!--仅典型案例显示评论区域-->
	  <div class="pageBg3"></div>
      <div class="pageBg5 commentList">
      <ul>
      <#list commentList as com>
      	<li>
      	<#assign grade = com.grade>
      	<div class="imgDiv"><img src="../webstyle/image/nimg38.gif" alt="" /></div>  	
	  	<div class="name">${com.commenter_name}:<#if grade==0>未评价<#else>
	  	<#list 1..grade as i><img src="../webstyle/image/nimg19.gif" alt="" />
	  	</#list></#if>
	  	<span>${com.time}发表</span></div>
		<div class="content">${com.comment?default('')}</div>
	  	</li>
	  </#list>
	  </ul>
	  <div class="msg">共有 ${commentList.size()}条回复</div>
	  </div>
      <div class="pageBg4"></div>
      <div class="h25"></div>
      <div class="commentTitle">文明社会，从理性发贴开始。</div>
      <div class="pageBg5 commentForm">
      <div class="bg">
      <textarea name="comment.comment" id="comment" class="textarea"></textarea>
      <input type="hidden" id="grade" name="comment.grade" value="0" />
                对该新闻评分：<img src="../webstyle/image/nimg19_2.gif" name="gradeImg" onmouseover="setStar(1)" onmouseout="mouseout()" onclick="setGrade(1)"/>
                   <img src="../webstyle/image/nimg19_2.gif" name="gradeImg" onmouseover="setStar(2)" onmouseout="mouseout()" onclick="setGrade(2)"/>
                   <img src="../webstyle/image/nimg19_2.gif" name="gradeImg" onmouseover="setStar(3)" onmouseout="mouseout()" onclick="setGrade(3)"/> 
                   <img src="../webstyle/image/nimg19_2.gif" name="gradeImg" onmouseover="setStar(4)" onmouseout="mouseout()" onclick="setGrade(4)"/> 
                   <img src="../webstyle/image/nimg19_2.gif" name="gradeImg" onmouseover="setStar(5)" onmouseout="mouseout()" onclick="setGrade(5)"/>
                <!--<select name="comment.grade" onchange="setStar(this.value)"><option value="0">选择评分</option><option value="1">1分</option><option value="2">2分</option><option value="3">3分</option><option value="4">4分</option><option value="5">5分</option></select></div>-->
            
            <div class="fr">
            <input type="button" class="btn1" onclick="submitComment()"/></div>
            <span class="clear_f"></span>
		</div>
        </div>
        <div class="pageBg4"></div>
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
<script>
//var isClick=false;
var num=0;
function submitComment(){
	if(document.getElementById("comment").value==""){
		alert("回复不可为空");
	}else{
		if(confirm("确认回复")){
			document.form.submit();
		}
	}
}


function setStar(grade){
	
	var e = document.getElementsByName("gradeImg");
	
	for(var i=0;i<grade;i++){
		e[i].src="../webstyle/image/nimg19.gif";
		
	}
	for(var i=grade;i<6;i++){
		e[i].src="../webstyle/image/nimg19_2.gif";
		
	}
}
function setGrade(grade){
	//isClick=true;
	document.getElementById("grade").value=grade;
	setStar(grade);
	
}
function mouseout(){
	num=document.getElementById("grade").value;
	setStar(num);
}
</script>
</html>