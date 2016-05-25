<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    	<title>在线阅卷</title>
		<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
    	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
	</head>
	<body>
		<form name="searchForm" action=""  method="post">
		<div class="xzfy mh-700">
    		<div class="xzfy-hd fn-clear">
    			<div class="xzfy-hd-r" style="font-size:20px">
    				在线查阅案卷
        			<a class="fhsy fn-right" onClick="back()"></a>
        		</div>
    		</div>
    		<div class="sccl-add">
                <label class="fn-left">请输入申请码：</label>
                <input class="fn-left" type="text" name="caseNum" placeholder="请输入申请码" />
                &nbsp; &nbsp;
                <input type="button" class="btn-delete" value="提交" onClick="searchList()" />
                <a style="color:red">${message?default('')}</a>
			</div>
			<div style="margin: 0 30px;">
				<span style="font-size:12px;color:red">提示：</span><br />
				<div class="xzfy6-p">&nbsp; &nbsp;&nbsp; &nbsp;请输入申请码以便查询相应的案卷!</div>
			</div>
			<script>
				//查询
				function searchList(){
					window.searchForm.action="../zxyj/fileList.action?funcCode=${funcCode}";
					window.searchForm.submit(); 
				}
				//返回
				function back(){
					window.searchForm.action="../zxfy/mainPage.action?funcCode=${funcCode}";
					window.searchForm.submit(); 
				}
			</script>
			</div>
		</form>
	</body>
</html>