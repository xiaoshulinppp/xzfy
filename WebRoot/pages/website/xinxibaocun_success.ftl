<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>行政复议信息管理系统</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<link href="../${Session['_USER_STYLE_'].cssPath}/notice_style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	<input type="hidden" name="funcCode" value="${funcCode}" />

	</body>
</html>
<script type="text/javascript">
	alert("提交成功！")
	window.location="xinXiBaoSong.action?funcCode=${funcCode}";
</script>