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
				<td height="20">WEB开发子系统 > WEB栏目管理 > 栏目管理</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>栏目信息</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<td width="100" class="cardActive">栏目信息</td>
				<td width="100" class="cardNormal"><a href="#" class="cardLink" onclick="showClassifyList();">栏目子项列表</a></td>
				<td class="cardThZf">&nbsp;</td>
			</tr>
		</table>
		<form id="updateForm" action="../webTemplate/updateClassify.action" method="post">
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal" width="20%">&nbsp;</th>
				<th class="thListNormal" width="30%">&nbsp;</th>
				<th class="thListNormal" width="20%">&nbsp;</th>
				<th class="thListNormal" width="30%">&nbsp;</th>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">栏目名称</td>
				<td class="tdFormInput">
					<input type="text" name="WtClassify.name" value="${WtClassify.name}" class="inputTextNormal" />
				</td>
				<td class="tdFormText">栏目顺序</td>
				<td class="tdFormInput">
					<input type="text" name="WtClassify.seq" value="${WtClassify.seq}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">栏目状态</td>
				<td class="tdFormInput">
					<input type="radio" name="WtClassify.state" value="1" <#if WtClassify.state == '1'>checked="true"</#if> />启动
					<input type="radio" name="WtClassify.state" value="0" <#if WtClassify.state == '0'>checked="true"</#if> />禁用
				</td>
				<td class="tdFormText">栏目模板</td>
				<td class="tdFormInput">
					<select id="templateSelect" name="WtClassify.templateId" class="selectStyleNormal">
						<option value="-1" <#if WtClassify.templateId == -1>selected="selected"</#if>>选择模板……</option>
						<#list templateList as data>
						<option value="${data.id}" <#if WtClassify.templateId == data.id>selected="selected"</#if>>${data.name}</option>
						</#list>
					</select>
					<a href="#" onclick="showTemplateImage();">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/view.gif" alt="模板预览" width="16" height="16" border="0" />
					</a>
				</td>
			</tr>
		</table>
		<input type="hidden" name="funcCode" value="${funcCode}" />
		<input type="hidden" name="entityId" value="${WtClassify.id}" />
		</form>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<#if WtClassify.level != 0>
					<input type="button" class="button" value="提 交" onclick="updateOrg();" />
					<input type="button" class="button" value="删 除" onclick="deleteOrg();" />
					</#if>
				</td>
			</tr>
		</table>
		<form id="deleteForm" action="deleteClassify.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="entityId" value="${WtClassify.parentClassify.id}" />
			<input type="hidden" name="classifyId" value="${WtClassify.id}" />
		</form>
	</body>
</html>
<script type="text/javascript">
	/*
	 * 显示子栏目列表
	 */
	function showClassifyList(){
		window.location.href = "../webTemplate/showChildClassifyList.action?funcCode=${funcCode}&entityId=${WtClassify.id}";
	}
	
	/*
	 * 删除栏目
	 */
	function deleteOrg(){
		if(confirm("是否删除栏目：${WtClassify.name}?")){
			window.document.getElementById("deleteForm").submit();
		}
	}
	
	/*
	 * 修改栏目
	 */
	function updateOrg(){
		if(confirm("是否修改栏目：${WtClassify.name}?")){
			window.document.getElementById("updateForm").submit();
		}
	}
	
	/*
	 * 模板预览
	 */
	function showTemplateImage(){
		var templateId = window.document.getElementById("templateSelect").value;
		if(templateId == -1){
			alert("请选择要预览的模板！");
			return;
		}
		var url = "../webTemplate/showTemplateImage.action?funcCode=${funcCode}&entityId=" + templateId;
		window.open(url);
	}
</script>