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
					<div class="xzfy-table">
						<form name="xzbzwForm" action="" class="registerform"  method="post" enctype="multipart/form-data" >
						<@ww.hidden name="'infoId'" />
						<@ww.hidden name="'funcCode'" />
						<@ww.hidden name="'caseIndex'" />
						<@ww.hidden name="'infoModel.executeDate'" id="executeDate" />
						<table class="table">
							<tbody>
								<tr>
									<td>
										您向被申请人要求履行何种法定职责	（50字内）
									</td>
								</tr>
								<tr>
									<td>
										<@ww.textfield id="xzfyRequsetRetail" name="'infoModel.matterType'" maxlength="50" cssClass="'bd-i wd-300 pd-4'" />
									</td>
								</tr>
								<tr>
									<td>
										您何时向被申请人要求履行该法定职责
									</td>
								</tr>
								<tr>
									<td>
										<select name="year" id="year" onchange="yearMonth(this.value)"><option value="">选择年份</option></select>年
					    				<select name="month" id="month" onchange="monthDay(this.value)"><option value="">选择月份</option></select>月
										<select name="day" id="day"><option value="">选择日期</option></select>日
									</td>
								</tr>
								<tr>
									<td>
										复议请求:
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="infoModel.xzfyRequset" value="4"
										<#if infoModel.xzfyRequset?has_content && "4" == infoModel.xzfyRequset>
											checked="checked"
										</#if>
										
										 />责令被申请人履行法定职责
									</td>
								</tr>
								<tr>
									<td>
										<input type="radio" name="infoModel.xzfyRequset" value="5"
										<#if infoModel.xzfyRequset?has_content && "5" == infoModel.xzfyRequset>
											checked="checked"
										</#if>
										 />确认被申请人不履行法定职责违法
									</td>
								</tr>
								
							</tbody>
						</table>
						</form>
					</div>
				</div>
				<table class="table">	
					<tr>
						<td>
				     		<div class="xzfy-next"><a class="next-btn" href="../zxsq/isNotXzzwSave.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}" title="点击返回上一步：选择代理人">上一步</a> </div>
				     	</td>
				     	<td>
				     		<div class="xzfy-next"><a class="next-btn" href="javascript:xiaYiBu()" title="点击进入下一步：">下一步</a> </div>
				     	</td>
					</tr>
				</table>
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
	

/*	$(function(){
		var dateStr = $("#executeDate").val();
		if(dateStr != null && dateStr != undefined || dateStr != '')
		{
			alert(dateStr.substr(0,4));
			$("#year").get(0).value = dateStr.substr(0,4);
        	$("#month").get(0).value = dateStr.substr(5,2);
        	$("#day").get(0).value = dateStr.substr(8,2);
        	alert(dateStr.substr(8,2));
		}
	});
	*/

/*	$(document).ready(function(){
		var dateStr = $("#executeDate").val();
		if(dateStr != null && dateStr != undefined || dateStr != '')
		{
			alert(dateStr.substr(0,4));
			$("#year").get(0).value = dateStr.substr(0,4);
        	$("#month").get(0).value = dateStr.substr(5,2);
        	$("#day").get(0).value = dateStr.substr(8,2);
        	alert(dateStr.substr(8,2));
		}
	});
	*/
	
/*	window.onload = function(){
		var dateStr = $("#executeDate").val();
		if(dateStr != null && dateStr != undefined || dateStr != '')
		{
			alert(dateStr.substr(0,4));
			$("#year").get(0).value = "2014";
        	$("#month").get(0).value = "12";
        	$("#day").get(0).value = "12";
        	alert(dateStr.substr(8,2));
		}
	}
*/
	function setDate()
	{
		var dateStr = $("#executeDate").val();
		if(dateStr != null && dateStr != undefined || dateStr != '')
		{
			alert(dateStr);
		}
		alert(dateStr);
	}
    
    function back()
    {
    	window.location.href="../zxsq/isNotXzzwSave.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
	   	window.getElementById('nextBtn').disabled=true;
    }
    


	function xiaYiBu(){
		var str = "";
		var dateStr = "";
		var s = $("#xzfyRequsetRetail").val();
		if(s == null || s == undefined || s == '')
		{
			alert("请填写   您向被申请人要求履行何种法定职责");
			return;
		}
		str = "infoModel.xzfyRequsetRetail=" + s;
		s = $("#year").val();
		if(s == null || s == undefined || s == '')
		{
			alert("请选择   知道的 年份");
			return;
		}
		dateStr = s + "年";
		s = $("#month").val();
		if(s == null || s == undefined || s == '')
		{
			alert("请选择   知道的月份");
			return;
		}
		dateStr += s + "月";
		s = $("#day").val();
		if(s == null || s == undefined || s == '')
		{
			alert("请选择  知道的日期");
			return;
		}
		dateStr += s + "日";
		$("#executeDate").val(dateStr);
		
		s = $('input:radio[name="infoModel.xzfyRequset"]:checked').val();
		if(s == null || s == undefined || s == '')
		{
			alert("请选择  复议请求");
			return;
		}
		
		
		window.xzbzwForm.action="../zxsq/runXzbzwSave.action";
		window.xzbzwForm.submit();
	}
</script>