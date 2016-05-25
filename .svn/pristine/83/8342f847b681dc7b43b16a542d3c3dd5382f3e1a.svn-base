<div class="wal">
<div class="pageBg2">
<!--wal-->
<div class="fl w198">
      <div class="sideNav">
            <div class="title">请选择栏目</div>
            <ul>
            <#list list as a> 
                 <li><a href="javascript:chageChannel();"><#if a=="11">图片动态<#elseif a=="12">工作动态<#elseif a=="21">领导讲话
                 <#elseif a=="22">法制舆情摘报<#elseif a=="31">法律法规<#elseif a=="41">行政处罚<#elseif a=="42">行政许可
                 <#elseif a=="43">行政强制实施<#elseif a=="44">行政不作为<#elseif a=="45">行政征收<#elseif a=="46">行政确权
                 <#elseif a=="47">干预经营自主权<#elseif a=="48">信息公开<#elseif a=="49">其他</#if></a></li>
            </#list>
            </ul>
      </div>
</div>
<div class="fr w771">
	<div class="pageNow">当前位置：<#if column=="1">复议动态<#elseif column=="2">时政快递<#elseif column=="3">法律法规<#elseif column=="4">典型案例</#if></div>
	  <div id="totallist" style="display:block">
	   <!--<iframe frameborder="0" height="900" scrolling="no" width="100%" src="dataList1.html"></iframe>-->
	    <#list allList as list >
	    <#if list_index==0>
	    <#assign subColumn="${list.subColumn}">
	    </#if>
   		<#assign length=5>
   		<#if list.size() lt 5>
   		<#assign length=list.size()></#if>
   		<div class="dataListTitle"><h1><#if subColumn=="11">图片动态<#elseif subColumn=="12">工作动态<#elseif subColumn=="21">领导讲话
                 <#elseif subColumn=="22">法制舆情摘报<#elseif subColumn=="31">法律法规<#elseif subColumn=="41">行政处罚<#elseif subColumn=="42">行政许可
                 <#elseif subColumn=="43">行政强制实施<#elseif subColumn=="44">行政不作为<#elseif subColumn=="45">行政征收<#elseif subColumn=="46">行政确权
                 <#elseif subColumn=="47">干预经营自主权<#elseif subColumn=="48">信息公开<#elseif subColumn=="49">其他</#if></h1>
                 <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=${column}&subColumn=${subColumn}" class="more"><img src="../images/index/more.gif" /></a></div>
            <div class="dataList">
            <ul>
   			<#list list as a>
   			<li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${a.id}" target="blank">${a.title}</a><span>${a.releaseDate}</span></li>
   			</#list>
   			</ul>
   			</div>
   			<div class="dataListB"></div>
   		
   		</#list>
   		</div>
	  <#list list as a>
	  <div class="pageDiv" >
      <iframe frameborder="0" height="900" scrolling="no" width="100%" src="../website/showSubColumn.action?funcCode=${funcCode}&column=${a}"></iframe>
	  </div>
	  </#list>

</div>
<span class="clear_f"></span>
<div class="h50"></div>
<!--walEnd-->
</div>
</div>