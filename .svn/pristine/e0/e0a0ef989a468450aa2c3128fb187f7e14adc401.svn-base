<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="dictListForm" method="post">

<@head.head  title="${action.getText('dictlist.title')}"/>
   <#assign maxop = "">
   <#list displayInfo.operationList as op>
       		<#if op.abbr == "update">
       		  <#assign maxop = "update">
       		</#if>
       		<#if op.abbr == "view" && maxop == "">
       		  <#assign maxop = "view">
       		</#if>
   </#list>
<@multiTable.multiTable  formName="dictListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace ="system" actionName="Dictionary.action" params="" mainIdName="dictId"  subUrl="../system/showDictItemFrame.action" subParams="&opName=${maxop}"/>

<@pagnation.pagnation formName="dictListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listDictionary.action" params="funcCode=${funcCode}"/>

</form>
</body>
</html>