<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/tree/style.css" type="text/css">
<title>${action.getText("platform.name")}</title>
</head>
<body>
<div style="display:none">
<IMG id= "exampleImg_" src="tree_close.gif" onclick=""></IMG>
<a id="exampleA_" object="" onclick=""></a>
</div>
<div id= "tree_node" style="margin-top:-4; margin-bottom:0"></div>
<div id = "tree_" class="normaltext" valign="middle">
</div>
</body>
</html>
<script language="JavaScript" src="../js/tree/tree.js" object="" style="display:" width = "16",height="16"></script>
<script>
tree = document.getElementById("tree_");
treeGlobe = new TreeGlobe();
treeGlobe.rootPath="../js/tree/";
treeGlobe.init(document.getElementById("exampleImg_"),document.getElementById("exampleA_"),
"tree_expand.gif",
"tree_close.gif",
"tree_expand_a.gif",
"tree_close_a.gif",
"tree_line_a.gif",
"tree_line_b.gif",
"tree_line_c.gif",
"tree_blank.gif",
"tree_node_open.gif",
"tree_node_close.gif");

allNodes = new Array(0);
treeGlobe.modifyNode = function(node,name,value,parent){
	if(node != null){
		node.entityid = ${entityId};
		node.nameElement.onclick=setValue;
		if(node.parent != null){
		   node.innerHTML = "<b>"+node.innerHTML+"</b>";
		}
		<#if multiSelect == "true">
		if(node.parent != null){
			checkboxElement = document.createElement("INPUT");
			checkboxElement.setAttribute("type","checkbox");
			textElement = document.createTextNode(name);
			node.nameElement.innerHTML = "";
			node.nameElement.appendChild(checkboxElement);
			node.nameElement.appendChild(textElement);
			node.extend = checkboxElement;
			allNodes[allNodes.length] = node;
		}
		</#if>
	}
}
fieldId = opener.document.getElementById("${fieldId}");
fieldName = opener.document.getElementById("${fieldName}");
<#if multiSelect == "true">
function setValue(){
	name = "";
	value = "";
	for(i=0;i<allNodes.length;i++){
		if(allNodes[i] != null && allNodes[i].extend != null){
			if(allNodes[i].extend.checked){
				if(name == "" || value == ""){
					name =allNodes[i].name;
					value =allNodes[i].value;
				}
				else{
					name +=","+allNodes[i].name;
					value +=","+allNodes[i].value;
				}
			}
		}
	}
	fieldName.value = name;
	fieldId.value = value;
}
</#if>
<#if multiSelect != "true">
function setValue(){
	node = this.object;
	fieldName.value = node.value;
	fieldId.value = node.name;
	window.close();
}
</#if>
serverUrl = "./selectFuncServer.action?funcCode=${funcCode}";

//
treeGlobe.treeNodeElement = document.getElementById("tree_node");
<#if function?has_content>
root = treeGlobe.createTreeNode("${function.name}",1,null);
<#else>
root = treeGlobe.createTreeNode("$功能树",1,null);
</#if>
root.id = 0;
root.entityid = ${entityId};
root.entityabbr="";
tree.appendChild(root.nodeElement);
root.treeNodeOpenElement = treeGlobe.initImage(document.getElementById("exampleImg_"),"tree_root.gif");
root.treeNodeCloseElement = root.treeNodeOpenElement.cloneNode();
root.expandElement.onclick();
</script>