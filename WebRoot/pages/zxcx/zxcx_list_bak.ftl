<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线查询</title>
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
</head>
<link href="../16B/style.css" rel="stylesheet" type="text/css">
<body>
	<div class="xzfy mh-700 pos-rel">
	    <div class="xzfy-hd fn-clear">
	        <a class="xzfy-hd-r fhsy fn-right" href="index.html"></a>
	        <div class="xzfy-hd-bg fn-left"></div>
	    </div>
	    <div class="xzfy1-btn fn-clear">
	    	<p class="zxfy1-btn-p fn-right">在线查询案件进度</p>
	    </div>
	    <div class="xzfy-table xzfy1-table">
	    	<table class="table">
	    	<!--	<colgroup>
                    <col style="width: 30%;" />
                    <col style="width: 70%;" />
                </colgroup>
                -->
                <tbody>
                	<colgroup>
	                    <col width="20%;"/>
	                    <col width="35%;"/>
	                    <col width="45%;"/>
	                </colgroup>
			    	<tr>
						<td colspan=3>案件信息</td>
					</tr>
					<tr>
						<td rowspan=3>申请人</td>
						<td>申请日期</td>
						<td>${xzfyInfo.receive_real_date?default('')}</td>
					</tr>
					<tr>
						<td>申请人</td>
						 <#assign appdetail=xzfyInfo.appdetail?default('')>
						<td>${appdetail}</td>
					</tr>
					<tr>
						<td>代表人</td>
						<#assign dbrDetail=xzfyInfo.dbrDetail?default('')>
						<td>${dbrDetail}</td>
					</tr>
					<#assign defendant_type=xzfyInfo.defendant_type?default('')>
   <#assign defendant_type_2=""?default('')>
    
   <#if defendant_type=="3">
					 <#assign defendant_type_2="乡镇街道">   
					         
	 <#elseif  defendant_type=="4">
					         <#assign defendant_type_2="区县政府部门">
	<#elseif defendant_type=="5">
					               
	                      <#assign defendant_type_2="区县政府">
	<#elseif defendant_type=="6">
					       <#assign defendant_type_2="省级政府">       
	 <#elseif  defendant_type=="7">
					  <#assign defendant_type_2="省级政府部门">
	<#elseif defendant_type=="8">
					    <#assign defendant_type_2="其他">    
	 <#elseif  defendant_type=="9">
					         <#assign defendant_type_2="区县政府部门派出机构">
     <#elseif  defendant_type=="11">
					        <#assign defendant_type_2="国务院部门">
					        
	</#if>
						<tr>
							<td rowspan=2>被申请人</td>
							<td>被申请人种类</td>
							<td>${defendant_type_2}</td>
						</tr>
						<tr>
							<td>被申请人名称</td>
							 <#assign defendant_name=xzfyInfo.defendant_name?default('')>
							<td>${defendant_name}</td>
						</tr>
					
					
					
					<tr>
						<td rowspan=2>复议请求</td>
						<td>要求复议的具体行政行为情况</td>
						<td> <#assign require_fy=xzfyInfo.require_fy?default('')> ${require_fy}</td>
						
					</tr>
					
					<tr>
						<td>是否行政不作为</td>
						<#assign ismanage=xzfyInfo.ismanage?default('')>
						<#if ismanage=='0'>
							<td>否</td>
						<#else>
							<td>是</td>
						</#if>
					</tr>
					<tr>
						<td rowspan=2>事实及理由</td>
						<td>要求被申请人履行日期</td>
						<#assign zhidaosj=xzfyInfo.zhidaosj?default('')>
						<td>${zhidaosj}</td>
					</tr>
					<tr>
						<td>曾要求被申请人履行何职责</td>
						 <#assign is_prof_detail=xzfyInfo.is_prof_detail?default('')>
						<td>${is_prof_detail}</td>
					</tr>
				</tbody>
			</table>
	    </div>
	    <div class="xzfy-table xzfy1-table">
	    	 <table class="table">
	    	 	<colgroup>
                    <col style="width: 30%;" />
                    <col style="width: 70%;" />
                </colgroup>
                <tbody>
	                <tr>
						<td>办理进度</td>
						<td>
							<table  class="table">
								<colgroup>
				                    <col style="width: 30%;" />
				                    <col style="width: 70%;" />
				                </colgroup>
				                <tbody>
								
								<#--<#if infoModel.finishRealDate?exists>
										<tr>
											<td>${infoModel.finishRealDate?default('')}</td>
											<td>结案日期</td>
										</tr>
									</#if>
									<#if infoModel.finishDate?exists>
										<tr>
											<td>${infoModel.finishDate?default('')}</td>
											<td>结案审批</td>
										</tr>
									</#if>
									<#if infoModel.isStopTo?exists>
										<tr>
											<td>${infoModel.isStopTo?default('')}</td>
											<td>中止结束</td>
										</tr>
									</#if>
									<#if infoModel.isStopFrom?exists>
										<tr>
											<td">${infoModel.isStopFrom?default('')}</td>
											<td>案件中止</td>
										</tr>
									</#if>
									<#if infoModel.isDelayTo?exists>
										<tr>
											<td>${infoModel.isDelayTo?default('')}</td>
											<td>延期结束</td>
										</tr>
									</#if>
									<#if infoModel.isDelayFrom?exists>
										<tr>
											<td>${infoModel.isDelayFrom?default('')}</td>
											<td>案件延期</td>
										</tr>
									</#if>
									<#if infoModel.lianRealDate?exists>
										<tr>
											<td>${infoModel.lianRealDate?default('')}</td>
											<td>立案审查</td>
										</tr>
									</#if>
									<#if infoModel.lianDate?exists>
										<tr>
											<td>${infoModel.lianDate?default('')}</td>
											<td>立案受理</td>
										</tr>
									</#if>
									<#if infoModel.buzhengFrom?exists>
										<tr>
											<td>${infoModel.buzhengFrom?default('')}</td>
											<td>在线补证</td>
										</tr>
									</#if>
									<#if infoModel.bzTongZhiRiQi?exists>
										<tr>
											<td>${infoModel.bzTongZhiRiQi?default('')}</td>
											<td>通知补证</td>
										</tr>
									</#if>
									<#if infoModel.receiveRealDate?exists>
										<tr>
											<td>${infoModel.receiveRealDate?default('')}</td>
											<td>当面确认</td>
										</tr>
									</#if>-->
									
										<tr>
										
											<td><font style="color:red">2016-06-22</font></td>
											<td> <font style="color:red"> 提交申请</font></td>
										
										</tr>
									
									
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
	    	 </table>
	    </div>
	</div>
</body>
</html>