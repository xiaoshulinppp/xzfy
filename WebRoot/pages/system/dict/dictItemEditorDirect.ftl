<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
</head>
<body>
</body>
</html>
<script language="JavaScript" src="../js/tree/tree.js" object="" style="display:" width = "16",height="16"></script>
<script>
root = parent.leftframe.root;


<#if opName == "update">
updateItem(${dictItemId},"${dictItem.name}");
</#if>
<#if opName == "delete">
deleteItem(${dictItemId});
</#if>
<#if opName == "create">
createItem(${dictItemId},"${dictItem.name}",${parentId});
</#if>
function updateItem(dictItemId,dictItemName){
  updateNode(dictItemId,dictItemName);
  root.loadAllTabs();
}
function updateNode(id,name){
  node = root.findChildById(id);
  if(node != null){
  	node.nameElement.innerHTML = name;
  }
  root.loadAllTabs();
  window.location = "./viewDictItem.action?funcCode=${funcCode}&dictId=${dictId}&dictType=${dictType}&dictItemId=${dictItemId}&opName=update";
}

function deleteItem(dictItemId){
  deleteNode(dictItemId);
  root.loadAllTabs();
}
function deleteNode(id){
  node = root.findChildById(id);
  if(node != null){
  	node.remove();
  }
  root.loadAllTabs();
  window.location = "./createDictItem.action?funcCode=${funcCode}&dictId=${dictId}&dictType=${dictType}&dictItemId=0&opName=create";
}

function createItem(dictItemId,dictItemName,parentId){
  createNode(dictItemId,dictItemName,parentId);
}
function createNode(id,name,parentId){
  node = root.findChildById(parentId);
  if(node != null){
     if(node.loaded){
     	if(node.children.length == 0){
     	   node.loaded = false;
     	   node.loadChildren();
     	}
     	else{
		   newNode = node.addNode(name,name);
		   newNode.id = id;
	    }
	 }
	 else{
		node.loadChildren();
	 }
	 newNode = node.findChildById(id);
	 newNode.expandElement.onclick();
  }
  root.loadAllTabs();

   window.location = "./viewDictItem.action?funcCode=${funcCode}&dictId=${dictId}&dictType=${dictType}&dictItemId=${dictItemId}&opName=update";


}
</script>
