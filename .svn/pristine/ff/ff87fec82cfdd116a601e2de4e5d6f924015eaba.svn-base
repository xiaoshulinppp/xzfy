<html>
	<head>
		<meta HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=UTF-8">
		<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="css/login/login_style.css" rel="stylesheet" type="text/css">
	</head>
	<script language="JavaScript">
		function document.onkeydown(){  
			var e=event.srcElement;     
			if(event.keyCode==13){     
				document.getElementById("imageField").click();     
				return false;     
			}     
		}
		
		function init() {
			document.getElementById("username").focus();
			document.getElementById("username").select();
		}
	</script>
	<body onload='init()'>
		<#include "/common/actionerrors.ftl">
		${errorString?default('')}
		<@ww.form name="'loginForm'" action="'loginPlatorm'" validate="'true'" method="'post'" >
		<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					<table width="475" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<img src="images/login/pic_logintitle.gif" width="475" height="124">
							</td>
						</tr>
						<tr>
							<td>
								<img src="images/login/pic_userpw.gif" width="475" height="38">
							</td>
						</tr>
						<tr>
							<td height="30" background="images/login/bg_login_userpw.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td align="right">
											<@ww.textfield id="'username'" name="'username'"  cssClass="'inputtext'" value = "'admin'" theme="simple" onclick="'this.focus();this.select()'"/>
										</td>
										<td width="20">&nbsp;</td>
										<td>
											<@ww.password  name="'password'" cssClass="'inputtext'" show="'true'" value ="'password' "theme="simple" onclick="'this.focus();this.select()'"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="27" align="center" background="images/login/bg_login_words.gif"></td>
						</tr>
						<tr>
							<td height="38" background="images/login/bg_login_butn.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td align="center">
											<input id="imageField" name="imageField" type="image" src="images/login/button_login.gif" width="220" height="35" border="0">
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<img src="images/login/pic_login_bot.gif" width="475" height="22">
							</td>
						</tr>
					</table>
					<table width="527" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="40">&nbsp;</td>
						</tr>
						<tr>
							<td height="37" align="center" background="images/login/bg_login_vbot.gif" style="color:#FFFFFF;"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</@ww.form>
	</body>
</html>
