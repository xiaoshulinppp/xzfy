function selectAll(x,y){
    var o = document.getElementsByName(x);
 	var Narray = document.getElementsByName(y); 	
  	var len = Narray.length-1;
  	var i = -1;
    while(i++<len){
      if(o[0].checked)
        Narray[i].checked = true;
      else
        Narray[i].checked = false;
 }
}