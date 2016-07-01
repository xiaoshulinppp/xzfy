<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>表单布局工具</title>
<link href="../${Session["
	_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<Script Language="Javascript" src="js/colorEditor.js"></Script>
<body>
	<form name="'designForm'">
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="yourPlace">
			<tr>
				<td height="20"><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td>您的位置:表单单元编辑器</td>
						</tr>
					</table></td>
			</tr>
		</table>
		<input id="codeButton" class="button" type="button"
			onclick="design();" value="设计" disabled /> <input id="viewButton"
			class="button" type="button" onclick="preview();" value="预览" />
		<div id="designArea" style="display: block;">
			<applet codebase="."
				code="com.iscp.sys.formLayout.view.formLayoutClient.class"
				name="formLayoutClientApplet" ARCHIVE="layoutClient.jar" width="800"
				height="500" hspace="0" vspace="0" align="middle"
				tableName="${req.getParameter('tableName')}";
> </applet>
		</div>
		<div id="viewArea" style="display: none; width: 800; Height: 500"
			width="800" height="500">
			<iframe id="previewer" src="about:blank" width="800" height="500">
			</iframe>
</body>
</html>
<script>

function preview(){
	document.formLayoutClientApplet.preview();
	codeButton = document.getElementById("codeButton");
	viewButton = document.getElementById("viewButton");
	codeButton.disabled=false;
	viewButton.disabled=true;
	viewArea.style.display="block";
	designArea.style.display="none";
}
function design(){
	codeButton = document.getElementById("codeButton");
	viewButton = document.getElementById("viewButton");
	viewButton.disabled=false;
	codeButton.disabled=true;
	viewArea.style.display="none";
	designArea.style.display="block";
}
function change(str){
	document.all('previewer').src="../formlayoutserver?id="+str;
}
cellDesignArea_align = "center";
cellDesignArea_valign = "top";
var editingString;
function setHTMLEditorInnerHTML(str,align,valign){
	var s = new Array(str,align,valign);
	editingString = str;
	returnStrings = window.showModalDialog("contentEditor.htm",s);
	if(returnStrings != null && returnStrings[0]!=null){
		editingString = returnStrings[0];
	}
	document.formLayoutClientApplet.fetchWebEditorResult();
}
function getHTMLEditorInnerHTML(){
	return editingString;
}

</script>