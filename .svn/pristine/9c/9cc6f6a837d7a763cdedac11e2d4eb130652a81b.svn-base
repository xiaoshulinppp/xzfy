//////////////////��ɫ�����///////////////////////
function ColorEditor(){
	this.isback;
	this.colorTableDiv;
	this.colorTableInfo;
	this.colorTableView;
	this.setColor = function(){
		e = event.srcElement;
		cellDesignArea.focus();
		if(this.isback){
			document.execCommand("ForeColor",true,e.bgColor);
		}
		else{
			document.execCommand("BackColor",false,e.bgColor);
		}
		cellDesignArea.focus();
		colorTableDiv.style.display="none";
	}
	this.setSelected = function(){
		e = event.srcElement;
		colorTableView.bgColor = e.bgColor;
	}
	
	this.initWebDesign_colorTable = function(colorTable,colorTableDiv,colorTableInfo,colorTableView){
		this.colorTableDiv = colorTableDiv;
		this.colorTableInfo = colorTableInfo;
		this.colorTableView = colorTableView;
		for(y = 0;y<9;y++){
			row = colorTable.insertRow(y);
			row.height=10;
			for(x = 0;x<27;x++){
				cell = row.insertCell(x);
				a = this.getHexExpress((x%9)*2);
				b = this.getHexExpress(y*2);
				blue = x;
				c = this.getHexExpress(blue);
				cell.onclick='setColor();';
				cell.bgColor="#"+a+a+b+b+c+c;
				cell.borderColor="#ff0000";
				cell.width=10;
			}
		}
	}
	this.getHexExpress = function(i){
		if(i<10)return i+"";
		else if(i == 10)return "a";
		else if(i == 11)return "b";
		else if(i == 12)return "c";
		else if(i == 13)return "d";
		else if(i == 14)return "e";
		else return "f";
	}
	this.show = function(isback){
		if(this.isback==isback && colorTableDiv.style.display == "block"){
			colorTableDiv.style.display = "none";
		}
		else{
			colorTableDiv.style.display = "block";
		}
		this.isback = isback;
		if(this.isback){
			this.colorTableInfo.innerHTML="调色板(前景色)";
		}
		else{
			this.colorTableInfo.innerHTML="调色板(背景色)";
		}
	}
}
/////////////////////////////////////////////////