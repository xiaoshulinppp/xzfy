<!--************************************************************ -->
<!--* 文件创建人：祁纲                                         * -->
<!--* 文件创建日期：2006-09-08                                 * -->
<!--************************************************************ -->
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>信息系统构架平台V2.0</title>
<link rel="stylesheet" href="../../css/15B/menu_style.css" type="text/css">
</head>
<body >
<div id="MyMenuTreePanel" class="treeBody"></div>
<script>

var LNoChildIcon = "../../images/15B/treemenuimg/linee.gif";
var LHasChildIcon = "../../images/15B/treemenuimg/adde.gif";
var LOpenedHasChildIcon = "../../images/15B/treemenuimg/subtracte.gif";
var MNoChildIcon = "../../images/15B/treemenuimg/linem.gif";
var MHasChildIcon = "../../images/15B/treemenuimg/addm.gif";
var MOpenedHasChildIcon = "../../images/15B/treemenuimg/subtractm.gif";

var SpaceIcon = "../../images/15B/treemenuimg/space.gif";
var LineSpaceIcon = "../../images/15B/treemenuimg/linespace.gif";

var DefaultClosedFolder="../../images/15B/treemenuimg/closedFolder.gif";
var DefaultOpenedFolder="../../images/15B/treemenuimg/openedFolder.gif";

var RootCanExpand=false;
var DisplayRootFolderIcon=true;
var RootFolderIcon="../../images/15B/treemenuimg/openedFolder.gif";

var DEFAULTICON_WIDTH=16;
var DEFAULTICON_HEIGHT=16;



function MyMenuNode(displayName,childCount,url,folderIcon){
  this.displayName = displayName;
	this.childCount = childCount;
	this.childrenArray = new Array();
  this.table = document.createElement("table");
  this.table.border=0;
  this.table.cellSpacing=0;
  this.table.cellPadding=0;
  this.row = this.table.insertRow();
  this.cell = this.row.insertCell();
  this.isLast = true;

  this.icon = document.createElement("img");
  this.icon.src=LNoChildIcon;
  this.icon.align="absmiddle";
  this.icon.width=DEFAULTICON_WIDTH;
  this.icon.height=DEFAULTICON_HEIGHT;
  this.spaceSpan = document.createElement("span");
  //this.icon.
  this.icon.node = this;
  this.icon.onclick=function(){
    if(childCount>0){
	    if(this.node.childrenDiv.style.display=="block"){
	      this.node.childrenDiv.style.display="none";
	      if(this.node.isLast){
	        this.src = LHasChildIcon;
	      }else{
	        this.src = MHasChildIcon;
	      }
	    }else{
	      this.node.childrenDiv.style.display="block";
	      if(this.node.isLast){
	        this.src = LOpenedHasChildIcon;
	      }else{
	        this.src = MOpenedHasChildIcon
	      }
	    }
    }
  }
  this.cell.appendChild(this.spaceSpan);
  this.cell.appendChild(this.icon);
  this.cell.vAlign="top";
  this.menuIcon = document.createElement("img");
  if(folderIcon=="" || folderIcon==null){
    folderIcon = DefaultClosedFolder;
  }
  this.menuIcon.src=folderIcon;
  this.menuIcon.align="absmiddle";
  this.menuIcon.width=DEFAULTICON_WIDTH;
  this.menuIcon.height=DEFAULTICON_HEIGHT;
  this.cell.appendChild(this.menuIcon);

  this.contentLink = document.createElement("a");
  if(url!=""){
    this.contentLink.href=url;
    this.contentLink.target="mainFrame";
  }
  this.contentLink.innerHTML=this.displayName;
  this.cell.appendChild(this.contentLink);
  childTable = document.createElement("table");
  childTable.border=0;
  childTable.cellSpacing=0;
  childTable.cellPadding=0;
  childRow = childTable.insertRow();
  this.childrenDiv = childRow.insertCell();

  this.childrenDiv.style.display="none";
  this.cell.appendChild(this.childrenDiv);

  this.addChild = function(childNode){
  	this.childrenArray[this.childrenArray.length] = childNode;
  	this.childrenDiv.appendChild(childNode.table);
  }
  this.expand = function(){
  	if(this.childCount>0){
	 	  this.childrenDiv.style.display="block";
	    if(this.isLast){
	      this.icon.src = LOpenedHasChildIcon;
	    }else{
	      this.icon.src = MOpenedHasChildIcon
	    }
    }
  }

  this.shrink = function(){
  	if(this.childCount>0){
	  	this.childrenDiv.style.display="none";
	    if(this.isLast){
	      this.icon.src = LHasChildIcon;
	    }else{
	      this.icon.src = MHasChildIcon;
	    }
    }
  }


}


function expandToTreePath(treeNodeName){
  var node;
  var str = "myMenu";

  if(treeNodeName.length>str.length){
  	eval(str).icon.click();
	  var temp = treeNodeName.substring(9);

	  ss = temp.split("_");

	  for(i=0;i<ss.length;i++){
	    str = str+"_"+ss[i];
	    node = eval(str);
	    node.icon.click();
	  }
  }
}


function expandToLevel(level){
  var str = "myMenu";
  var node = eval(str);
  node.expand();
  expandChildren(node,0,level);
}

function expandChildren(node,currLevel,level){
  var c = currLevel+1;
  var j;
  if(c<level){
  	var count = node.childCount;
  	if(count>0){
		  for(j=0;j<count;j++){
		    var childNode = node.childrenArray[j];
		    childNode.expand();
		    expandChildren(childNode,c,level);
		  }
	  }
  }
}


function loadTree(varname){
  var node = eval(varname);

  if(node.parentNode!=null){
    var tempstr = node.parentNode.spaceSpan.innerHTML;
    if(tempstr!=""){
      node.spaceSpan.innerHTML = tempstr;
    }

    var space = document.createElement("img");
    space.src=LineSpaceIcon;
    space.align="absMiddle";
    space.width=DEFAULTICON_WIDTH
    space.height=DEFAULTICON_HEIGHT
    if(node.parentNode.isLast){
      space.src=SpaceIcon;
    }
    node.spaceSpan.appendChild(space);
  }

  var j;

  if(node.childCount>0){
    if(node.isLast==true){
      node.icon.src = LHasChildIcon;
    }else{
      node.icon.src = MHasChildIcon;
    }
  }
  for(j=1;j<=node.childCount;j++){
    var childvarname = varname+"_"+j;
    var child = eval(childvarname);
    //node.addChild(child);
    //node.childrenDiv.appendChild(child.table);
    child.parentNode = node;
    if(j==node.childCount){
    	child.isLast = true;
      child.icon.src=LNoChildIcon;

    }else{
    	child.isLast = false;
      child.icon.src=MNoChildIcon
    }

    loadTree(childvarname);
    node.addChild(child);
  }
}


myMenu = new MyMenuNode("WebApp FrameWork","3","","","0");
myMenu_1 = new MyMenuNode("领导决策平台管理","6","","","241");
myMenu_1_1 = new MyMenuNode("单位管理","0","deptmanage.do","","281");
myMenu_1_2 = new MyMenuNode("信息分类表维护","0","infosortmanage.do","","301");
myMenu_1_3 = new MyMenuNode("领导桌面布局管理","0","desktopmanage.do","","321");
myMenu_1_4 = new MyMenuNode("授权树管理","0","impowermanage.do","","341");
myMenu_1_5 = new MyMenuNode("Portlet管理","0","portletmanage.do","","441");
myMenu_1_6 = new MyMenuNode("推送管理","0","pushupdatemanage.do","","461");
myMenu_2 = new MyMenuNode("信息上报维护","4","","","261");
myMenu_2_1 = new MyMenuNode("本部门基本信息维护","0","mydeptinfomanage.do","","361");
myMenu_2_2 = new MyMenuNode("IFrame组件维护","0","myiframemanage.do","","381");
myMenu_2_3 = new MyMenuNode("决策支持项维护","0","mysupportitemmanage.do","","401");
myMenu_2_4 = new MyMenuNode("权限树维护","0","myimpowertreemanage.do","","421");
myMenu_3 = new MyMenuNode("系统管理","4","","","1");
myMenu_3_1 = new MyMenuNode("用户管理","0","wafusermanage.do","","2");
myMenu_3_2 = new MyMenuNode("用户组管理","0","wafgroupmanage.do","","3");
myMenu_3_3 = new MyMenuNode("菜单管理","0","wafmenumanage.do","","4");
myMenu_3_4 = new MyMenuNode("角色管理","0","wafrolemanage.do","","5");


function writeTree(){
  loadTree("myMenu");
  //ddd.value=treeNode.table.outerHTML;
  //document.body.appendChild(myMenu.table);
  MyMenuTreePanel.appendChild(myMenu.table);
  //expandToTreePath("treeNode_2_1_1");
  expandToLevel(2);
  var root = eval("myMenu");
  if(!RootCanExpand){
    root.cell.removeChild(root.icon);
  }
  if(!DisplayRootFolderIcon){
    root.cell.removeChild(root.menuIcon);
  }
}

writeTree();


</script>
</div>

</body>
</html>
