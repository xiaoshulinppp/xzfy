<html>
<head>
<title>${action.getText("platform.name")}</title>
</head>
<frameset id="mainframeset" cols="300,*" border="3" framespacing="3"  borderColor="#0088ff" > 
	<frame frameborder="1" border="1" src="../system/showFunctionTree.action?funcCode=${funcCode}&opName=update" name="leftframe" scrolling="yes" >
	<frame id="mainframe" src="../system/createFunction.action?funcCode=${funcCode}&parentId=0&opName=update" name="mainiframe">
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
