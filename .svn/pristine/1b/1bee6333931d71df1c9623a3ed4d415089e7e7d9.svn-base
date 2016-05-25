( function() {
	if (!window.xyTree)
		window.xyTree = {};
})();

xyTree.TreeConfigNormal = {
	rootIcon : '../plugs/xyTree-4.1/images/foldericon.gif',
	openRootIcon : '../plugs/xyTree-4.1/images/openfoldericon.gif',
	folderIcon : '../plugs/xyTree-4.1/images/foldericon.gif',
	openFolderIcon : '../plugs/xyTree-4.1/images/openfoldericon.gif',
	fileIcon : '../plugs/xyTree-4.1/images/file.gif',
	iIcon : '../plugs/xyTree-4.1/images/I.gif',
	lIcon : '../plugs/xyTree-4.1/images/L.gif',
	lMinusIcon : '../plugs/xyTree-4.1/images/Lminus.gif',
	lPlusIcon : '../plugs/xyTree-4.1/images/Lplus.gif',
	tIcon : '../plugs/xyTree-4.1/images/T.gif',
	tMinusIcon : '../plugs/xyTree-4.1/images/Tminus.gif',
	tPlusIcon : '../plugs/xyTree-4.1/images/Tplus.gif',
	blankIcon : '../plugs/xyTree-4.1/images/blank.gif',
	defaultText : 'Tree Item',
	defaultAction : 'javascript:void(0);',
	defaultBehavior : 'classic',
	usePersistence : true,
	jianju1 : '4px'
};
// 添加一个全局变量2007/06/15
xyTree.defaultNodeClickAction = "xyTree.defaultNodeClickAction";// 懒得取值

// div树类
// =====================================================================
xyTree.DivTreeNormal = function(name, img) {
	this.img;
	if (img)
		this.img = img;

	var objectname = this.getName();
	this.tree = new xyTree.TreeNormal(name, objectname);
	this.tree.divtree = this;
	this.div = this.creatediv();
}

xyTree.DivTreeNormal.count = 0;

xyTree.DivTreeNormal.prototype.getName = function() {
	var s = "xytreenormalid";
	s += (window.xyTree.DivTreeNormal.count++);
	return s;
}

xyTree.DivTreeNormal.prototype.add = function(node) {
	this.tree.add(node);
}

xyTree.DivTreeNormal.prototype.init = function(funClickNode, funClickRootNode) {
	var div = this.div.lastChild;
	// 把所有的一级节点列出来
	// 首先得到所有的一级节点
	var root = this.tree.root;
	var arr = root.child;
	for ( var i = 0; i < arr.length; i++)
		div.appendChild(arr[i].innerhtml());

	this.clickNode = funClickNode ? funClickNode : this.defaultClickNode;
	this.clickRootNode = funClickRootNode ? funClickRootNode
			: this.defaultClickRootNode;
}

xyTree.DivTreeNormal.prototype.creatediv = function() {
	var divtree = this;
	var div = document.createElement('div');
	div.className = 'treeyangshi';

	var divhead = document.createElement('div');
	var img = document.createElement('img');

	if (!this.img) {
		img.src = xyTree.TreeConfigNormal.openRootIcon;
		img.onclick = function() {
			var divbody = this.parentNode.parentNode.lastChild;
			if (divbody.style.display == 'block') {
				divbody.style.display = 'none';
				img.src = xyTree.TreeConfigNormal.rootIcon;
			} else {
				divbody.style.display = 'block';
				img.src = xyTree.TreeConfigNormal.openRootIcon;
			}
		}
	} else {
		img.src = this.img;
		img.className = 'treeyangshiImg';
		img.onclick = function() {
			var divbody = this.parentNode.parentNode.lastChild;
			if (divbody.style.display == 'block') {
				divbody.style.display = 'none';
				// img.src = xyTree.TreeConfigNormal.rootIcon;
			} else {
				divbody.style.display = 'block';
				// img.src = xyTree.TreeConfigNormal.openRootIcon;
			}
		}
	}

	img.align = "absbottom";
	divhead.appendChild(img);

	var qj = this.tree.objectname; // 得到全局对象的名称
	var a = document.createElement('a');
	a.href = 'javascript:void(0);';
	a.onclick = function() {
		divtree.clickRootNode();
	};
	a.onfocus = function() {
		this.blur();
	}
	a.appendChild(document.createTextNode(this.tree.treename));
	a.style.marginLeft = xyTree.TreeConfigNormal.jianju1;

	divhead.appendChild(a);
	div.appendChild(divhead);

	var divbody = document.createElement('div');
	divbody.style.display = 'block';
	div.appendChild(divbody);

	return div;
}

xyTree.DivTreeNormal.prototype.hideTreeBody = function() {
	this.div.lastChild.style.display = 'none';
	if (!this.img) {
		this.div.firstChild.firstChild.src = xyTree.TreeConfigNormal.rootIcon;
	}
}

xyTree.DivTreeNormal.prototype.showTreeBody = function() {
	this.div.lastChild.style.display = 'block';
	if (!this.img) {
		this.div.firstChild.firstChild.src = xyTree.TreeConfigNormal.openRootIcon;
	}
}

/**
 * 缺省的单击节点的行为，相当于单击文件夹
 * 
 * @param {xyTree.Node}
 *            node 被单击的节点
 */
xyTree.DivTreeNormal.prototype.defaultClickNode = function(node) {
	node.getHtmlElementFoldImg().onclick();
}

/**
 * 缺省的单击根节点的行为，相当于单击根节点复选框
 */
xyTree.DivTreeNormal.prototype.defaultClickRootNode = function() {
	this.div.firstChild.firstChild.onclick();
}

/**
 * 根据id寻找一个节点，用户必须给每个节点设id属性，并保证它的唯一性
 * 
 * @param {String ||
 *            int} id 待寻找节点的id
 * @return 想找的节点
 * @type xyTree.Node
 */
xyTree.DivTreeNormal.prototype.findOneNodeById = function(id) {
	for ( var i = 0; i < this.tree.treeArray.length; i++) {
		if (this.tree.treeArray[i].id) {
			if (this.tree.treeArray[i].id == id)
				return this.tree.treeArray[i];
		}
	}
	return null;
}
