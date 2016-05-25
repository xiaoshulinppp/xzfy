<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="userListForm" method="post">

<@head.head  title="${action.getText('userlist.title')}"/>

<@singleTable.table formName="userListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="user" actionName="User.action" params="&orgId=${orgId}"/> 

<@pagnation.pagnation formName="userListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../user/listUser.action" params="&funcCode=${funcCode}&orgId=${orgId}"/>

<input type ='hidden' name ='orgId' value='${orgId}'>
</form>
</body>
</html>
