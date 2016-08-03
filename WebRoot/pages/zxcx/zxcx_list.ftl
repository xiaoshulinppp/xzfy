<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link href="../pages/css/base.css" rel="stylesheet" type="text/css">
<link href="../pages/css/progress.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.10.1.min.js"></script>
<title>教育培训中心</title>
</head>
<body>
	<div class="main">
    	<div class="logo">
        	<img src="../pages/img/name.png"/>
        </div>
        <div class="content">
        	<div class="top_title">
            	<p>在线查询案件进度</p>
                <a href="javascript:gotoIndexPage()">返回首页</a>
            </div>
            <div class="mian_cont">
            	<p class="cont_tit">案件信息</p>
                <table>
                	<tr>
                    	<td class="tabbg">申请人</td>
                        <td class="tabpad">
                        	<div>	
                        		<p class="tabtit">申请日期</p>
                        		<span class="tabtxt">
                        			${xzfyInfo.receive_real_date?default('')}
                        		</span>
                        	</div>
                        	<div>	
                        		<p class="tabtit">申请类别</p>
                        		<span class="tabtxt">
                        			<#if xzfyInfo.app_type="1">公民</#if><#if xzfyInfo.app_type="2">法人或其他组织</#if>
                        		</span>
                        	</div>
                        	<div>	
                        		<p class="tabtit">申请人</p>	
                        		<span class="tabtxt">
                        			<#if xzfyInfo.app_type="1">${xzfyInfo.appdetail?default('')}</#if>
                        			<#if xzfyInfo.app_type="2">${xzfyInfo.agentDetail?default('')}</#if>
								</span>
							</div>
                            <div>
								<p class="tabtit">代表人</p>	
								<span class="tabtxt">
									${xzfyInfo.dbrDetail?default('无')}
								</span>
							</div>
							<div>
								<p class="tabtit">代理人</p>	
								<span class="tabtxt">
									<#if xzfyInfo.agent=="1">${xzfyInfo.agent_name?default('')}<#else>无</#if>
								</span>
							</div>
							<div>
								<p class="tabtit">赔偿金额</p>	
								<span class="tabtxt">
									<#if xzfyInfo.ismoney=="是">${xzfyInfo.money_detail?default('')}<#else>无</#if>
								</span>
							</div>
							<div>
								<p class="tabtit">受损证明材料</p>	
								<span class="tabtxt">
									${xzfyInfo.money_file?default('无')}
								</span>
							</div>
                        </td>
                    </tr>
                    <#assign defendant_type=xzfyInfo.defendant_type?default('')>
  					<#assign defendant_type_2=""?default('')>
    
  					<#if defendant_type=="3">
						<#assign defendant_type_2="乡镇街道">   
					<#elseif defendant_type=="4">
					    <#assign defendant_type_2="区县政府部门">
					<#elseif defendant_type=="5">
					      <#assign defendant_type_2="区县政府">
					<#elseif defendant_type=="6">
					       <#assign defendant_type_2="省级政府">       
					<#elseif defendant_type=="7">
					  <#assign defendant_type_2="省级政府部门">
					<#elseif defendant_type=="8">
					    <#assign defendant_type_2="其他">    
	 				<#elseif defendant_type=="9">
				         <#assign defendant_type_2="区县政府部门派出机构">
     				<#elseif defendant_type=="11">
				        <#assign defendant_type_2="国务院部门">
					</#if>
                    <tr>
                    	<td class="tabbg">被申请人</td>
                        <td class="tabpad">
                        	<div><p class="tabtit">被申请人种类</p><span class="tabtxt">${defendant_type_2}</span></div>
                            <div><p class="tabtit">被申请人名称</p><span class="tabtxt">${xzfyInfo.defendant_name?default('')}</span></div>
                        </td>
                    </tr>
					<tr>
                    	<td class="tabbg">复议请求</td>
                        <td class="tabpad">
                            <div>
                            	<p class="tabtit">是否行政不作为</p>
                            	<span class="tabtxt">
                            		<#if xzfyInfo.ismanage=="2">是<#else>否</#if>
                            	</span>
                            </div>
                            <#if xzfyInfo.ismanage=="2">
                            	<div>
	                            	<p class="tabtit">要求被申请人履行日期</p>
	                            	<span class="tabtxt">
	                            		${xzfyInfo.zhidaosj?default('')}
	                            	</span>
	                            </div>
	                            <div>
	                            	<p class="tabtit">曾要求被申请人履行何职责</p>
	                            	<span class="tabtxt">
	                            		${xzfyInfo.is_prof_detail?default('')}
	                            	</span>
	                            </div>
                            <#else>
                            	<div>
	                            	<p class="tabtit">要求复议的具体行政行为情况</p>
	                            	<span class="tabtxt">
	                            		${xzfyInfo.require_fy?default('')}
	                            	</span>
	                            </div>
                            </#if>
                            <div>
                            	<p class="tabtit">行政复议请求</p>
                            	<span class="tabtxt">
                            		${xzfyInfo.xzfy_requset?default('')}
                            	</span>
                            </div>
                            <div>
                            	<p class="tabtit">规范文件审查说明</p>
                            	<span class="tabtxt">
                            		<#if xzfyInfo.ischeck=="是">${xzfyInfo.check_file?default('')}<#else>否</#if>
                            	</span>
                            </div>
                        </td>
                    </tr>
					<tr>
                    	<td class="tabbg">事实及理由</td>
                        <td class="tabpad">
                        	<div>	<p class="tabtit">事实与理由</p>	<span class="tabtxt">${xzfyInfo.shishiyuly?default('')}</span></div>
                        </td>
                    </tr>
                    <tr class="trbg">
                    	<td class="tabtrbg">办理进度</td>
                        <td class="tabpads">
                        	<div><p class="bljdtit">2016-06-22&#12288;&#12288;&#12288;提交申请</p></div>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
    </div>

</body>
</html>
<script>
	function gotoIndexPage(){
		if(confirm("你确定要返回首页吗？")){
	    	window.location.href="../zxfy/mainPage.action?fyjg=${fyjg}";
	    }
	}
</script>