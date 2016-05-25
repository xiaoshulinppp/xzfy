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
	<div class="xzfy6">
		<#if isManage=="0">
			<div class="xzfy6-border">
				<div class="xzfy6-bg sccl-bg">
					<div class="xzfy6-t">证明具体行政行为存在的材料<span>上传</span></div>
					<div class="xzfy6-p">（温馨提示：例如：不服《行政处罚决定书》、《政府信息公开告知书》，请将该文书扫描或拍成照片上传（JPG格式）。如果材料为多页，您可以扫描或拍摄<span>10张以内jpg</span>格式文件上传）</div>
					<div class="sccl-add">
	                    <label class="fn-left">材料名称：</label>
	                    <input class="fn-left" id="nameOfCl" name="clmc" type="text" placeholder="请输入材料名称">
	                    <label class="fn-left">文号：</label>
	                    <input class="fn-left" id="numberOfCl" name="wjh" type="text" placeholder="请输入材料文号">
	               		<a class="btn-add add-cl fn-left" href="javascript:addcl()" title="点击添加材料">添加材料</a>
	            	</div>
	            	<div id="sss" class="xzfy-table">
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
	                						<#list xzclArchive as archive>
	                							<#if clName==archive.clName>
	                								<td>${(archive.other)?default("")}</td>
	                								<#break>
	                							</#if>
	                						</#list>
	                						<td class="co-green">已上传&nbsp;<a class="btn-delete" href="javascript:void(0)" onclick="xzclDelete(this)">删除</a></td>
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
			                        			<a href='javascript:void(0)' onclick='pop1Div(this,event)'>
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
	                    <form name="xzclAllForm" action="" method="post">
	                    	<div style="display:none">
	                    		<input name="caseNum" value="${caseNum}"></input>
	                    		<input id="xzName" name="clmc" value=""></input>
	                    	</div>
	                    </form>
	            	</div>
				</div>
			</div>
		<#else>
			<#--- 行政材料不作为申请书----->
			<div class="xzfy6-border">
				<div class="xzfy6-bg sczj-bg">
					<div class="xzfy6-t">行政材料不作为申请书（复印件）<span>上传</span></div>
					<div class="xzfy6-p">（温馨提示：请上传申请人曾向被申请人提交的要求其履行法定职责的申请材料（照片或扫描件）上传图片格式：<span>JPG</span>。证件尺寸为：<span>358 像素（宽）× 441 像素（高）</span>）</div>
					<div id="sss1" class="xzfy-table">
						<table class="table">
							<colgroup>
	                            <col style="width: 40%;" />
	                            <col style="width: 25%;" />
	                            <col style="width: 15%;" />
	                            <col style="width: 20%;" />
	                        </colgroup>
	                        <thead>
		                        <tr>
		                            <th>材料名称</th>
		                            <th>操作</th>
		                            <th>状态</th>
		                            <th class="text-r">缩略图</th>
		                        </tr>
	                        </thead>
	                        <tbody>
	                        	<tr>
	                        		<td>
	                        			<input id="archiveName" class="bd-i pd-4" type="text" placeholder="请输入材料名称" value="${bzwclName?default('')}"></input>
	                        		</td>
	                        		<td>
	                        			<a id="bzwsqUpload" class="btn-modify" href="javascript:void(0)" onclick="popDiv('archiveName',event)">上传</a>
										<a id="bzwsqDelete" style="display:none" class="btn-delete" href="javascript:bzwqsDete()">删除</a>
	                        		</td>
	                        		<td class="co-green" id="myText">未上传</td>
	                        		<td class="text-r table-img">
										<img id="bzwClImg1" src="../pages/zxfy/img/pic_thumbnails.jpg" class="appImg" style="margin-left:5px">
										<img id="bzwClImg2" src="../pages/zxfy/img/pic_thumbnails.jpg" class="appImg">
									</td>
	                        	</tr>
	                        </tbody>
	                     </table>
	                     <form name="bzwclForm" action="" method="post" enctype="multipart/form-data">
							<div class="xzfy-pop" id="pop2">
		                        <div class="pop-t">
		                        	<a class="btn-close1 fn-right" id="close2" href="javascript:void(0)">X</a> 
		                        	<a id="bzwclFile" class="btn-modify" href="javascript:void(0)">选择文件上传</a>
		                        	<div id="bzwclDiv" style="display:none">
			                        	<a style="position:relative;display:block;width:65px;height:25px;background:#4973be;border:1px solid #999;text-align:center;" href="javascript:void(0)">上传文件
			                        		<input id="realFile" style="position:absolute;left:0;top:0;width:100%;height:100%;z-index:999;filter:alpha(opacity=0);" type="file" name="bzwclArchive" onchange="imgCheck2(this)"></input>
			                        	</a>
		                        	</div>
	                        		<input type="hidden"  name="caseNum" value="${caseNum}"></input>
	                        		<input id="bzwName" type="hidden"  name="bzwclName" value=""></input>
		                        </div>
		                        <div class="pop-c">
		                        	<div class="pop-img" id="imgDiv2" style=""></div>
		                        	<a class="link-delete" href="javascript:void(0)" style="display:none">删除</a> 
		                        </div>
		                        <div class="pop-f">
		                        	<a class="btn-confirm" id="confirm2" href="javascript:void(0)">确定</a>
		                        </div>
		                    </div>
	                	</form>
	                	<form name="bzwclDeleteForm" action="" method="post">
	                		<input type="hidden"  name="caseNum" value="${caseNum}"></input>
	                	</form>
					</div>
				</div>
			</div>
			<div style="display:none">
				<input id="bzwsqimg1" value="${bzwsqImgPath1?default('')}"></input>
				<input id="bzwsqimg2" value="${bzwsqImgPath2?default('')}"></input>
			</div>
			<#---行政材料不作为回执书---->
			<div class="xzfy6-border">
				<div class="xzfy6-bg sczj-bg">
					<div class="xzfy6-t">行政材料不作为回执书（复印件）<span>上传</span></div>
					<div class="xzfy6-p">（温馨提示：请上传向被申请人邮寄上述申请材料的邮政回执，或者当面提交申请材料的登记回执（照片或扫描件）上传图片格式：<span>JPG</span>。证件尺寸为：<span>358 像素（宽）× 441 像素（高）</span>）</div>
					<div id="sss2" class="xzfy-table">
						<table class="table">
							<colgroup>
	                            <col style="width: 40%;" />
	                            <col style="width: 25%;" />
	                            <col style="width: 15%;" />
	                            <col style="width: 20%;" />
	                        </colgroup>
	                        <thead>
		                        <tr>
		                            <th>材料名称</th>
		                            <th>操作</th>
		                            <th>状态</th>
		                            <th class="text-r">缩略图</th>
		                        </tr>
	                        </thead>
	                        <tbody>
	                        	<tr>
	                        		<td>
	                        			<input id="archiveName1" class="bd-i pd-4" type="text" placeholder="请输入材料名称" value="${bzwhzclName?default('')}"></input>
	                        		</td>
	                        		<td>
	                        			<a id="bzwhzUpload" class="btn-modify" href="javascript:void(0)" onclick="popDiv1('archiveName1',event)">上传</a>
										<a id="bzwhzDelete" style="display:none" class="btn-delete" href="javascript:bzwhzDete()">删除</a>
	                        		</td>
	                        		<td class="co-green" id="myText1">未上传</td>
	                        		<td class="text-r table-img">
										<img id="bzwhzClImg1" src="../pages/zxfy/img/pic_thumbnails.jpg" class="appImg" style="margin-left:5px">
										<img id="bzwhzClImg2" src="../pages/zxfy/img/pic_thumbnails.jpg" class="appImg">
									</td>
	                        	</tr>
	                        </tbody>
	                     </table>
	                     <form name="bzwhzclForm" action="" method="post" enctype="multipart/form-data">
							<div class="xzfy-pop" id="pop3">
		                        <div class="pop-t">
		                        	<a class="btn-close1 fn-right" id="close3" href="javascript:void(0)">X</a> 
		                        	<a id="bzwhzclFile" class="btn-modify" href="javascript:void(0)">选择文件上传</a>
		                        	<div id="bzwhzclDiv" style="display:none">
			                        	<a style="position:relative;display:block;width:65px;height:25px;background:#4973be;border:1px solid #999;text-align:center;" href="javascript:void(0)">上传文件
			                        		<input id="realFile1" style="position:absolute;left:0;top:0;width:100%;height:100%;z-index:999;filter:alpha(opacity=0);" type="file" name="bzwhzclArchive" onchange="imgCheck3(this)"></input>
			                        	</a>
		                        	</div>
	                        		<input type="hidden"  name="caseNum" value="${caseNum}"></input>
	                        		<input id="bzwhzName" type="hidden"  name="bzwhzclName" value=""></input>
		                        </div>
		                        <div class="pop-c">
		                        	<div class="pop-img" id="imgDiv3" style=""></div>
		                        	<a class="link-delete" href="javascript:void(0)" style="display:none">删除</a> 
		                        </div>
		                        <div class="pop-f">
		                        	<a class="btn-confirm" id="confirm3" href="javascript:void(0)">确定</a>
		                        </div>
		                    </div>
	                	</form>
	                	<form name="bzwhzclDeleteForm" action="" method="post">
	                		<input type="hidden"  name="caseNum" value="${caseNum}"></input>
	                	</form>
					</div>
				</div>
			</div>
			<div style="display:none">
				<input id="bzwhzimg1" value="${bzwhzImgPath1?default('')}"></input>
				<input id="bzwhzimg2" value="${bzwhzImgPath2?default('')}"></input>
			</div>
		</#if>
		<table class="table">
			<tr>
				<td>
					<#if buzhengContentType?seq_contains("1") || buzhengContentType?seq_contains("2")>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:sfzmPage()" title="点击进入上一步：身份证明补正页面">上一步</a> 
						</div>
					<#else>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:login()" title="点击进入上一步：登陆补正页面">上一步</a> 
						</div>
					</#if>
				</td>
				<td>
					<#if buzhengContentType?seq_contains("4")>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:otherPage()" title="点击进入下一步：其它材料补正材料补正">下一步</a> 
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
		/* 每份材料上传十张时隐藏上传文件按钮  */
		var $tr = $("#xzclForm").parent().find("tbody").children("tr");
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
		/* 不作为申请材料上传后显示 */
		if($("#archiveName").val()!=""){
			$("#archiveName").attr("disabled","true");
		}
		if($("#bzwsqimg1")[0] && $("#bzwsqimg2")[0] && $("#bzwClImg1")[0] && $("#bzwClImg2")[0] && $("#bzwsqUpload")[0] && $("#bzwsqDelete")[0] && $("#myText")[0]){
			var img1 = $("#bzwsqimg1").val();
			var img2 = $("#bzwsqimg2").val();
			if(img1!=""){
				$("#bzwClImg2")[0].src = img1;
				$("#myText").text("已上传");
			}
			if(img2!=""){
				$("#bzwClImg1")[0].src = img2;
			}
			if(img1!=""){
				if(img2!=""){
					$("#bzwsqUpload")[0].style.display="none";
				}
				$("#bzwsqDelete")[0].style.display="";
			}
		}
		/* 不作为材料回执书 */
		if($("#archiveName1").val()!=""){
			$("#archiveName1").attr("disabled","true");
		}
		if($("#bzwhzimg1")[0] && $("#bzwhzimg2")[0] && $("#bzwhzClImg2")[0] && $("#myText1")[0] && $("#bzwhzClImg1")[0] && $("#bzwhzUpload")[0] && $("#bzwhzDelete")[0])
		{
			var img1 = $("#bzwhzimg1").val();
			var img2 = $("#bzwhzimg2").val();
			if(img1!=""){
				$("#bzwhzClImg2")[0].src = img1;
				$("#myText1").text("已上传");
			}
			if(img2!=""){
				$("#bzwhzClImg1")[0].src = img2;
			}
			if(img1!=""){
				if(img2!=""){
					$("#bzwhzUpload")[0].style.display="none";
				}
				$("#bzwhzDelete")[0].style.display="";
			}
		}
	});
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
		    			var node2 = "<tr><td colspan='4' class='sccl-img'><a href='javascript:void(0)' onclick='pop1Div(this,event)'><img id='sccl-add2' src='../pages/zxfy/img/pic_add.jpg'></img></a></td></tr>";
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
    function pop1Div(t,ev){
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
    	$("#pop1").css({
    		"display":"block",
    		"top":(popTop-$("#sss").offset().top-150)+"px",
    		"left":(popLeft-$("#sss").offset().left+30)+"px"
    	});
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
    /* 前台预览图片 */
    function imgPreview(obj,img){
			/* IE浏览器前台预览图片 */
		if($.browser.msie){
			obj.select();
			top.parent.document.body.focus();
			var str = document.selection.createRange().text;
			document.selection.empty();
			$(img).parent().attr("style","filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);");
			$(img).parent()[0].filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = str;
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
    /* 删除材料 */
    function xzclDelete(obj){
    	var name = $(obj).parents("tr").find("td").eq(0).text();
    	$("#xzName").val(name);
    	if(confirm("确认删除？")){
    		window.xzclAllForm.action="../zxbz/xzclDelete.action?funcCode=${funcCode}";
       	 	window.xzclAllForm.submit();
    		return true;
    	}
    }
    /*------------------------------行政不作为案件申请材料---------------------------*/
    /* 弹出上传文件框 */
    function popDiv(name,ev){
    	var name = $("#"+name).val();
    	if(name!=""){
    		$("#bzwName").val(name);
	    	/* 控制上传按钮 样式 */
			if($.browser.msie){
				$("#bzwclFile")[0].style.display="none";
				$("#bzwclDiv")[0].style.display="";
			}
			else{
				/* 自定义按钮调用默认上传按钮  */
			    $("#bzwclFile").click(function(){
			    	$("#realFile").click();
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
	    	$("#pop2").css({
	    		"display":"block",
	    		"top":(popTop-$("#sss1").offset().top-150)+"px",
	    		"left":(popLeft-$("#sss1").offset().left+30)+"px"
	    	});
    	}
    	else{
    		alert("材料名称不能为空!");
    	}
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
    /* 关闭上传文件框  */
    $("#close2").click(function(){
        $("#pop2").css("display","none");
        var file = $("#realFile")[0];
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
     /* 上传材料form表单提交 */
    $("#confirm2").click(function(){
    	var file=$("#realFile").val();
    	/* 调用文件验证方法 */
    	if(fileCheck(file)==false){
    		return false;
    	}
    	/* 提交表单 */
        window.bzwclForm.action="../zxbz/bzwArchiveSave.action?funcCode=${funcCode}";
        window.bzwclForm.submit();
    });
    /* 删除行政不作为申请材料  */
    function bzwqsDete(){
    	if(confirm("确认删除？")){
    		window.bzwclDeleteForm.action="../zxbz/bzwArchiveDelete.action?funcCode=${funcCode}";
        	window.bzwclDeleteForm.submit();
        	return true;
    	}
    }
    /*--------------------------行政不作为材料回执书---------------------------------*/
    /* 弹出上传文件框 */
    function popDiv1(name,ev){
    	var name = $("#"+name).val();
    	if(name!=""){
    		$("#bzwhzName").val(name);
	    	/* 控制上传按钮 样式 */
			if($.browser.msie){
				$("#bzwhzclFile")[0].style.display="none";
				$("#bzwhzclDiv")[0].style.display="";
			}
			else{
				/* 自定义按钮调用默认上传按钮  */
			    $("#bzwhzclFile").click(function(){
			    	$("#realFile1").click();
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
	    	$("#pop3").css({
	    		"display":"block",
	    		"top":(popTop-$("#sss2").offset().top-150)+"px",
	    		"left":(popLeft-$("#sss2").offset().left+30)+"px"
	    	});
    	}
    	else{
    		alert("材料名称不能为空!");
    	}
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
        var file = $("#realFile1")[0];
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
    	var file=$("#realFile1").val();
    	/* 调用文件验证方法 */
    	if(fileCheck(file)==false){
    		return false;
    	}
    	/* 提交表单 */
        window.bzwhzclForm.action="../zxbz/bzwhzArchiveSave.action?funcCode=${funcCode}";
        window.bzwhzclForm.submit();
    });
    /* 删除行政不作为申请材料  */
    function bzwhzDete(){
    	if(confirm("确认删除？")){
    		window.bzwhzclDeleteForm.action="../zxbz/bzwhzArchiveDlete.action?funcCode=${funcCode}";
        	window.bzwhzclDeleteForm.submit();
        	return true;
    	}
    }
    /*-------------------------------翻页--------------------------------------*/
    function login(){
    	window.location.href="../zxbz/zxbzListAction.action?funcCode=${funcCode}";
    }
    function sfzmPage(){
    	window.location.href="../zxbz/sfclPage.action?funcCode=${funcCode}&caseNum=${caseNum}";
    }
    function otherPage(){
    	var $div = $("#sss");
    	if($div.length>0){
			var $tr = $div.find("tbody").find("tr");
			if($tr.length==0){
				alert("请上传行政作为材料！");
				return;
			}
			if($tr.length==2){
				var imgLen = $tr.eq(1).find("img").length;
				if(imgLen==1){
					alert("请为行政作为材料上传一个文件！");
					return;
				}
			}
		}
		var $imgPath1 = $("#bzwsqimg1");
		if($imgPath1.length>0){
			if($imgPath1.val()==""){
				alert("请补正行政不作为申请书材料!");
				return;
			}
		}
		var $bzwhz = $("#bzwhzimg1");
		if($bzwhz.length>0){
			if($bzwhz.val()==""){
				alert("请补正行政不作为申请书！");
				return;
			}
		}
    	window.location.href="../zxbz/otherclPage.action?funcCode=${funcCode}&caseNum=${caseNum}";
    }
    function mainPage(){
    	var $div = $("#sss");
    	if($div.length>0){
			var $tr = $div.find("tbody").find("tr");
			if($tr.length==0){
				alert("请上传行政作为材料！");
				return;
			}
			if($tr.length==2){
				var imgLen = $tr.eq(1).find("img").length;
				if(imgLen==1){
					alert("请为行政作为材料上传一个文件！");
					return;
				}
			}
		}
		var $imgPath1 = $("#bzwsqimg1");
		if($imgPath1.length>0){
			if($imgPath1.val()==""){
				alert("请补正行政不作为申请书材料!");
				return;
			}
		}
		var $bzwhz = $("#bzwhzimg1");
		if($bzwhz.length>0){
			if($bzwhz.val()==""){
				alert("请补正行政不作为申请书！");
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