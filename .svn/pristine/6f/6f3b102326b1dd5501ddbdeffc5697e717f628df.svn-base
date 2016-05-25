<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--********************************************************* -->
<!--* 文件创建日期：2013-07-16                                 * -->
<!--* 文件修改日期：2013                                       * -->
<!--* 功能描述：总体框架文件                                    * -->
<!--********************************************************* -->
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京市行政复议管理系统</title>
<meta http-equiv=="Pragma" CONTENT="no-cache">
<meta http-equiv="Window-target" CONTENT="_top">
<!--                       css请不要改变调用顺序                       -->
<link href="sys_theme/css/base.css" rel="stylesheet" type="text/css" />
<link href="sys_theme/css/sys_frames.css" rel="stylesheet" type="text/css" />
<!--                       Javascripts请不要改变调用顺序                       -->
<script type="text/javascript" SRC="sys_theme/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="sys_theme/js/baseframe.js"></script>
<script language="JavaScript">
<!--
function tick() {
var hours, minutes, seconds;
var intHours, intMinutes, intSeconds;
var today;
today = new Date();
intHours = today.getHours();
intMinutes = today.getMinutes();
intSeconds = today.getSeconds();

if (intHours == 0) {
hours = "00:";
} else if (intHours < 10) { 
hours = "0" + intHours+":";
} else {
hours = intHours + ":";
}

if (intMinutes < 10) {
minutes = "0"+intMinutes+":";
} else {
minutes = intMinutes+":";
}
if (intSeconds < 10) {
seconds = "0"+intSeconds+" ";
} else {
seconds = intSeconds+" ";
} 
timeString = hours+minutes+seconds;
Clock.innerHTML = timeString;
window.setTimeout("tick();", 1000);
}

window.onload = tick;
//-->
</script>
<script language="javascript" type="text/javascript">
<!--
//获得当前时间,刻度为一千分一秒
var initializationTime=(new Date()).getTime();
function showLeftTime()
{
var now=new Date();
var year=now.getFullYear();
var month=now.getMonth();
var monthnum=month+1;
var day=now.getDate();
var hours=now.getHours();
var minutes=now.getMinutes();
var seconds=now.getSeconds();
document.all.show.innerHTML=""+year+"年"+monthnum+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";
//一秒刷新一次显示时间
var timeID=setTimeout(showLeftTime,1000);
}
//-->

function returnDesk(){
	document.getElementById("mainframe").src="xzfy/showTotalPage.action?funcCode=450";
}
</script>
</head>


<body  onload="showLeftTime(); resizeFrame('subframe');resizeFrame('mainframe');" scroll="no"onresize="resizeFramedbClick('subframe');resizeFramedbClick('mainframe');" ><!--框架实时响应窗口变化-->
<!--start header-->
<div id="header" class="fn-clear">
    <!--系统logo开始-->
    <div id="logo"><img src="sys_theme/images/head.jpg"/></div> 
    <!--系统logo结束-->  
</div>
<!--end header-->
<!--menubar 用户信息显示-->
<div id="operater" class="fn-clear">
<!--start 用户信息-->
<div class="userbar">
     <ul class="userbtn">
        <li><a href="javascript:returnDesk();" title="注销当前用户"><img src="sys_theme/images/logoff.png"/></a></li>
        <li><a href="javascript:void(0);" title="退出系统"><img src="sys_theme/images/btn_quite.png"/></a></li>
     </ul>
	 <div class="userinfo">
             <img src="sys_theme/images/pic_userinfo_left.png"/>
     		<span><img src="sys_theme/images/icons/userinfo.png"/><font>[${Session["_USER_LOGIN_"].name} ] </font></span>
            <span><img src="sys_theme/images/icons/nowtime.png"/><font  id="show"></font></span>
     </div>    
</div>
<!--end 用户信息-->
	<div class="menubar" id="menubar">
   		 <div class="menubar-content-show" onClick="hidemenu();" title="隐藏菜单栏" id="hidemenu" style="display:block;"><img src="sys_theme/images/menu_hide.png"/></div>
   	     <div class="menubar-content-hide" style="display:none;" onClick="showmenu();" id="showmenu"  title="显示菜单栏"><img src="sys_theme/images/menu_show.png"/></div>	
    </div>

</div>
<!--menubar 用户信息显示结束-->
<!--mainbody-->
<div id="container">
    <!--主操作区域开始-->
 	<div id="col-main">
     <div id="main-content" class="main-content"><iframe src="xzfy/showTotalPage.action?funcCode=450" name="mainframe" width="100%" marginwidth="0" marginheight="0"  scrolling="yes" style="overflow:visible"  frameborder="0" id="mainframe" onload="resizeFramedbClick('subframe');resizeFramedbClick('mainframe');"></iframe></div>
    </div>  
    <!--主操作区域结束-->
     <!--左侧栏开始-->
    <div id="col-sub" class="col-sub"><iframe src="system/getMenuAction.action" name="subframe" width="240" marginwidth="0" marginheight="0" scrolling="no" frameborder="0" id="subframe" style="display:block" ></iframe>
    </div>
     <!--左侧栏结束--> </div><!--end mainbody-->
</body>

</html>
