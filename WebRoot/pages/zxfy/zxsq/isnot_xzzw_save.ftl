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
            <li  class="xzfy-nav-on"><p>填写复议请求</p><span>4</span></li>
            <li><p>填写事实及理由</p><span>5</span></li>
            <li><p>上传证据及依据</p><span>6</span></li>
        </ul>
        
		<div class="xzfy6">
				<div class="xzfy6-bg ">
					<p class="xzfy0-p">   您申请行政复议的事项是：</p>
					<form name="isnotXzzwForm" action=""  method="post" enctype="multipart/form-data" >
						<@ww.hidden name="'infoId'" /> 
						<@ww.hidden name="'funcCode'" />
						<@ww.hidden name="'caseIndex'" />
	                <div class="xzfy-table">
	                    <table class="table">
		                    	<colgroup>
						            <col style="width: 5%;" />
									<col style="width: 90%;" />
						        </colgroup>
							<tbody>
								<tr>
									<td>
										<input type="radio" name="infoModel.isManage" value="0" 
										<#if infoModel.isManage?has_content && infoModel.isManage == "0">
											checked="checked"
										</#if>
										 />
									</td>
									<td>
										<label>不服从被申请人做出的具体行政行为</label> 
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="infoModel.isManage" value="2"
										<#if infoModel.isManage?has_content && infoModel.isManage == "2">
											checked="checked"
										</#if>
										 />
									</td>
									<td>
										<label>认为被申请人不履行法定职责</label> 
									</td>
								</tr>
	                        </tbody>
	                    </table>
	                    
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
	
    
    function back()
    {
    	window.location.href="../zxsq/bsqrSave.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
	   	window.getElementById('nextBtn').disabled=true;
    }
    
	
	function xiaYiBu(){
	
		var str=$('input:radio[name="infoModel.isManage"]:checked').val();
        if(str==null){
            alert("请选择  申请的行政复议事项");
            return;
        }
		window.isnotXzzwForm.action="../zxsq/runIsNotXzzwSave.action";
		window.isnotXzzwForm.submit();
	}
</script>