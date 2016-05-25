/*function showSearch(divId)
{
	if(divId.style.display == 'none'){
		divId.style.display = 'block';
		}else{
		divId.style.display = 'none';
		}	
}*/
/*20080616改firefox&ie6-7,下通用。页面调用需要加'' onClick="showSearch('searchTop')"*/

function showSearch(divId)
{
	if(document.getElementById(divId).style.display == 'none'){
		document.getElementById(divId).style.display = 'block';
		}else{
		document.getElementById(divId).style.display = 'none';
		}	
}