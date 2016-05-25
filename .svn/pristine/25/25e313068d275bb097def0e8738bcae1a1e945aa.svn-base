<!--************************************************************ -->
<!--* 文件创建日期：2006-09-08                                 * -->
<!--* 功能描述：系统HEAD部分                                   * -->
<!--************************************************************ -->
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>信息系统构架平台V2.0</title>
<link rel="stylesheet" href="../${Session["_USER_STYLE_"].cssPath}/head_style.css" type="text/css">
<script type="text/javascript" src="../${Session["_USER_STYLE_"].jsPath}/poslib.js"></script>
<script type="text/javascript" src="../${Session["_USER_STYLE_"].jsPath}/scrollbutton.js"></script>
<script type="text/javascript" src="../${Session["_USER_STYLE_"].jsPath}/menu4.js"></script>
<script type="text/javascript" src="../${Session["_USER_STYLE_"].jsPath}/winxp.css.js"></script>
<link href="../${Session["_USER_STYLE_"].cssPath}/winxp.css" rel="stylesheet" type="text/css">
<!--JavaScript部分-->
<style type="text/css">
</style>
</head>

<script type="text/javascript">

var ie55 = /MSIE ((5\.[56789])|([6789]))/.test( navigator.userAgent ) &&
			navigator.platform == "Win32";

if ( !ie55 ) {
	window.onerror = function () {
		return true;
	};
}

function writeNotSupported() {
	if ( !ie55 ) {
		document.write( "<p class=\"warning\">" +
			"This script only works in Internet Explorer 5.5" +
			" or greater for Windows</p>" );
	}
}

</script>

<script type="text/javascript">



// set default css file to use
Menu.prototype.cssText = cssText;



// menu bar

var menuBar = new MenuBar();



//============menu_1================


//======================================
</script>


<BODY>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="../${Session["_USER_STYLE_"].imagePath}/bg_head.gif">
  <tr>
    <td width="341" rowspan="2"><img src="../${Session["_USER_STYLE_"].imagePath}/pic_logo_LDJC.gif" width="341" height="72"></td>
    <td height="35" align="right"><table border="0" cellspacing="5" cellpadding="0">
      <tr>
        <td class="userInfo">操作员：${userName}  登录时间：${loginTime}</td>
        <td width="73"><a href="#"></a><a href="#"><img src="../${Session["_USER_STYLE_"].imagePath}/button_xgzl.gif" alt="修改个人资料" width="72" height="23" border="0"></a></td>
        <td width="72"><a href="../" target="_top"><img src="../${Session["_USER_STYLE_"].imagePath}/button_logout.gif" alt="退出登录" width="72" height="23" border="0"></a></td>
      </tr>
      
    </table></td>
    <td width="10" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>
	<table border="0" cellpadding="0" cellspacing="0" align="right">
	<tr>
	  <#if topFuncList?has_content>
	  <td width="5" ><img src="../${Session["_USER_STYLE_"].imagePath}/pic_topmenu_left.gif" width="5" height="23"></td>

     <#list topFuncList as rootMenu>
       <#assign link = "../system/getMenuAction.action?parentMenuId="+rootMenu.id>
         <td height="23" background="../${Session["_USER_STYLE_"].imagePath}/bg_menu_button_off.gif" >
         	    <a href="${link}" class="toplink" target="leftFrame">${rootMenu.name}</a>         	
         </td>
     </#list>
    </#if>   

   	  <td height="23" background="../${Session["_USER_STYLE_"].imagePath}/bg_menu_button_off.gif" >	
		<script type="text/javascript">
			menuBar.write();
		</script>
		
		<script type="text/javascript">
			writeNotSupported();
		</script></td>
	  <#if topFuncList?has_content>
	  <td width="5" align="right" ><img src="../${Session["_USER_STYLE_"].imagePath}/pic_topmenu_right.gif" width="5" height="23"></td>
	  </#if>
	</tr>
</table>
	</td>
  </tr>
</table>
</BODY>
