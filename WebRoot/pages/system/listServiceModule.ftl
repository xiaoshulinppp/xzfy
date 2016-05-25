<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="serviceListForm" method="post">

<@head.head  title="服务管理"/>

<@singleTable.table formName="serviceListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="system" actionName="Service.action" params=""/> 

<@pagnation.pagnation formName="serviceListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listService.action" params="&funcCode=${funcCode}"/>

</form>
</body>
</html>