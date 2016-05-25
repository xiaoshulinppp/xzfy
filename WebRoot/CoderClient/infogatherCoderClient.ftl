<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>
${action.getText("platform.name")}
</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form  name="'relationForm'">
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10); z-index:1; left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" id="control">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
          <td>${action.getText("current.location")}:${action.getText("relation.title")}</td>
      </tr>
    </table></td>
  </tr>
</table>
<applet
  codebase = "."
  code     = "com.iscp.sys.coderClient.InfoGatherMapTool.class"
  name     = "关联关系管理客户端"
  ARCHIVE  = "../CoderClient/coderClient.jar"
  width    = "800"
  height   = "600"
  hspace   = "0"
  vspace   = "0"
  align    = "middle"
  position = "<#list positionList as pos>${pos.abbr}[${pos.name}]</#list>"
  generateTemplate="${generateTemplate}"
>
</applet>
</div>
</form>
</body>
</html>
<script>
function openFormDesign(table){
	var s = new Array(table);
	window.showModalDialog("../formDesigner/formLayoutDialog.htm",s);
}
</script>