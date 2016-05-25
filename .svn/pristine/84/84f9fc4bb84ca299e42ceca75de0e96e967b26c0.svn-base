<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="ptreeListForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
        <td>${action.getText("current.location")}:${action.getText("ptreelist.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("ptreelist.title")}</td>
  </tr>
</table>
 <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td width="10" class="cardNormal"><a href="../system/viewPtree.action?postId=${positionId}&entityId=${parentId}&funcCode=${funcCode}&opName=update" class="cardLink">${action.getText("ptree.ptreebaseinfo")}</a></td>
          <td width="100" class="cardActive">${action.getText("ptree.ptreesubinfo")}</td>
	  <td class="cardTh">&nbsp;</td>
        </tr>
  </table>
  <@singleTableOpen.table formName="ptreeListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="system" actionName="PtreeOpen.action" params="&postId=${positionId}&parentId=${parentId}"/> 

<@pagnation.pagnation formName="ptreeListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listPtree.action" params="&funcCode=${funcCode}&positionId=${positionId}&parentId=${parentId}"/>

<input type ='hidden' name ='positionId' value='${positionId}'>
<input type ='hidden' name ='parentId' value='${parentId}'>
</form>
</body>
</html>