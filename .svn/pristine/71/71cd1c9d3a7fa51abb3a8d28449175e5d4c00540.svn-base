<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="roleListForm" method="post">

<@head.head  title="${action.getText('rolelist.title')}"/>

<@singleTable.table formName="roleListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="user" actionName="Role.action" params="&orgId=${orgId}"/> 

<@pagnation.pagnation formName="roleListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../user/listRole.action" params="&funcCode=${funcCode}&orgId=${orgId}"/>

<input type ='hidden' name ='orgId' value='${orgId}'>
</form>
</body>
</html>