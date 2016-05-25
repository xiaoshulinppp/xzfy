<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../sys_theme/js/jquery-1.8.2.min.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left"><img src="../sys_theme/images/icons/crumb.png"/></span>
      <h2 class="ui-title-cnt fn-left">文章列表</h2>  
       <span class="ui-searchbar-btn" id="search-box-btn">
    <a href="javascript:slideToggle('#search-general')" id="searchbar-icon" class="show-search"  ></a></span></div>
<form name="form" id="form" method="post" ENCTYPE="multipart/form-data">
<!--您的位置表格开始-->

<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="pNum" id="pNum"/>
<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
<div class="ui-search fn-clear" >
		    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
		    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
		        <tbody class="">
		        <tr>
		          <td >文章标题</td>
		          <td><input class="ui-input-wdm" type="text" name="title" value="${title?default('')}"/></td>
		         <td >作者</td>
		          <td ><input class="ui-input-wdm" type="text"  name="author" value="${author?default('')}" /></td>
		          <tr>
		         <td>创建日期</td>
		         <td ><input class="ui-input-wdm" type="text"  name="createdDate" value="${createdDate?default('')}" onClick="WdatePicker()"/></td>
		          <td >关键词</td>
		          <td ><input class="ui-input-wdm" type="text" name="keyword" value="${keyword?default('')}"  /></td>
		          
		         </tr>
		         <tr>
		         <td >所属栏目</td>
		          <td>
		          <select name="column">
		          	<option value="" <#if column=="">selected</#if>>选择</option>
		          	<option value="1" <#if column=="1">selected</#if>>图片信息</option>
		          	<option value="2" <#if column=="2">selected</#if>>领导讲话</option>
		          	<option value="3" <#if column=="3">selected</#if>>动态新闻</option>
		          	<option value="4" <#if column=="4">selected</#if>>法律法规</option>
		          	<option value="5" <#if column=="5">selected</#if>>法制舆情摘报</option>
		          	<option value="6" <#if column=="6">selected</#if>>典型案例</option>
		          	<option value="7" <#if column=="7">selected</#if>>工作建议</option>
		          	<option value="8" <#if column=="8">selected</#if>>法制动态摘编</option>
		          </select>
		          </td>
		          <td></td>
		          <td></td>
		         </tr>
		          </tbody>
		         <tfoot><!--可以让按钮居中-->
		          <tr>
		           <td colspan="4"><input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick="search(1)"/><input class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/></td>
		         </tr>
		        </tfoot>  		        
		    </table>
  		</div>  
	</div>
<div class="ui-list-nobtnbar fn-clear ">
	<table class="ui-table  ui-table-list  list-fixed " >
	<thead class=""  id="" name="" >
<tr>
<th>序号</th>  
<th>文章标题</th>
<th>作者</th>
<th>创建日期</th>
<th>所属栏目</th>
<th>文章查看次数</th>
<th>文章来源</th>
<th>查看</th>
<th>修改</th>
<th>审核</th>
</tr>
</thead>
<tbody class="discolor">
<#list articleList as info>
<tr>
<#assign isTop = info.isTop?default('0')>
<#assign isRelease = info.isRelease?default('0')>
<td>&nbsp;${info_index+1}</td>
<td>&nbsp;${info.title?default('')}</td>
<td>&nbsp;${info.author?default('')}</td>
<td>&nbsp;${info.createdDate?default('')}</td>
<td>&nbsp;<#if info.column=="1">图片信息<#elseif info.column=="2">领导讲话<#elseif info.column=="3">动态新闻
<#elseif info.column=="4">法律法规<#elseif info.column=="5">法制舆情摘报<#elseif info.column=="6">典型案例<#elseif info.column=="7">工作建议<#else>法制动态摘编</#if></td>
<td>&nbsp;${info.viewCount?default(0)}</td>
<td>&nbsp;${info.resource?default('')}</td>
<td><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${info.id}">查看</a></td>
<td>&nbsp;<a href="../website/editArticle.action?funcCode=${funcCode}&articleId=${info.id}">修改</a></td>
<td>&nbsp;<a href="../website/review.action?funcCode=${funcCode}&articleId=${info.id}">审核</a></td>
</tr>
</#list>
</tbody>
</table>
</div>
<div class="ui-page">

         <span class="ui-page-item ui-page-item-info">第${pNum}/${totalPage}页   共 ${pageList.getTotalCount()}条 </span>
         			<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
		<span class="ui-page-item ui-page-item-go"> <h4>到</h4><input class="input-page"   name="gotoPageNum" id="gotoPageNum" /><a href="#" onclick="gotoPage()" class="ui-button ui-button-go">Go</a></span>			
		<span class="ui-page-item ui-item-link">
        <a href ="javascript:search(1)" class="ui-page-item ui-page-item-first">首页</a>
        <a href ="javascript:search(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>	
        <a href ="javascript:search(${downPage})" class="ui-page-item ui-page-next">下一页</a>
        <a href ="javascript:search(${totalPage})" class="ui-page-item ui-page-last">末页</a></span>
</div>
</form>
</body>
</html>
<script language="javascript">
			function gotoPage(){
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
				document.form.action="showList.action"
				document.form.submit();
			}
</script>