<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <title>法制办</title>
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
</head>
<body>
<div class="xzfy mh-700">
    <div class="xzfy-hd fn-clear">
        <a class="xzfy-hd-r fhsy fn-right" href="javascript:gotoIndexPage()"></a>
        <div class="xzfy-hd-bg fn-left"></div>
    </div>
    <div class="xzfy0-main fn-clear">
        <div class="xzfy0-new fn-left">
            <a class="xzfy0-new-link" href="../zxsq/newsq.action?funcCode=${funcCode}&fyjg=${fyjg?default('0000')}" title="点击填写新的申请信息"></a>
            <p class="xzfy0-p">如果您对一个具体行政行为申请行政复议，尚未在本系统内填写任何申请信息，请点击本按钮。</p>
        </div>
        <div class="xzfy0-continue fn-left">
            <a class="xzfy0-continue-link" href="../zxsq/proceedList.action?funcCode=${funcCode}" title="点击继续填写"></a>
            <p class="xzfy0-p">如果您需要修改未提交的案件信息，或者补充其他材料，可以选择【继续填写】。</p>
        </div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
	
	
	
	function gotoIndexPage()
	{
		if(confirm("你确定要返回首页吗？你可以在三天内通过提供“案件代码”在“在线申请-继续填写”来完成复议申请的填写。"))  
	    {
	    	window.location.href="../zxfy/mainPage.action?funcCode=${funcCode}";
	    }
	}
	
</script>