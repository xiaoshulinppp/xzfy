<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" style="width:98%;">
			<tr>
				<td height="20">WEB开发子系统 > WEB栏目管理 > 模板管理</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>模板列表</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<td class="cardThZf">&nbsp;</td>
				<td align="right">
					<input type="button" value="新 增" class="button" onclick="gotoCreateTemplate();" />
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal">编号</th>
				<th class="thListNormal">模板名称</th>
				<th class="thListNormal">模板链接</th>
				<th class="thListNormal">查看</th>
				<th class="thListNormal">修改</th>
				<th class="thListNormal">删除</th>
			</tr>
			<#assign index = 1>
			<#list templateList as data>
			<tr class="trColor">
				<td class="tdlistCenter">${index}</td>
				<td class="tdlistCenter">${data.name}</td>
				<td class="tdlistCenter">${data.function}</td>
				<td class="tdlistCenter">
					<a href="#" onclick="showTemplate('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/view.gif" alt="查看" width="16" height="16" border="0" />
					</a>
				</td>
				<td class="tdlistCenter">
					<a href="#" onclick="updateTemplate('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/file_modf.gif" alt="修改" width="16" height="16" border="0" />
					</a>
				</td>
				<td class="tdlistCenter">
					<a href="#" onclick="deleteTemplate('${data.id}', '${data.name}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/file_del_new.gif" alt="删除" width="16" height="16" border="0" />
					</a>
				</td>
			</tr>
			<#assign index = index + 1>
			</#list>
			<#assign countNum = 16>
			<#if index lt countNum>
			<#assign temp = countNum - index>
			<#list 1..temp as x>
			<tr class="trColor">
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
				<td align="center" class="tdlistCenter">&nbsp;</td>
			</tr>
			</#list>
			</#if>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr align="center">
				<td>第${pageNum}/${totalPage}页 
					<a onclick="gopage('1')"  href ="#">首页</a>
					<#assign upPage = pageNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<a onclick="gopage('${upPage}')"  href ="#">上一页</a>
					<#assign downPage = pageNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>
					<a onclick="gopage('${downPage}')"  href ="#">下一页</a>
					<a onclick="gopage('${totalPage}')" href ="#">末页</a>
					第 <input id="gotoPageNum" name="gotoPageNum" type="text" class="inputTextSmall" maxlength="4" onkeypress="keyUpFunc(event);"> 页
					<a href="#" onclick="gotoPage()">跳转</a>
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			function gopage(mpage){
				window.location = "../webTemplate/showTemplateList.action?funcCode=${funcCode}&pageNum=" + mpage  + "";
			}
			
			function keyUpFunc(oEvent){
				if(oEvent.keyCode == 13 || oEvent.keyCode == 108){
					oEvent.keyCode=0;
					gotoPage();
				}
			}
		
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
					window.location = "../webTemplate/showTemplateList.action?funcCode=${funcCode}&pageNum=" + inputPage + "";
				}
				return;
			}
		</script>
		<form id="showForm" action="../webTemplate/showTemplate.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" id="showTemplateId" name="entityId" value="" />
		</form>
		<form id="deleteForm" action="../webTemplate/deleteTemplate.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" id="templateId" name="entityId" value="" />
		</form>
		<form id="updateForm" action="../webTemplate/gotoUpdateTemplate.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" id="updateTemplateId" name="entityId" value="" />
		</form>
	</body>
</html>
<script type="text/javascript">
	/*
	 * 进入新增模板页面
	 */
	function gotoCreateTemplate(){
		window.location.href = "../webTemplate/gotoCreateTemplate.action?funcCode=${funcCode}";
	}
	
	/*
	 * 删除模板
	 */
	function deleteTemplate(templateId, templateName){
		if(confirm("是否删除模板：" + templateName + "？")){
			window.document.getElementById("templateId").value = templateId;
			window.document.getElementById("deleteForm").submit();
		}
	}
	
	/*
	 * 修改模板
	 */
	function updateTemplate(templateId){
		window.document.getElementById("updateTemplateId").value = templateId;
		window.document.getElementById("updateForm").submit();
	}
	
	/*
	 * 查看模板
	 */
	function showTemplate(templateId){
		window.document.getElementById("showTemplateId").value = templateId;
		window.document.getElementById("showForm").submit();
	}
</script>