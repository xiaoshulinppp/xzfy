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
					<div class="xzfy1-btn fn-clear"><p class="zxfy1-btn-p fn-left">请填写行政复议请求</p></div>
					<form name="xzzwForm" action=""  method="post" enctype="multipart/form-data" >
						<@ww.hidden name="'infoId'" />
						<@ww.hidden name="'funcCode'" />
						<@ww.hidden name="'caseIndex'" />
						<@ww.hidden name="'infoModel.executeDate'" id="executeDate" />
						<table class="table">
							<tr>
								<td class="text-r">
									具体行政行为名称：
								</td>
								<td>
									<@ww.textfield name="'infoModel.xwName'" id="xwName" maxlength="50" cssClass="'bd-i wd-150 pd-4'"  />
								</td>
							</tr>  	               	
					        <tr>
					        	<td class="text-r">
									文号：
								</td>
								<td>
									<@ww.textfield name="'infoModel.xwNum'" id="xwNum" maxlength="50" cssClass="'bd-i wd-150 pd-4'" />
								</td>
						     </tr>
						     
						     <tr>
					        	<td class="text-r">
									行政复议请求：
								</td>
								<td>
									<select name="infoModel.xzfyRequset" id="xzfyRequest" class="bd-i wd-150 select">
										  <option value ="" >请选择复议请求</option>
										  <option value="1" 
										  <#if infoModel.xzfyRequset?has_content && "1" == infoModel.xzfyRequset>
										  	selected="selected"
										  </#if>
										  >撤销该具体行政行为</option>
										  <option value="2"
										  <#if infoModel.xzfyRequset?has_content && "2" == infoModel.xzfyRequset>
										  	selected="selected"
										  </#if>
										  >变更该具体行政行为</option>
										  <option value="3"
										  <#if infoModel.xzfyRequset?has_content && "3" == infoModel.xzfyRequset>
										  	selected="selected"
										  </#if>
										  >确认该具体行政行为违法</option>
									</select>
								</td>
						     </tr>
						                    	
					        <tr>
					        	<td class="text-r">
									何时知道具体行政行为：
								</td>
								<td>
									<select name="year" id="year" onchange="yearMonth(this.value)"><option value="">选择年份</option></select>年
								    <select name="month" id="month" onchange="monthDay(this.value)"><option value="">选择月份</option></select>月
									<select name="day" id="day"><option value="">选择日期</option></select>日
								</td>
						    </tr>  	               	
					        <tr>
					        	<td class="text-r">
									知道具体行政行为方式：
								</td>
								<td>
							<#-->		<@ww.textfield name="'tuJing'" id="fangShi" cssClass="'bd-i wd-150 pd-4'" /> -->
									<select name="tuJing" id="fangShi" class="bd-i wd-150 select">
										  <option value ="" >请选择知道方式</option>
										  <option value="邮寄" 
										  <#if tuJing?has_content && "邮寄" == tuJing>
										  	selected="selected"
										  </#if>
										  >邮寄</option>
										  <option value="当面领取" 
										  <#if tuJing?has_content && "当面领取" == tuJing>
										  	selected="selected"
										  </#if>
										  >当面领取</option>
										  <option value="信息公开" 
										  <#if tuJing?has_content && "信息公开" == tuJing>
										  	selected="selected"
										  </#if>
										  >信息公开</option>
										  <option value="公告" 
										  <#if tuJing?has_content && "公告" == tuJing>
										  	selected="selected"
										  </#if>
										  >公告</option>
										  <option value="法院判决" 
										  <#if tuJing?has_content && "法院判决" == tuJing>
										  	selected="selected"
										  </#if>
										  >法院判决</option>
										  <option value="其他" 
										  <#if tuJing?has_content && "其他" == tuJing>
										  	selected="selected"
										  </#if>
										  >其他</option>
									</select>
								</td>
						     </tr>
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
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="../pages/zxfy/js/time5.js" charset="utf-8"></script>
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
    	window.location.href="../zxsq/isNotXzzwSave.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
	   	window.getElementById('nextBtn').disabled=true;
    }
    
	
	function xiaYiBu(){
		var str = $("#xwName").val();
		if(str == null || str == undefined || str == '')
		{
			alert("请填写   具体行政行为名称 ");
			return;
		}
		str = $("#xwNum").val();
		if(str == null || str == undefined || str == '')
		{
			alert("请填写  行文文号");
			return;
		}
		str = $("#xzfyRequest").val();
		if(str == null || str == undefined || str == '')
		{
			alert("请选择  行政复议请求");
			return;
		}
		str = $("#year").val();
		var dateStr = "";
		if(str == null || str == undefined || str == '')
		{
			alert("请选择   知道的 年份");
			return;
		}
		
		dateStr = str + "年";
		str = $("#month").val();
		if(str == null || str == undefined || str == '')
		{
			alert("请选择   知道的月份");
			return;
		}
		dateStr += str + "月";
		str = $("#day").val();
		if(str == null || str == undefined || str == '')
		{
			alert("请选择  知道的日期");
			return;
		}
		dateStr += str + "日";
		$("#executeDate").val(dateStr);
		str = $("#fangShi").val();
		if(str == null || str == undefined || str == '')
		{
			alert("请填写  知道的方式");
			return;
		}
		
		window.xzzwForm.action="../zxsq/runXzzwSave.action";
		window.xzzwForm.submit();
	}
</script>