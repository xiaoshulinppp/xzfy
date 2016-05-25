var monthNumber = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

//开始加载
window.onload = function()
{
    var now = getServerTime();
    var y = now.getFullYear();
	//以服务器时间今年为准，前120年
    for (var i = y; i >= y - 5; i--) {
        document.getElementById("year").options.add(new Option(i,i));
    }
  
    //月份的下拉框
    var j = "";
    for (var i = 1; i <= 12; i++){
    	if(i < 10)
    	{
    		document.getElementById("month").options.add(new Option("0" + i,"0" + i));
    	}
    	else
		{
    		document.getElementById("month").options.add(new Option(i,i));
		}
    }
    
   
    for (var i=1; i <= 30; i++){
    	if(i < 10)
    	{
    		document.getElementById("day").options.add(new Option("0" + i,"0" + i));
    	}else {
    		document.getElementById("day").options.add(new Option(i,i));
    	}
    }
};

//获取服务器时间
function getServerTime(){	
    var xmlHttp = null;  
    //获取服务器时间  
    try {  
        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");  
    } catch (e) {  
        try {  
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  
        } catch (e2) {  
        }  
    }  
     
    if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {  
        xmlHttp = new XMLHttpRequest();  
    }  
     
    xmlHttp.open("GET", window.location.href.toString(), false);  
    xmlHttp.setRequestHeader("If-None-Match", "bytes=-1");  
    xmlHttp.setRequestHeader("Cache-Control","no-cache");  
    xmlHttp.send(null);   
    return new Date(xmlHttp.getResponseHeader("Date"));  
}  

//年联动月，日
function yearMonth(str){
    if(str != ""){
    	if(str == getServerTime().getFullYear())
    	{
    		selectMonth(getServerTime().getMonth() + 1);
    	}else
    	{
    		selectMonth(12);
	       var monthvalue = document.getElementById("month").options[window.document.getElementById("month").selectedIndex].value;
	       monthDay(monthvalue);
    	}
    } 
}

//月联动日
function monthDay(str) {
    if(str != ""){
        var yearvalue = document.getElementById("year").options[window.document.getElementById("year").selectedIndex].value;
        var n = monthNumber[str - 1];
        if (str==2 && isLeapYear(yearvalue)) n++;
        if(yearvalue == getServerTime().getFullYear() && str == (getServerTime().getMonth() + 1))
        {
        	n = getServerTime().getDate();
        }
           selectDay(n);
    } 
}

function selectMonth(n) {
    document.getElementById("month").options.length = 1;
    for (var i=1; i<=n; i++){
    	
    	if(i < 10)
    	{
    		document.getElementById("month").options.add(new Option("0" + i,"0" + i));
    	}else {
    		document.getElementById("month").options.add(new Option(i,i));
    	}
    }
}

//据条件显示日
function selectDay(n) {
    document.getElementById("day").options.length = 1;
    for (var i=1; i<=n; i++){
    	
    	if(i < 10)
    	{
    		document.getElementById("day").options.add(new Option("0" + i,"0" + i));
    	}else {
    		document.getElementById("day").options.add(new Option(i,i));
    	}
    }
}

//判断是否闰平年
function isLeapYear(year){ 
   return (year%4 == 0 && (year%100 !=0 || year%400 == 0));
}