<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<title>信息采集报送平台</title>
		<link href="../css/${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
		<link type="text/css" rel="stylesheet" href="../plugs/zTree3.1/zTreeStyle/zTreeStyle.css">
		<script type="text/javascript" src="../plugs/zTree3.1/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="../plugs/zTree3.1/jquery.ztree.core-3.1.js"></script>
	</head>
	<script type="text/javascript">
		var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "pId"
				}
			},
			callback: {
				onClick: setClassifyId
			},
			key: {
				children: "nodes"
			}
		};
		
		var zNodes = ${treeData};
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDiv"), setting, zNodes);
			var treeObj = $.fn.zTree.getZTreeObj("treeDiv");
			var node = treeObj.getNodeByParam("id",${classifyId},null);
			treeObj.selectNode(node);
			treeObj.expandNode(node, true, false, false);
		});
		
		function setClassifyId(event, treeId, treeNode){
			window.parent.setClassifyId(treeNode.id);
		}
		
		function selectNode(treeNodeId){
			var treeObj = $.fn.zTree.getZTreeObj("treeDiv");
			var node = treeObj.getNodeByParam("id",treeNodeId,null);
			treeObj.selectNode(node);
			treeObj.expandNode(node, true, false, false);
		}
	</script>
	<body>
		<div>
			<ul id="treeDiv" class="ztree"></ul>
		</div>
	</body>
</html>