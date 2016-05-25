<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>在线补证</title>
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
	<link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
</head>
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
<body>
<div class="xzfy mh-700">
	<div class="xzfy-hd fn-clear">
		<a class="xzfy-hd-r fhsy fn-right" href="index.html"></a>
   		<div class="xzfy-hd-bg fn-left"></div>
	</div>
	<#list buzhengContentType as bzContent>
		<div class="xzfy6">
			<#if bzContent=='1'>
				<div class="xzfy6-border">
					<div class="xzfy6-bg sczj-bg">
						<div class="xzfy6-t">一.申请人证件（复印件）<span>上传</span></div>
						<div class="xzfy6-p">（温馨提示：您填写的申请人数量为<span>${listApp?size}</span>，请上传该人数的有效证件,含正反面。上传图片格式：<span>JPG</span>。证件尺寸为：<span>358 像素（宽）× 441 像素（高）</span>）</div>
						<div class="xzfy-table">
							<table class="table">
								<colgroup>
		                            <col style="width: 10%;" />
		                            <col style="width: 10%;" />
		                            <col style="width: 25%;" />
		                            <col style="width: 25%;" />
		                            <col style="width: 15%;" />
		                            <col style="width: 15%;" />
		                        </colgroup>
		                        <thead>
			                        <tr>
			                            <th>序号</th>
			                            <th>姓名</th>
			                            <th>证件类型</th>
			                            <th>操作</th>
			                            <th>状态</th>
			                            <th class="text-r">缩略图</th>
			                        </tr>
		                        </thead>
		                        <tbody>
		                        	<#assign x=1 />
		                        	<#list listApp as listUser>
										<tr>
											<td>${x}</td>
											<td>${listUser.appName}</td>
											<td>
												<select class="class="bd-i wd-150 select" name="select" id="${'select' + listUser_index}">
													<#if listUser.sfzmType?exists>
														<#if listUser.sfzmType=='0'>
															<option value="1" selected="selected">身份证</option>
														</#if>
														<#if listUser.sfzmType=='1'>
															<option value="2" selected="selected">军官证</option>
														</#if>
														<#if listUser.sfzmType=='2'>
															<option value="3" selected="selected">护照</option>
														</#if>
													<#else>
														<option value="">请选择</option>
														<option value="1">身份证</option>
														<option value="2">军官证</option>
														<option value="3">护照</option>
													</#if>
												</select>
											</td>
											<td>
												<a class="btn-modify" href="javascript:paraTo(${listUser.id},'${'select' + listUser_index}')">上传</a>
												<a class="btn-delete" href="javascript:paraToDelete(${listUser.id})" style="display:none">删除</a>
											</td>
											<td class="co-green">未上传</td>
											<td class="text-r table-img">
												<img src="../pages/zxfy/img/pic_thumbnails.jpg" class="appImg" style="margin-left:5px">
												<img src="../pages/zxfy/img/pic_thumbnails.jpg" class="appImg">
											</td>
										</tr>
										<#assign x=x+1 />
									</#list>
								</tbody>
							</table>
							<form name="sfzmForm" id="sfzmForm" action="" method="post" enctype="multipart/form-data">
								<div class="xzfy-pop" id="pop">
			                        <div class="pop-t">
			                        	<a class="btn-close1 fn-right" id="close" href="javascript:void(0)">X</a> 
			                        	<a id="sfzmFile" class="btn-modify" href="javascript:void(0)">选择文件上传</a>
			                        	<div id="sfzmDiv" style="display:none">
				                        	<a style="position:relative;display:block;width:65px;height:25px;background:#4973be;border:1px solid #999;text-align:center;" href="javascript:void(0)">上传文件
				                        		<input id="myFile" style="position:absolute;left:0;top:0;width:100%;height:100%;z-index:999;filter:alpha(opacity=0);" type="file" name="sfzmArchive" onchange="imgCheck(this)"></input>
				                        	</a>
			                        	</div>
		                        		<input type="hidden" name="userId" value="" id="userId"></input>
		                        		<input type="hidden"  name="caseNum" value="${caseNum}"></input>
		                        		<input type="hidden"  name="select" value="" id="selection"></input>
			                        </div>
			                        <div class="pop-c">
			                        	<div class="pop-img" id="imgDiv" style=""></div>
			                        	<a class="link-delete" href="javascript:void(0)">删除</a> 
			                        </div>
			                        <div class="pop-f">
			                        	<a class="btn-confirm" id="confirm" href="javascript:void(0)">确定</a>
			                        </div>
			                    </div>
	                    	</form>
	                    	<form name="sfzmDeleteForm" id="sfzmDeleteForm" action="" method="post">
	                    		<div style="display:none">
	                    			<input name="userId" value="" id="id"></input>
	                    			<input name="caseNum" value="${caseNum}"></input>
	                    			<input id="delete"></input>
	                    		</div>
	                    	</form>
						</div>
					</div>
				</div>
				<div style="display:none">
					<input id="imgPath" value="${imgPath}"></input>
				</div>
			</#if>
			<#if bzContent=='2'>
				<div class="xzfy6-border">
					<div class="xzfy6-bg sccl-bg">
						<div class="xzfy6-t">二.证明具体行政行为存在的材料<span>上传</span></div>
						<div class="xzfy6-p">（温馨提示：例如：不服《行政处罚决定书》、《政府信息公开告知书》，请将该文书扫描或拍成照片上传（JPG格式）。如果材料为多页，您可以扫描或拍摄<span>10张以内jpg</span>格式文件上传）</div>
						<div class="sccl-add">
		                    <label class="fn-left">材料名称：</label>
		                    <input class="fn-left" id="nameOfCl" name="clmc" type="text" placeholder="请输入材料名称">
		                    <label class="fn-left">文号：</label>
		                    <input class="fn-left" id="numberOfCl" name="wjh" type="text" placeholder="请输入材料文号">
	                   		<a class="btn-add add-cl fn-left" href="javascript:addcl()" title="点击添加材料">添加材料</a>
	                	</div>
	                	<div class="xzfy-table">
	                		<table class="table">
	                			<colgroup>
                            		<col style="width: 40%;" />
                            		<col style="width: 30%;" />
                            		<col style="width: 20%;" />
                           		 	<col style="width: 10%;" />
                        		</colgroup>
                        		<thead>
			                        <tr>
			                            <th>材料名称</th>
			                            <th>文号</th>
			                            <th>状态</th>
			                            <th class="text-r">数量</th>
			                        </tr>
		                        </thead>
		                        <tbody>
		                        	<#if xzclName?exists>
		                        		<#assign k = 0 />
		                        		<#list xzclName as clName>
		                        			<tr>
                        						<td>${clName}</td>
                        						<td>${(archive.other)?default("")}</td>
                        						<td class="co-green">已上传</td>
                        						<#list xzclArchive as archive>
                        							<#if clName==archive.clName>
                        								<#assign k =k+1 />
                        							</#if>
                        						</#list>
                        						<td class="text-r">${k}</td>
                        						<#assign k=0 />
                        					</tr>
                        					<tr>
                        						<td colspan="4" class="sccl-img">
				                        			<#list xzclArchive as archive>
				                        				<#if clName==archive.clName>
				                        					<img class="tooltip" src="${archive.fileRelativePath}" title="单击图片删除" onclick="imgRemove(${archive.id})"></img>
				                        				</#if>
				                        			</#list>
				                        			<a href='javascript:void(0)' onclick='pop1Div(this)'>
				                        				<img id='sccl-add2' src='../pages/zxfy/img/pic_add.jpg'></img>
				                        			</a>
			                        			</td>
		                        			</tr>
		                        		</#list>
		                        	</#if>
		                        </tbody>
	                		</table>
	                		<form name="xzclForm" id="xzclForm" action="" method="post" enctype="multipart/form-data">
		                		<div class="xzfy-pop" id="pop1">
			                        <div class="pop-t">
			                        	<a class="btn-close1 fn-right" id="close1" href="javascript:void(0)">X</a> 
			                        	<a class="btn-modify" id="xzclFile" href="javascript:void(0)">选择文件上传</a>
			                        	<div id="xzclDiv" style="display:none">
				                        	<a style="position:relative;display:block;width:65px;height:25px;background:#4973be;border:1px solid #999;text-align:center;" href="javascript:void(0)">上传文件
				                        		<input id="xzcl" style="position:absolute;left:0;top:0;width:100%;height:100%;z-index:999;filter:alpha(opacity=0);" type="file" name="xzcl" onchange="imgCheck1(this)"></input>
				                        	</a>
			                        	</div>
		                        		<input type="hidden" id="clmc" name="clmc" value=""></input>
		                        		<input type="hidden" id="wjh" name="wjh" value=""></input>
		                        		<input type="hidden" name="caseNum" value="${caseNum}"></input>
			                        </div>
			                        <div class="pop-c">
			                        	<div class="pop-img" id="imgDiv1" style=""></div>
			                        	<a class="link-delete" href="javascript:void(0)">删除</a> 
			                        </div>
			                        <div class="pop-f">
			                        	<a class="btn-confirm" id="confirm1" href="javascript:void(0)">确定</a>
			                        </div>
			                    </div>
		                    </form>
		                    <form name="xzclDeleteForm" action="" method="post">
		                    	<div style="display:none">
		                    		<input name="caseNum" value="${caseNum}"></input>
		                    		<input id="xzclImgId" name="xzclImgId" value=""></input>
		                    	</div>
		                    </form>
	                	</div>
					</div>
				</div>
			</#if>
			<#if bzContent=='3'>
				<div class="xzfy6-border">
					<div class="xzfy6-bg sccl-bg">
						<div class="xzfy6-t">三.授权代理的材料<span>上传</span></div>
		                <div class="xzfy6-p">（温馨提示：如果您是法定代理，请上传法定代理证明照片或扫描件（JPG格式）。法定代理证明材料提示如下：基于夫妻关系的，需提交结婚证照片或扫描件；基于直系亲属关系的，需提交户籍证明照片或扫描件；基于其他监护关系的，需提交证明监护关系成立的有关证明材料照片或扫描件。请上传<span>2张以内jpg</span>格式文件上传）</div>
		                <div class="xzfy-table">
		                	<table class="table">
		                		<colgroup>
		                            <col style="width: 25%;" />
		                            <col style="width: 30%;" />
		                            <col style="width: 20%;" />
		                            <col style="width: 20%;" />
		                        </colgroup>
		                        <thead>
		                        	<tr>
		                        		<th>代理人</th>
			                            <th>操作</th>
			                            <th>状态</th>
			                            <th class="text-r">缩略图</th>
		                        	</tr>
		                        </thead>
		                        <tbody>
		                        	<tr>
		                        		<td>${sqdlApp.appName}</td>
		                        		<td>
											<a class="btn-modify" id="uploadSqImg" href="javascript:pop2Div()">上传</a>
											<a class="btn-delete" id="deleteSqImg" href="javascript:sqDelte()" style="display:none">删除</a>
										</td>
										<td class="co-green" id="sta">未上传</td>
										<td class="text-r table-img">
											<img id="sqImg1" src="../pages/zxfy/img/pic_thumbnails.jpg" class="sqImg" style="margin-left:5px">
											<img id="sqImg2" src="../pages/zxfy/img/pic_thumbnails.jpg" class="sqImg">
										</td>
		                        	</tr>
		                        </tbody>
		                	</table>
		                	<form name="sqclForm" id="sqclForm" action="" method="post" enctype="multipart/form-data">
			                	<div class="xzfy-pop" id="pop2">
			                        <div class="pop-t">
			                        	<a class="btn-close1 fn-right" id="close2" href="javascript:void(0)">X</a> 
			                        	<a class="btn-modify" id="sqclFile" href="javascript:void(0)">选择文件上传</a>
			                        	<div id="sqDiv" style="display:none">
				                        	<a style="position:relative;display:block;width:65px;height:25px;background:#4973be;border:1px solid #999;text-align:center;" href="javascript:void(0)">上传文件
				                        		<input id="sqFile" style="position:absolute;left:0;top:0;width:100%;height:100%;z-index:999;filter:alpha(opacity=0);" type="file" name="sqwt" onchange="imgCheck2(this)"></input>
				                        	</a>
			                        	</div>
		                        		<input type="hidden" name="caseNum" value="${caseNum}"></input>
			                        </div>
			                        <div class="pop-c">
			                        	<div class="pop-img" id="imgDiv2" style=""></div>
			                        	<a class="link-delete" href="javascript:void(0)">删除</a> 
			                       	</div>
			                        <div class="pop-f">
			                        	<a class="btn-confirm" id="confirm2" href="javascript:void(0)">确定</a>
			                        </div>
			                    </div>
		                    </form>
		                    <form name="sqwtDeleteForm" id="sqwtDeleteForm" action="" method="post">
	                    		<div style="display:none">
	                    			<input name="caseNum" value="${caseNum}"></input>
	                    			<input id="sqDel"></input>
	                    		</div>
	                    	</form>
		               	</div>
					</div>
				</div>
				<div style="display:none">
					<input id="img1" value="${sqwtArchive1}"></input>
					<input id="img2" value="${sqwtArchive2}"></input>
				</div>
			</#if>
			<#if bzContent=='4'>
				<div class="xzfy6-border">
					<div class="xzfy6-bg sccl-bg">
						<div class="xzfy6-t">四.其他材料<span>上传</span></div>
                		<div class="xzfy6-p">（温馨提示：例如：不服《行政处罚决定书》、《政府信息公开告知书》，请将该文书扫描或拍成照片上传（JPG格式）。如果材料为多页，您可以扫描或拍摄<span>10张以内jpg</span>格式文件上传）</div>
                		<div class="sccl-add">
		                    <label class="fn-left">材料名称：</label>
		                    <input class="fn-left" type="text" id="otherName" placeholder="请输入材料名称">
		                    <label class="fn-left">文号：</label>
		                    <input class="fn-left" type="text" id="otherWh" placeholder="请输入材料文号">
		                    <a class="btn-add add-cl fn-left" href="javascript:addcl2()" title="点击添加材料">添加材料</a>
		                </div>
		                <div class="xzfy-table">
                    		<table class="table">
                    			<colgroup>
		                            <col style="width: 40%;" />
		                            <col style="width: 30%;" />
		                            <col style="width: 20%;" />
		                            <col style="width: 10%;" />
		                        </colgroup>
		                        <thead>
			                        <tr>
			                            <th>材料名称</th>
			                            <th>文号</th>
			                            <th>状态</th>
			                            <th class="text-r">数量</th>
			                        </tr>
		                        </thead>
		                        <tbody>
		                        	<#if otherName?exists>
		                        		<#assign m = 0 />
		                        		<#list otherName as otclName>
		                        			<tr>
                        						<td>${otclName}</td>
                        						<td>${(archive.other)?default("")}</td>
                        						<td class="co-green">已上传</td>
                        						<#list otherArchiveModels as archive>
                        							<#if otclName==archive.clName>
                        								<#assign m =m+1 />
                        							</#if>
                        						</#list>
                        						<td class="text-r">${m}</td>
                        						<#assign m=0 />
                        					</tr>
                        					<tr>
                        						<td colspan="4" class="sccl-img">
				                        			<#list otherArchiveModels as archive>
				                        				<#if otclName==archive.clName>
				                        					<img class="tooltip" title="单击图片删除" src="${archive.fileRelativePath}"></img>
				                        				</#if>
				                        			</#list>
				                        			<a href='javascript:void(0)' onclick='pop3Div(this)'>
				                        				<img id='sccl-add2' src='../pages/zxfy/img/pic_add.jpg'></img>
				                        			</a>
			                        			</td>
		                        			</tr>
		                        		</#list>
		                        	</#if>
		                        </tbody>
                    		</table>
                    		<form name="otherForm" id="otherForm" action="" method="post" enctype="multipart/form-data">
	                    		<div class="xzfy-pop" id="pop3">
			                        <div class="pop-t">
			                        	<a class="btn-close1 fn-right" id="close3" href="javascript:void(0)">X</a> 
			                        	<a class="btn-modify" id="otherFile" href="javascript:void(0)">选择文件上传</a>
			                        	<div id="otherDiv" style="display:none">
				                        	<a style="position:relative;display:block;width:65px;height:25px;background:#4973be;border:1px solid #999;text-align:center;" href="javascript:void(0)">上传文件
				                        		<input id="othercl" style="position:absolute;left:0;top:0;width:100%;height:100%;z-index:999;filter:alpha(opacity=0);" type="file" name="other1" onchange="imgCheck3(this)"></input>
				                        	</a>
			                        	</div>
		                        		<input type="hidden" id="otherClName" name="clmc" value=""></input>
		                        		<input type="hidden" id="otherWjh" name="wjh" value=""></input>
		                        		<input type="hidden" name="caseNum" value="${caseNum}"></input>
			                        </div>
			                        <div class="pop-c">
			                        	<div class="pop-img" id="imgDiv3" style=""></div>
			                        	<a class="link-delete" href="javascript:void(0)">删除</a> 
			                        </div>
			                        <div class="pop-f">
			                        	<a class="btn-confirm" id="confirm3" href="javascript:void(0)">确定</a>
			                        </div>
			                    </div>
		                    </form>
                    	</div>
					</div>
				</div>
			</#if>
		</div>
	</#list>
	<div style="text-align:center;">
		<input type="button" name="goToUpdatePage" class="button" value="上一步" onClick="goToPrePage()"></input>
		<input type="button" name="goToUpdatePage" class="button" value="下一步" onClick="goToNextPage()"></input>
	</div>
</div>
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script>
	/* 初始化界面  */
	$(function(){
		var $btn = $("a.btn-modify");
		var $status = $("td.co-green");
		var $img = $("img.appImg");
		var imgPath = $("#imgPath").val();
		var str =  new Array();
		str = imgPath.split(",");
		var len = str.length-1;
		/* 上传以后显示缩略图 */
		for(var i=0;i<len;i++){
			if(str[i]!=0){
				if(i%2==0){
					/* 显示删除材料按钮  */
					$($btn[i/2]).next()[0].style.display="";
					/* 第一张上传成功后状态显示  */
					$($status[i/2]).text("已上传");
					if(str[i+1]!=0){
						/* 上传两张正反面证件材料后隐藏上传按钮  */
						$btn[i/2].style.display="none";
						/* 第二张上传成功后状态显示 */
						$($status[i/2]).text("已上传");
					}
					$img[i+1].src=str[i];
				}
				else{
					$img[i-1].src=str[i];
				}
			}
		}
		var img1 = $("#img1").val();
		var img2 = $("#img2").val();
		if(img1!=""){
			$("#sqImg2")[0].src = img1;
			$("#sta").text("已上传");
		}
		if(img2!=""){
			$("#sqImg1")[0].src = img2;
		}
		if(img1!=""){
			if(img2!=""){
				$("#uploadSqImg")[0].style.display="none";
			}
			$("#deleteSqImg")[0].style.display="";
		}
		/* 每份材料上传十张时隐藏上传文件按钮  */
		var $tr = $("#xzclForm").parent().find("tbody").children("tr");
		for(var i=0;i<$tr.length;i=i+2){
			var imgNum = $tr.eq(i).find("td").eq(3).text();
			if(imgNum==10){	
				$tr.eq(i+1).find("td").find("a").css("display","none");
			}
		}
		var $tr = $("#otherForm").parent().find("tbody").children("tr");
		for(var i=0;i<$tr.length;i=i+2){
			var imgNum = $tr.eq(i).find("td").eq(3).text();
			if(imgNum==10){	
				$tr.eq(i+1).find("td").find("a").css("display","none");
			}
		}
		
		/* 图片提示效果 */
		var x = 10;
		var y = 20;
		$("img.tooltip").mouseover(function(e){
			this.myTitle = this.title;
			this.title="";
			var tooltip = "<div id='tooltip' style='position:absolute;background:#ccc'>"+this.myTitle+"</div>";
			$("body").append(tooltip);
			$("#tooltip").css({
				"top":(e.pageY+y)+"px",
				"left":(e.pageX+x)+"px"
			}).show("fast");
		}).mouseout(function(){
			this.title = this.myTitle;
			$("#tooltip").remove();
		}).mousemove(function(e){
			$("#tooltip").css({
				"top":(e.pageY+y)+"px",
				"left":(e.pageX+x)+"px"
			});
		});
	});
    /* 关闭框 */
    $("#close").click(function(){
        $("#pop").css("display","none");
        var file = $("#myFile")[0];
        /* 清空上传文件域  */
        file.outerHTML = file.outerHTML;
        /* 清除预览图片  */
        $("#pop").find("div#imgDiv").empty();
        if(typeof FileReader=="undefined"){
    			/* 清除IE浏览器前台预览图片 */
			if($.browser.msie==true){
				$("#pop").find("div#imgDiv").attr("style","");
			}
		}
    });
    /* 向form表单传递参数  */
    function paraTo(userId,index){
    	/* 上传按钮控制  */
    	if($.browser.msie){
    		$("#sfzmFile")[0].style.display="none";
    		$("#sfzmDiv")[0].style.display="";
    	}
    	else{
    		$("#sfzmFile").click(function(){
    			$("#myFile").click();
    		});
    	}
    	/* 弹出上传文件框  */
    	$("#pop").css("display","block");
    	$("#userId").val(userId);
    	var $select = $("#"+index);
    	var $selection = $("#selection");
    	if($select.val()==""){
    		/* 绑定click事件向form表单传递select值 */
    		$select.click(function(){
    			$selection.val($(this).val());
    		});
    	}else{
    		$selection.val($select.val());
    	} 
    }
    /* 上传材料form表单提交 */
    $("#confirm").click(function(){
    	var select = $("#selection").val();
    	/* 验证证件类型是否为空 */
    	if(select==""){
    		alert("请选择证件类型！");
    		return false;
    	}
    	var file=$("#myFile").val();
    	/* 调用文件验证方法 */
    	if(fileCheck(file)==false){
    		return false;
    	}
    	/* 提交表单 */
        window.sfzmForm.action="../zxbz/sfzmSavaRun.action?funcCode=${funcCode}";
        window.sfzmForm.submit();
    });
    /* 删除材料  */
    function paraToDelete(userId){
    	$("#id").val(userId);
    	if(confirm("确定删除？")){
    		$("#delete").click();
    		return true;
    	}
    }
    /* 提交删除材料 */
    $("#delete").click(function(){
    	window.sfzmDeleteForm.action="../zxbz/sfzmDelete.action?funcCode=${funcCode}";
    	window.sfzmDeleteForm.submit();
    });
    /* 验证上传文件内容是否为空以及格式 是否正确 */
    function fileCheck(file){
    	if(file==""){
    		alert("请选择文件！");
    		return false;
    	}
    	var strTemp=file.split(".");
    	var strCheck = strTemp[strTemp.length-1];
    	if(strCheck.toUpperCase()!="JPG"){
    		alert("上传的文件必须是JPG格式！");
    		return false;
    	}
    	return true;
    }
    /* 选择上传文件后判断格式是否正确  */
    function imgCheck(obj){
    	var file= obj.value;
    	var strTemp = file.split(".");
    	var strCheck = strTemp[strTemp.length-1];
    	if(strCheck.toUpperCase()!="JPG"){
    		$(obj).parents("div#pop").find("div#imgDiv").empty();
    		obj.outerHTML = obj.outerHTML;
    		alert("上传的文件仅支持JPG格式！");
    		return false;
    	}else{
    		var $imgDiv = $(obj).parents("div#pop").find("div#imgDiv");
    		var $img = $imgDiv.find("img");
    		if($img.length==0){
    			$imgDiv.append("<img></img>");
    			var $img = $imgDiv.find("img");
    		}
    		imgPreview(obj,$img[0]);
    	}
    }
    /* 前台预览图片 */
    function imgPreview(obj,img){
			/* IE浏览器前台预览图片 */
		if($.browser.msie){
			$(img).parent().attr("style","filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);");
			$(img).parent()[0].filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = obj.value;
			$(img).remove();
		}
		else{
			/* Firefox浏览器 前台预览图片 */
			var reader = new FileReader();
			reader.onload = function(evt){
				img.src = evt.target.result;
			}
			reader.readAsDataURL(obj.files[0]);
		}
    }
    /*------------------------------------------------------------------------------------------*/
    /* 添加材料 */
    function addcl(){
    	var nameOfCl = $("#nameOfCl").val();
    	var numberOfCl = $("#numberOfCl").val();
    	if(nameOfCl==""){
    		alert("请填写材料名称！");
    	}
    	else{
			var $tr = $("#nameOfCl").parent().next().find("tbody").children("tr");
			if($tr.length<10){
    			var $tbody = $("#nameOfCl").parent().next().find("tbody");
    			var flag=1;
				for(var i=1;i<$tr.length;i=i+2){
    				var img = $($tr[i]).find("img").length;
    				if(img==1){
    					flag=0;
    					break;
    				}
    			}
    			var $tr = $("#xzclForm").parent().find("tbody").children("tr");
    			var flag2=1;
				for(var i=0;i<$tr.length;i=i+2){
					var name = $tr.eq(i).find("td").eq(0).text();
					if(nameOfCl==name){	
						flag2=0;
						break;
					}
				}
    			if(flag==1){
    				if(flag2==1){
	    				/* 生成节点  */
		    			var node1 = "<tr><td>"+nameOfCl+"</td><td>"+numberOfCl+"</td><td class='co-green'>未上传</td><td class='text-r'>0张</td></tr>";
		    			var node2 = "<tr><td colspan='4' class='sccl-img'><a href='javascript:void(0)' onclick='pop1Div(this)'><img id='sccl-add2' src='../pages/zxfy/img/pic_add.jpg'></img></a></td></tr>";
		    			$tbody.append(node1+node2);
	    			}
	    			else{
	    				alert("材料名称不能重复！");
	    			}
    			}
    			else{
    				alert("请给材料添加文件!");
    			}
			}
			else{
				alert("您已上传5份材料，不能继续上传了！");
			}
    	}
    	/* 清空输入框  */
    	if(nameOfCl!=""){
    		$("#nameOfCl").val("");
    		$("#numberOfCl").val("");
    	}
    }
    /* 弹出上传文件框  */
    function pop1Div(t){
    	/* 将材料文件名和文件号传到form表单  */
    	var $td = $(t).parents("tr").prev().find("td");
    	$("#clmc").val($td.eq(0).text());
    	$("#wjh").val($td.eq(1).text());
    	/* 控制上传按钮 样式 */
		if($.browser.msie){
			$("#xzclFile")[0].style.display="none";
			$("#xzclDiv")[0].style.display="";
		}
		else{
			/* 自定义按钮调用默认上传按钮  */
		    $("#xzclFile").click(function(){
		    	$("#xzcl").click();
		    });
		}
    	/* 弹出上传文件框  */
    	$("#pop1").css("display","block");
    }
    /* 选择文件后进行校验格式  */
    function imgCheck1(obj){
    	var file= obj.value;
    	var strTemp = file.split(".");
    	var strCheck = strTemp[strTemp.length-1];
    	if(strCheck.toUpperCase()!="JPG"){
    		$(obj).parents("div#pop1").find("div#imgDiv1").empty();
    		obj.outerHTML = obj.outerHTML;
    		alert("上传的文件仅支持JPG格式！");
    		return false;
    	}
    	else{
    		var $imgDiv = $(obj).parents("div#pop1").find("div#imgDiv1");
    		var $img = $imgDiv.find("img");
    		if($img.length==0){
    			$imgDiv.append("<img></img>");
    			var $img = $imgDiv.find("img");
    		}
    		/* 前台预览图片 */
    		imgPreview(obj,$img[0]);
    	}
    }
    /* 关闭上传文件框  */
    $("#close1").click(function(){
        $("#pop1").css("display","none");
        var file = $("#xzcl")[0];
        /* 清空上传文件域  */
        file.outerHTML = file.outerHTML;
        /* 清除预览图片  */
        $("#pop1").find("div#imgDiv1").empty();
         if(typeof FileReader=="undefined"){
    			/* 清除IE浏览器前台预览图片 */
			if($.browser.msie==true){
				$("#pop1").find("div#imgDiv1").attr("style","");
			}
		}
    });
     /* 上传材料form表单提交 */
    $("#confirm1").click(function(){
    	var file=$("#xzcl").val();
    	/* 调用文件验证方法 */
    	if(fileCheck(file)==false){
    		return false;
    	}
    	/* 提交表单 */
        window.xzclForm.action="../zxbz/xzclSaveRun.action?funcCode=${funcCode}";
        window.xzclForm.submit();
    });
    /* 删除材料中的某一图片   */
    function imgRemove(id){
    	$("#xzclImgId").val(id);
    	if(confirm("确认删除？")){
    		window.xzclDeleteForm.action="../zxbz/xzclImgDelete.action?funcCode=${funcCode}";
       	 	window.xzclDeleteForm.submit();
    		return true;
    	}
    }
    /*-------------------------------------------------------------------------------*/
     /* 弹出上传文件框  */
    function pop2Div(){
		if($.browser.msie){
			$("#sqclFile")[0].style.display="none";
			$("#sqDiv")[0].style.display="";
		}
    	else{
    		/* 自定义文件上传按钮调用默认的文件上传触发事件  */
		    $("#sqclFile").click(function(){
		    	$("#sqFile").click();
		    });
    	}
    	$("#pop2").css("display","block");
    }
    /* 选择文件后进行校验格式  */
    function imgCheck2(obj){
    	var file= obj.value;
    	var strTemp = file.split(".");
    	var strCheck = strTemp[strTemp.length-1];
    	if(strCheck.toUpperCase()!="JPG"){
    		$(obj).parents("div#pop2").find("div#imgDiv2").empty();
    		obj.outerHTML = obj.outerHTML;
    		alert("上传的文件仅支持JPG格式！");
    		return false;
    	}
    	else{
    		var $imgDiv = $(obj).parents("div#pop2").find("div#imgDiv2");
    		var $img = $imgDiv.find("img");
    		if($img.length==0){
    			$imgDiv.append("<img></img>");
    			var $img = $imgDiv.find("img");
    		}
    		/* 前台预览图片 */
    		imgPreview(obj,$img[0]);
    	}
    }
    /* 关闭弹出框 */
    $("#close2").click(function(){
    	$("#pop2").css("display","none");
    	var file = $("#sqFile")[0];
        /* 清空上传文件域  */
        file.outerHTML = file.outerHTML;
        /* 清除预览图片  */
        $("#pop2").find("div#imgDiv2").empty();
        if(typeof FileReader=="undefined"){
    			/* 清除IE浏览器前台预览图片 */
			if($.browser.msie==true){
				$("#pop2").find("div#imgDiv2").attr("style","");
			}
		}
    });
    /* 授权材料form表单提交 */
    $("#confirm2").click(function(){
    	var file=$("#sqFile").val();
    	/* 调用文件验证方法 */
    	if(fileCheck(file)==false){
    		return false;
    	}
    	/* 提交表单 */
        window.sqclForm.action="../zxbz/sqwtSave.action?funcCode=${funcCode}";
        window.sqclForm.submit();
    });
    /* 提交删除授权委托书材料表单  */
    $("#sqDel").click(function(){
    	window.sqwtDeleteForm.action="../zxbz/sqclDelete.action?funcCode=${funcCode}";
    	window.sqwtDeleteForm.submit();
    });
    /* 删除授权委托书材料 */
    function sqDelte(){
    	if(confirm("是否确认删除？")){
    		$("#sqDel").click();
    		return true;
    	}
    }
    /*-----------------------------------------------------------------------------------*/
     /* 添加材料 */
    function addcl2(){
    	var nameOfCl = $("#otherName").val();
    	var numberOfCl = $("#otherWh").val();
    	if(nameOfCl==""){
    		alert("请填写材料名称！");
    	}
    	else{
			var $tr = $("#otherName").parent().next().find("tbody").children("tr");
			if($tr.length<10){
    			var $tbody = $("#otherName").parent().next().find("tbody");
    			var flag=1;
				for(var i=1;i<$tr.length;i=i+2){
    				var img = $($tr[i]).find("img").length;
    				if(img==1){
    					flag=0;
    					break;
    				}
    			}
    			var $tr = $("#otherForm").parent().find("tbody").children("tr");
    			var flag2=1;
				for(var i=0;i<$tr.length;i=i+2){
					var name = $tr.eq(i).find("td").eq(0).text();
					if(nameOfCl==name){
						flag2=0;
					}
				}
    			if(flag==1){
    				if(flag2==1){
	    				/* 生成节点  */
		    			var node1 = "<tr><td>"+nameOfCl+"</td><td>"+numberOfCl+"</td><td class='co-green'>未上传</td><td class='text-r'>0张</td></tr>";
		    			var node2 = "<tr><td colspan='4' class='sccl-img'><a href='javascript:void(0)' onclick='pop3Div(this)'><img id='sccl-add2' src='../pages/zxfy/img/pic_add.jpg'></img></a></td></tr>";
		    			$tbody.append(node1+node2);
	    			}
	    			else{
	    				alert("材料名称不能重复！");
	    			}
    			}
    			else{
    				alert("请给材料添加文件!");
    			}
			}
			else{
				alert("您已上传5份材料，不能继续上传了！");
			}
    	}
    	/* 清空输入框  */
    	if(nameOfCl!=""){
    		$("#otherName").val("");
    		$("#otherWh").val("");
    	}
    }
     /* 弹出上传文件框  */
    function pop3Div(t){
    	/* 将材料文件名和文件号传到form表单  */
    	var $td = $(t).parents("tr").prev().find("td");
    	$("#otherClName").val($td.eq(0).text());
    	$("#otherWjh").val($td.eq(1).text());
    	/*控制上传按钮 */
		if($.browser.msie==true){
			$("#otherFile")[0].style.display="none";
			$("#otherDiv")[0].style.display="";
		}
    	else{
    		/* 自定义按钮调用默认上传按钮  */
		    $("#otherFile").click(function(){
		    	$("#othercl").click();
		    });
    	}
    	/* 弹出上传文件框  */
    	$("#pop3").css("display","block");
    }
    /* 选择文件后进行校验格式  */
    function imgCheck3(obj){
    	var file= obj.value;
    	var strTemp = file.split(".");
    	var strCheck = strTemp[strTemp.length-1];
    	if(strCheck.toUpperCase()!="JPG"){
    		$(obj).parents("div#pop3").find("div#imgDiv3").empty();
    		obj.outerHTML = obj.outerHTML;
    		alert("上传的文件仅支持JPG格式！");
    		return false;
    	}
    	else{
    		var $imgDiv = $(obj).parents("div#pop3").find("div#imgDiv3");
    		var $img = $imgDiv.find("img");
    		if($img.length==0){
    			$imgDiv.append("<img></img>");
    			var $img = $imgDiv.find("img");
    		}
    		/* 前台预览图片 */
    		imgPreview(obj,$img[0]);
    	}
    }
    /* 关闭上传文件框  */
    $("#close3").click(function(){
        $("#pop3").css("display","none");
        var file = $("#othercl")[0];
        /* 清空上传文件域  */
        file.outerHTML = file.outerHTML;
        /* 清除预览图片  */
        $("#pop3").find("div#imgDiv3").empty();
        if(typeof FileReader=="undefined"){
    			/* 清除IE浏览器前台预览图片 */
			if($.browser.msie==true){
				$("#pop3").find("div#imgDiv3").attr("style","");
			}
		}
    });
     /* 上传材料form表单提交 */
    $("#confirm3").click(function(){
    	var file=$("#othercl").val();
    	/* 调用文件验证方法 */
    	if(fileCheck(file)==false){
    		return false;
    	}
    	/* 提交表单 */
        window.otherForm.action="../zxbz/otherSave.action?funcCode=${funcCode}";
        window.otherForm.submit();
    });
    /*-----------------------------------------------------------------------------------*/
    /* 跳转到下一页 */
	function goToNextPage(){
		 window.location="../pages/zxbz/yulan.ftl"
	}
	/* 跳转到上一页  */
	function goToPrePage(){
		window.location="../zxbz/zxbzListAction.action?funcCode=${funcCode}"
	}
</script>
</body>
</html>