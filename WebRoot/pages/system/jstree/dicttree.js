function showDict(abbr,name,value,multiselect){
	array = new Array(4);
	array[0] = abbr;
	array[1] = document.getElementById(name);
	array[2] = document.getElementById(value);
	array[3] = multiselect;
	window.showModalDialog("../jstree/dicttree.htm",array);
}
