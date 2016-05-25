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
				<td>栏目列表</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<td width="100" class="cardNormal"><a href="#" class="cardLink" onclick="showParentInfo();">栏目信息</a></td>
				<td width="100" class="cardActive">栏目子项列表</td>
				<td class="cardThZf">&nbsp;</td>
				<td align="right">
					<input type="button" value="新 增" class="button" onclick="gotoCreateClassify();" />
				</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal">编号</th>
				<th class="thListNormal">栏目名称</th>
				<th class="thListNormal">父栏目名称</th>
				<th class="thListNormal">栏目级别</th>
				<th class="thListNormal">栏目状态</th>
				<th class="thListNormal">栏目子项列表</th>
				<th class="thListNormal">修改</th>
				<th class="thListNormal">删除</th>
			</tr>
			<#assign index = 1>
			<#list classifyList as data>
			<tr class="trColor">
				<td class="tdlistCenter">${index}</td>
				<td class="tdlistCenter">${data.name}</td>
				<td class="tdlistCenter">${data.parentClassify.name}</td>
				<td class="tdlistCenter">${data.level}</td>
				<#if data.state == '1'>
				<td class="tdlistCenter">启动</td>
				<#else>
				<td class="tdlistCenter">禁用</td>
				</#if>
				<td class="tdlistCenter">
					<a href="#" onclick="showClassifyList('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/view.gif" alt="栏目子项列表" width="16" height="16" border="0" />
					</a>
				</td>
				<td class="tdlistCenter">
					<a href="#" onclick="updateClassify('${data.id}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/file_modf.gif" alt="修改" width="16" height="16" border="0" />
					</a>
				</td>
				<td class="tdlistCenter">
					<a href="#" onclick="deleteClassify('${data.id}', '${data.name}');">
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
				window.location = "../webTemplate/showChildClassifyList.action?funcCode=${funcCode}&pageNum=" + mpage  + "&entityId=${WtClassify.id}";
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
					window.location = "../webTemplate/showChildClassifyList.action?funcCode=${funcCode}&pageNum=" + inputPage + "&entityId=${WtClassify.id}";
				}
				return;
			}
		</script>
		<form id="deleteForm" action="../webTemplate/deleteClassify.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" id="deleteClassifyId" name="classifyId" value="" />
			<input type="hidden" name="entityId" value="${WtClassify.id}" />
		</form>
	</body>
</html>
<script type="text/javascript">
	/*
	 * 进入新增模板页面
	 */
	function gotoCreateClassify(){
		window.location.href = "../webTemplate/gotoCreateClassify.action?funcCode=${funcCode}&entityId=${WtClassify.id}";
	}
	
	/*
	 * 删除模板
	 */
	function deleteClassify(classifyId, classifyName){
		if(confirm("是否删除栏目：" + classifyName + "？")){
			window.document.getElementById("deleteClassifyId").value = classifyId;
			window.document.getElementById("deleteForm").submit();
		}
	}
	
	/*
	 * 进入修改栏目页面
	 */
	function updateClassify(classifyId){
		window.parent.selectNode(classifyId);
		window.location.href = "../webTemplate/showClassifyInfo.action?funcCode=${funcCode}&entityId=" + classifyId;
	}
	
	/*
	 * 显示父栏目信息
	 */
	function showParentInfo(){
		window.location.href = "../webTemplate/showClassifyInfo.action?funcCode=${funcCode}&entityId=${WtClassify.id}";
	}
	
	/*
	 * 显示栏目子项列表
	 */
	function showClassifyList(classifyId){
		window.parent.selectNode(classifyId);
		window.location.href = "../webTemplate/showChildClassifyList.action?funcCode=${funcCode}&entityId=" + classifyId;
	}
</script>