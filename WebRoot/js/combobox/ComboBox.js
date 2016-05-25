/*
 *	ComboBox
 *	By Jared Nuzzolillo
 *
 *	Updated by Erik Arvidsson,YanYiTan
 *	http://webfx.eae.net/contact.html#erik
 *  2004-07-16  optimize the movement of the ↓↑ key --By YanYiTan
 *  2004-07-15  allow using ↓↑ key combined with cursor to select item.
                value in textview automatically displays in the opslist
                -- By YanYiTan
 *	2002-06-13	Fixed Mozilla support and improved build performance
 *
 */

Global_run_event_hook = true;
Global_combo_array    = new Array();

Array.prototype.remove=function(dx)
{ 
    if(isNaN(dx)||dx>this.length){self.status='Array_remove:invalid request-'+dx;return false}
    for(var i=0,n=0;i<this.length;i++)
    {  
        if(this[i]!=this[dx])
        {
            this[n++]=this[i]
        }
    }
    this.length-=1
}

function ComboBox_make()
{
    var bt,nm;
    nm = this.name+"txt"; 
    
    this.txtview = document.createElement("INPUT")
    this.txtview.type = "text";
    this.txtview.name = nm;
    this.txtview.id = nm;
    this.txtview.className = "combo-input"
    this.view.appendChild(this.txtview);
        
    this.valcon = document.createElement("INPUT");
    this.valcon.type = "hidden";
    this.view.appendChild(this.valcon);
   
    var tmp = document.createElement("IMG");
    tmp.src = "___";
    tmp.style.width = "1px";
    tmp.style.height = "0";
    this.view.appendChild(tmp);
    
    this.btn = document.createElement("BUTTON");
    this.btn.appendChild(document.createTextNode(6));
    this.btn.className = "combo-button";
    this.btn.tabIndex  = -1;
    
	this.view.appendChild(this.btn);
   	this.btn.onfocus = function () { this.blur(); };
	this.btn.onclick = new Function ("", this.name + ".toggle()");
}

function ComboBox_choose(realval,txtval)
{
    this.value         = realval;
    var samstring = this.name+".view.childNodes[0].value='"+txtval+"'"
    window.setTimeout(samstring,1)
    this.valcon.value  = realval;   
    this.allName.value = realval;
    
}

function ComboBox_mouseDown(e)
{
    var obj,len,el,i;
    el = e.target ? e.target : e.srcElement;
    while (el.nodeType != 1) el = el.parentNode;
    var elcl = el.className;
    if(elcl.indexOf("combo-")!=0)
    {
				
        len=Global_combo_array.length
        for(i=0;i<len;i++)
        {
        
            curobj = Global_combo_array[i]
            
            if(curobj.opslist)
            {
                curobj.opslist.style.display='none';
                if(curobj.txtview.value.trim()=="")
					curobj.rowHilited = -1;
            }
        }
    }
}

function ComboBox_handleKey(e)
{
    var key,obj,eobj,el,strname;
    eobj = e;
    key  = eobj.keyCode;
    
    if (key == 9) //tab key
		return true;
    
    
    el = e.target ? e.target : e.srcElement;
    while (el.nodeType != 1) el = el.parentNode;
    elcl = el.className
    if(elcl.indexOf("combo-")==0 && key!=13 && key!=40 && key!=38)
    {
        if(elcl.split("-")[1]=="input")
        {
            strname = el.id.split("txt")[0]
            obj = window[strname];
			
            //obj.expops.length=0
            //obj.update();
            if(!obj.opslist)
				obj.build(obj.options);
			
		
				
			 hideAllOpsList();
            
            //if(obj.expops.length==1&&obj.expops[0].text=="(No matches)"){}//empty
            //else{ obj.view.style.zIndex = ++ComboBox.prototype.COMBOBOXZINDEX; obj.opslist.style.display='block';}
            
            obj.view.style.zIndex = ++ComboBox.prototype.COMBOBOXZINDEX;
            obj.opslist.style.display='block';
            
            
            obj.value = el.value;
            obj.valcon.value = el.value;
            
            if(key!=38 && key!=40 && key!=13)
            {
				opln = obj.options.length;
				astr = obj.txtview.value.toLowerCase();
			
				alen = astr.length;
				for(i=0;i<opln;i++)
				{
				     opart=obj.options[i].text.toLowerCase().substring(0,alen);
					 if(astr==opart)
					 {
							obj.opslist.scrollTop = obj.opslist.childNodes[0].rows(i).cells(0).offsetTop;
							disableAllHilite(obj.opstable);
							obj.opstable.rows(i).cells(0).className='combo-hilite';
							obj.rowHilited = i;
							break;
					 }
				} 
			}   
        }
     }
   
   
   if(typeof(obj)!="object")
   {
		obj = getAvailableCMB();
   }
   
     
   var lineHilited; 
   if (typeof(obj) == "object")
   {
		if (key == 40) // press the "↓" key  
		{
		    
		     {
					//alert("obj.opslist.clientHeight = " +obj.opslist.clientHeight);
					//alert("obj.opslist.offsetHeight = " +obj.opslist.offsetHeight);
					
					//lineHilited = whichLineHilite(obj.opstable); 
					lineHilited = obj.rowHilited;
					
					if ( lineHilited == -1 ) 
					{
						disableAllHilite(obj.opstable);
						obj.opstable.rows[0].cells[0].className = "combo-hilite";
						obj.rowHilited = 0;
						obj.opslist.scrollTop = 0;
					}
					else
					{
					    disableAllHilite(obj.opstable);
					    
						if(lineHilited == obj.opstable.rows.length-1)  //lineHilited is the last line
						{
							obj.opstable.rows[obj.opstable.rows.length-1].cells[0].className = "combo-hilite";
							obj.rowHilited = obj.opstable.rows.length-1;
						}
						else
						{
							obj.opstable.rows[lineHilited+1].cells[0].className = "combo-hilite";
							obj.rowHilited = lineHilited+1;
							
							//alert("obj.opstable.rows[obj.rowHilited].offsetTop = " +obj.opstable.rows[obj.rowHilited].offsetTop);
							//alert("obj.opslist.scrollTop = " + obj.opslist.scrollTop);
							
							var nTemRel = obj.opstable.rows[obj.rowHilited].offsetTop-obj.opslist.scrollTop;
							
							
							
							if ((obj.opslist.clientHeight - nTemRel)<16 || nTemRel <0)  //if the rowHilited is out of the opslist
							{
							 
							   if(typeof(obj.opstable.rows[lineHilited+2]) == "object")  //rowHilited is not the last row
							       obj.opslist.scrollTop = obj.opstable.rows[lineHilited+2].cells[0].offsetTop - obj.opslist.clientHeight;
							   else
								   obj.opslist.scrollTop = obj.opstable.clientHeight;
							}
							else
							{
								//alert("rowHilited is in the view");
							}
							
							
						}
					}
		     
		     }
		}
   
		if (key == 38) //press the "↑" Key
		{
			   if(obj.opslist)
			   {
				   
					//lineHilited = whichLineHilite(obj.opstable);
					lineHilited = obj.rowHilited;
					
					if ( lineHilited == -1 ) 
					{
						disableAllHilite(obj.opstable);
						obj.opstable.rows[0].cells[0].className = "combo-hilite";
						obj.rowHilited = 0;
						obj.opslist.scrollTop = 0;
					}
					else
					{
					    disableAllHilite(obj.opstable);
					    
						if(lineHilited == 0)  //lineHilited is the first line
						{
							obj.opstable.rows[0].cells[0].className = "combo-hilite";
							
							obj.rowHilited = 0;
						}
						else
						{
							obj.opstable.rows[lineHilited-1].cells[0].className = "combo-hilite";
							
							obj.rowHilited = lineHilited-1;
							
							
							if (obj.opstable.rows[obj.rowHilited].offsetTop > obj.opslist.scrollTop) 
							{
							    
							}
							else  //if the rowHilited is out of the opslist
							{
							     obj.opslist.scrollTop = obj.opstable.rows[obj.rowHilited].cells[0].offsetTop;
							}
						}
					}
			   
			   }
   
		}
   
		if (key == 13)  //press ENTER key
		{
			    if(obj.opslist)
			    {
					
					lineHilited = whichLineHilite(obj.opstable);
					var myValue;
				    if(obj.rowHilited != -1)
					{
						myValue = obj.opstable.rows(obj.rowHilited).cells(0).innerText;
						obj.txtview.value=myValue.trim();
						obj.opslist.style.display='none';
						obj.allName.value = obj.options[obj.rowHilited].value;	
					}
					else
						disableAllHilite(obj.opstable);
			    }
		}
   }
}

function ComboBox_update()
{
    var opart,astr,alen,opln,i,boo;
    boo=false;
    opln = this.options.length
    astr = this.txtview.value.toLowerCase();
    alen = astr.length
    if(alen==0)
    {
        for(i=0;i<opln;i++)
        {
            this.expops[this.expops.length]=this.options[i];boo=true;
        }
    }
    else
    {
        for(i=0;i<opln;i++)
        {
            opart=this.options[i].text.toLowerCase().substring(0,alen)
            if(astr==opart)
            {
                this.expops[this.expops.length]=this.options[i];boo=true;
            }
        }
    }
    if(!boo){this.expops[0]=new ComboBoxItem("(No matches)","")}
}


function ComboBox_remove(index)
{
    this.options.remove(index)
}

function ComboBox_add()
{
    var i,arglen;
    arglen=arguments.length
    for(i=0;i<arglen;i++)
    {
        this.options[this.options.length]=arguments[i]
    }
}

function ComboBox_build(arr)
{
    var str,arrlen
    arrlen=arr.length;
    
    var nOpslistWid,nTblWid;
    nTblWid      = this.txtview.offsetWidth;
    nOpslistWid  = nTblWid  + this.btn.offsetWidth;
    
    //str = '<table class="combo-list-width" cellpadding=0 cellspacing=0>';
    str = '<table id="expose" class="combo-list-width" border=0 cellpadding=0 cellspacing=0 style="width:' +  nTblWid + '">';
    var strs = new Array(arrlen);
    for(var i=0;i<arrlen;i++)
    {
        strs[i] = '<tr>' +
			'<td class="combo-item" onClick="'+this.name+'.choose(\''+arr[i].value+'\',\''+arr[i].text+'\');'+this.name+'.opslist.style.display=\'none\';"' +
			'onMouseOver="on_MouseOver(this);" onMouseOut="this.className=\'combo-item\'" >&nbsp;'+arr[i].text+'&nbsp;</td>' +
			'</tr>';
    }
    str = str + strs.join("") + '</table>'
    
    if(this.opslist){this.view.removeChild(this.opslist);}
    
    this.opslist                = document.createElement("DIV")
    this.opslist.innerHTML      = str;
    this.opslist.style.display  = 'none';
    this.opslist.className      = "combo-list";
    this.opslist.style.position = 'absolute';
    this.opslist.style.left     = 0;
	this.opslist.style.top		= 22;
	this.opslist.style.height   = 102;
	this.opslist.style.width    = nOpslistWid;
    this.opslist.onselectstart  = returnFalse;
    this.view.appendChild(this.opslist);
    
    this.opstable = this.opslist.childNodes[0];
    
}


function ComboBox_toggle() //when you click drop-down button runs after function ComboBox_mouseDown(e)
{
    
    hideAllOpsList();
    
    if(this.opslist)
    {
        if(this.opslist.style.display=="block")
        {
            this.opslist.style.display="none"
        }
        else
        {
            //this.update();
            this.build(this.options);
            this.view.style.zIndex = ++ComboBox.prototype.COMBOBOXZINDEX
            this.opslist.style.display="block"
        }
    }
    else
    {
        //this.update();
        this.build(this.options);
        this.view.style.zIndex     =  ++ComboBox.prototype.COMBOBOXZINDEX;
        this.opslist.style.display = "block";
    }
    
  
		
		opln = this.options.length;
		astr = this.txtview.value.toLowerCase();
		alen = astr.length;
		for(i=0;i<opln;i++)
		{
		     opart=this.options[i].text.toLowerCase().substring(0,alen);
			 if(astr==opart)
			 {
					this.opslist.scrollTop = this.opslist.childNodes[0].rows(i).cells(0).offsetTop;
					disableAllHilite(this.opstable);
					this.opstable.rows(i).cells(0).className='combo-hilite';
					this.rowHilited = i;
					break;
			 }
		}
	
}

function ComboBox()
{
    if(arguments.length==0)
    {
        self.status="ComboBox invalid - no name arg"
    }

    this.rowHilited = -1; //log the Row NO.that is hilited. -1 means no row is hilited
    
    this.name     = arguments[0];
    this.par      = arguments[1]||document.body;
    this.allName  = arguments[2];
    this.view     = document.createElement("DIV");
    this.view.style.position='relative';
    this.options  = new Array();
    this.expops   = new Array();
    this.value    = ""

    this.build  = ComboBox_build;
    this.make   = ComboBox_make;
    this.choose = ComboBox_choose;
    this.add    = ComboBox_add;
    this.toggle = ComboBox_toggle;
    this.update = ComboBox_update;
    this.remove = ComboBox_remove;
    this.make();
    this.txtview = this.view.childNodes[0];
    this.valcon  = this.view.childNodes[1];
    this.btn     = this.view.childNodes[3];
    
    this.par.appendChild(this.view);

    Global_combo_array[Global_combo_array.length]=this;
    if(Global_run_event_hook){ComboBox_init();}
}

ComboBox.prototype.COMBOBOXZINDEX = 1000 //change this if you must

function ComboBox_init() 
{
	if (document.addEventListener) {
		document.addEventListener("keyup", ComboBox_handleKey, false );
		document.addEventListener("mousedown", ComboBox_mouseDown, false );
	}
	else if (document.attachEvent) {
		document.attachEvent("onkeyup", function () { ComboBox_handleKey(window.event); } );
		document.attachEvent("onmousedown", function () { ComboBox_mouseDown(window.event); } );
	}
	
    Global_run_event_hook = false;
}

function returnFalse(){return false}

function ComboBoxItem(text,value)
{
    this.text  = text;
    this.value = value;
}

document.write('<link rel="STYLESHEET" type="text/css" href="../js/combobox/ComboBox.css">')


////////////////////////////////////////////////////
//YanYiTan's Functions

function  whichLineHilite(myObj) //find out which line is hilited in the table. If return value =-1 means no row is hilited.
{                                //If return value =2 means NO.3 row is hilited
	var nTblLen,nLine;
	nTblLen = myObj.rows.length;
	nLine   = -1;
	
	for(i=0;i<nTblLen;i++)
	{
		if(myObj.rows[i].cells[0].className == "combo-hilite")
		{
			nLine = i;
			break;
		}
	}
	
	return nLine;
}

function disableAllHilite(myObj)
{
	var nTblLen;
	nTblLen = myObj.rows.length;
	for(ii=0;ii<nTblLen;ii++)
	{
		myObj.rows[ii].cells[0].className = "combo-item";
	}
}

String.prototype.trim = function()
{
    return this.replace(/(^\s*)|(\s*$)/g, "");
}

function on_MouseOver(objThis)
{
	objIptTxtId = objThis.parentElement.parentElement.parentElement.parentElement.parentElement.childNodes[0].id;
	strObjName  = objIptTxtId.getStrFromRear("txt");
	obj         = window[strObjName];
	
	var nTblLen;
	nTblLen = obj.opstable.rows.length;
	for(var i=0;i<nTblLen;i++) 
	{	
		obj.opstable.rows(i).cells(0).className='combo-item';
		if (obj.opstable.rows(i).cells(0) == objThis)
		{
			obj.rowHilited = i;
		}
	}
		
	objThis.className='combo-hilite';
	
}

String.prototype.getStrFromRear = function(strTgt)
{
   //ie:.poshipViatxt.getStrFromRear("txt")="poshipVia";
   var nPosi;
   
   nPosi = this.indexOf(strTgt);
   return this.substr(0,nPosi);
}



function hideAllOpsList()
{
    var len=Global_combo_array.length;
    for(i=0;i<len;i++)
    {
        
        curobj = Global_combo_array[i]
            
        if(curobj.opslist)
        {
            curobj.opslist.style.display = 'none';
            
        }
    }
}

function getAvailableCMB()
{
	var curObj;
	var len=Global_combo_array.length;
    for(i=0;i<len;i++)
    {
		if(Global_combo_array[i].opslist)
		{
			if( Global_combo_array[i].opslist.style.display != "none" )
			{
				curObj = Global_combo_array[i];
				break;
			}
		}
    }
	return curObj;
}

function setCmb_bfrSubmit()
{

	var strCmbHidName="col_country_id"; // hidden textbox name in comBox
	var collCmbHidName=document.getElementsByName(strCmbHidName);  //collection of comboBox hidden name
	
	var nCmbCount=collCmbHidName.length;
	var strCurTxt;
	var objComboBox;
	var bExists;
	
	
	
	for(ii=1;ii<=nCmbCount;ii++)  //Loop for each comboBox
	{
		
		objComboBox=eval("objCom_"+ii);
		
		strCurTxt=objComboBox.txtview.value;
   
   
		//***********   Loop for all items in ComboBox     **********
		//
  
		bExists=0;
   
		nCmbLen=objComboBox.options.length;
   
		for(i=0;i<nCmbLen;i++)
	    {
			if(strCurTxt==objComboBox.options[i].text)
			{
				collCmbHidName[ii-1].value=objComboBox.options[i].value;
				bExists=1;
				break;
			}
   
		}
		/////////////////////////////////////////////////////////////
   
   
		 //If the data you input doesn't in the comboBox
		 //
		if(!bExists)
		{
			collCmbHidName[ii-1].value="0";
		}
	
	}

}



function restoreCmb(arrCountryId,nCmbCount)
{
	for(i=0;i<nCmbCount;i++)  //Loop for each comboBox
	{       
	    n=i+1;
        objComboBox=eval("objCom_"+n);
        nCmbLen=objComboBox.options.length;
        
        for(j=0;j<nCmbLen;j++)
	    {
			if(arrCountryId[i+1]==objComboBox.options[j].value.trim())
			{
				//alert(poShipVia.options[i].value);
				objComboBox.choose(arrCountryId[i+1],objComboBox.options[j].text);
				break;
			}
		}
	}
}
