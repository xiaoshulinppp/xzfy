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
<script>

</script>
</head>

<body>
<#if articleList.size()!=0>
<div class="dataListTitle"><h1>典型案例</h1>
</div>
            
 
            <div class="dataList">
            <ul>
                    <#list articleList as a>
                       <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${a.id}" target="blank">${a.title}</a><span>${a.releaseDate?default('')}</span></li>
                    </#list>
            </ul>
            </div>

            <div class="dataListB"></div>
</#if>
</body>
</html>
            