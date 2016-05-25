<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线查询</title>
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
</head>
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
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
	    		<colgroup>
                    <col style="width: 30%;" />
                    <col style="width: 70%;" />
                </colgroup>
                <tbody>
			    	<tr>
						<td colspan=3>案件信息</td>
					</tr>
					<tr>
					<td rowspan=5>申请人</td>
					</tr>
					<tr>
						<td>申请日期</td>
						<td>${infoModel.receiveDate?default('')}</td>
					</tr>
					<tr>
						<td>申请人</td>
						<td>${appName?default('')}</td>
					</tr>
					<tr>
						<td>代表人</td>
						<td>${appDeputyName?default('')}</td>
					</tr>
					<tr>
						<td>主要联系人</td>
						<td>${appLinkName?default('')}</td>
					</tr>
					<#if infoModel.defendantType='4'>
						<tr>
							<td rowspan=4>被申请人</td>
						</tr>
						<tr>
							<td>行政复议机关</td>
							<td>${infoModel.xzfyOrg?default('')}</td>
						</tr>
						<tr>
							<td>被申请人种类</td>
							<td>其它</td>
						</tr>
						<tr>
							<td>被申请人名称</td>
							<td>${infoModel.defendantRealName?default('')}</td>
						</tr>
					<#else>
						<tr>
							<td rowspan=3>被申请人</td>
						</tr>
						<tr>
							<td>行政复议机关</td>
							<td>${infoModel.xzfyOrg?default('')}</td>
						</tr>
						<tr>
							<td>被申请人种类</td>
							<#if infoModel.defendantType='1'>
								<td>区县政府</td>
							</#if>
							<#if infoModel.defendantType='2'>
								<td>省级政府部门</td>
							</#if>
							<#if infoModel.defendantType='3'>
								<td>省级行政机关</td>
							</#if>
						</tr>
					</#if>
					<tr>
						<td rowspan=4>复议请求</td>
					</tr>
					<tr>
						<td>具体行政行为</td>
						<td>${infoModel.xzfyRequset?default('1')}</td>
					</tr>
					<tr>
						<td>请求如何处理</td>
						<td>${infoModel.xzfyRequsetRetail?default('2')}</td>
					</tr>
					<tr>
						<td>是否行政不作为</td>
						<#if infoModel.isManage=='0'>
							<td>否</td>
						<#else>
							<td>是</td>
						</#if>
					</tr>
					<tr>
						<td rowspan=4>事实及理由</td>
					</tr>
					<tr>
						<td>知道该具体行政行为的时间</td>
						<td>${infoModel.executeDate?default('')}</td>
					</tr>
					<tr>
						<td>该具体行政行为侵害申请人合法权益的事实</td>
						<td>${infoModel.breakRight?default('')}</td>
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
									<#if infoModel.finishRealDate?exists>
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
									</#if>
									<#if infoModel.receiveDate?exists>
										<tr>
											<td>${infoModel.receiveDate?default('')}</td>
											<td>提交申请</td>
										</tr>
									</#if>
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