
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">

<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="tableListForm" method="post">

<@head.head  title="${action.getText('mappingtablelist.title')}"/>

<@multiTable.multiTable  formName="tableListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace ="system" actionName="MappingTable.action" params="" mainIdName="tableId"  subUrl="../system/listField.action" subParams=""/>

<@pagnation.pagnation formName="tableListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listMappingTable.action" params="funcCode=${funcCode}"/>

</form>
</body>
</html>