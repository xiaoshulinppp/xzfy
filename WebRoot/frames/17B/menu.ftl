<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--********************************************************* -->
<!--* 文件创建日期：2013-07-24                                * -->
<!--* 文件修改日期：2013                                       * -->
<!--* 功能描述：左侧菜单文件                                    * -->
<!--********************************************************* -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta http-equiv=="Pragma" CONTENT="no-cache">
<meta http-equiv="Window-target" CONTENT="_top">
<!--                       css请不要改变调用顺序                       -->
<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="../sys_theme/css/sys_menu.css" rel="stylesheet" type="text/css" />
</head>


<body>
<div id="sidebar" class="fn-clear"><!--注意使用了id-->
	<div id="sidebar-wrapper">
	<#if funcList?has_content>
	<#assign seq =1>
	<ul id="main-nav">
	<#list mainFuncSet as mainMenu>
    	
    	<li>
		 		<a href="#"  class="nav-top-item ">
		 		<img src="../sys_theme/images/icons/menu_0${seq}_off.png"/><span>${mainMenu.name}</span></a>
				<ul>
				<#assign key = mainMenu.name>
				<#assign submenus = funcList[key]>
		 		<#list submenus as submenu>
		 		<#if submenu.linkParameters ?exists>
	                <li><a  href="${submenu.link}?funcCode=${submenu.id}&${submenu.linkParameters}&rootFlag=true"  target="mainframe">${submenu.name}</a></li>
	            <#else>
	            	<li><a  href="${submenu.link}?funcCode=${submenu.id}&rootFlag=true"  target="mainframe">${submenu.name}</a></li>
	            </#if>
	            </#list>
	            </ul>   
	          </li>
	         
	        <#assign seq = seq + 0>
       </#list>
       </ul> 
       </#if>
       
    </div>
</div>

</body>
<!--                    左侧菜单交互   Javascripts请不要改变调用顺序                       -->
<script type="text/javascript" SRC="../sys_theme/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../sys_theme/js/base.menu.js"></script>
</html>
