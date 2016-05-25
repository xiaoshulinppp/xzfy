<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="funcListForm" method="post">

<@head.head  title="${action.getText('funclist.title')}"/>

 <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td width="10" class="cardNormal"><a href="../system/viewFunction.action?funcId=${parentId}&funcCode=${funcCode}&opName=update" class="cardLink">${action.getText("func.funcbaseinfo")}</a></td>
          <td width="100" class="cardActive">${action.getText("func.funcsubinfo")}</td>
	  <td class="cardTh">&nbsp;</td>
        </tr>
  </table>
  
<@singleTableOpen.table formName="funcListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="system" actionName="FunctionOpen.action" params="&parentId=${parentId}"/> 

<@pagnation.pagnation formName="funcListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listFunciton.action" params="&funcCode=${funcCode}&parentId=${parentId}"/>

<input type ='hidden' name ='parentId' value='${parentId}'>
</form>
</body>
</html>