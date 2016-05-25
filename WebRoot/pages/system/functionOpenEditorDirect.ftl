<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
</head>
    <body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0"marginwidth="0" marginheight="0" >
	  <script language="javascript">
	     function add_sccess(){
	        window.opener.location.reload();
	       
	        alert("操作成功完成");
	       
			window.close();
         }
	  </script>
</body>
</html>
<script language="JavaScript" src="../js/tree/tree.js" object="" style="display:" width = "16",height="16"></script>
<script>
root = window.opener.parent.leftframe.root;


<#if opName == "update">
updateItem(${entityId},"${func.name}");
</#if>
<#if opName == "delete">
deleteItem(${entityId});
</#if>
<#if opName == "create">
alert();
createItem(${funcId},"${func.name}",${parentId});
</#if>
function updateItem(funcId,funcName){
  updateNode(funcId,funcName);
  root.loadAllTabs();
  add_sccess();
}
function updateNode(id,name){
  node = root.findChildById(id);
  if(node != null){
  	node.nameElement.innerHTML = name;
  }
  root.loadAllTabs();  
}

function deleteItem(funcId){
  deleteNode(funcId);
  root.loadAllTabs();
   add_sccess();
}
function deleteNode(id){
  node = root.findChildById(id);
  if(node != null){
  	node.remove();
  }
  root.loadAllTabs();  
}

function createItem(funcId,funcName,parentId){
  createNode(funcId,funcName,parentId);
   add_sccess();
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
 
}
</script>
