<!--************************************************************ -->
<!--* 文件创建人：祁纲                                         * -->
<!--* 文件创建日期：2006-09-08                                 * -->
<!--************************************************************ -->
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}V2.0</title>
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
  n=getMenuCount();
  for(i=1;i<=n;i++){
   eval("submenu" + i + ".style.display=\"none\";"); 
   eval("menufolder" + i + ".className =\"tdfolderOff\";");
    }
   eval("submenu" + sid + ".style.display=\"block\";");
   eval("menufolder" + sid + ".className =\"tdfolderOn\";");
}
</SCRIPT>
<BODY>
<div class="menuBackground" id="menubg">&nbsp;</div>
<div class="menuTop" id="menuTop">&nbsp;</div>
<div class="menuBody" id="menuBody" style="height:expression(body.offsetHeight-menuTop.offsetHeight-21); overflow:auto; width:100%; left: 0px; top: 0px;">
<#if funcList?has_content>
<#assign sizes = funcList?size>
<#assign seq =1>
<#list mainFuncSet as mainMenu>
<TABLE border=0 align="center" cellPadding=0 cellSpacing=0 class="menubox">
          <TBODY>
             <TR>
               <TD id="menufolder${seq}" class="tdfolderOn" onClick="javascript:showsubmenu('${seq}');">${mainMenu.name}</TD>
             </TR>
            <TR id="submenu${seq}" style="DISPLAY: block">
               <TD class="tdsubmenu">
               <#assign key = mainMenu.name>
			   <#assign submenus = funcList[key]>
			   <#list submenus as submenu>
			    <#if submenu.linkParameters ?exists>
                    <#assign link = "${submenu.link}?funcCode=${submenu.id}&${submenu.linkParameters}">
		       <#else>
                    <#assign link = "${submenu.link}?funcCode=${submenu.id}">
		       </#if>
			   	<a href="${link}" class="menuLink" target="mainPage">${submenu.name}</a><br>
			   	</#list>
              </TD>
             </TR>
           </TBODY>
</TABLE>
<#assign seq = seq + 1>
</#list>  
</#if>

</div>
<div class="menuBottom" id="menubottom">&nbsp;</div>
</BODY>
