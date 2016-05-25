		<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
		<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>

<!-- 组件template -->
<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>

<script>
			function opendg(dgurl,dgw,dgh)
			{ 
  				$.dialog({ 
    			title:'上传案卷',
    			width: dgw,
    			height: dgh,
    			content:'url:'+ dgurl});
			}
</script>	
	<span class="x-line fn-clear">
	    <img src="../sys_theme/images/pic_search_line.png"/>
	</span>
	<#if list1.size()!=0>
	<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left">
         <img src="../sys_theme/images/icons/crumb.png"/>
     </span>
     <h2 class="ui-title-cnt fn-left">
                      未上传案卷
     </h2>  
     <span class="ui-searchbar-btn" id="search-box-btn">
         <a href="../website/ajListMore.action?funcCode=${funcCode}&p=1" target="_blank" class="more"><img src="../webstyle/image/more.gif" /></a>
     </span>
</div>     
<br>
			 <div class="ui-list-nobtnbar fn-clear ">
 <table class="ui-table  ui-table-list  list-fixed  ">
            			<tr>  
							<th >序号</th>
							<th >立案日期</th>
							<th >申请人</th>
							<th>被申请人</th>
							<th >案号</th>
							<th >承办人</th>
							<th >案件状态</th>
							<th >案件信息</th>
							<th >案卷管理</th>
						</tr>
						<#list list1 as info>
						<tr>
							<td>&nbsp;${info_index+1}</td>
					    	<td>&nbsp;<#if info.lian_date?has_content>${info.lian_date}</#if></td>
							<td>&nbsp;<#if info.app_show?has_content>${info.app_show}</#if></td>
							<td>&nbsp;<#if info.defendant_name?has_content>${info.defendant_name}</#if></td>
							<td>&nbsp;<#if info.tjzfzh?has_content>${info.tjzfzh}</#if></td>
							<td>&nbsp;<#if info.user2_name?has_content>${info.user2_name}</#if></td>
							<td>&nbsp;案卷未上传</td>
							<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${info.id}" target="blank">查看</a></td>
							<td><a href="javascript:opendg('../ajgl/gotoUpload.action?funcCode=${funcCode}&xzfyId=${info.id}',1000,600)"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
						</tr>
						</#list>
					</table>
					</div>
			</#if>
			<#if list2.size()!=0>
			
	<div class="ui-title fn-clear">
     <span class="ui-title-icon fn-left">
         <img src="../sys_theme/images/icons/crumb.png"/>
     </span>
     <h2 class="ui-title-cnt fn-left">
                      已上传案卷
     </h2>  
     <span class="ui-searchbar-btn" id="search-box-btn">
         <a href="../website/ajListMore.action?funcCode=${funcCode}&p=2" target="_blank" class="more"><img src="../webstyle/image/more.gif" /></a>
     </span>
</div> 	
<br>
			 <div class="ui-list-nobtnbar fn-clear ">
 <table class="ui-table  ui-table-list  list-fixed  ">
            			<tr>  
							<th >序号</th>
							<th>立案日期</th>
							<th>申请人</th>
							<th>被申请人</th>
							<th>案号</th>
							<th>承办人</th>
							<th>案件状态</th>
							<th>案卷维护</th>
							<th>案卷</th>
							<th>案件信息</th>
						</tr>
						<#list list2 as info>
						<tr>
							<td>&nbsp;${info_index+1}</td>
					    	<td>&nbsp;<#if info.lian_date?has_content>${info.lian_date}</#if></td>
							<td>&nbsp;<#if info.app_show?has_content>${info.app_show}</#if></td>
							<td>&nbsp;<#if info.defendant_name?has_content>${info.defendant_name}</#if></td>
							<td>&nbsp;<#if info.tjzfzh?has_content>${info.tjzfzh}</#if></td>
							<td>&nbsp;<#if info.user2_name?has_content>${info.user2_name}</#if></td>
							<td>&nbsp;案卷已上传</td>
							<td><a href="javascript:opendg('../ajgl/viewAttachment.action?funcCode=${funcCode}&xzfyId=${info.id}',1000,600)"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
							<td><a href="javascript:opendg('../ajgl/appAnjuView.action?funcCode=${funcCode}&xzfyId=${info.id}',1000,600)">查看案件</a></td>
							<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${info.id}" target="blank">查看</a></td>
						</tr>
						</#list>
					</table>
					</div>
			</#if>