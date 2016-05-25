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
            <#list list as a> 
                 <li><a href="../website/subColumnMore.action?funcCode=${funcCode}&column=${column}&subColumn=${a}"><#if a=="11">图片动态<#elseif a=="12">工作动态<#elseif a=="21">领导讲话
                 <#elseif a=="22">法制舆情摘报<#elseif a=="31">法律法规<#elseif a=="41">行政处罚<#elseif a=="42">行政许可
                 <#elseif a=="43">行政强制实施<#elseif a=="44">行政不作为<#elseif a=="45">行政征收<#elseif a=="46">行政确权
                 <#elseif a=="47">干预经营自主权<#elseif a=="48">信息公开<#elseif a=="49">其他</#if></a></li>
                 
            </#list>
            <#if column="5">
	            <li><a href="javascript:initTongJiSearchForm(1);" class="aNow">国务院复议案件报表</a> </li>
	            <li><a href="javascript:initTongJiSearchForm(2);">接待与立案工作信息</a> </li>
	            <li><a href="javascript:initTongJiSearchForm(3);">行政复议机关案件统计</a> </li>
	            <li><a href="javascript:initTongJiSearchForm(4);">被申请人案件统计</a> </li>
	            <li><a href="javascript:initTongJiSearchForm(5);">复议办案指标统计</a> </li>
	            <li><a href="javascript:initTongJiSearchForm(6);">其他</a> </li>
	            <li><a href="javascript:initTongJiSearchForm(7);">接待信息查询</a> </li>
            </#if>
            </ul>
      </div>
</div>
<div class="fr w771">
	<div class="pageNow">当前位置：<a href="../website/showColumn.action?funcCode=${funcCode}&column=${column}"><#if column=="1">复议动态<#elseif column=="2">时政快递<#elseif column=="3">法律法规<#elseif column=="4">典型案例<#elseif column=="5">统计查询
      </#if></a></div>
	<div id="totallist" style="display:block">
	   <!--<iframe frameborder="0" height="900" scrolling="no" width="100%" src="dataList1.html"></iframe>-->
	    <#list allList as list >
	    <#if list.size()!=0>
	    <#assign subColumn="${list[0].subColumn}">
   		<#assign length=5>
   		<#if list.size() lt 5>
   		<#assign length=list.size()></#if>
   		<div class="dataListTitle"><h1><#if subColumn=="11">图片动态<#elseif subColumn=="12">工作动态<#elseif subColumn=="21">领导讲话
         <#elseif subColumn=="22">法制舆情摘报<#elseif subColumn=="31">法律法规<#elseif subColumn=="41">行政处罚<#elseif subColumn=="42">行政许可
                 <#elseif subColumn=="43">行政强制实施<#elseif subColumn=="44">行政不作为<#elseif subColumn=="45">行政征收<#elseif subColumn=="46">行政确权
                 <#elseif subColumn=="47">干预经营自主权<#elseif subColumn=="48">信息公开<#elseif subColumn=="49">其他</#if></h1>
                 <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=${column}&subColumn=${subColumn}" class="more"><img src="../webstyle/image/more.gif" /></a></div>
            <div class="dataList">
            <ul>
   			<#list list as a>
   			<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${a.id}" target="blank">${a.title}</a><span>${a.releaseDate?default('')}</span></li>
   			</#list>
   			</ul>
   			</div>
   			<div class="dataListB"></div>
   		</#if>
   		</#list>
  	</div>

	  <#if column="5">

		  <form name="form1" id="form1" target="_blank" action="" method="post">
		     
		    
		            

		           
		      	<div id="div0" style="display:block">
		            	<iframe src="../banan/form1Search.action?funcCode=${funcCode}" name="iframe0" id="iframe0" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no"  width="100%" height="800px"></iframe>
		       </div>	
		       
		      	<div id="div1" style="display:none">
		            	<iframe src="../xzfy/form2Search.action?funcCode=${funcCode}" name="iframe1" id="iframe1" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no"  width="100%" height="800px"></iframe>
		       </div>		                  
		                  
		                <div id="div2" style="display:none">
		            	<iframe src="../banan/form10Search.action?funcCode=${funcCode}" name="iframe2" id="iframe2" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no"  width="100%" height="1200px"></iframe>
		            	</div>
		            	<div id="div3" style="display:none">
		            	<iframe src="../tongJi/enterMoKuai4.action?funcCode=${funcCode}" name="iframe3" id="iframe3" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no"  width="100%" height="800px"></iframe>
		            	</div>
		            	<div id="div4" style="display:none">
		            	<iframe src="../zbtj/showQueryPanel.action?funcCode=${funcCode}" name="iframe4" id="iframe4" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no"  width="100%" height="800px"></iframe>
		            	</div>
		            	<div id="div5" style="display:none">
		            	<iframe src="../xzfy/div5Search.action?funcCode=${funcCode}" name="iframe5" id="iframe5" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no"  width="100%" height="500px"></iframe>
		            	</div>
		            	<div id="div6" style="display:none">
		            	<iframe src="../banan/jiedaiSearch.action?funcCode=${funcCode}" name="iframe6" id="iframe6" frameborder="0" marginheight="0" marginwidth="0" frameborder="0" scrolling="no"  width="100%" height="500px"></iframe>
		            	</div>
		                  
	
		  
	      <input type="hidden" name="tongJiMoKuai" id="tongJiMoKuai" value="2" />
		  <input type="hidden" name="funcCode" value="${funcCode}" />
		  </form>
       </#if>
	  

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
<script>
	$(document).ready(function(){
		
	});
	function showTongJiTable(){
		var form1=document.getElementById("form1");
		var tongJiType = document.getElementById("tongJiType").value;
		if(tongJiType==2 || tongJiType==4 ||tongJiType==5){
			form1.action="../tongJi/tongJi.action";
			form1.submit();
		}else if(tongJiType==6){
			if(document.getElementById("startDate").value==""||document.getElementById("endDate").value==""){
				alert("请选择起始日期！");
			}else{
				form1.action="../tongJi/jtfyajslTongji.action";
				form1.submit();
			}
		}
		else if(tongJiType==7){
			form1.action="../tongJi/searchDataList.action";
			form1.submit();
		}else if(tongJiType==3){
			form1.action="../jdquery/showSearchResult.action";
			form1.submit();
		}else if(tongJiType==1){
			form1.action="../banan/showRijiedaiList.action";
			form1.submit();
		}
		
	}
	
	function initTongJiSearchForm(tongJiMoKuai){
		for(var i=0;i<7;i++){
			
			var id="div"+i;
			var ifm="iframe"+i;
			var form=document.getElementById(id);
			var ifmUrl=document.getElementById(ifm);
			if(i==tongJiMoKuai-1){
				form.style.display="block";
				document.frames(ifm).location.reload();
			}else{
				form.style.display="none";
			}
		}
		//$("#tongJiMoKuai").val(tongJiMoKuai);
	}
	function showSearchProperty(){
		if (document.getElementById("tongJiType").value=="2"||document.getElementById("tongJiType").value=="4"||document.getElementById("tongJiType").value=="5"||document.getElementById("tongJiType").value=="6"){
			document.getElementById("querycondition0").style.display="none";
			document.getElementById("querycondition1").style.display="block";
			document.getElementById("querycondition2").style.display="none";
			document.getElementById("querycondition3").style.display="none";
			if(document.getElementById("tongJiType").value=="2"||document.getElementById("tongJiType").value=="4"){
				document.getElementById("userDiv").style.display="block";
			}else{
				document.getElementById("userDiv").style.display="none";
			}
			if(document.getElementById("tongJiType").value=="5"){
				document.getElementById("resultDiv").style.display="block";
			}else{
				document.getElementById("resultDiv").style.display="none";
			}
			
			
		}else if(document.getElementById("tongJiType").value=="7"){
			document.getElementById("querycondition0").style.display="none";
			document.getElementById("querycondition1").style.display="none";
			document.getElementById("querycondition2").style.display="block";
			document.getElementById("querycondition3").style.display="none";
			document.getElementById("userDiv").style.display="none";
			document.getElementById("resultDiv").style.display="none";
		}else if(document.getElementById("tongJiType").value=="3"){
			document.getElementById("querycondition0").style.display="none";
			document.getElementById("querycondition1").style.display="none";
			document.getElementById("querycondition2").style.display="none";
			document.getElementById("querycondition3").style.display="block";
			document.getElementById("userDiv").style.display="none";
			document.getElementById("resultDiv").style.display="none";
		}
		else if(document.getElementById("tongJiType").value=="1"){
			document.getElementById("querycondition0").style.display="block";
			document.getElementById("querycondition1").style.display="none";
			document.getElementById("querycondition2").style.display="none";
			document.getElementById("querycondition3").style.display="none";
			document.getElementById("userDiv").style.display="none";
			document.getElementById("resultDiv").style.display="none";
		}
	}
	function gotoChange(){
	    if(document.getElementById("appType").value=="1"){
	        document.getElementById("civil").style.display="block";
	        document.getElementById("legal").style.display="none";
	    }
	    else if(document.getElementById("appType").value=="2"){
	        document.getElementById("legal").style.display="block";
	        document.getElementById("civil").style.display="none";
	    }
	    else{
	        document.getElementById("legal").style.display="none";
	        document.getElementById("civil").style.display="none";
	    }
	}
</script>
</html>