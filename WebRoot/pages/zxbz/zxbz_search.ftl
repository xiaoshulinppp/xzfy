<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线补证</title>
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
		<form name="updateForm" action=""  method="post" class="xzfy-form">
			 <div class="bd-b fn-clear">
                <label class="label-r">请输入案件代码：</label>
                <input class="bd-i pd-4" type="text" name="caseNum">
                <input type="button" class="button" value="提交" onClick="submitIndex()"></input>
                <a style="color:#FF0000">${message?default('')}</a>
            </div>
            <div class="bd-b fn-clear">
            	<p class="xzfy0-p">提示：请输入身份证号码及查询码以便查询相应的案件信息。</p>
            </div>
		</form>
	</div>
	<script>
		function submitIndex(){
			window.updateForm.action="../zxbz/loginBuzheng.action?funcCode=${funcCode}";
			window.updateForm.submit();
		}
	</script>
</body>
</html>