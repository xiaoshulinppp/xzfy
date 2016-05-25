<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
	<#if list1.size()!=0>
      		<div class="dataListTitle"><h1><#if p==1>案卷未上传<#else>案卷已上传</#if></h1><a href="../website/ajListMore.action?funcCode=${funcCode}&p=${p}" target="_blank" class="more"><img src="../webstyle/image/more.gif" /></a></div>
			<div class="pageBox">
            	<div class="searchList">
		            <table width="100%" border="0" cellpadding="0" cellspacing="0">
		            <#if p==1>
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
							<th>案件信息</th>
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
							<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${info.id}">查看</a></td>
							<td><a href="../ajgl/gotoUpload.action?funcCode=${funcCode}&xzfyId=${info.id}"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
							<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${info.id}" target="blank">查看</a></td>
						</tr>
						</#list>
					<#else>
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
						<#list list1 as info>
						<tr>
							<td>&nbsp;${info_index+1}</td>
					    	<td>&nbsp;<#if info.lian_date?has_content>${info.lian_date}</#if></td>
							<td>&nbsp;<#if info.app_show?has_content>${info.app_show}</#if></td>
							<td>&nbsp;<#if info.defendant_name?has_content>${info.defendant_name}</#if></td>
							<td>&nbsp;<#if info.tjzfzh?has_content>${info.tjzfzh}</#if></td>
							<td>&nbsp;<#if info.user2_name?has_content>${info.user2_name}</#if></td>
							<td>&nbsp;案卷已上传</td>
							<td><a href="../ajgl/viewAttachment.action?funcCode=${funcCode}&xzfyId=${info.id}"><img src="../images/15B/sicons/file_modf.gif"  width="16" height="16" border="0"></a></td>
							<td><a href="../ajgl/appAnjuView.action?funcCode=${funcCode}&xzfyId=${info.id}">查看案件</a></td>
							<td><a href="../xzfy/viewCase.action?funcCode=${funcCode}&xzfyId=${info.id}" target="blank">查看</a></td>
						</tr>
						</#list>
					</#if>
					</table>
				</div>
			</div>
			<div class="dataListB"></div>
</#if>