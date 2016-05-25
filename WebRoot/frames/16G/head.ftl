<!--************************************************************ -->
<!--* 文件创建日期：2008-07-30                                 * -->
<!--* 功能描述：系统HEAD部分                                   * -->
<!--************************************************************ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>信息采集报送平台</title>
<link rel="stylesheet" href="../${Session["_USER_STYLE_"].cssPath}/head_style.css" type="text/css">
<script language="javascript" src="../${Session["_USER_STYLE_"].jsPath}/card_li.js" type="text/javascript"></script>



<BODY>
<div class="topTabOut">
    <div class="titleLogo">
	<div class="topTitleChn">信息采集报送平台</div>
	</div>
    <div class="menuDiv">
    <div class="tdSmenu"></div>


    <div class="listDiv"><ul class="topCardUl">
    <#if topFuncList?has_content>
	<#assign seq =1>
    <#list topFuncList as mainMenu>
   
    	<li class="topCardOff" onClick="changeCard(this,'topCard'),changeFrame('${mainMenu.id}')">
          <span>${mainMenu.name}</span>
    	</li>

    <#assign seq = seq + 1>
    </#list>
    </#if>
      </ul></div>
  </div>
</div>
<div class="contBarOut">
	<div class="contBarIn">
	<div class="loginTime">用户：${userName} | 登录时间：${loginTime}</div>
	<div class="userInfo"><a href="../unLogin.action" target="_top">退出登录</a></div>
	</div>
</div>
</BODY>
<SCRIPT language="javascript">
function changeFrame(tempId){
	parent.mainFrame.document.all.mainframeset.cols = "230,10,*"; //parent.controlFrame.document.all.closemenu.style.display = "none"; parent.controlFrame.document.all.openmenu.style.display = "block"; 
	parent.mainFrame.mainPage.location='../user/getUserPage.action';
	parent.mainFrame.controlFrame.document.all.closemenu.style.display = "block"; 
	parent.mainFrame.controlFrame.document.all.openmenu.style.display = "none"; 
	parent.mainFrame.leftFrame.location='../system/getMenuAction.action?parentMenuId='+tempId;
}

</SCRIPT>