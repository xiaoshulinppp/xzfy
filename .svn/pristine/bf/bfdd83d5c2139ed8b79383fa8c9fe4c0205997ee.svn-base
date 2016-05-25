var isie=0;
if(window.navigator.appName=="Microsoft Internet Explorer"&&window.navigator.appVersion.substring(window.navigator.appVersion.indexOf("MSIE")+5,window.navigator.appVersion.indexOf("MSIE")+8)>=5.5) {
isie=1;
}
else {
isie=0;
}
if(isie) {
var html="";
html+='<TABLE STYLE="border:1pt solid #808099" BGCOLOR="#FFFFFF" WIDTH="120" HEIGHT="130" CELLPADDING="0" CELLSPACING="1">';
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
html+='<TR><TD STYLE="border:1pt solid #EEEEEE" ID="i0" ONMOUSEOVER="document.all.i0.style.background=\'#CFD6E8\';document.all.i0.style.border=\'1pt solid #737B92\';" ONMOUSEOUT="document.all.i0.style.background=\'#FFFFFF\';document.all.i0.style.border=\'1pt solid #EEEEEE\';" ONCLICK="window.parent.history.back(1);">&nbsp;后 退</TD></TR>';

html+='<TR><TD STYLE="border:1pt solid #EEEEEE" ID="i1" ONMOUSEOVER="document.all.i1.style.background=\'#CFD6E8\';document.all.i1.style.border=\'1pt solid #737B92\';" ONMOUSEOUT="document.all.i1.style.background=\'#FFFFFF\';document.all.i1.style.border=\'1pt solid #EEEEEE\';" ONCLICK="window.parent.history.go(1);">&nbsp;前 进</TD></TR>';

html+='<TR><TD STYLE="border:1pt solid #EEEEEE" ID="i6" ONMOUSEOVER="document.all.i6.style.background=\'#CFD6E8\';document.all.i6.style.border=\'1pt solid #737B92\';" ONMOUSEOUT="document.all.i6.style.background=\'#FFFFFF\';document.all.i6.style.border=\'1pt solid #EEEEEE\';" ONCLICK="window.print();">&nbsp;打 印</TD></TR>';

html+='<TR><TD STYLE="border:1pt solid #EEEEEE" ID="i7" ONMOUSEOVER="document.all.i7.style.background=\'#CFD6E8\';document.all.i7.style.border=\'1pt solid #737B92\';" ONMOUSEOUT="document.all.i7.style.background=\'#FFFFFF\';document.all.i7.style.border=\'1pt solid #EEEEEE\';" ONCLICK="window.parent.location.href=window.parent.location.href;">&nbsp;刷 新</TD></TR>';

html+='<TR><TD STYLE="border:1pt solid #EEEEEE" ID="i8" ONMOUSEOVER="document.all.i8.style.background=\'#CFD6E8\';document.all.i8.style.border=\'1pt solid #737B92\';" ONMOUSEOUT="document.all.i8.style.background=\'#FFFFFF\';document.all.i8.style.border=\'1pt solid #EEEEEE\';" ONCLICK="if(window.parent.document.body.style.zoom!=0) window.parent.document.body.style.zoom*=1.6; else window.parent.document.body.style.zoom=1.6;">&nbsp;放 大</TD></TR>';

html+='<TR><TD STYLE="border:1pt solid #EEEEEE" ID="i9" ONMOUSEOVER="document.all.i9.style.background=\'#CFD6E8\';document.all.i9.style.border=\'1pt solid #737B92\';" ONMOUSEOUT="document.all.i9.style.background=\'#FFFFFF\';document.all.i9.style.border=\'1pt solid #EEEEEE\';" ONCLICK="if(window.parent.document.body.style.zoom!=0) window.parent.document.body.style.zoom*=0.625; else window.parent.document.body.style.zoom=0.625;">&nbsp;缩 小</TD></TR>';

html+='</TABLE>';

var oPopup = window.createPopup();

}

function dopopup(x,y) {
if(isie) {
var oPopupBody = oPopup.document.body;
oPopupBody.innerHTML = html;
oPopup.show(x, y, 120, 130, document.body);
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