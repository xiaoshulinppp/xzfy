<!--************************************************************ -->
<!--* 文件创建人：祁纲                                         * -->
<!--* 文件创建日期：2006-09-08                                 * -->
<!--************************************************************ -->
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}V2.0</title>
<link rel="stylesheet" href="../../${Session["_USER_STYLE_"].cssPath}/menu_style.css" type="text/css">
</head>
<body>

<SCRIPT>

var LNoChildIcon = "../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/linee.gif";
var LHasChildIcon = "../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/adde.gif";
var LOpenedHasChildIcon = "../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/subtracte.gif";
var MNoChildIcon = "../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/linem.gif";
var MHasChildIcon = "../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/addm.gif";
var MOpenedHasChildIcon = "../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/subtractm.gif";

var SpaceIcon = "../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/space.gif";
var LineSpaceIcon = "../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/linespace.gif";

var DefaultClosedFolder="../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif";
var DefaultOpenedFolder="../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/openedFolder.gif";

var RootCanExpand=false;
var DisplayRootFolderIcon=true;
var RootFolderIcon="../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/openedFolder.gif";
var DEFAULTICON_WIDTH=19;
var DEFAULTICON_HEIGHT=19;


function MyMenuNode(displayName,childCount,url,folderIcon,menuId){
  this.displayName = displayName;
	this.childCount = childCount;
  this.menuId = menuId;
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
  this.contentLink.href="javascript:editCurrMenu('"+menuId+"')";
  this.contentLink.className="myMenu";
  this.contentLink.node=this;
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
    space.width=DEFAULTICON_WIDTH;
    space.height=DEFAULTICON_HEIGHT;
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
      child.icon.src=MNoChildIcon;
    }

    loadTree(childvarname);
    node.addChild(child);
  }
}


myMenu = new MyMenuNode("菜单项","3","javascript:editCurrMenu('0')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/computer3.gif","0");
myMenu_1 = new MyMenuNode("系统管理","5","javascript:editCurrMenu('1')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/openedFolder.gif","1");
myMenu_1_1 = new MyMenuNode("用户管理","0","javascript:editCurrMenu('2')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","2");
myMenu_1_2 = new MyMenuNode("用户组管理","0","javascript:editCurrMenu('3')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","3");
myMenu_1_3 = new MyMenuNode("菜单管理","0","javascript:editCurrMenu('4')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","4");
myMenu_1_4 = new MyMenuNode("角色管理","0","javascript:editCurrMenu('5')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","5");
myMenu_1_5 = new MyMenuNode("日志管理","0","javascript:editCurrMenu('6')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","6");
myMenu_2 = new MyMenuNode("系统管理new","5","javascript:editCurrMenu('55401')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/openedFolder.gif","55401");
myMenu_2_1 = new MyMenuNode("用户管理","0","javascript:editCurrMenu('55402')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","55402");
myMenu_2_2 = new MyMenuNode("角色管理","0","javascript:editCurrMenu('55404')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","55404");
myMenu_2_3 = new MyMenuNode("组织结构管理","0","javascript:editCurrMenu('55403')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","55403");
myMenu_2_4 = new MyMenuNode("菜单管理","0","javascript:editCurrMenu('55422')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","55422");
myMenu_2_5 = new MyMenuNode("日志管理","0","javascript:editCurrMenu('55421')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","55421");
myMenu_3 = new MyMenuNode("网站管理","5","javascript:editCurrMenu('50001')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/openedFolder.gif","50001");
myMenu_3_1 = new MyMenuNode("信息发布管理","0","javascript:editCurrMenu('50021')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","50021");
myMenu_3_2 = new MyMenuNode("域管理","0","javascript:editCurrMenu('55361')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","55361");
myMenu_3_3 = new MyMenuNode("Portlet管理","0","javascript:editCurrMenu('50041')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","50041");
myMenu_3_4 = new MyMenuNode("页面管理","0","javascript:editCurrMenu('55362')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","55362");
myMenu_3_5 = new MyMenuNode("页面模板管理","0","javascript:editCurrMenu('55363')","../../${Session["_USER_STYLE_"].imagePath}/treemenuimg/closedFolder.gif","55363");



</SCRIPT>

 <DIV id="menuTreeContainer" class="treeBody"></DIV><BR></DIV>

<SCRIPT>
function writeTree(){
  loadTree("myMenu");
  //ddd.value=treeNode.table.outerHTML;
  //document.body.appendChild(myMenu.table);
  menuTreeContainer.appendChild(myMenu.table);
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
</SCRIPT>

<SCRIPT>

function editMenu(){
   var menuId = menuHandleForm.menuId.value;
   var feature = "dialogWidth:600px;dialogHeight:360px;scroll:no;status:no;help:no;center:1";
   window.showModalDialog("wafmenumanage.do?funcid=editmenu&menuId="+menuId,window, feature);
//   window.open("wafmenumanage.do?funcid=editmenu&menuId="+menuId);
}

function editCurrMenu(menuId){
	  var feature = "dialogWidth:600px;dialogHeight:360px;scroll:no;status:no;help:no;center:1";
   window.showModalDialog("wafmenumanage.do?funcid=editmenu&menuId="+menuId,window, feature);
}

function deleteMenu(){
   if(confirm("请确认是否删除")){
      var menuId = menuHandleForm.menuId.value;
      document.menuHandleForm.method ="POST";
      document.menuHandleForm.action ="wafmenumanage.do?funcid=deletemenu";
      document.menuHandleForm.submit();
   }
}

function newMenu(){
   var menuId = menuHandleForm.menuId.value;
   var feature = "dialogWidth:600px;dialogHeight:400px;scroll:no;status:no;help:no;center:1";
   window.showModalDialog("wafmenumanage.do?funcid=newmenu&menuId="+menuId,window, feature);
//   window.open("wafmenumanage.do?funcid=newmenu&menuId="+menuId);
}


</SCRIPT>
<!--<div style="DISPLAY: none" id="popContent">
<table border="1">
  <tr>
    <td onclick="parent.editMenu()" style="cursor: hand;font-size: 9pt;">修改</td>
  </tr>
  <tr>
    <td onclick="parent.newMenu()" style="cursor: hand;font-size: 9pt;">添加子菜单</td>
  </tr>
  <tr id="deleteMenuRightMenu">
    <td onclick="parent.deleteMenu()" style="cursor: hand;font-size: 9pt;">删除</td>
  </tr>
</table>
</div>-->
<DIV id=popContent style="DISPLAY: none">
<TABLE class=mTabOut cellSpacing=0 cellPadding=2 width="100%" border=0>
  <TBODY>
  <TR id=editMenuRightMenu>
    <TD class=mTdList onMouseOver="this.className='mTdListOver'" 
    onclick=parent.editMenu() onMouseOut="this.className='mTdList'">编 辑</TD></TR>
  <TR id=newMenuRightMenu>
    <TD class=mTdList onMouseOver="this.className='mTdListOver'" 
    onclick=parent.newMenu() onMouseOut="this.className='mTdList'">添加子菜单</TD></TR>
  <TR id=deleteMenuRightMenu>
    <TD class=mTdList onMouseOver="this.className='mTdListOver'" 
    onclick=parent.deleteMenu() onMouseOut="this.className='mTdList'">删 
  除</TD></TR></TBODY></TABLE></DIV>
<FORM id=menuHandleForm name=menuHandleForm><INPUT type=hidden name=menuId> 
</FORM>
<SCRIPT>
var currMenuID="0";
var popupHeight=70;
var popupMenu = window.createPopup();


function rightClickPage(){
  popupHeight=60;
  if(event.srcElement.className=="myMenu"){

    menuHandleForm.menuId.value=event.srcElement.node.menuId;
    if(event.srcElement.node.menuId=="0"){
      editMenuRightMenu.style.display="none";
      deleteMenuRightMenu.style.display="none";
      popupHeight=20;
    }else{
      if(event.srcElement.node.childCount>0){
        editMenuRightMenu.style.display="block";
        newMenuRightMenu.style.display="block";
      	deleteMenuRightMenu.style.display="none";
      	popupHeight=38;
    	}else{
        editMenuRightMenu.style.display="block";
        newMenuRightMenu.style.display="block";
      	deleteMenuRightMenu.style.display="block";
        popupHeight=56;
    	}
    }


    var lefter = event.clientY;
    var topper = event.clientX;
    if(topper+popupHeight>window.dialogHeight){
      topper = topper-popupHeight;
    }
    var StyleMenuHeader="<link href='css/rightmenu_style.css' rel='stylesheet' type='text/css'>";
    popupMenu.document.open();
    popupMenu.document.write(StyleMenuHeader+popContent.innerHTML);
    popupMenu.document.close();
    popupMenu.show(topper, lefter, 100, popupHeight, document.body);
    return false;
  }
  return true;
}

function closePopup(){
  popupMenu.hide();
}
</SCRIPT>

<SCRIPT>
if (document.all && window.print) {
document.oncontextmenu = rightClickPage;
document.body.onmouseup = closePopup;
//document.body.onclick = hideFolderHandleMenu;
}
</SCRIPT>

</body>
</html>
