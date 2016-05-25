<html>
<head>
<title>${action.getText("platform.name")}</title>
</head>
<frameset id="mainframeset" cols="300,*" border="3" framespacing="3"  borderColor="#0088ff" > 
<#if dictTableName?has_content && dictTableName!="">
<frame frameborder="1" border="1" src="../system/showDictItemTreeByNewTable.action?funcCode=${funcCode}&entityId=${dictId}&opName=${opName}" name="leftframe" scrolling="yes" >
	<frame id="mainframe" src="../system/createDictItemByNewTable.action?funcCode=${funcCode}&dictId=${dictId}&parentId=0&opName=update" name="mainiframe">

<#else>
		<frame frameborder="1" border="1" src="../system/showDictItemTree.action?funcCode=${funcCode}&entityId=${dictId}&opName=${opName}" name="leftframe" scrolling="yes" >
	<frame id="mainframe" src="../system/createDictItemNew.action?funcCode=${funcCode}&dictId=${dictId}&parentId=0&opName=update" name="mainiframe">
</#if>
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
