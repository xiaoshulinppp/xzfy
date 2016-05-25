<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>继续申请</title>
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
</head>
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
<body>
<div class="xzfy mh-700 pos-rel">
	 <div class="xzfy-hd fn-clear">
        <a class="xzfy-hd-r fhsy fn-right" href="../zxfy/mainPage.action?funcCode=${funcCode}"></a>
        <div class="xzfy-hd-bg fn-left"></div>
    </div>
	<div class="xzfy-table xzfy1-table">
		<form name="proceedForm" action=""  method="post" class="xzfy-form">
			 <div class="bd-b fn-clear">
			 	<#if otherValue == "1">
			 		<div class="xzfy6-p"><span>你的案件代码不存在</span></div>
			 	<#elseif otherValue == "2">
			 		<div class="xzfy6-p"><span>你的申请已经提交，你可以通过首页的其他功能查看进度或进行补正</span></div>
			 	<#elseif otherValue == "3">
			 		<div class="xzfy6-p"><span>你的申请已过期</span></div>
			 	<#elseif otherValue == "4">
			 		<div class="xzfy6-p"><span>你的案件异常</span></div>
			 	</#if>
                <label class="label-r">请输入案件代码：</label>
                <input class="bd-i pd-4" type="text" name="sqm">
                <input type="button" class="button" value="提交" onClick="submitIndex()"></input>
                <a style="color:#FF0000">${message?default('')}</a>
            </div>
            <div class="bd-b fn-clear">
            	<p class="xzfy0-p">提示：请输入案件代码以便继续进行申请。</p>
            </div>
		</form>
	</div>
	<script>
		function submitIndex(){
			window.proceedForm.action="../zxsq/proceedSq.action?funcCode=${funcCode}";
			window.proceedForm.submit();
		}
	</script>
</body>
</html>