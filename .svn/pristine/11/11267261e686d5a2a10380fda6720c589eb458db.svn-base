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
				<td height="20">WEB开发子系统 > WEB栏目管理 > 栏目权限管理</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
			<tr>
				<td>“${WtClassify.name}”授权列表</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
			<tr>
				<#if pageState != 'none'>
				<td width="100" class="cardActive">授权列表</td>
				<td width="100" class="cardNormal"><a href="#" class="cardLink" onclick="showClassifyNoneRoleList();">未授权列表</a></td>
				<#else>
				<td width="100" class="cardNormal"><a href="#" class="cardLink" onclick="showClassifyRoleList();">授权列表</a></td>
				<td width="100" class="cardActive">未授权列表</td>
				</#if>
				<td class="cardThZf">&nbsp;</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
			<tr>
				<th class="thListNormal">编号</th>
				<th class="thListNormal">栏目名称</th>
				<th class="thListNormal">角色组织</th>
				<th class="thListNormal">角色名称</th>
				<#if pageState != 'none'>
				<th class="thListNormal">取消授权</th>
				<#else>
				<th class="thListNormal">授权</th>
				</#if>
			</tr>
			<#assign index = 1>
			<#list classifyRoleList as data>
			<tr class="trColor">
				<td class="tdlistCenter">${index}</td>
				<td class="tdlistCenter">${WtClassify.name}</td>
				<td class="tdlistCenter">${data.org.name}</td>
				<td class="tdlistCenter">${data.name}</td>
				<#if pageState != 'none'>
				<td class="tdlistCenter">
					<a href="#" onclick="relieveClassifyRole('${data.id}', '${data.name}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/file_del_new.gif" alt="取消授权" width="16" height="16" border="0" />
					</a>
				</td>
				<#else>
				<td class="tdlistCenter">
					<a href="#" onclick="entitledClassifyRole('${data.id}', '${data.name}');">
						<img src="../${Session['_USER_STYLE_'].imagePath}/sicons/file_modf.gif" alt="授权" width="16" height="16" border="0" />
					</a>
				</td>
				</#if>
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
				<#if pageState != 'none'>
				window.location = "../webTemplate/showClassifyRoleList.action?funcCode=${funcCode}&pageNum=" + mpage  + "&entityId=${WtClassify.id}";
				<#else>
				window.location = "../webTemplate/showClassifyNoneRoleList.action?funcCode=${funcCode}&pageNum=" + mpage  + "&entityId=${WtClassify.id}";
				</#if>
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
					<#if pageState != 'none'>
					window.location = "../webTemplate/showClassifyRoleList.action?funcCode=${funcCode}&pageNum=" + inputPage + "&entityId=${WtClassify.id}";
					<#else>
					window.location = "../webTemplate/showClassifyNoneRoleList.action?funcCode=${funcCode}&pageNum=" + inputPage + "&entityId=${WtClassify.id}";
					</#if>
				}
				return;
			}
		</script>
		<form id="entitledForm" action="../webTemplate/entitledClassifyRole.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="entityId" value="${WtClassify.id}" />
			<input type="hidden" id="entitledRoleId" name="roleId" value="" />
		</form>
		<form id="relieveForm" action="../webTemplate/relieveClassifyRole.action" method="post">
			<input type="hidden" name="funcCode" value="${funcCode}" />
			<input type="hidden" name="entityId" value="${WtClassify.id}" />
			<input type="hidden" id="relieveRoleId" name="roleId" value="" />
		</form>
	</body>
</html>
<script type="text/javascript">
	/*
	 * 显示栏目授权列表
	 */
	function showClassifyRoleList(){
		window.location.href = "../webTemplate/showClassifyRoleList.action?funcCode=${funcCode}&entityId=${WtClassify.id}";
	}
	
	/*
	 * 显示栏目未授权列表
	 */
	function showClassifyNoneRoleList(){
		window.location.href = "../webTemplate/showClassifyNoneRoleList.action?funcCode=${funcCode}&entityId=${WtClassify.id}";
	}
	
	/*
	 * 授权用户
	 */
	function entitledClassifyRole(roleId, roleName){
		if(confirm("是否授权角色：" + roleName)){
			window.document.getElementById("entitledRoleId").value = roleId;
			window.document.getElementById("entitledForm").submit();
		}
	}
	
	function relieveClassifyRole(roleId, roleName){
		if(confirm("是否取消授权角色：" + roleName)){
			window.document.getElementById("relieveRoleId").value = roleId;
			window.document.getElementById("relieveForm").submit();
		}
	}
</script>