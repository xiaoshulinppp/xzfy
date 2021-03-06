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
	<div class="xzfy6-border">
            <div class="xzfy6-bg wc-bg">
                <div class="xzfy6-t">恭喜！您已完成案件相关信息的填写及上传</div>
                <div class="xzfy6-p">（温馨提示：您现在可以对您所提供的案件信息进行预览。）</div>
            </div>
        
    		
	<div id="div_00">
		<!-- 提示   下载按钮   预览 -->
		
		<div class="xzfy6-t">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;恭喜您！您已成功填写并保存相关申请信息，并上传了有关证据材料。</div>
		<div class="xzfy6-t">但是申请人需要对该复议申请予以书面确认。未经过确认，不视为行政复议机构收到行政复议申请。</div>
		<div class="xzfy6-t">本信息将在系统内保留60日，请您尽快在行政复议法规定的申请期限内，通过以下几种方式确认：</div>
		<div class="xzfy6-t">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现场确认 （请在法定行政复议申请期限内到市政府行政复议接待室现场确认）</div>
		<div class="xzfy6-t">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮寄（您还可以打印附件2《行政复议申请确认单》，由全体申请人签字后，通过以下方式确认申请）</div>
		<!--	电子邮件（说明）
			传真（说明）
			网上提交（说明） -->
		<div class="xzfy6-t">我们将从收到由全体申请人签字的确认单之日起，视为正式收到申请人的行政复议申请。</div>
		
		
		<table class="table">	
			<tr>
				<td>
					<div class="xzfy-next"><a class="next-btn" href="../zxsq/downloadSqsAndQrd.action?funcCode=${funcCode}&infoId=${infoId}&otherValue=20" title="点击下载附件">下载申请书</a> </div>
		     	</td>
		     	<td>
					<div class="xzfy-next"><a class="next-btn" href="../zxsq/downloadSqsAndQrd.action?funcCode=${funcCode}&infoId=${infoId}&otherValue=21" title="点击下载附件">下载确认书</a> </div>
		     	</td>
		     	<td>
		     		<div class="xzfy-next"><a class="next-btn" href="javascript:yuLan()" title="点击预览案件">预览案件</a> </div>
		     	</td>
			</tr>
		</table>
	</div>
	
	<div class="xzfy-table" style="display:none" id="div_01">
		<@ww.hidden name="'infoId'" />
		<table class="table">
			<tr>
				<td colspan="3">
					案件信息
				</td>
			</tr>
			<tr>
				<td rowspan="4">
					申请人
				</td>
				<td>
					类别
				</td>
				<td>
					${infoModel.appType?default("")}
				</td>
			</tr>
			<tr>
				<td>
					申请人
				</td>
				<td>
					
					<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
					    <tr>
								<th class="thListNormal" width="40">序号</th>
								<th class="thListNormal" width="100">姓名</th>
								<th class="thListNormal" width="80">性别</th>
								<th class="thListNormal" width="100">出生年月</th>
								<th class="thListNormal" width="300">身份证号</th>	
								<th class="thListNormal" width="100">手机号码</th>
			<#-->					<th width="100" class="thListNormal">操作</th>    -->
					    </tr>
					    
					   <#assign count =0>
					   <#list appS as app>
						   <tr class="trcolor">
							   <#assign seq = 1>
								<td align="center" class="tdlistCenter">${count+1}</td>
						    
								<td class="tdlistCenter">
									${app.appName?default('姓名')}
								</td>
								<td class="tdlistCenter">
						<#-->			${app.sexy?default('性别')}   -->
									<#if app.sexy == "1">
										男
									<#else>
										女
									</#if>
								</td>   
								<td class="tdlistCenter">
									${app.dateOfBirth?default('出生年月')}
								</td>
								<td class="tdlistCenter">
									${app.appId?default('身份证号')}
								</td>
								<td class="tdlistCenter">
									${app.telephone?default('手机号码')}
								</td>
			<#-->					<td class="tdlistCenter">
									<a href="../zxsq/.action?funcCode=${funcCode}&appID=${app.id}" ><img src="../images/16B/sicons/view.gif" alt="查看" width="16" height="16" border="0">查看</a>
								</td>		-->	
						  </tr>
						  <#assign count = count +1>
					  </#list>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					代表人
				</td>
				<td>
						<#assign count =0>
					   	<#list appS as app>
					   			<#if count!=0>
					   				、 
					   			</#if>
								${app.appName?default('姓名')}
							  <#assign count = count +1>
					  	</#list>
				</td>
			</tr>
			<tr>
				<td>
					主要联系人
				</td>
				<td>
					<#list appS as app>
						<#if app.isLink=="1" >
							${app.appName?default('姓名')}
						</#if>
					</#list>
				</td>
			</tr>
			<tr>
				<td rowspan="3" >
					被申请人
				</td>
				<td>
					行政复议机关
				</td>
				<td>
					${infoModel.breakRight}
				</td>
			</tr>
			<tr>
				<td>
					被申请人种类
				</td>
				<td>
					<#if infoModel.defendantType=="5">
					区县政府
					<#elseif infoModel.defendantType=="7">
					省级政府部门
					<#elseif infoModel.defendantType=="6">
					省级行政机关
					<#elseif infoModel.defendantType=="4">
					区县政府部门
		<#--			<#elseif infoModel.defendantType=="2">
					县级政府 -->
					<#elseif infoModel.defendantType=="3">
					县级政府
					<#elseif infoModel.defendantType=="9">
					区县政府部门派出机构
					</#if>
				</td>
			</tr>
			<tr>
				<td>
					被申请人名称
				</td>
				<td>
					${infoModel.defendantName}
				</td>
			</tr>
			
			<tr>
				<td rowspan="4" >
					复议请求
				</td>
				
				<td>
					是否行政不作为
				</td>
				
			<#if infoModel.isManage == "0"> <#-- 作为 -->
				<td>
					否
				</td>
			<tr>
				<td>
					具体行政行为
				</td>
				<td>
					${infoModel.xwName?default("具体行政行为")}
				</td>
			</tr>
			<tr>
				<td>
					请求如何处理
				</td>
				<td>
					<#if infoModel.xzfyRequset = "1">
						撤销该具体行政行为
					<#elseif infoModel.xzfyRequset = "2">
						变更该具体行政行为
					<#elseif infoModel.xzfyRequset = "3">
						确认该具体行政行为违法
					</#if>
				</td>
			</tr>
			<tr>
				<td>
					知道该具体行政行为的时间
				</td>
				<td>
					${infoModel.executeDate?default("知道时间")}
				</td>
			</tr>
				
				
				
			<#elseif infoModel.isManage == "2"> <#-- 不作为 -->
				<td>
					是
				</td>
			<tr>
				<td>
					要求履行何种法定职责
				</td>
				<td>
					${infoModel.xzfyRequsetRetail?default("要求履行何种职责")}
				</td>
			</tr>
			<tr>
				<td>
					何时向被申请人要求履行该法定职责
				</td>
				<td>
					${infoModel.executeDate?default("请求时间")}
				</td>
			</tr>
			<tr>
				<td>
					复议请求
				</td>
				<td>
					<#if infoModel.xzfyRequset = "4">
						责令被申请人履行法定职责
					<#elseif infoModel.xzfyRequset = "5">
						确认被申请人不履行法定职责违法
					</#if>
				</td>
			</tr>
			<#else>
				<td>
					&nbsp;
				</td>
			<tr>
				<td>
					
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					&nbsp;
				</td>
			</tr>
			</#if>
		
			<tr>
				<td>
					事实及理由
				</td>
				<td colspan="2" >
					${infoModel.appAdviceDetail?default("事实理由")}
				</td>
			</tr>
			
			
			<tr>
				<td>
					证据及依据
				</td>
				<td>
					已上传材料
				</td>
				<td>
					<a href="#" >查看</a>
				</td>
			</tr>
	
		</table>
	</div>
</div>	

    	</div>
</body>
</html>
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script>
	<#-- 弹出窗口的位置及大小 -->
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
  
		$(".xzfy-pop").css("top", ((h-310)/2)+st);
		$(".xzfy-pop").css("left", ((w-200)/2)+sl);
		
		$(".xzfy1-form-bg").css("height", h+st);
		$(".xzfy1-form-bg").css("width", w+sl);
	}
	
	function selectCl()
	{
		var url = "../zxsq/checkSqm.action?funcCode=${funcCode}&infoId=${infoId}&otherValue=" + str;  
        $.ajax({
            type : "post",  
            async : false,
            url : url,
            datatype:"string",  
			success:function(json){
				str = json;
			},
			error:function(){
				alert("抱歉, 上传材料列表信息获取失败, 请检查网络 和 访问路径...");
			}
        });
	}
		
	<#-- 下一步 -->	
	function guanBi1(){
/*		if (navigator.userAgent.indexOf("MSIE") > 0) {
			if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
				window.opener = null;
				window.close();
			} else {
				window.open('', '_top');
				window.top.close();
			}
		}
		else if (navigator.userAgent.indexOf("Firefox") > 0) {
			window.location.href = 'about:blank ';
		} else {
			window.opener = null;
			window.open('', '_self', '');
			window.close();
		}
	*/
		
		
		window.opener=null;
		window.open('','_self');
		window.close();
	}
	
	function yuLan()
	{
		$("#div_00").css("display","none");
		$("#div_01").css("display","block");
	}
</script>