<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <title>法制办</title>
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
</head>
<body>

<div class="xzfy mh-700" id="bodyDiv">
    <div class="xzfy-hd fn-clear">
        <a class="xzfy-hd-r fhsy fn-right" href="javascript:gotoIndexPage()"></a>
        <div class="xzfy-hd-bg fn-left"></div>
    </div>
    <ul class="xzfy-nav fn-clear">
        <li><p>申请人信息</p><span>1</span></li>
        <li><p>选择代理人</p><span>2</span></li>
        <li><p>被申请人信息</p><span>3</span></li>
        <li><p>填写复议请求</p><span>4</span></li>
        <li><p>填写事实及理由</p><span>5</span></li>
        <li class="xzfy-nav-on"><p>上传证据及依据</p><span>6</span></li>
    </ul>
    <div class="xzfy6">
        <div class="xzfy6-border">
            <div class="xzfy6-bg sczj-bg">
                <div class="xzfy6-t">申请人证件（复印件）<span>上传</span></div>
                <div class="xzfy6-p">（温馨提示：您填写的申请人数量为<span>${renCount}</span>，请上传该人数的有效证件。上传图片格式：<span>JPG</span>。证件尺寸为：<span>A4</span>大小<span>300KB</span>）</div>
                <#if otherValue != "0"><div class="xzfy6-p"><span>文件大于300KB,上传失败.</span></div></#if>
                <div class="xzfy-table">
                    <table class="table">
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 15%;" />
                            <col style="width: 20%;" />
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
                        <#list appS as app>
	                        <tr>
	                            <td>${app_index + 1}</td>
	                            <td>${app.appName?default('姓名')}</td>
	                            <td>
	                            	<#if app.sfzmType?has_content>
										<select class="select" name="clType" id=${'sfType' + app_index}>
										  	<option value=${app.sfzmType} selected="selected">
										  	<#if app.sfzmType == "1">身份证</#if>
										  	<#if app.sfzmType == "2">现役军人证件</#if>
										  	<#if app.sfzmType == "3">护照</#if>
										  	</option>
										</select>
									<#else>
	                            	<select class="select" name="clType" id=${'sfType' + app_index}>
									  	<option value="1" selected="selected">身份证</option>
									  	<option value="2">现役军人证件</option>
									  	<option value="3">护照</option>
									</select>
									</#if>
	                            </td>
	                            <td>
		                            <#assign count = 0>
			                        <#list archiveList as arch>
			                        	<#if arch.uploadUserId == app.id+"">
											<#assign count = count +1>
										</#if>
			                        </#list>
		                            
		                            <#if (count < 2)>
			                            <a class="btn-modify" href="javascript:pickFile(${app_index}, ${app.id})">上传</a>
			                        </#if>
			                        <#if (count > 0)>
			                           <a class="btn-delete" href="javascript:deleteAll(${app.id})">删除</a>
			                        </#if>
	                            </td>
	                            <td class="co-green">
	                            <#if (count > 0)>
	                            	已上传
	                            <#else>
	                            	未上传
	                            </#if>
	                            </td>
	                            <td class="text-r table-img">
		                            <#assign count =0>
									<#list archiveList as arch>
										<#if arch.uploadUserId == app.id+"">
											<#assign count = count +1>
											<a href="javascript:deleteSfzm(${app.id}, ${arch.id})"><img src="../${arch.fileRelativePath}/${arch.fileAnotherName}" class="tooltip" title="单击图片删除" /></a> 
										</#if>
									</#list>
									<#if count lt 2>
											<img src="../pages/zxfy/img/pic_thumbnails.jpg">
									</#if>
	                            </td>
	                        </tr>
						</#list>
                        </tbody>
                    </table>


                     <table class="table">
							<tr>
								<td>
									<div class="xzfy-next"><a class="next-btn" href="javascript:back()" title="点击返回上一步：">上一步</a> </div>
						     	</td>
						     	<td>
						     		<div class="xzfy-next"><a class="next-btn" href="javascript:xiaYiBu()" title="点击进入下一步：">下一步</a> </div>
						     	</td>
							</tr>
					</table>
                </div>
            </div>
        </div>
    </div>
    
</div>
<div class="xzfy1-form-bg" id="popBg">
    <div class="xzfy-pop" id="pop">
		<form name="sqrSfzmForm" action=""  method="post" enctype="multipart/form-data" >
			<@ww.hidden name="'infoId'" />
			<@ww.hidden name="'funcCode'" />
			<@ww.hidden name="'caseIndex'" />
			<input type="hidden" id="appID" name="sqrID" />
			<input type="hidden" id="sfzmType" name="clType" />
	        <div class="pop-t">
	        	<a class="btn-close1 fn-right" id="close" href="javascript:pickFileClose()">X</a>
				<a class="btn-modify" id="selectBut" href="javascript:runPickFile()">选择文件上传</a>
				
				<div id="ieShowDiv" style="display:none">
	            	<a style="position:relative;display:block;width:65px;height:25px;background:#4973be;border:1px solid #999;text-align:center;" href="javascript:void(0)">上传文件
				        <input type="file" style="position:absolute;left:0;top:0;width:100%;height:100%;z-index:999;filter:alpha(opacity=0);" name="caiLiao" id="caiLiao" onchange="imgCheck(this)" />
	            	</a>
	        	</div>
			</div>
	        <div class="pop-c"><div class="pop-img" id="preview"></div></div>
	        <div class="pop-f"><a class="btn-confirm" id="confirm" href="javascript:upload()">确定</a></div>
	    </form>
	</div>
</div>



<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
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

	<#-- 鼠标移至图片上显示的div提示的效果 -->
	$(function(){
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
	
	
	function gotoIndexPage()
	{
		if(confirm("你确定要返回首页吗？你可以在三天内通过提供“案件代码”在“在线申请-继续填写”来完成复议申请的填写。"))  
	    {
	    	window.location.href="../zxfy/mainPage.action?funcCode=${funcCode}";
	    }
	}

	<#-- 显示上传材料 -->
    function pickFile(index, appID)
	{
//		$("#preview").html("");
//		$("#caiLiao").val('');
		$("#appID").val(appID);
		var sfType = "sfType" + index
		$("#sfzmType").val($("#" + sfType).val());
		
		if($.browser.msie){
    		$("#selectBut").css("display","none");
			$("#ieShowDiv").css("display","block");
    	}
		
		$("#pop").css("display","block");
		$("#popBg").css("display","block");
		
	}
	
	<#-- 隐藏上传材料 -->
	function pickFileClose()
	{
		$("#popBg").css("display","none");
		
        var file = $("#caiLiao")[0];
        /* 清空上传文件域  */
        file.outerHTML = file.outerHTML;
        /* 清除预览图片  */
        $("#pop").find("div#preview").empty();
        if(typeof FileReader=="undefined"){
    			/* 清除IE浏览器前台预览图片 */
			if($.browser.msie==true){
				$("#pop").find("div#preview").attr("style","");
			}
		}
	}
	
	<#-- 选择材料 -->
	function runPickFile()
	{
		$("#caiLiao").click();
	}
	
	<#-- 本地图片预览 -->
	function preview1(file)
	{
		var fileName= file.value;
    	var strTemp = fileName.split(".");
    	var strCheck = strTemp[strTemp.length-1];
    	if(strCheck.toUpperCase()!="JPG"){
//    		$(obj).parents("div#pop").find("div#imgDiv").empty();
//    		obj.outerHTML = obj.outerHTML;
    		alert("上传的文件仅支持JPG格式！");
    		return;
    	}
		
		if (file.files && file.files[0])
		{
			var reader = new FileReader();
			reader.onload = function(evt){
				$("#preview").html('<img src="' + evt.target.result + '" />');
			}
			reader.readAsDataURL(file.files[0]);
		}
		else  
		{
		
			file.select();
            top.parent.document.body.focus();
            var src = document.selection.createRange().text;
            document.selection.empty();
			
			$("#preview").attr("style","filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);");
			$("#preview").get(0).filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src;
			
	//		$("#preview").html('<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>');
		}
	}
	
	<#-- 删除材料 -->
	function deleteAll(sqrID)
	{
		if(confirm("你确定要删除这个人的身份证明材料吗？"))  
	    {
			window.location.href="../zxsq/runSqrSfzmDelAll.action?sqrID=" + sqrID + "&funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
		}
	}
	
	<#-- 删除单份材料 -->
	function deleteSfzm(sqrID, clID)
	{
		if(confirm("你确定要删除这张证明材料吗？"))  
	    {
			window.location.href="../zxsq/runSqrSfzmDel.action?sqrID=" + sqrID + "&clID="+ clID +"&funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
		}
	}
	
	<#-- 上传图片 -->
	function upload()
	{
		var file=$("#caiLiao").val();
    	/* 调用文件验证方法 */
    	if(fileCheck(file)==false){
    		return;
    	}
		
//		if($("#preview").html() == null || $("#preview").html() == undefined || $("#preview").html() == '' || $("#caiLiao").val() == null || $("#caiLiao").val() == undefined || $("#caiLiao").val() == '' )
//		{
//			return;
//		}


		window.sqrSfzmForm.action="../zxsq/runUploadSqrSfzmSave.action";
		window.sqrSfzmForm.submit();
	}
    
    function back()
    {
    	window.location.href="../zxsq/sslySave.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
    }
    
	
	<#-- 下一步 -->
	function xiaYiBu(){
		// 在进行下一步之前判断材料是否有按规定上传
		var temp_date = "error";
		url = "../zxsq/checkSqrSfzmNext.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
				
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
			alert("请完善材料的上传");
			return;
		}
		
		window.location.href="../zxsq/sqrSfzmNext.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId?default('')}";
	}
	
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
    		$(obj).parents("div#pop").find("div#preview").empty();
    		obj.outerHTML = obj.outerHTML;
    		alert("上传的文件仅支持JPG格式！");
    		return false;
    	}else{
    		
    		var $imgDiv = $(obj).parents("div#pop").find("div#preview");
    		var $img = $imgDiv.find("img");
    		if($img.length==0){
    			$imgDiv.append("<img></img>");
    			var $img = $imgDiv.find("img");
    		}
    		imgPreview(obj,$img[0]);
    	}
    }
    
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

</script>
</body>
</html>