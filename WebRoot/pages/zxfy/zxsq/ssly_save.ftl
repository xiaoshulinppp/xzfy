<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <title>法制办</title>
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
</head>
<body>

    <div class="xzfy mh-700 pos-rel">
        <div class="xzfy-hd fn-clear">
            <a class="xzfy-hd-r fhsy fn-right" href="javascript:gotoIndexPage()"></a>
            <div class="xzfy-hd-bg fn-left"></div>
        </div>
        <ul class="xzfy-nav fn-clear">
            <li><p>申请人信息</p><span>1</span></li>
            <li><p>选择代理人</p><span>2</span></li>
            <li><p>被申请人信息</p><span>3</span></li>
            <li><p>填写复议请求</p><span>4</span></li>
            <li class="xzfy-nav-on"><p>填写事实及理由</p><span>5</span></li>
            <li><p>上传证据及依据</p><span>6</span></li>
        </ul>
		<div class="xzfy6">
				<div class="xzfy6-bg ">
					<div class="xzfy1-btn fn-clear"><p class="zxfy1-btn-p fn-left">请填写事实理由</p></div>
					<form name="sslyForm" action=""  method="post" enctype="multipart/form-data" >
						<@ww.hidden name="'infoId'" />
						<@ww.hidden name="'funcCode'" />
						<@ww.hidden name="'caseIndex'" />
	                
	                <div class="xzfy-table">
	                	<textarea name="infoModel.appAdviceDetail" id="ssly" class="bd-i wd-500 pd-4 mg-0 va-t" rows="8" onkeyup="checkSsly()"  onafterpaste="checkSsly()"><#if infoModel.appAdviceDetail ? has_content>${infoModel.appAdviceDetail?default('')}</#if></textarea>
	                	<div class="xzfy6-p">（温馨提示：事实理由最多可以填写<span>5000</span>个字符，您已填写<span id="yiTian">0</span>个字符，还可以填写<span id="shengYu">0</span>个字符）</div>
	                	<table class="table">	
							<tr>
								<td>
									<div class="xzfy-next"><a class="next-btn" href="javascript:back()" title="点击返回上一步：">上一步</a> </div>
						     	</td>
						     	<td>
						     		<div class="xzfy-next"><a class="next-btn" href="javascript:xiaYiBu()" title="点击进入下一步：">下一步</a> </div>
						     	</td>
							</tr>
						</table>
	                </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="../pages/zxfy/js/jquery-1.10.2.min.js"></script>
<script>
	
	
	function gotoIndexPage()
	{
		if(confirm("你确定要返回首页吗？你可以在三天内通过提供“案件代码”在“在线申请-继续填写”来完成复议申请的填写。"))  
	    {
	    	window.location.href="../zxfy/mainPage.action?funcCode=${funcCode}";
	    }
	}
	
	window.onload = function(){
		checkSsly();
	}

	function checkSsly()
	{
		var str = $("#ssly").val();
		if(str == null || str == undefined || str == '')
		{
			$("#yiTian").html("0");
			$("#shengYu").html("0");
			return false;
		}
		
		var len = str.length;
		$("#yiTian").html(len);
		$("#shengYu").html(5000 - len);
		
		
		if(len > 5000)
		{
			return false;
		}else{
			return true;
		}
	}
	
	<#-- 上一步  -->
	function back(){
		window.location.href="../zxsq/sslyBefore.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
	   	window.getElementById('nextBtn').disabled=true;
	}
	
	<#-- 下一步 -->	
	function xiaYiBu(){
		
		if(!checkSsly())
		{
			alert("请填写  事实理由, 且字数限制为 5000个字符以内");
			return;
		}
		window.sslyForm.action="../zxsq/runSslySave.action";
		window.sslyForm.submit();
		document.sslyForm.nextBtn.disabled=true;
	}
</script>