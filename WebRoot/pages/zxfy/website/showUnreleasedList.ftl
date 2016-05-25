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
<form name="form" method="post">
<!--您的位置表格开始-->
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="pNum" id="pNum"/>
<input type="hidden" name="columnType" value="${columnType}"/>
<span class="x-line fn-clear"><img src="../sys_theme/images/pic_search_line.png"/></span><!--我是有箭头灰色的分割线-->
		<div class="ui-search fn-clear" >
		    <div class="ui-search-general fn-clear  fn-hide" id="search-general">
		    <table id=""class="ui-table ui-table-search  "  summary="这是一个1行4列的表格样式模板">
		        <tbody class="">
		        <tr>
		          <td>文章标题</td>
		          <td><input class="ui-input-wdm" type="text" name="title" value="${title?default('')}"/></td>
		         <td >作者</td>
		          <td ><input class="ui-input-wdm" type="text"  name="author" value="${author?default('')}" /></td>
		          <tr>
		         <td>创建日期</td>
		         <td><input class="ui-input-wdm" type="text"  name="createdDate" value="${createdDate?default('')}" onClick="WdatePicker()"/></td>
		         <td>所属栏目</td>
		          <td>
		          <select name="column">
		          	<option value="" <#if column=="">selected</#if>>选择</option>
		          	<option value="1" <#if column=="1">selected</#if>>复议动态</option>
		          	<option value="2" <#if column=="2">selected</#if>>时政快递</option>
		          	<option value="3" <#if column=="3">selected</#if>>法律法规</option>
		          	<option value="4" <#if column=="4">selected</#if>>典型案例</option>
		          	<option value="11" <#if column=="11">selected</#if>>行政诉讼文书</option>
		          	<option value="12" <#if column=="12">selected</#if>>行政复议文书</option>
		          </select>
		          </td>
		         </tr>
		          </tbody>
		          <tr>
		           <td colspan="4" align="center"><input  class="ui-btn ui-btn-yellow" type="button" name="button" id=""  value="搜索"  title="搜索" onclick="search(1)"/><input class="ui-btn ui-btn-normal" type="reset" value="重置" title="重新填写"/></td>
		         </tr>
		        </tfoot>  		        
		    </table>
  		</div>  
	</div>
<div class="" align="right" class="ui-title fn-clear">
<input class="ui-btn ui-btn-yellow" type="button" align="center" name="button" value="发布" onclick="release()"/>
</div>
<div class="ui-list-nobtnbar fn-clear ">
	<table class="ui-table  ui-table-list  list-fixed " >
	<thead class=""  id="" name="" >

<tr>
<th width="8%">序号</th>  
<th>文章标题</th>
<th width="10%">作者</th>
<th width="10%">创建日期</th>
<th width="10%">所属栏目</th>
<th width="10%">查看次数</th>
<th width="8%">查看</th>
<th width="8%">修改</th>
<th width="8%">删除</th>
<th width="8%">发布</th>

</tr>
</thead>
<tbody class="discolor">
<#list articleList as info>
<tr>
<#assign isTop = info.isTop?default('0')>

<td>&nbsp;${info_index+1}</td>
<td>&nbsp;${info.title?default('')}</td>
<td>&nbsp;${info.author?default('')}</td>
<td>&nbsp;${info.createdDate?default('')}</td>
<td>&nbsp;<#if info.column=="1">复议动态<#elseif info.column=="2">时政快递<#elseif info.column=="3">法律法规
<#elseif info.column=="4">典型案例<#elseif info.column=="5">行政诉讼文书
<#elseif info.column=="6">行政复议文书


</#if></td>
<td>&nbsp;${info.viewCount?default(0)}</td>
<td><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${info.id}" target="_blank">查看</a></td>
<td>&nbsp;<a href="../website/editArticle.action?funcCode=${funcCode}&articleId=${info.id}&columnType=${columnType}">修改</a></td>
<td>&nbsp;<a href="../website/deleteArticle.action?funcCode=${funcCode}&articleId=${info.id}&columnType=${columnType}">删除</a></td>
<td>&nbsp;<input type="checkbox" value="${info.id}" name="releaseId"></td>
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
				document.form.action="showUnreleasedList.action";
				document.form.submit();
			}
			function release(){
				if(isChosen()){
					if(confirm("确认要发布所选文章？")){
						document.form.action="release.action"
						document.form.submit();
					}
				}else{
					alert("请选择要发布的新闻");
				}
			}
			function isChosen(){
				var i;
				var b=false;
				var checkbox=document.getElementsByName("releaseId");
				for(i=0;i<checkbox.length;i++){
					if(checkbox[i].checked==true){
					b=true;
					break;
					}
				}
				return b;
			}
</script>