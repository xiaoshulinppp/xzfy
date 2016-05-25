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
            <li class="xzfy-nav-on"><p>申请人信息</p><span>1</span></li>
            <li><p>选择代理人</p><span>2</span></li>
            <li><p>被申请人信息</p><span>3</span></li>
            <li><p>填写复议请求</p><span>4</span></li>
            <li><p>填写事实及理由</p><span>5</span></li>
            <li><p>上传证据及依据</p><span>6</span></li>
        </ul>
        
        <div class="xzfy1-btn fn-clear">
        <p class="zxfy1-btn-p fn-right">当前申请人类别为
        	<#if infoModel.appType == "1">
				<span>公民</span>，如果申请人为法人或其他组织
			<#else>
				<span>法人或其他组织</span>，如果申请人为公民
			</#if>
        	 ，请点击【<a name="goto" class="btn-modify" href="javascript:goto()" title="点击切换为法人（公民）申请">切换</a>】</p> </div>
        <div class="xzfy1-btn fn-clear"><p class="zxfy1-btn-p fn-right">你已填写的申请人数量为：<span>${renCount}</span></p><a class="new-btn fn-left" id="new" title="点击新建申请人" href="javascript:add()">新建申请人</a> </div>
        <div class="xzfy-table xzfy1-table">
            <table class="table">
                <colgroup>
                    <col style="width: 8%;" />
                    <#if infoModel.appType == "1">
	                    <col style="width: 12%;" />  
	                    <col style="width: 10%;" />
	                <#else>
	                	<col style="width: 22%;" />
	                </#if>
                    <col style="width: 15%;" />  
                    <col style="width: 25%;" />
                    <col style="width: 15%;" />
                    <col style="width: 15%;" />
                </colgroup>
                <thead>
                <tr>
                    <th>序号</th>
                 <#if infoModel.appType == "1"> 
                    <th>姓名</th>
                    <th>性别</th>
                    <th>出生年月</th>
                 <#else>
                 	<th>法人或其他组织全称</th>
                 	<th>法定代表人</th>
                 </#if>
                    <th>身份证号</th>
                    <th class="text-r">手机号码</th>
                    <th class="text-r">操作</th>
                </tr>
                </thead>
                <tbody>
                <#list appS as app>
                	<tr>
	                    <td>${app_index + 1}</td>
	                <#if infoModel.appType == "1">
	                    <td>${app.appName?default('姓名')}</td>
						<td>
							<#if app.sexy == "1">
								男
							<#else>
								女
							</#if>
						</td>   
						<td>
							${app.dateOfBirth?default('出生年月')}
						</td>
					<#else>
						<td>${app.appName?default('法人或其他组织全称')}</td>
						<td>${app.deputyName?default('法定代表人')}</td>
					</#if>
	                    <td>${app.appId?default('身份证号')}</td>
	                    <td class="text-r">${app.telephone?default('手机号码')}</td>
	                    <td class="text-r"><a class="btn-modify" href="javascript:goUpdate(${app.id})">修改</a><a class="btn-delete" href="javascript:delApp(${app.id})">删除</a> </td>
	                </tr>
	            </#list>
		
                </tbody>
            </table>
        </div>
        <div class="xzfy-next"><a class="next-btn" href="javascript:xiaYiBu()" title="点击进入下一步：选择代理人">下一步</a> </div>
	</div>


	<div class="xzfy1-form-bg" id="form">
        <div class="xzfy1-form">
            <div class="xzfy1-form-hd"><a class="btn-close fn-right" id="close" href="javascript:close()"></a><p class="xzfy1-form-p fn-left"><span>申请人信息</span>/<#if infoModel.appType == "1">公民资料填写<#else>法人或其他组织资料填写</#if><span class="fw-n">（<span class="need">*</span>号为必填项）</span></p> </div>
            <form name="form1" action="" class="registerform" method="post" enctype="multipart/form-data">
            	<@ww.hidden name="'infoId'"/>
            	<@ww.hidden name="'funcCode'"/>
            	<@ww.hidden name="'caseIndex'" />
            	<@ww.hidden name="'app.id'" />
            	<input type="hidden" id="saveType" name="saveType" />
            	<input type="hidden" id="sqrID" name="sqrID" />
            	
            	<#if infoModel.appType == "1">
            	
	                <ul>
	                    <li>
	                        <label class="label"><span class="need">*</span> 姓名</label>
	                        <input type="text" id="gmName" name="app.appName" class="inputxt Validform_error" onBlur="checkGmName()" maxlength="10" onkeyup="value=value.replace(/[^\a-zA-Z\u4E00-\u9FA5]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-zA-Z\u4E00-\u9FA5]/g,''))" />
	                        <span id="gmNameCheck" class="Validform_checktip">请输入姓名</span>
	                    </li>
	                    <li>
	                        <label class="label">性别</label>
	                        <input class="input-r" type="radio" value="1" name="app.sexy" id="male" onBlur="checkGmAppId()" class="pr1" checked="checked" datatype="*"><label class="input-l" for="male">男</label> 
	                        <input class="input-r" type="radio" value="2" name="app.sexy" id="female" onBlur="checkGmAppId()" class="pr1" ><label class="input-l" for="female">女</label>
	                    </li>
	                    <li>
	                        <label class="label"><span class="need">*</span>出生年月</label>
	                        <input type="hidden" id="gmDateOfBirth" name="app.dateOfBirth"/>
	                        <select name="year" id="year" onchange="yearMonth(this.value)"><option value="">选择年份</option></select>年
						    <select name="month" id="month" onchange="monthDay(this.value)"><option value="">选择月份</option></select>月
							<select name="day" id="day" onchange="checkGmAppId()"><option value="">选择日期</option></select>日
	                    </li>
	                    <li>
	                        <label class="label"><span class="need">*</span> 身份证</label>
	                        <input type="text" id="gmAppId" name="app.appId" class="inputxt" onBlur="checkGmAppId()" maxlength="18" onkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
	                        
	                        <span id="gmAppIdCheck" class="Validform_checktip">请输入</span>
	                    </li>
	                    <li>
	                        <label class="label"><span class="need">*</span> 邮箱</label>
	                        <input type="text" id="gmEmail" name="app.email" class="inputxt" onBlur="checkGmEmail()" maxlength="30" />
	                        
	                        <span id="gmEmailCheck" class="Validform_checktip">请输入</span>
	                    </li>
	                    <li>
	                        <label class="label"><span class="need">*</span> 手机号码</label>
	                        <input type="text" id="gmMobile" name="app.telephone" class="inputxt" onBlur="checkGmMobile()" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />

							<span id="gmMobileCheck" class="Validform_checktip">请输入</span>
	                    </li>
	                    <li>
	                        <label class="label">固定号码</label>
	                        <input type="text" id="gmTelephone" name="app.mobile" class="inputxt" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="11" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
	                    </li>
	                    <li>
	                        <label class="label">邮编</label>
	                        <input type="text" id="gmPostCode" name="app.postCode" class="inputxt" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="10" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
	                    </li>
	                    <li>
	                        <label class="label"><span class="need">*</span> 通邮地址</label>
	                        <input type="text" id="gmMailAddress" name="app.mailAddress" class="inputxt" onBlur="checkGmMailAddress()" maxlength="50" />
	                        
	                        <span id="gmMailAddressCheck" class="Validform_checktip">请输入</span>
	                    </li>
	                    <li>
	                        <label class="label">现住址</label>
	                        <input type="text" id="gmAddress" name="app.address" class="inputxt" maxlength="50" />
	                    </li>
	                </ul>
                <#else>
                	<ul>
	                    <li>
							<label class="label"><span class="need">*</span>法人或其他组织全称</label>
							<input type="text" id="frAppName" name="app.appName" class="inputTextNormal" />
						</li>
						<li>
							<label class="label"><span class="need">*</span>法定代表人</label>
							<input type="text" id="frDeputyName" name="app.deputyName" class="inputTextNormal" />
						</li>
						<li>
							<label class="label"><span class="need">*</span>法定代表人身份证</label>
							<input type="text" id="frAppId" name="app.appId" class="inputTextNormal" />
						</li>
						<li>
							<label class="label"><span class="need">*</span>邮箱</label>
							<input type="text" id="frEmail" name="app.email" class="inputTextNormal" />
						</li>
						<li>
							<label class="label"><span class="need">*</span>手机号码</label>
							<input type="text" id="frMobile" name="app.telephone" class="inputTextNormal" />
						</li>
						<li>
							<label class="label">固定号码</label>
							<input type="text" id="frTelephone" name="app.mobile" class="inputTextNormal" />
						</li>
						<li>
							<label class="label">邮编</label>
							<input type="text" id="frPostCode" name="app.postCode" class="inputTextNormal" />
						</li>
						<li>
							<label class="label"><span class="need">*</span>通邮地址</label>
							<input type="text" id="frMailAddress" name="app.mailAddress" class="inputTextNormal" />
						</li>
						<li>
							<label class="label">现地址</label>
							<input type="text" id="frAddress" name="app.address" class="inputTextNormal" />
						</li>
						
						<#-- 证明材料 -->
						
						<li>
							<label class="label"><span class="need">*</span>身份证扫描件、电子版</label>
							<input class="pd-4" type="file" name="caiLiao" id="frSfzm" />
							<span id="frSfzmSpan"></span>
							<a id="frSfzmA" href="javascript:updateFrSfzm()">修改材料</a>
							
						</li>
						<li>
							<label class="label"><span class="need">*</span>法定代表人身份证明扫描件、电子版</label>
							<input class="pd-4" type="file" name="caiLiao" id="frDbrzm" />
							<span id="frDbrzmSpan"></span>
							<a id="frDbrzmA" href="javascript:updateFrDbrzm()">修改材料</a>
						</li>
					</ul>
                </#if>
                <div class="xzfy-com"><a class="com-btn" id="complete" href="javascript:saveOrupdate()">完成</a> </div>
            </form>
        </div>
    </div>
    
    
    
    <div class="xzfy1-form-bg" id="dbrForm">
        <div class="xzfy1-form">
            <div class="xzfy1-form-hd"><a class="btn-close fn-right" id="close" href="javascript:closeDbr()"></a>
            <p class="xzfy1-form-p fn-left">您填写的申请人数量超过5人，依法应当推选1至5名代表人，请您填写代表人信息<span class="fw-n">（勾选）</span></p> </div>
            <div class="xzfy6-t">请选择1-5名代表人</div>
            <form name="form2" action="" class="registerform">
            	<@ww.hidden name="'infoId'"/>
            	<@ww.hidden name="'funcCode'"/>
            	<@ww.hidden name="'caseIndex'"/>
  			<ul>
            	<#list appS as app > 
						<li>
							<label class="label"><input type="checkbox" name="dbrArr" value="${app.id}" />${app.appName}</label>
						</li>
						
				</#list>
			</ul>
			<div class="xzfy-com"><a class="com-btn" id="complete" href="javascript:saveDbr()">完成</a> </div>
            </form>
        </div>
    </div>


<script type="text/javascript" src="../pages/zxfy/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../pages/zxfy/js/time_level3linkage.js" charset="utf-8"></script>
<script type="text/javascript" src="../pages/zxfy/js/checkIdCard.js" charset="utf-8"></script>
<script type="text/javascript">
	
	$(document).ready(
        function(){
            //页面初始化
            goCenter();
          
            //滚动条滚动
            $(window).scroll(
                function(){
                    goCenter();
                }
            );
            //拖动浏览器窗口
            $(window).resize(
                function(){
                    goCenter();
                }
            );
        }
    );
	function goCenter()
    {
    	var h = $(window).height();
		var w = $(window).width();
		var st = $(window).scrollTop();
		var sl = $(window).scrollLeft();
  
		$(".xzfy1-form-bg").css("height", h+st);
		$(".xzfy1-form-bg").css("width", w+sl);
	}


	<#-- 返回首页 -->
	function gotoIndexPage()
	{
		if(confirm("你确定要返回首页吗？你可以在三天内通过提供“案件代码”在“在线申请-继续填写”来完成复议申请的填写。"))  
	    {
	    	window.location.href="../zxfy/mainPage.action?funcCode=${funcCode}";
	    }
	}

	<#-- 切换申请人类别 -->
	function goto(){
		<#if infoModel.appType == "2">
			window.location.href="../zxsq/gotoGmSave.action?funcCode=${funcCode}&infoId=${infoId}&caseIndex=${caseIndex}";
		<#else>
			window.location.href="../zxsq/gotoFrSave.action?funcCode=${funcCode}&infoId=${infoId}&caseIndex=${caseIndex}";
		</#if>
	}

	<#-- 继续添加 -->
	function add(){
		$("#saveType").val("0");
		
		<#-- 重置所有的表单信息 -->
		$("#sqrID").val("");
		
		<#if infoModel.appType == "1">
			$("#gmName").val("");
				$("#gmNameCheck").removeClass('Validform_wrong');
				$("#gmNameCheck").removeClass('Validform_right');
				$("#gmNameCheck").html('请输入用户名');
			$("#year").val("");
			$("#month").val("");
			$("#day").val("");
			
			$("#gmDateOfBirth").val("");
			$("#gmAppId").val("");
			$("#gmAppIdCheck").removeClass('Validform_wrong');
				$("#gmAppIdCheck").removeClass('Validform_right');
				$("#gmAppIdCheck").html('请输入该申请人的身份证号码');
			$("#gmEmail").val("");
				$("#gmEmailCheck").removeClass('Validform_wrong');
				$("#gmEmailCheck").removeClass('Validform_right');
				$("#gmEmailCheck").html('请输入电子邮箱');
			$("#gmMobile").val("");
				$("#gmMobileCheck").removeClass('Validform_wrong');
				$("#gmMobileCheck").removeClass('Validform_right');
				$("#gmMobileCheck").html('请输入手机号码');
			$("#gmTelephone").val("");
			$("#gmPostCode").val("");
			$("#gmMailAddress").val("");
				$("#gmMailAddressCheck").removeClass('Validform_wrong');
				$("#gmMailAddressCheck").removeClass('Validform_right');
				$("#gmMailAddressCheck").html('请输入通邮地址');
			$("#gmAddress").val("");
		
		<#else>
			$("#frAppName").val("");
			$("#frDeputyName").val("");
			$("#frAppId").val("");
			$("#frEmail").val("");
			$("#frMobile").val("");
			$("#frTelephone").val("");
			$("#frPostCode").val("");
			$("#frMailAddress").val("");
			$("#frAddress").val("");
			$("#frSfzm").val("");
			$("#frDbrzm").val("");
			
			$("#frSfzm").css("display","block");
			$("#frSfzmSpan").css("display","none");
			$("#frSfzmA").css("display","none");
			$("#frDbrzm").css("display","block");
			$("#frDbrzmSpan").css("display","none");
			$("#frDbrzmA").css("display","none");
		</#if>
		$("#form").css("display","block");
	}

	<#-- 新增/保存修改 -->
	function saveOrupdate()
	{
		// 判断表单是否为空
		if(!checkGmName())
		{
			return;
		}
		if(!checkGmAppId())
		{
			return;
		}
		if(!checkGmEmail())
		{
			return;
		}
		if(!checkGmMobile())
		{
			return;
		}
		if(!checkGmMailAddress())
		{
			return;
		}
		$("#form").css("display","none");
		if("1" == $("#saveType").val())
		{
			window.form1.action="../zxsq/runSqrUpdate.action";
			window.form1.submit();
		}
		else
		{
			window.form1.action="../zxsq/runSqrSave.action";
			window.form1.submit();
		}
	}

	function close()
	{
		$("#form").css("display","none");
	}

	<#-- 修改申请人信息 -->
	function goUpdate(appID)
	{
		
		var url = "../zxsq/sqrUpdate.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}&app.id=" + appID;  
        $.ajax({
            type : "get",  
            async : false,
            url : url,
            datatype:"json",  
            success:function(appJson){
            	
            	if(appJson == "error")
            	{
            		alert("抱歉, 服务器无法接受你的请求, 请确保正常操作... 谢谢合作");
            		return;
            	}
            	var app = jQuery.parseJSON(appJson);
            	$("#sqrID").val(app[0].id);
				$("#saveType").val("1");
            	
				<#if infoModel.appType == "1">
                	$("#gmName").val(app[0].appName);
                	if(app[0].sexy == "2")
                	{
                		$("input[name='app.sexy']").val(["2"]);
                	}
                	$("#year").get(0).value = (app[0].dateOfBirth).substr(0,4);
                	$("#month").get(0).value = (app[0].dateOfBirth).substr(5,2);
                	$("#day").get(0).value = (app[0].dateOfBirth).substr(8,2);
                	$("#gmAppId").val(app[0].appId);
                	$("#gmEmail").val(app[0].email);
                	$("#gmTelephone").val(app[0].mobile);
                	$("#gmMobile").val(app[0].telephone);
                	$("#gmPostCode").val(app[0].postCode);
                	$("#gmMailAddress").val(app[0].mailAddress);
                	$("#gmAddress").val(app[0].address);
                	checkGmName();
                	checkGmAppId();
                	checkGmEmail();
                	checkGmMobile();
                	checkGmMailAddress();
				<#else>
                	$("#frAppName").val(app[0].appName);
                	$("#frDeputyName").val(app[0].deputyName);
                	$("#frAppId").val(app[0].appId);
                	$("#frEmail").val(app[0].email);
                	$("#frMobile").val(app[0].mobile);
                	$("#frTelephone").val(app[0].telephone);
                	$("#frPostCode").val(app[0].postCode);
                	$("#frMailAddress").val(app[0].mailAddress);
                	$("#frAddress").val(app[0].address);
                	$("#frSfzmSpan").text(app[0].zmcl4);
                	$("#frDbrzmSpan").text(app[0].zmcl5);
				</#if>
				$("#frSfzm").css("display","none");
				$("#frSfzmSpan").css("display","block");
				$("#frSfzmA").css("display","block");
				$("#frDbrzm").css("display","none");
				$("#frDbrzmSpan").css("display","block");
				$("#frDbrzmA").css("display","block");
		        $("#form").css("display","block");
                
            },  
            error: function() {  
               $("#form").css("display","none");
               alert("抱歉, 申请人信息获取失败, 请检查网络 和 访问路径..."); 
            }  
        });
        
	}

	<#-- 删除  -->
	function delApp(sqrID){
		if(confirm("你确定要删除该申请人吗？"))
		{
			
			window.location.href="../zxsq/runSqrDel.action?app.id=" + sqrID + "&funcCode=${funcCode}&infoId=${infoId}&caseIndex=${caseIndex}";
	   	}
	}





	
	
	


	
	
	

	function updateFrSfzm()
	{
		$("#frSfzm").css("display","block");
		$("#frSfzmSpan").css("display","none");
		$("#frSfzmA").css("display","none");
		
	}
	
	function updateFrDbrzm()
	{
		$("#frDbrzm").css("display","block");
		$("#frDbrzmSpan").css("display","none");
		$("#frDbrzmA").css("display","none");
	}

	
	
	
	
	
	
	
	
	
	
	<#-- 下一步 -->
	function xiaYiBu(){
		<#if renCount == 0>
			alert("抱歉, 请至少填写一位申请人...");
			return ;
		</#if>
		<#if 5 lt renCount>
			$("#dbrForm").css("display","block");
		<#else>
			window.location.href="../zxsq/sqrNext.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
		   	window.getElementById('nextBtn').disabled=true;
		</#if>
	}
	
	function closeDbr()
	{
		$("#dbrForm").css("display","none");
	}
	
	function saveDbr()
	{
		var num = jQuery("input[name='dbrArr']:checked").length;
		if(num==0){
			alert("请至少选中一个!");
			return;
		}
		if(num>5)
		{
			alert("最多只能选择5名 代表人");
			return;
		}
		
		$("#dbrForm").css("display","none");
		window.form2.action="../zxsq/runSqrDbrSave.action";
		window.form2.submit();
		window.getElementById('nextBtn').disabled=true;
	}
	
	
	
<#--  --------------- 表单校验 ---------------------------  -->	
	function checkGmName()
	{
		var str = $("#gmName").val();
		if(str == null || str == undefined || str == '')
		{  // Validform_wrong  Validform_right
			$("#gmNameCheck").removeClass('Validform_wrong');
			$("#gmNameCheck").removeClass('Validform_right');
			$("#gmNameCheck").html('请输入用户名');
			
		}else
		{
			$("#gmNameCheck").removeClass('Validform_wrong');
			$("#gmNameCheck").addClass('Validform_right');
			$("#gmNameCheck").html('完成!');
			return true;
		}
	}
	
	function checkGmAppId()
	{
		
		var str = $("#gmAppId").val();
		if(str == null || str == undefined || str == '')
		{  // Validform_wrong  Validform_right
			$("#gmAppIdCheck").removeClass('Validform_wrong');
			$("#gmAppIdCheck").removeClass('Validform_right');
			$("#gmAppIdCheck").html('请输入该申请人的身份证号码');
		}else
		{
			if(IdCardValidate(str))
			{ // 身份证正确
				var temp_date = "";
				// 性别是否和身份证一致
				if(str.length == 15)
				{
					temp_date = str.charAt(14);
				}else
				{
					temp_date = str.charAt(16);
				}
				var sexyVal=$('input:radio[name="app.sexy"]:checked').val();
				temp_date = temp_date%2;
				if((sexyVal == 1 && temp_date == 1) || (sexyVal == 2 && temp_date == 0))
				{
					
				}else
				{
					$("#gmAppIdCheck").addClass('Validform_wrong');
					$("#gmAppIdCheck").removeClass('Validform_right');
					$("#gmAppIdCheck").html('身份证与所选申请人性别不对应');
					return;
				}
				
				// 判断 出生年月是否和身份证一致       //   $("#gmDateOfBirth").val('');
				temp_date = "";
				if(str.length == 15)
				{
					temp_date = str.substring(6,8)+ "-" + str.substring(8,10) + "-" + str.substring(10,12);
				}else
				{
					temp_date = str.substring(6,10)+ "-" + str.substring(10,12)+ "-" + str.substring(12,14);
				}
				
				var birth = $("#year").val() + "-" +  $("#month").val() + "-" +  $("#day").val();
				if(!(birth == temp_date))
				{
					$("#gmAppIdCheck").addClass('Validform_wrong');
					$("#gmAppIdCheck").removeClass('Validform_right');
					$("#gmAppIdCheck").html('身份证和出生年月不对应');
					return;
				}
				$("#gmDateOfBirth").val(temp_date);
				// 异步校验, 本案件中 该身份证申请人是否已添加
				
				var url = "";
				if("1" == $("#saveType").val())
				{
					url = "../zxsq/checkSqrAppID.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}&app.appId=" + str + "&app.id=" + $("#sqrID").val();
				}
				else
				{
					url = "../zxsq/checkSqrAppID.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}&app.appId=" + str;
				}
				
		        $.ajax({
		            type : "post",  
		            async : false,
		            url : url,
		            datatype:"string",  
					success:function(json){
						temp_date = json;
					},
					error:function(){
						alert("抱歉, 请检查网络 和 访问路径...");
						temp_date = "error";
					}
		        });
		        
				if(temp_date == "error")
				{
					$("#gmAppIdCheck").addClass('Validform_wrong');
					$("#gmAppIdCheck").removeClass('Validform_right');
					$("#gmAppIdCheck").html('该申请人已经添加, 请勿重复添加');
					return;
				}
				
				$("#gmAppIdCheck").removeClass('Validform_wrong');
				$("#gmAppIdCheck").addClass('Validform_right');
				$("#gmAppIdCheck").html('完成!');
				return true;
			}else
			{
				$("#gmAppIdCheck").addClass('Validform_wrong');
				$("#gmAppIdCheck").removeClass('Validform_right');
				$("#gmAppIdCheck").html('请输入正确的身份证号!');
			}
		}
	}
	function checkGmEmail()
	{
		var str = $("#gmEmail").val();
		if(str == null || str == undefined || str == '')
		{  // Validform_wrong  Validform_right
			$("#gmEmailCheck").removeClass('Validform_wrong');
			$("#gmEmailCheck").removeClass('Validform_right');
			$("#gmEmailCheck").html('请输入电子邮箱');
		}else
		{
			if(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(str))
			{
				$("#gmEmailCheck").removeClass('Validform_wrong');
				$("#gmEmailCheck").addClass('Validform_right');
				$("#gmEmailCheck").html('完成!');
				return true;
			}else
			{
				$("#gmEmailCheck").addClass('Validform_wrong');
				$("#gmEmailCheck").removeClass('Validform_right');
				$("#gmEmailCheck").html('请输入正确的电子邮箱地址');
			}
		}
	}
	function checkGmMobile()
	{
		var str = $("#gmMobile").val();
		if(str == null || str == undefined || str == '')
		{  // Validform_wrong  Validform_right
			$("#gmMobileCheck").removeClass('Validform_wrong');
			$("#gmMobileCheck").removeClass('Validform_right');
			$("#gmMobileCheck").html('请输入手机号码');
		}else
		{
			if(/^1\d{10}$/.test(str))
			{
				$("#gmMobileCheck").removeClass('Validform_wrong');
				$("#gmMobileCheck").addClass('Validform_right');
				$("#gmMobileCheck").html('完成!');
				return true;
			}else{
				$("#gmMobileCheck").addClass('Validform_wrong');
				$("#gmMobileCheck").removeClass('Validform_right');
				$("#gmMobileCheck").html('请输入正确的手机号!');
			}
		}
	}
	function checkGmMailAddress()
	{
		var str = $("#gmMailAddress").val();
		if(str == null || str == undefined || str == '')
		{  // Validform_wrong  Validform_right
			$("#gmMailAddressCheck").removeClass('Validform_wrong');
			$("#gmMailAddressCheck").removeClass('Validform_right');
			$("#gmMailAddressCheck").html('请输入通邮地址');
		}else
		{
			$("#gmMailAddressCheck").removeClass('Validform_wrong');
			$("#gmMailAddressCheck").addClass('Validform_right');
			$("#gmMailAddressCheck").html('完成!');
			return true;
		}
	}
	<#-- ---------------------------------------------------------------------- -->



	
	<#-- 判断单选框是否有选中 -->
	function checkRadio()
	{
		var val=$('input:radio[name="app.sexy"]:checked').val();
        if(val==null){
            alert("什么也没选中!");
            return false;
        }
	}
	
	<#-- 判断复选框是否有选择 -->
	function checkCheck()
	{
		var num = jQuery("input[name='dbrArr']:checked").length;
		if(num==0){
			alert("请至少选中一个!");
		}
	}
	
	
</script>
</body>
</html>
