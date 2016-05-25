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
		<a class="xzfy-hd-r fhsy fn-right" href="index.html"></a>
   		<div class="xzfy-hd-bg fn-left"></div>
	</div>
	<div class="xzfy6">
		<div class="xzfy6-border">
			<div class="xzfy6-bg sccl-bg">
				<div class="xzfy6-t">其他材料<span>上传</span></div>
        		<div class="xzfy6-p">（温馨提示：例如：不服《行政处罚决定书》、《政府信息公开告知书》，请将该文书扫描或拍成照片上传（JPG格式）。如果材料为多页，您可以扫描或拍摄<span>10张以内jpg</span>格式文件上传）</div>
        		<div class="sccl-add">
                    <label class="fn-left">材料名称：</label>
                    <input class="fn-left" type="text" id="otherName" placeholder="请输入材料名称">
                    <label class="fn-left">文号：</label>
                    <input class="fn-left" type="text" id="otherWh" placeholder="请输入材料文号">
                    <a class="btn-add add-cl fn-left" href="javascript:addcl2()" title="点击添加材料">添加材料</a>
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
                        	<#if otherName?exists>
                        		<#assign m = 0 />
                        		<#list otherName as otclName>
                        			<tr>
                						<td>${otclName}</td>
                						<#list otherArchiveModels as archive>
                							<#if otclName==archive.clName>
                								<td>${(archive.other)?default("")}</td>
                								<#break>
                							</#if>
                						</#list>
                						<td class="co-green">已上传&nbsp;<a class="btn-delete" href="javascript:void(0)" onclick="clDelete(this)">删除</a></td>
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
		                        					<img class="tooltip" title="单击图片删除" src="${archive.fileRelativePath}" onclick="imgRemove1(${archive.id})"></img>
		                        				</#if>
		                        			</#list>
		                        			<a href='javascript:void(0)' onclick='pop3Div(this,event)'>
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
                    <form name="otherDeleteForm" action="" method="post">
                    	<div style="display:none">
                    		<input name="caseNum" value="${caseNum}"></input>
                    		<input id="otherImgId" name="otherImgId" value=""></input>
                    	</div>
                    </form>
                    <form name="clDeleteForm" action="" method="post">
                    	<div style="display:none">
                    		<input name="caseNum" value="${caseNum}"></input>
                    		<input id="clmc" name="clmc" value=""></input>
                    	</div>
                    </form>
            	</div>
			</div>
		</div>
		<table class="table">
			<tr>
				<td>
					<#if buzhengContentType?seq_contains("3")>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:xzclPage()" title="点击进入上一步：行政材料补正页面">上一步</a> 
						</div>
					<#elseif buzhengContentType?seq_contains("1") || buzhengContentType?seq_contains("2")>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:sfzmPage()" title="点击进入上一步：身份证明页面">上一步</a> 
						</div>
					<#else>
						<div class="xzfy-next">
							<a class="next-btn" href="javascript:login()" title="点击进入上一步：登陆补正页面">上一步</a> 
						</div>
					</#if>
				</td>
				<td>
					<div class="xzfy-next">
						<a class="next-btn" href="javascript:mainPage()" title="点击进入下一步：补正完成">完成</a> 
					</div>
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
		var $tr = $("#otherForm").parent().find("tbody").children("tr");
		for(var i=0;i<$tr.length;i=i+2){
			var imgNum = $tr.eq(i).find("td").eq(3).text();
			if(imgNum>=10){	
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
		    			var node1 = "<tr><td>"+nameOfCl+"</td><td>"+numberOfCl+"</td><td class='co-green'>未上传</td><td class='text-r'>0</td></tr>";
		    			var node2 = "<tr><td colspan='4' class='sccl-img'><a href='javascript:void(0)' onclick='pop3Div(this,event)'><img id='sccl-add2' src='../pages/zxfy/img/pic_add.jpg'></img></a></td></tr>";
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
    function pop3Div(t,ev){
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
    		"top":(popTop-$("#sss").offset().top-150)+"px",
    		"left":(popLeft-$("#sss").offset().left+30)+"px"
    	});
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
     /* 删除材料中的某一图片   */
    function imgRemove1(id){
    	$("#otherImgId").val(id);
    	if(confirm("确认删除？")){
    		window.otherDeleteForm.action="../zxbz/otherImgDelete.action?funcCode=${funcCode}";
       	 	window.otherDeleteForm.submit();
    		return true;
    	}
    }
    /* 材料删除 */
    function clDelete(obj){
    console.info(obj);
    	var clname = $(obj).parents("tr").find("td").eq(0).text();
    	console.info(clname);
    	$("#clmc").val(clname);
    	if(confirm("确认删除？")){
    		window.clDeleteForm.action="../zxbz/otherClDelete.action?funcCode=${funcCode}";
       	 	window.clDeleteForm.submit();
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
    function xzclPage(){
    	window.location.href="../zxbz/xzclPage.action?funcCode=${funcCode}&caseNum=${caseNum}";
    }
    function mainPage(){
    	var $div = $("#sss");
		var $tr = $div.find("tbody").find("tr");
		if($tr.length==0){
			alert("请上传其它材料！");
			return;
		}
		if($tr.length==2){
			var imgLen = $tr.eq(1).find("img").length;
			if(imgLen==1){
				alert("请为其它材料上传一个文件！");
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