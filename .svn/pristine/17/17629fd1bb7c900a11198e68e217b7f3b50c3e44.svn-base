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
				<td>创建模板</td>
			</tr>
		</table>
		<form id="createForm" action="../webTemplate/createTemplate.action" method="post"  enctype="multipart/form-data">
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal" width="20%">&nbsp;</th>
				<th class="thListNormal" width="30%">&nbsp;</th>
				<th class="thListNormal" width="20%">&nbsp;</th>
				<th class="thListNormal" width="30%">&nbsp;</th>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">模板名称</td>
				<td class="tdFormInput">
					<input type="text" id="templateName" value="" class="inputTextNormal" />
				</td>
				<td class="tdFormText">功能链接</td>
				<td class="tdFormInput">
					<input type="text" id="templateFunction" value="" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">截图上传</td>
				<td class="tdFormInput">
					<input type="file" name="upFile" value="" class="inputTextFile" />
				</td>
				<td class="tdFormText">显示顺序</td>
				<td class="tdFormInput">
					<input type="text" id="templateSeq" value="${templateSeq}" class="inputTextNormal" />
				</td>
			</tr>
			<tr class="trwhite">
				<td class="tdFormText">模板简介</td>
				<td class="tdFormInput" colspan="3">
					<textarea id="templateIntroduction" cols="40" rows="5" class="textarea"></textarea>
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td>
					<input type="button" class="button" value="提 交" onclick="createTemplate();" />
					<input type="button" class="button" value="返 回" onclick="gotoBack();" />
				</td>
			</tr>
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" id="hiddenTemplateName" name="wtTemplate.name" value="" />
			<input type="hidden" id="hiddenTemplateFunction" name="wtTemplate.function" value="" />
			<input type="hidden" id="hiddenTemplateIntroduction" name="wtTemplate.introduction" value="" />
			<input type="hidden" id="hiddenTemplateSeq" name="wtTemplate.seq" value="" />
		</form>
		</table>
	</body>
</html>
<script type="text/javascript">
	function createTemplate(){
		var name = window.document.getElementById("templateName").value;
		var templateFunction = window.document.getElementById("templateFunction").value;
		var seq = window.document.getElementById("templateSeq").value;
		var introduction = window.document.getElementById("templateIntroduction").value;
		if(name == ""){
			alert("模板名称不能为空！");
			return;
		}
		if(templateFunction == ""){
			alert("模板功能链接不能为空！");
			return;
		}
		var regex = "^\\d+$";
		if(!seq.match(regex)){
			alert("模板显示顺序必须为正整数！");
			return;
		}
		if(introduction == ""){
			alert("模板简介不能为空！");
			return;
		}
		if(confirm("确认提交？")){
			window.document.getElementById("hiddenTemplateName").value = name;
			window.document.getElementById("hiddenTemplateFunction").value = templateFunction
			window.document.getElementById("hiddenTemplateSeq").value = seq
			window.document.getElementById("hiddenTemplateIntroduction").value = introduction
			window.document.getElementById("createForm").submit();
		}
	}
	
	function gotoBack(){
		window.history.back();
	}
</script>