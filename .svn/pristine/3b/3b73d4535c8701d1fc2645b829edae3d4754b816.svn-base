<html>
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title></title>
		<script type="text/javascript" src="../js/jqueryValidForm/js/jquery-1.4.1.min.js"></script>
        <script type="text/javascript" src="../js/jqueryValidForm/js/Validform.js"></script>
	    <link href="../js/jqueryValidForm/css/css.css" type="text/css" rel="stylesheet" />
		<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<form id="functionForm"  action="doupdateUserInfo.action" name="functionForm" method="post" class="registerform">
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
			<tr>
				<td>${action.getText("current.location")}:修改个人资料</td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
			<tr>
				<td height="24" align="center"></td>
			</tr>
		</table>
		<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
				<tr>
					<th class="thFormNormal"></th>
					<th class="thFormNormal">基本信息</th>
				</tr>
				<tr class="trwhite">
					<td class ="tdFormLeft" style="height:57px;">用户名</td>
					<td class="tdFormRight">
					<input type="text" name="userVO.name"  value="${userVO.name?default("")}" class="inputTextNormal" datatype="*" nullmsg="请输入用户名！" /><font color=red>**</font>
					</td>
				</tr>
				<tr class="trwhite">
					<td class="tdFormleft" style="height:57px;">登录名</td>
					<td>
					<input type="text" name="userVO.logName" value="${userVO.logName?default("")}" class="inputTextNormal" disabled ="true"/>
					</td>
				</tr>
				<tr class="trwhite">
					<td class="tdFormleft" style="height:57px;">固定电话</td>
					<td class="tdFormRight">
					<input type="text" name="userVO.phone" value="${userVO.phone?default("")}" class="inputTextNormal" ignore="ignore" datatype="n" errormsg="固定电话格式错误"/>
					</td>
				</tr>
				<tr class="trwhite">
					<td class="tdFormleft" style="height:57px;">手机</td>
					<td class="tdFormRight">
					<input type="text" name="userVO.mphone"  value="${userVO.mphone?default("")}" class="inputTextNormal" ignore="ignore" datatype="m" errormsg="手机号码格式错误！"  />
					</td>
				</tr>
				<tr class="trwhite">
					<td class="tdFormleft" style="height:57px;">地址</td>
					<td class="tdFormRight">
					<input type="text" name="userVO.address"  value="${userVO.address?default("")}" class="inputTextNormal" size="50" ignore="ignore" datatype="s"/>
					</td>
				</tr>
				<tr class="trwhite">
					<td class="tdFormleft" style="height:57px;">邮编</td>
					<td class="tdFormRight">
					<input type="text" name="userVO.postMan"  value="${userVO.postMan?default("")}" class="inputTextNormal" ignore="ignore" datatype="p"  errormsg="邮政编码格式错误！" /> 邮政编码为6位数字
					</td>
				</tr>
				<tr class="trwhite">
					<td class="tdFormleft" style="height:57px;">EMail</td>
					<td class="tdFormRight">
					<input type="text" name="userVO.email"  value="${userVO.email?default("")}" class="inputTextNormal"  />
					</td>
				</tr>
			</table>
		</td>

	</tr>
</table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
			<tr>
				<td><input id="saveid" type="submit" value="提 交" class="button"/> 
				     <!--
					<input id = "initid" name="Button32" type="button" class="button" value="初始化密码" onclick="initPassword()">
				-->
				</td>
			</tr>
		</table>
		<br>
		<script>
			function initPassword() {
				submitDisableButton();
				window.functionForm.action="../user/initUserPassword.action";
				window.functionForm.submit();
			}
function beforeSubmit(){
}
			
$(function(){
	$(".registerform").Validform();
})

		</script>
		<@ww.hidden name ="'funcCode'"/>
		</form>
	</body>
</html>