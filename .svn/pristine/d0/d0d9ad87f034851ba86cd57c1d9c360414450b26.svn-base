
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议信息管理系统</title>
<link href="../webstyle/style/main.css" rel="stylesheet" type="text/css" />
<link href="../webstyle/style/index.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../webstyle/script/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/js.js"></script>
<script language="javascript" type="text/javascript" src="../webstyle/script/fun.js"></script>
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/jquery.form.js"></script> 
<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<!-- 组件template -->
<script type="text/javascript" src="../${Session['_USER_STYLE_'].jsPath}/tpl.base.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js"></script>
<!--[if lte IE 6]>
<script src="script/png.js" type="text/javascript"></script>
    <script type="text/javascript">
        DD_belatedPNG.fix('div, ul, img, li, input , a');
    </script>
<![endif]--> 
</head>

<body   onload="startTime()">

<form name="Form1" id="Form1" action="" method="post">

<#include "../website/header.ftl">

<div class="wal pageNow2">
      <div class="fl">当前位置：<a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页  </a>> 用户列表 </div>
      <div class="fr"></div>
</div>

<div class="pageBg1">
<div class="wal">
     
	  
		<input type="hidden" name="funcCode" value="${funcCode}">
		<input type="hidden" name="pNum" value="${pNum}" id="pageNum">
	  
      <div class="pageBox">
            <div class="searchList">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
            	<tr>
            		<td><span style="float:right;"><input type="button" style="border:1px solid;color:white;background:green;padding:3px;font-size:15px;width:80px;" value="新增用户" onClick="addUser()" />
            		<input type="button" style="border:1px solid;color:white;background:green;padding:3px;font-size:15px;width:80px;" value="返回" onClick="goBack()" /></span></td>
            	</tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>登录名</th>                 
                    <th>密码</th>
                  </tr>
				  <#assign account=pNum*pageSize-pageSize+1>
				<#list pageList as user>
					
						
					<tr>
						<td>${account}</td>
						<td>&nbsp;${user.name?default('')}</td>
						<td>&nbsp;${user.logName?default('')}</td>
						<td>&nbsp;${user.password?default('')}</td>		
					</tr>
					<#assign account=account+1>
				</#list>
             
            </table>
          
            <div class="pageNum">
               第${pNum}/${totalPage}页   共${totalCount}条
					<#assign upPage = pNum -1>
					<#if upPage lt 1 >
					<#assign upPage = 1>
					</#if>
					<#assign downPage = pNum +1>
					<#if (downPage gt totalPage)>
					<#assign downPage = totalPage>
					</#if>　
			<a href="javascrpt:goPage(1)" class="ui-page-item ui-page-item-first">首页</a>
			    <a href="javascrpt:goPage(${upPage})" class="ui-page-item ui-page-item-prev">上一页</a>
		     	<a href="javascrpt:goPage(${downPage})" class="ui-page-item ui-page-next">下一页</a>
			    <a href="javascrpt:goPage(${totalPage})" class="ui-page-item ui-page-last">尾页</a>　
            </div>
            </div>
      </div>
      <div class="pageBoxBg"></div>
</div>
</div>
</form>
<div class="foot">
版权所有：北京市人民政府法制办　地址：北京市西城区槐柏树街2号<br />
电话：65193431
</div>
</body>
</html>

<script>
		function addUser(){
	    	document.Form1.action="gfbAddUser.action";
	    	document.Form1.submit();
	    }
		function goPage(pNum){		
			document.getElementById("pageNum").value=pNum;
			document.Form1.submit();
		}
		function goBack(){
			document.Form1.action="changePwd.action";
	    	document.Form1.submit();
		}
	</script>