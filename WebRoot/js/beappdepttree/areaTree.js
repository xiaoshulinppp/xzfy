var loadingNode;

function TreeNode(){
	var nodeElement;
	var nameElement;
	var childrenElement;
	var childrenListElement;
	var expandElement;
	var collapseElement;
	var expand_a_Element;
	var collapse_a_Element;
	var treeNodeHeadElement;
	var treeNodeOpenElement;
	var treeNodeCloseElement;
	var tab;
	var parent;
	var children;
	var childrenSize = 0;
	var tabImg;
	var tabImgSelect;
	var tg;
	var loaded;
	var id;
	var entityid;
	var entityabbr;
	var value;
	var name;
	var extend;

	this.init = function(name,tg,tab,parent,value){//change at hw this.init = function(name,tg,tab,parent,value)
		this.tg = tg;
		this.name = name;
		this.value = value;
		this.loaded = false;
		this.parent = parent;
		this.children = new Array(0);
		this.childrenSize = 0;
		this.tab = tab;
		this.tabImg = new Array(this.tab);
		this.tabImgSelect = new Array(this.tab);
		this.expandElement = tg.expandElement.cloneNode();
		this.expandElement.object=this;
		this.expandElement.onclick=this.expand;
		this.collapseElement = tg.collapseElement.cloneNode();
		this.collapseElement.object=this;
		this.collapseElement.onclick=this.collapse;
		this.expand_a_Element = tg.expand_a_Element.cloneNode();
		this.expand_a_Element.object=this;
		this.expand_a_Element.onclick=this.expand;
		this.collapse_a_Element = tg.collapse_a_Element.cloneNode();
		this.collapse_a_Element.object=this;
		this.collapse_a_Element.onclick=this.collapse;
		this.treeNodeHeadElement = document.createElement("A");
		this.treeNodeOpenElement = tg.treeNodeOpenElement.cloneNode();
		this.treeNodeCloseElement = tg.treeNodeCloseElement.cloneNode();
		this.nameElement = tg.aElement.cloneNode();
		this.nameElement.object = this;
		this.nameElement.onclick = this.event;
		this.nameElement.innerHTML = name;
		this.nameElement.style.height=18;
		//this.nameElement.style.color="red";
		this.nameElement.style.color="black";
		this.nameElement.setAttribute("valign","middle");
		this.nameElement.style.valign="middle";
		this.childrenElement = tg.treeNodeElement.cloneNode();
		this.childrenElement.style.display="none";
		this.nodeElement = tg.treeNodeElement.cloneNode();
		for(i = 0;i<this.tab;i++){
			this.tabImg[i] = document.createElement("A");
			this.tabImgSelect[i] = new Array(4);
			this.tabImgSelect[i][0] = this.expandElement;
			this.tabImgSelect[i][1] = this.expand_a_Element;
			this.tabImgSelect[i][2] = tg.linecElement.cloneNode();
			this.tabImgSelect[i][3] = tg.blankElement.cloneNode();
			this.tabImgSelect[i][4] = tg.lineaElement.cloneNode();
			this.tabImgSelect[i][5] = tg.linebElement.cloneNode();
			this.nodeElement.appendChild(this.tabImg[i]);
		}
		this.loadTabs();
		this.treeNodeHeadElement.appendChild(this.treeNodeCloseElement)
		this.nodeElement.appendChild(this.treeNodeHeadElement);
		this.nodeElement.appendChild(this.nameElement);
		this.nodeElement.appendChild(this.childrenElement);
	}
	this.findChildById = function(id){
		return this.findChildById(id,0);
	}

	this.findChildById = function(id,deep){
		if(deep == null){
			deep = 0;
		}
		if(this.id == id){
			return this;
		}
		if(deep>60){
			return null;
		}
		for(var i = 0;i<this.childrenSize;i++){
			result = null;
			if(this != this.children[i]){
				result = this.children[i].findChildById(id,deep+1);
			}
			if(result != null){
				return result;
			}
		}
		return null;
	}

	this.event = function(){
	}

	this.loadAllTabs = function(){
		if(this.children.length == 0){
			this.childrenElement.style.display="none";
		}
		this.loadTabs();
		for(var i= 0;i<this.children.length;i++){
			if(this.children[i] != null){
				this.children[i].loadAllTabs();
			}
		}
	}

	this.loadTabs = function(){
		p = this;
		for(var i =this.tab-1;i>=0;i--){
			this.tabImg[i].innerHTML ="";
			if(p.isLastChild()){
				if(p == this){
					if(this.children.length == 0 && this.loaded){
						this.tabImg[i].appendChild(this.tabImgSelect[i][5]);
					}
					else{
						this.tabImg[i].appendChild(this.tabImgSelect[i][1]);
					}
				}
				else{
					this.tabImg[i].appendChild(this.tabImgSelect[i][3]);
				}
			}
			else{
				if(p == this){
					if(this.children.length == 0 && this.loaded){
						this.tabImg[i].appendChild(this.tabImgSelect[i][4]);
					}
					else{
						this.tabImg[i].appendChild(this.tabImgSelect[i][0]);
					}
				}
				else{
					this.tabImg[i].appendChild(this.tabImgSelect[i][2]);
				}
			}
			p = p.parent;
		}
	}

	this.isLastChild = function(){
		if(this.parent != null){
			if(this.parent.childrenSize > 0 && this.parent.children[this.parent.childrenSize-1] == this){
				return true;
			}
			return false;
		}
		return true;
	}

	this.remove = function(){
		children = this.parent.children;
		newChildren = new Array(0);
		for(var i = 0;i<this.parent.childrenSize;i++){
			if(children[i] != this){
				newChildren[newChildren.length] = children[i];
			}
		}
		this.parent.children = newChildren;
		this.parent.childrenSize --;
		this.parent.childrenElement.removeChild(this.nodeElement);
	}

	this.addNode = function(name,value){//change at hw this.addNode = function(name,value){
		node = this.tg.createTreeNode(name,this.tab+1,this,value);//change at hw node = this.tg.createTreeNode(name,this.tab+1,this,value);
		this.childrenElement.appendChild(node.nodeElement);
		this.children[this.childrenSize] = node;
		this.childrenSize++;
		if(this.childrenSize>1){
			this.children[this.childrenSize-2].loadTabs();
		}
		node.loadTabs();
		return node;
	}

	this.loadChildren = function(){
		if(this.loaded){
			return;
		}
		this.tg.loadChildrenAjax(this);
	}


	this.expand = function(){
		o = this.object;
		o.loadChildren();
		o.tabImgSelect[o.tab-1][1] = o.collapse_a_Element;
		o.tabImgSelect[o.tab-1][0] = o.collapseElement;
		o.treeNodeHeadElement.innerHTML = "";
		o.treeNodeHeadElement.appendChild(o.treeNodeOpenElement)
		o.loadTabs();
		if(o.childrenElement.childNodes.length>0){
			o.childrenElement.style.display="block";
		}
	}
	this.collapse = function(){
		o = this.object;
		o.tabImgSelect[o.tab-1][1] = o.expand_a_Element;
		o.tabImgSelect[o.tab-1][0] = o.expandElement;
		o.treeNodeHeadElement.innerHTML = "";
		o.treeNodeHeadElement.appendChild(o.treeNodeCloseElement)
		o.loadTabs();
		this.object.childrenElement.style.display="none";
	}
}

function TreeGlobe(){
	var expandElement;
	var collapseElement;
	var expand_a_Element;
	var collapse_a_Element;
	var lineaElement;
	var linebElement;
	var linecElement;
	var blankElement;
	var treeNodeOpenElement;
	var treeNodeCloseElement;
	var treeNodeElement;
	var aElement;

	this.init = function(imgElement,aElement,expand,collasp,expand_a,collasp_a,linea,lineb,linec,blank,treeNodeOpen,treeNodeClose){
		this.aElement = aElement.cloneNode();
		this.expandElement=this.initImage(imgElement,expand);
		this.collapseElement=this.initImage(imgElement,collasp);
		this.expand_a_Element=this.initImage(imgElement,expand_a);
		this.collapse_a_Element=this.initImage(imgElement,collasp_a);
		this.lineaElement=this.initImage(imgElement,linea);
		this.linebElement=this.initImage(imgElement,lineb);
		this.linecElement=this.initImage(imgElement,linec);
		this.blankElement=this.initImage(imgElement,blank);
		this.treeNodeOpenElement=this.initImage(imgElement,treeNodeOpen);
		this.treeNodeCloseElement=this.initImage(imgElement,treeNodeClose);
	}
	var rootPath="";
	
	this.initImage = function(example,name){
		e = example.cloneNode();
		e.src=this.rootPath+name;
		e.width = "16";
		e.height = "16";
		return e;
	}
	this.createTreeNode = function(name,tab,parent,value){//change at hw this.createTreeNode = function(name,tab,parent,value)
		node = new TreeNode();
		node.init(name,this,tab,parent,value);//change at hw node.init(name,this,tab,parent,value);
		//this.nameElement.style.color="red";//change at hw
		//alert(test);
		//alert(parent);
		//alert("node.value=="+node.value);
		this.modifyNode(node,name,value,parent);
		return node;
	}
	var af = new AjaxFunction();
	this.loadChildrenAjax = function(node){
		loadingNode = node;
		//alert(node.entityid);
		af.ask(serverUrl+"&entityId="+node.entityid+"&parentId="+node.id,this.loadChildren);
	}
	this.loadChildren = function(){
		if (http_request.readyState == 4) {
			if (http_request.status == 200) {
				receive = http_request.responseText;
				items = receive.split("&^&");
				for(j=0;j<items.length-1;j+=3){
					nd = loadingNode.addNode(items[j+1],items[j+2]);//change at hwnd = loadingNode.addNode(items[j+1],items[j+2]);
					nd.id = items[j];
				}
				if(items.length>1){
					loadingNode.childrenElement.style.display="block";
				}
				else{
					loadingNode.childrenElement.style.display="none";
				}
				loadingNode.loaded = true;
			} else {
				alert('??????...');
			}
		}
    }

	this.modifyNode = function(node,name,value,parent){
	}
}


function AjaxFunction(){
  this.ask = function(url,functionname){
    http_request = false;
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
      http_request = new XMLHttpRequest();
      if (http_request.overrideMimeType) {
          http_request.overrideMimeType('text/xml');
      }
    }
    else if (window.ActiveXObject) { // IE
      try {
        http_request = new ActiveXObject("Msxml2.XMLHTTP");
      }
      catch (e) {
        try {
          http_request = new ActiveXObject("Microsoft.XMLHTTP");
        }
	    catch (e) {}
      }
    }
    if (!http_request) {
      alert('Giving up :( Cannot create an XMLHTTP instance');
      return false;
    }
    http_request.onreadystatechange = functionname;
    http_request.open('POST', url, false);
	http_request.setRequestHeader("contentType","text/html;charset=gb2312");
	http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	http_request.send(null);
	}
  
  this.replyBlog = function(){
    if (http_request.readyState == 4) {
      if (http_request.status == 200) {
	//	alert(http_request.responseText);
		return true;
      } else {
        alert('There was a problem with the request.');
      }
    }
	return false;
  }
}