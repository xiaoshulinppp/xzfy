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
            <li class="xzfy-nav-on"><p>选择代理人</p><span>2</span></li>
            <li><p>被申请人信息</p><span>3</span></li>
            <li><p>填写复议请求</p><span>4</span></li>
            <li><p>填写事实及理由</p><span>5</span></li>
            <li><p>上传证据及依据</p><span>6</span></li>
        </ul>
        
		<div class="xzfy6">
				<div class="xzfy6-bg ">
					<p class="xzfy0-p">请选择主要联系人</p>
					<form name="zylxrForm" id="zylxrForm" action=""  method="post" enctype="multipart/form-data" >
						<@ww.hidden name="'infoId'" />
						<@ww.hidden name="'funcCode'" />
						<@ww.hidden name="'caseIndex'" />
	                <div class="xzfy-table">
	                    <table class="table">
		                    	<colgroup>
						            <col style="width: 10%;" />
						            <col style="width: 20%;" />
						            <col style="width: 20%;" />
						            <col style="width: 20%;" />
						            <col style="width: 30%;" />
						        </colgroup>
							<tbody>
						<#list dbrOrDlr as app >
								<tr>
									<td>
										<input type="radio" id="${'input_' + app.id}" name="app.id" value="${app.id}" onKeyUp="showSend(${app.id})" onMouseDown="showSend(${app.id})"  
										<#if app.isLink=="1" >
											checked="checked"
										</#if>
										 />
									</td>
									<td>
										${app.appName}
									</td>
									<td>
										${app.telephone}
									</td>
									<td id="${"tr_a_" + app.id}">
										<#if app.isLink=="1" >
											<a class="btn-modify" href="javascript:send(${app.id})" id="send" >获取验证码</a>
										</#if>
										&nbsp;
									</td>
									<td id="${"tr_text_" + app.id}">
						            	&nbsp;
						            	<#if app.isLink=="1" >
											<input class="bd-i wd-150 pd-4" type="text" id="yanZhengMa" placeholder="请输入手机验证码 " maxlength="18" name="otherValue" />
										</#if>
									</td>
								</tr>
							</#list>
	                        </tbody>
	                    </table>
	                    
	                    <table class="table">	
							<tr>
								<td>
									<div class="xzfy-next"><a class="next-btn" href="javascript:back()" title="点击返回上一步：选择代理人">上一步</a> </div>
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
	
	var wait=0;
	
	window.onload = function(){
		<#list dbrOrDlr as app >
			<#if app.isLink=="1" >
				wait=60;
			</#if>
		</#list>
		time();
	}
	
	function time() {
        if (wait == 0) { 
//            alert();
//            o.removeAttribute("disabled");  
//			$("#send").attr({"disabled":"disabled"});         
            $("#send").text("获取验证码"); 
//            wait = 60;
        } else { 
//            o.setAttribute("disabled", true); 
//			$("#send").removeAttr("disabled");
            $("#send").text("(" + wait+ ")秒"); 
            wait--; 
            setTimeout(function() { 
                time() 
            }, 
            1000) 
        }
    }
	
	function showSend(zylxrID)
	{
		if(document.getElementById("send")){
			$("#send").remove();
		}
		if(document.getElementById("yanZhengMa")){
			$("#yanZhengMa").remove();
		}
		var str = "tr_a_" + zylxrID;
		if(wait == 0)
		{
			$("#" + str).html('<a class="btn-modify" href="javascript:send('+ zylxrID +')" id="send" >获取验证码</a>&nbsp;');
		}else{
			$("#" + str).html('<a class="btn-modify" href="javascript:send('+ zylxrID +')" id="send" >已发送</a>&nbsp;');
		}
		var str = "tr_text_" + zylxrID;
		$("#"+ str).html('&nbsp;<input class="bd-i wd-150 pd-4" type="text" id="yanZhengMa" placeholder="请输入手机验证码 "  name="otherValue" />');
		
		$("input[name='app.id']").val([zylxrID]);
//		$("#input_" + zylxrID).checked = true;
	}
	
	
	<#-- 案件申请码 -->
	function send(zylxrID){
		
		<#-- 点击发送按钮之后    应该  设置   一定时间内  禁止  重复提交 -->
		if (wait == 0){
			wait = 60;
			sendYanZhengMa(zylxrID);
			time();
		}
	}
	
	function sendYanZhengMa(zylxrID)
	{
		var url = "../zxsq/sendSqm.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}&app.id=" + zylxrID;  
        $.ajax({
            type : "get",  
            async : false,
            url : url,
            datatype:"text",  
			success:function(json){
				str = json;
			},
			error:function(){
				alert("抱歉, 申请人信息获取失败, 请检查网络 和 访问路径...");
			}
        });
        if(str == "success")
		{
			alert("验证码发送成功, 请查收");
		}else{
			alert("验证码发送失败, 请重新获取");
		}
	}
    
    function back()
    {
    	window.location.href="../zxsq/dlrSave.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
	   	window.getElementById('nextBtn').disabled=true;
    }
    
	
	function xiaYiBu(){
		
		var val = $('input:radio[name="app.id"]:checked').val();
        if(val==null){
            alert("请选择 主要联系人, 并且获取 案件申请码");
            return ;
        }
		var str = $("#yanZhengMa").val();
		if(str == null || str == undefined || str == '')
		{
			alert("请输入 案件申请码");
			return;
		}
		
		var url = "../zxsq/checkSqm.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}&&app.id=" + $("input[name='app.id']").val() + "&otherValue=" + str;  
        $.ajax({
            type : "post",  
            async : false,
            url : url,
            datatype:"string",  
			success:function(json){
				str = json;
			},
			error:function(){
				alert("抱歉, 请检查网络 和 访问路径...");
				str = "error";
			}
        });
        
        if(str == "error")
		{
			alert("案件申请码有误, 请重新核对");
			return;
		}
        
		window.zylxrForm.action="../zxsq/bsqrSave.action";
		window.zylxrForm.submit();
	}
</script>