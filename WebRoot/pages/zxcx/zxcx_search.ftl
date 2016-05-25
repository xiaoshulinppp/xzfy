<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
	<title>在线查询</title>
</head>
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
<body>
	<div class="xzfy mh-700 pos-rel">
        <div class="xzfy-hd fn-clear">
            <a class="xzfy-hd-r fhsy fn-right" href="../zxfy/mainPage.action?funcCode=${funcCode}""></a>
            <div class="xzfy-hd-bg fn-left"></div>
        </div>
        <div class="xzfy-table xzfy1-table">
        	<form class="xzfy-form" name="updateForm" action=""  method="post">
        		<div class="bd-b fn-clear">
                    <label class="label-r">请输入案件代码</label>
                    <input name="caseIndex" class="bd-i wd-300 pd-4" type="text"><a style="color:#FF0000">${message?default('')}</a>
                    <input type="button" class="button" value="提交" onClick="submitIndex()"></input>
                </div>
                <div class="bd-b fn-clear">
                	<p class="xzfy0-p">提示：请输入身份证号码及查询码以便查询相应的案件信息。</p>
                </div>
        	</form>
        </div>
    </div>
	<script>
		function submitIndex(){
			window.updateForm.action="../zxcx/zxcxByCaseIndex.action?funcCode=${funcCode}";
			window.updateForm.submit();
		}
	</script>
</body>
</html>