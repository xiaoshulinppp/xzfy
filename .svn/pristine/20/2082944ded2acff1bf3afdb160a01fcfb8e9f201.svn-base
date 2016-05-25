var isie=0;
if(window.navigator.appName=="Microsoft Internet Explorer"&&window.navigator.appVersion.substring(window.navigator.appVersion.indexOf("MSIE")+5,window.navigator.appVersion.indexOf("MSIE")+8)>=5.5) {
isie=1;
}
else {
isie=0;
}
if(isie) {
var html="";
html+='<TABLE STYLE="border:1pt solid #808099" BGCOLOR="#FFFFFF" WIDTH="120" HEIGHT="24" CELLPADDING="0" CELLSPACING="1">';
html+='<ST'+'YLE TYPE="text/css">\n';
html+='a:link {text-decoration:none;font-family:Arial;font-size:9pt;}\n';
html+='a:visited {text-decoration:none;font-family:Arial;font-size:8pt;}\n';
html+='td {font-size:9pt;}\n';
html+='</ST'+'YLE>\n';
html+='<SC'+'RIPT LANGUAGE="JavaScript">\n';
html+='\n<'+'!--\n';
html+='window.onerror=null;\n';
html+='/'+' -'+'->\n';
html+='</'+'SCRIPT>\n';

html+='<TR><TD STYLE="border:1pt solid #EEEEEE" ID="i7" ONMOUSEOVER="document.all.i7.style.background=\'#CFD6E8\';document.all.i7.style.border=\'1pt solid #737B92\';" ONMOUSEOUT="document.all.i7.style.background=\'#FFFFFF\';document.all.i7.style.border=\'1pt solid #EEEEEE\';" ONCLICK="window.parent.location.href=window.parent.location.href;">&nbsp;刷 新</TD></TR>';

html+='</TABLE>';

var oPopup = window.createPopup();

}

function dopopup(x,y) {
if(isie) {
var oPopupBody = oPopup.document.body;
oPopupBody.innerHTML = html;
oPopup.show(x, y, 120, 24, document.body);
}
}

function click(e) {
if(isie) {
if(document.all) {
if(event.button==2||event.button==3) {
dopopup(event.x-1,event.y-1);
}
}
}
}

if(isie) {
document.oncontextmenu = function() { dopopup(event.x,event.y);return false; }
document.onmousedown = click;
}