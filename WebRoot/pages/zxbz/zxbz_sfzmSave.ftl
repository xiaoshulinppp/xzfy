<!DOCTYPE html>
<html>
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
		<a class="xzfy-hd-r fhsy fn-right" href="../zxfy/mainPage.action?funcCode=${funcCode}"></a>
   		<div class="xzfy-hd-bg fn-left"></div>
	</div>
	<#-- 身份证明补正材料 -->
	<div class="xzfy6">
		<#list buzhengContentType as bzContent>
			<#if bzContent=='1'>
				<div class="xzfy6-border">
					<div class="xzfy6-bg sczj-bg">
						<div class="xzfy6-t">申请人证件（复印件）<span>上传</span></div>
						<div class="xzfy6-p">（温馨提示：您填写的申请人数量为<span>${listApp?size}</span>，请上传该人数的有效证件,含正反面。上传图片格式：<span>JPG</span>。证件尺寸为：<span>358 像素（宽）× 441 像素（高）</span>）</div>
						<div id="sss1" class="xzfy-table">
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
														<#if listUser.sfzmType=='1'>
															<option value="1" selected="selected">身份证</option>
															<option value="2">军官证</option>
															<option value="3">护照</option>
														</#if>
														<#if listUser.sfzmType=='2'>
															<option value="1">身份证</option>
															<option value="2" selected="selected">军官证</option>
															<option value="3">护照</option>
														</#if>
														<#if listUser.sfzmType=='3'>
															<option value="1">身份证</option>
															<option value="2">军官证</option>
															<option value="3" selected="selected">护照</option>
														</#if>
														<#if listUser.sfzmType==''>
															<option value="">请选择</option>
															<option value="1">身份证</option>
															<option value="2">军官证</option>
															<option value="3">护照</option>
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
												<a class="btn-modify" href="javascript:void(0)" onclick="paraTo(${listUser.id},'${'select' + listUser_index}',event)">上传</a>
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
					<input id="imgPath" value="${imgPath?default('')}"></input>
				</div>
			</#if>
		<#-- 授权代理材料补正 -->
			<#if bzContent=='2'>
				<div class="xzfy6-border">
					<div class="xzfy6-bg sccl-bg">
						<div class="xzfy6-t">授权代理的材料<span>上传</span></div>
		                <div class="xzfy6-p">（温馨提示：如果您是法定代理，请上传法定代理证明照片或扫描件（JPG格式）。法定代理证明材料提示如下：基于夫妻关系的，需提交结婚证照片或扫描件；基于直系亲属关系的，需提交户籍证明照片或扫描件；基于其他监护关系的，需提交证明监护关系成立的有关证明材料照片或扫描件。请上传<span>2张以内jpg</span>格式文件上传）</div>
		                <div id="sss2" class="xzfy-table">
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
											<a class="btn-modify" id="uploadSqImg" href="javascript:void(0)" onclick="pop2Div(event)">上传</a>
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
		</#list>
		<table class="table">
			<tr>
				<td>
					<div class="xzfy-next">
						<a class="next-btn" href="javascript:login()" title="点击进入上一步：登陆补正页面">上一步</a> 
					</div>
				</td>
				<td>
					<#if buzhengContentType?seq_contains("3")>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:xzclPage()" title="点击进入下一步：行政材料补正">下一步</a> 
						</div>
					<#elseif buzhengContentType?seq_contains("4")>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:otherPage()" title="点击进入下一步：其它材料补正">下一步</a> 
						</div>
					<#else>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:mainPage()" title="点击进入下一步：补正完成">完成</a> 
						</div>
					</#if>
				</td>
			</tr>
		</table>
	</div>
</div>
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script>
	/* 初始化界面  */
	$(function(){
		var $btn = $("a.btn-modify");
		var $status = $("td.co-green");
		var $img = $("img.appImg");
		if($("#imgPath").length!=0){
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
		}
		if($("#img1")[0] && $("#img2")[0] && $("#sqImg2")[0] && $("#sqImg1")[0] && $("#sta")[0] && $("#uploadSqImg")[0] && $("#deleteSqImg")[0]){
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
		}
	});
	/*-----------------------------------身份证明材料补正-------------------------------------------*/
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
    function paraTo(userId,index,ev){
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
    	ev=ev||window.event;
    	var popTop;
    	var popLeft;
    	if(ev.pageX || ev.pageY){  
	        popLeft = ev.pageX;  
	        popTop = ev.pageY;  
	    } else {//兼容ie 
	        popLeft = ev.clientX + document.body.scrollLeft - document.body.clientLeft;  
	        popTop = ev.clientY + document.documentElement.scrollTop;  
	    }  
    	$("#pop").css({
    		"display":"block",
    		"top":(popTop-$("#sss1").offset().top-150)+"px",
    		"left":(popLeft-$("#sss1").offset().left+30)+"px"
    	});
    	
    	
    	
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
    /*----------------------------------授权代理材料补正------------------------------------------------*/
    /* 弹出上传文件框  */
    function pop2Div(ev){
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
    	
    	ev=ev||window.event;
    	var popTop;
    	var popLeft;
    	if(ev.pageX || ev.pageY){  
	        popLeft = ev.pageX;  
	        popTop = ev.pageY;  
	    } else {//兼容ie 
	        popLeft = ev.clientX + document.body.scrollLeft - document.body.clientLeft;  
	        popTop = ev.clientY + document.documentElement.scrollTop;  
	    }  
    	$("#pop2").css({
    		"display":"block",
    		"top":(popTop-$("#sss2").offset().top-150)+"px",
    		"left":(popLeft-$("#sss2").offset().left+30)+"px"
    	});
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
    /*---------------------------------------------------------------------------------------------*/
    /* 前台预览图片 */
    function imgPreview(obj,img){
			/* IE浏览器前台预览图片 */
		if($.browser.msie){
			obj.select();
			top.parent.document.body.focus();
			var str = document.selection.createRange().text;
			document.selection.empty();
			$(img).parent().attr("style","filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);");
			$(img).parent().get(0).filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = str;
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
    /*-------------------------------翻页--------------------------------------*/
    function login(){
    	window.location.href="../zxbz/zxbzListAction.action?funcCode=${funcCode}";
    }
    function xzclPage(){
    	var path = $("#imgPath");
    	if(path.length>0){
    		var str =  new Array();
			str = path.val().split(",");
			var len = str.length-1;
    		for(var i=0;i<len;i=i+2){
    			if(str[i]==0){
    				alert("请上传申请人身份证明材料！");
    				return;
    			}
    		}
    	}
    	var path2 = $("#img1");
    	if(path2.length>0){
    		if(path2.val()==""){
    			alert("请上传授权代理材料！");
    			return;
    		}
    	}
    	window.location.href="../zxbz/xzclPage.action?funcCode=${funcCode}&caseNum=${caseNum}";
    }
    function otherPage(){
    	var path = $("#imgPath");
    	if(path.length>0){
    		var str =  new Array();
			str = path.val().split(",");
			var len = str.length-1;
    		for(var i=0;i<len;i=i+2){
    			if(str[i]==0){
    				alert("请上传申请人身份证明材料！");
    				return;
    			}
    		}
    	}
    	var path2 = $("#img1");
    	if(path2.length>0){
    		if(path2.val()==""){
    			alert("请上传授权代理材料！");
    			return;
    		}
    	}
    	window.location.href="../zxbz/otherclPage.action?funcCode=${funcCode}&caseNum=${caseNum}";
    }
    function mainPage(){
    	var path = $("#imgPath");
    	if(path.length>0){
    		var str =  new Array();
			str = path.val().split(",");
			var len = str.length-1;
    		for(var i=0;i<len;i=i+2){
    			if(str[i]==0){
    				alert("请上传申请人身份证明材料！");
    				return;
    			}
    		}
    	}
    	var path2 = $("#img1");
    	if(path2.length>0){
    		if(path2.val()==""){
    			alert("请上传授权代理材料！");
    			return;
    		}
    	}
    	if(confirm("确认完成补正吗？")){
	    	window.location.href="../zxbz/mainPage.action?funcCode=${funcCode}&caseNum=${caseNum}";
	    	return true;
    	}
    }
</script>
</body>
</html>