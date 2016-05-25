<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>

<form name="orgListForm" method="post">

<@head.head  title="${action.getText('orglist.title')}"/>

<table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr>
          <td width="10" class="cardNormal"><a href="../user/viewOrg.action?orgId=${parentId}&funcCode=${funcCode}&opName=update" class="cardLink">组织基本信息</a></td>
          <td width="100" class="cardActive">子组织列表</td>
	  <td class="cardTh">&nbsp;</td>
        </tr>
  </table>

<@singleTable.table formName="orgListForm" displayInfo=displayInfo funcCode="${funcCode}" pageNum="${pageNum}" nameSpace="user" actionName="OrgOpen.action" params="&parentId=${parentId}"/> 

<@pagnation.pagnation formName="orgListForm" currentPage="${pageNum}" totalPage="${displayInfo.totalPage}" reqUrl="../user/listOrg.action" params="&funcCode=${funcCode}&parentId=${parentId}"/>

<input type ='hidden' name ='parentId' value='${parentId}'>
</form>
</body>
</html>