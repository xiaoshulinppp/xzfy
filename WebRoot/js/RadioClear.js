function selectAll(x){
 	var Narray = document.getElementsByName(x);
  	var len = Narray.length-1;
  	var i = -1;
    while(i++<len){
      Narray[i].checked = true;
 }
}
