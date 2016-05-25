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
    		<div class="xzfy6-bg sccl-bg">
    			<div class="xzfy6-t">如您有其它证据材料需要提交，请依次<span>上传</span></div>
    			<#if otherValue != "0"><div class="xzfy6-p"><span>文件大于300KB,上传失败.</span></div></#if>
                <div class="xzfy6-p">（温馨提示：（请填写证据材料名称，并上传证据材料的JPG格式照片或者扫描件，最多上传<span>30张</span>证据材料，不限份数，每张材料大小<span>300k以内的jpg</span>格式文件）</div>
               
               <#if (clSize < 30)> 
                <div id="add1">
                	<a class="btn-add add-cl " href="javascript:add1()" title="点击添加材料">添加一份新材料</a>
                	<br /><br />
                </div>
                
                <div class="sccl-add" id="add2" style="display:none" >
                    <label class="fn-left">材料名称：</label>
                    <input class="fn-left" type="text" id="clName" maxlength="50" placeholder="请输入材料名称">
                    <label class="fn-left">文号：</label>
                    <input class="fn-left" type="text" id="clNum" maxlength="50" placeholder="请输入材料文号">
                    <a class="btn-add add-cl fn-left" href="javascript:add()" title="点击添加材料">添加材料</a>
                </div>
                </#if>
                
                
				<#list archiveList as listArch>
                
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
                        <tr>
                        <#assign count = 0>
                        <#list listArch as arch>
							<#assign count = count +1>
							<#if count == 1>
                            <td>${arch.clName?default('')}</td>
                            <td>${arch.other?default('')}</td>
                            </#if>
                        </#list>
                            <td class="co-green">已上传</td>
                            <td class="text-r">${count}张</td>
                        </tr>
                        <tr>
                            <td colspan="4"  class="sccl-img">
										<#list listArch as arch>
											<a href="javascript:deleteDlsx('${arch.id}')"><img src="../${arch.fileRelativePath}/${arch.fileAnotherName}" class="tooltip" title="单击删除" /></a>
										</#list>
										<#if (clSize < 30)> 
											<#list listArch as arch>
												<a href="javascript:pickFile('${arch.clName}', 
												<#if arch.other?has_content>
												'${arch.other}'
												<#else>
												'-'
												</#if>)"><img id="sccl-add2" src="../pages/zxfy/img/pic_add.jpg" class="tooltip" title="单击添加一张材料"></a>
												<#break>
											</#list>
										</#if>
										
									
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                </#list>
            
    		</div>
                <table class="table">	
					<tr>
						<td>
							<div class="xzfy-next"><a class="next-btn" href="javascript:back()" title="点击返回上一步：">上一步</a> </div>
				     	</td>
				     	<td>
				     		<div class="xzfy-next"><a class="next-btn" href="javascript:xiaYiBu()" title="点击进入下一步：">提交申请</a> </div>
				     	</td>
					</tr>
				</table>
    	</div>	
    		
    		
                
    	
    	
    	
    </div>
</div>


<div class="xzfy1-form-bg" id="popBg">
	<form name="otherClForm" action=""  method="post" enctype="multipart/form-data" >
        <div class="xzfy-pop" id="pop">
			<@ww.hidden name="'infoId'" />
			<@ww.hidden name="'funcCode'" />
			<@ww.hidden name="'caseIndex'" />
			<input type="hidden" id="clName1" name="clName" />
			<input type="hidden" id="clNum1" name="clNum" />
            
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
        </div>
	</form>
</div>   
</body>
</html>
<script type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
<script>
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
	
	
	function add1()
	{
		$("#add1").css("display","none");
		$("#add2").css("display","block");
	}

	function pickFile(clName, clNum)
	{
		$("#clName1").val(clName);
		$("#clNum1").val(clNum);
		
		$("#preview").html("");
		
		if($.browser.msie){
    		$("#selectBut").css("display","none");
			$("#ieShowDiv").css("display","block");
    	}
		$("#pop").css("display","block");
		$("#popBg").css("display","block");
	}
	
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
	
	function runPickFile()
	{
		$("#caiLiao").click();
	}
	
	
	
	
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
		}
	}
	
	function add()
	{
		// 异步校验一下 材料名 是否已有  上传的数量
		
		var nameStr = $("#clName").val();
		var numStr = $("#clNum").val();
		if(nameStr == null || nameStr == undefined || nameStr == "")
		{
			alert("请输入  材料名称");
			return;
		}
		if(numStr == null || numStr == undefined || numStr == "")
		{
			numStr = "-";
		}
		
		pickFile(nameStr, numStr);
	}
	
	function deleteDlsx(clID)
	{
		if(confirm("你确定要删除这张证明材料吗？"))  
	    {
			window.location.href="../zxsq/runQtclDel.action?clID="+ clID +"&funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
		}
	}
	
	function upload()
	{
		var file=$("#caiLiao").val();
    	/* 调用文件验证方法 */
    	if(fileCheck(file)==false){
    		return;
    	}
    	
		window.otherClForm.action="../zxsq/runOtherSave.action";
		window.otherClForm.submit();
	}
	
	<#-- 上一步  -->
	function back(){

	}
	
	<#-- 下一步 -->	
	function xiaYiBu(){
		if(confirm("你确定提交申请吗? 提交之后将不能进行修改"))
		{
			window.location.href="../zxsq/tiJiaoShenQing.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
		}
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
    
    
	
	function gotoIndexPage()
	{
		if(confirm("你确定要返回首页吗？你可以在三天内通过提供“案件代码”在“在线申请-继续填写”来完成复议申请的填写。"))  
	    {
	    	window.location.href="../zxfy/mainPage.action?funcCode=${funcCode}";
	    }
	}
	
	function back()
    {
    	window.location.href="../zxsq/runDlsxNext.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
    }
</script>