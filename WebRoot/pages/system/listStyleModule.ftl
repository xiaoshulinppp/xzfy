<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="styleListForm" method="post">

<@head.head  title="${action.getText('stylelist.title')}"/>

<@singleTable.table formName="styleListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="system" actionName="Style.action" params=""/> 

<@pagnation.pagnation formName="styleListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listStyle.action" params="&funcCode=${funcCode}"/>

</form>
</body>
</html>