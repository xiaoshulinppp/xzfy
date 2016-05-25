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
<div class="dataListTitle"><h1><#if articleList[0].subColumn=="11">图片动态<#elseif articleList[0].subColumn=="12">工作动态<#elseif articleList[0].subColumn=="21">领导讲话
                 <#elseif articleList[0].subColumn=="22">法制舆情摘报<#elseif articleList[0].subColumn=="31">法律法规<#elseif articleList[0].subColumn=="41">行政处罚<#elseif articleList[0].subColumn=="42">行政许可
                 <#elseif articleList[0].subColumn=="43">行政强制实施<#elseif articleList[0].subColumn=="44">行政不作为<#elseif articleList[0].subColumn=="45">行政征收<#elseif articleList[0].subColumn=="46">行政确权
                 <#elseif articleList[0].subColumn=="47">干预经营自主权<#elseif articleList[0].subColumn=="48">信息公开<#elseif articleList[0].subColumn=="49">其他</#if></h1>
                 <a href="../website/subColumnMore.action?funcCode=${funcCode}&column=${articleList[0].column}&subColumn=${articleList[0].subColumn}" target="blank" class="more"><img src="../webstyle/image/more.gif" /></a></div>
            
            <#if articleList[0].subColumn=="11">
            <div class="imgList">
            <ul>
            		<#list articleList as a>
                     <li>
                        <div class="imgDiv"><a  href="../website/showArticle.action?funcCode=${funcCode}&articleId=${a.id}" target="blank"><img src="${a.firstImage}" alt="" width="120" /></a></div>
                        <div class="name"><a href="">${a.title}</a></div>
                     </li>
                     </#list>
            </ul>
            <span class="clear_f"></span>
            </div>
            <#else>
            <div class="dataList">
            <ul>
                    <#list articleList as a>
                       <li><a href="../website/showArticle.action?funcCode=${funcCode}&articleId=${a.id}" target="blank">${a.title}</a><span>${a.releaseDate?default('')}</span></li>
                    </#list>
            </ul>
            </div>
            </#if>
            <div class="dataListB"></div>
</#if>
</body>
</html>
            