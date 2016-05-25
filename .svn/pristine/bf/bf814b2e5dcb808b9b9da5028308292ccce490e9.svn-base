<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="dictItemListForm" method="post">
<@head.head  title="${action.getText('dictitemlist.title')}"/>
<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td width="10" class="cardNormal"><a href="../system/viewDictItemNew.action?dictId=${dictId}&entityId=${parentId}&funcCode=${funcCode}&opName=update&dictType=0" class="cardLink">${action.getText("dictitem.dictitembaseinfo")}</a></td>
          <td width="100" class="cardActive">${action.getText("dictitem.dictitemsubinfo")}</td>
	  <td class="cardTh">&nbsp;</td>
        </tr>
  </table>
<@singleTableOpen.table formName="dictItemListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="system" actionName="DictItemOpen.action" params="&dictId=${dictId}&parentId=${parentId}"/> 
 
<@pagnation.pagnation formName="dictItemListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../system/listDictItem.action" params="funcCode=${funcCode}&dictId=${dictId}&parentId=${parentId}"/>

<input type ='hidden' name ='dictId' value='${dictId}'>
<input type ='hidden' name ='parentId' value='${parentId}'>
</form>
</body>
</html>