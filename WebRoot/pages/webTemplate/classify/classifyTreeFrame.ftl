<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
			function setClassifyId(nodeId){
				var url = "../webTemplate/showClassifyInfo.action?funcCode=${funcCode}&entityId=" + nodeId;
				window.document.getElementById("classifyData").src = url;
			}
			
			function refreshTree(nodeId){
				var url = "../webTemplate/showClassifyTree.action?funcCode=${funcCode}&classifyId=" + nodeId;
				window.document.getElementById("classifyTree").src = url;
			}
			
			function selectNode(treeNodeId){
				window.document.getElementById("classifyTree").contentWindow.selectNode(treeNodeId);
			}
		</script>
		<frameset cols="260,*" border="3" framespacing="3" borderColor="#28746a" >
			<frame id="classifyTree" src="../webTemplate/showClassifyTree.action?funcCode=${funcCode}" frameborder="1" border="1" scrolling="yes" />
			<frame id="classifyData" src="../webTemplate/showClassifyInfo.action?funcCode=${funcCode}&entityId=${classifyId?default(0)}" />
		</frameset>
	</head>
	<noframes>
		<body>
		</body>
	</noframes>
</html>