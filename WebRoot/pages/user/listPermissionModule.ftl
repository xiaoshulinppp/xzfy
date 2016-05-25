<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="permListForm" method="post">

<@head.head  title="${action.getText('permlist.title')}"/>

<@singleTable.table formName="permListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="user" actionName="Permission.action" params=""/> 

<@pagnation.pagnation formName="permListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../user/listPermission.action" params="&funcCode=${funcCode}"/>

</form>
</body>
</html>