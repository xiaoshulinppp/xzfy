<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="opListForm" method="post">
<@head.head  title="${action.getText('oplist.title')}"/>

<@singleTable.table formName="opListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="user" actionName="Operation.action" params=""/> 

<@pagnation.pagnation formName="opListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../user/listOperation.action" params="&funcCode=${funcCode}"/>


</form>
</body>
</html>