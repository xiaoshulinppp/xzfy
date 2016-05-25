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
	var treeNodeOpenElement;
	var tab;
	var parent;
	var children;
	var childrenSize;
	var tabImg;
	var tabImgSelect;
	var tg;
	var loaded;
	var id;
	var dictabbr;
	var value;
	var name;
	var extend;

	this.init = function(name,tg,tab,parent,value){
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
		if(this.tab == 1){
			this.treeNodeOpenElement = tg.treeNodeFirstElement.cloneNode();
		}
		else if(this.tab == 2){
			this.treeNodeOpenElement = tg.treeNodeSecondElement.cloneNode();
		}
		else{
			this.treeNodeOpenElement = tg.treeNodeOpenElement.cloneNode();
		}
		this.nameElement = tg.aElement.cloneNode();
		this.nameElement.object = this;
		this.nameElement.onclick = this.event;
		this.nameElement.innerHTML = name;
		this.nameElement.style.height=18;
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
		this.nodeElement.appendChild(this.treeNodeOpenElement);
		this.nodeElement.appendChild(this.nameElement);
		this.nodeElement.appendChild(this.childrenElement);
	}

	this.event = function(){
	}

	this.loadTabs = function(){
		p = this;
		for(i =this.tab-1;i>=0;i--){
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

	this.addNode = function(name,value){
		node = this.tg.createTreeNode(name,this.tab+1,this,value);
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


	///////////////////////////�¼�����/////////////////////////////////////
	this.expand = function(){
		o = this.object;
		o.loadChildren();
		o.tabImgSelect[o.tab-1][1] = o.collapse_a_Element;
		o.tabImgSelect[o.tab-1][0] = o.collapseElement;
		o.loadTabs();
		if(o.childrenElement.childNodes.length>0){
			o.childrenElement.style.display="block";
		}
	}
	this.collapse = function(){
		o = this.object;
		o.tabImgSelect[o.tab-1][1] = o.expand_a_Element;
		o.tabImgSelect[o.tab-1][0] = o.expandElement;
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
	var treeNodeFirstElement;
	var treeNodeSecondElement;
	var treeNodeElement;
	var aElement;

	this.init = function(imgElement,aElement,expand,collasp,expand_a,collasp_a,linea,lineb,linec,blank,treeNodeOpen,treeNodeClose,treeNodeFirst,treeNodeSecond){
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
		this.treeNodeFirstElement=this.initImage(imgElement,treeNodeFirst);
		this.treeNodeSecondElement=this.initImage(imgElement,treeNodeSecond);
	}
	this.initImage = function(example,name){
		e = example.cloneNode();
		e.src="../pages/system/jstree/"+name;
		e.width = "16";
		e.height = "16";
		return e;
	}
	this.createTreeNode = function(name,tab,parent,value){
		node = new TreeNode();
		node.init(name,this,tab,parent,value);
		this.modifyNode(node,name,value,parent);
		return node;
	}
	var af = new AjaxFunction();
	this.loadChildrenAjax = function(node){
		loadingNode = node;
		if(node.parent == null){
			af.ask(positionUrl,this.loadChildren);
		}
		else if(node.parent.parent == null){
			af.ask(ptreeUrl+"&parentId=0&positionId="+node.id,this.loadChildren);
		}
		else{
			af.ask(ptreeUrl+"&positionId=0&ptreeId="+node.id,this.loadChildren);
		}
	}
	this.loadChildren = function(){
		if (http_request.readyState == 4) {
			if (http_request.status == 200) {
				receive = http_request.responseText;
				items = receive.split("&^&");
				for(j=0;j<items.length-1;j+=3){
					nd = loadingNode.addNode(items[j+1],items[j+2]);
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
				alert('�ܻ���ӽڵ����...');
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
		alert(http_request.responseText);
		return true;
      } else {
        alert('There was a problem with the request.');
      }
    }
	return false;
  }
}