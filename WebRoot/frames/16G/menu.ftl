<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--************************************************************ -->
<!--* 文件创建日期：2008-07-30                                 * -->
<!--* 功能描述：系统菜单部分（左侧菜单）                       * -->
<!--************************************************************ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>信息采集报送平台</title>
<link rel="stylesheet" href="../${Session["_USER_STYLE_"].cssPath}/menu_style.css" type="text/css">
</head>
<SCRIPT language="javascript">
function getMenuCount(){
	n=0;
	for(j=0;j<document.all.length;j++){
		if(document.all[j].className=="menubox"){
			n++;
		}
	}
	return n;
}
function showsubmenu(sid)
{ 
  var n = getMenuCount();
  if(document.getElementById("submenu" + sid).style.display == "block"){
   document.getElementById("submenu" + sid).style.display="none";
   document.getElementById("menufolder" + sid).className ="tdfolderOff";
  }else{
  for(i=1;i<=n;i++){
   document.getElementById("submenu" + i).style.display="none"; 
   document.getElementById("menufolder" + i).className ="tdfolderOff"; 
    }
   document.getElementById("submenu" + sid).style.display="block";
   document.getElementById("menufolder" + sid).className ="tdfolderOn"; 
}
}
</SCRIPT>
<script language="javascript" src="../${Session["_USER_STYLE_"].jsPath}/card_li_menu.js" type="text/javascript"></script>

<BODY>
<div class="menuTop" id="menutop"><span>${parentMenu.name}</span></div>
<div class="menuBody">
	<div class="menuBodyIn" style="background-image:url(../${Session["_USER_STYLE_"].imagePath}/icons/01.png)">
    <#if funcList?has_content>
   <#assign seq =1>
   <#list mainFuncSet as mainMenu>	
	<div class="menubox">
	<div id="menufolder${seq}" class="<#if seq==1>tdfolderOn<#else>tdfolderOff</#if>" onClick="javascript:showsubmenu('${seq}');"><span>${mainMenu.name}</span></div>
	<div id="submenu${seq}" class="SubMenuBody" style="DISPLAY: <#if seq==1>none<#else>none</#if>">
		<ul class="subMenuUl">
		<#assign key = mainMenu.name>
		<#assign submenus = funcList[key]>
		<#assign subseq =1>
 		<#list submenus as submenu>
 		<#if submenu.linkParameters ?exists>
    	<#assign link = "${submenu.link}?funcCode=${submenu.id}&${submenu.linkParameters}">
     	<#else>
    	<#assign link = "${submenu.link}?funcCode=${submenu.id}">
   		</#if>
   		<li class="subMcardOff" onClick="changeCard(this,'subMcard')"><a href="javascript:changeLink('${link}')">${submenu.name}</a></li>
   		<#assign subseq = subseq + 1>
 		</#list>
		 </ul>
	</div>
	</div>
		<#assign seq = seq + 1>
</#list>
</#if>
</div>
<div class="menuBot"></div>
</BODY>
<SCRIPT language="javascript">
function changeLink(link){
	parent.mainPage.location=link;
}

</SCRIPT>
