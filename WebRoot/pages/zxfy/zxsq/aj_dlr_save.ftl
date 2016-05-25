<!DOCTYPE html>
<!--********************************************************* -->
<!--* 文件创建日期：2014-12-04                                 * -->
<!--* 文件修改日期：2014                                      * -->
<!--* 功能描述：法制办                                        * -->
<!--* 文件修改日期：2014-12-04		                          *-->
<!--********************************************************* -->
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
        <li  class="xzfy-nav-on"><p>选择代理人</p><span>2</span></li>
        <li><p>被申请人信息</p><span>3</span></li>
        <li><p>填写复议请求</p><span>4</span></li>
        <li><p>填写事实及理由</p><span>5</span></li>
        <li><p>上传证据及依据</p><span>6</span></li>
    </ul>
    <div class="xzfy6">
        
            <div class="xzfy6-bg ">
            <p class="xzfy0-p"> 没有代理人则不需要填以下信息写，请直接跳过此步 </p> 
            	<div class="xzfy-table">
           			<form name="dlrForm" action="../zxsq/runDlrSave.action"  method="post" enctype="multipart/form-data" >
					<@ww.hidden name="'infoId'" />
					<@ww.hidden name="'funcCode'" />
					<@ww.hidden name="'caseIndex'" />
                    <table class="table">
                        <colgroup>
                            
                            <col style="width: 30%;" />
                            <col style="width: 65%;" />
                        </colgroup>
                        
                        <tbody>
                        <tr >
							<td >
								 <label class="fn-right">代理人姓名：</label>
							</td>
							<td>
								 <input class="bd-i wd-150 pd-4" type="text" id="dlrName" name="app.appName" value="${app.appName?default('')}" placeholder="请输入代理人姓名" maxlength="10" onkeyup="value=value.replace(/[^\a-zA-Z\u4E00-\u9FA5]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\a-zA-Z\u4E00-\u9FA5]/g,''))" />
							</td>
						</tr> 
				        <tr>
				        	<td>
								<label class="fn-right">代理人电话：</label>
							</td>
							<td>
								<input class="bd-i wd-150 pd-4" type="text" id="dlrMobile" name="app.telephone" value="${app.telephone?default('')}" placeholder="请输入代理人手机号码" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
							</td>
					     </tr>
                        </tbody>
                    </table>
                	</form>
                    <table class="table">	
						<tr>
							<td>
								<div class="xzfy-next"><a class="next-btn" href="javascript:back()" title="点击返回上一步：填写申请人信息">上一步</a> </div>
					     	</td>
					     	<td>
					     		<div class="xzfy-next"><a class="next-btn" href="javascript:xiaYiBu()" title="点击进入下一步：">下一步</a> </div>
					     	</td>
						</tr>
					</table>
            </div>
        </div>
</div>

<script type="text/javascript" src="../pages/zxfy/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

    $(".btn-modify").click(function(){
        $("#pop").css("display","block");
    });
    $("#close").click(function(){
        $("#pop").css("display","none");
    });
    $("#confirm").click(function(){
        $("#pop").css("display","none");
    });

    $("#sccl-add2").click(function(){
        $("#pop1").css("display","block");
    });
    $("#close1").click(function(){
        $("#pop1").css("display","none");
    });
    $("#confirm1").click(function(){
        $("#pop1").css("display","none");
    });
    
    function back()
    {
    	window.location.href="../zxsq/sqrList.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
	   	window.getElementById('nextBtn').disabled=true;
    }
    
    function xiaYiBu(){
    	var strName = $("#dlrName").val();
    	var strMobile = $("#dlrMobile").val()
    	if((strName !== null && strName !== undefined && strName !== '') && (strMobile == null || strMobile == undefined || strMobile == ''))
    	{
    			alert(" 如果 有代理人    请填写 代理人手机号码,\r\n 若没有, 则请勿单独填写 姓名 ");
    			return ;
    	}else if((strMobile !== null && strMobile !== undefined && strMobile !== '') && (strName == null || strName == undefined || strName == ''))
    	{
    		alert(" 如果有代理人   请填写 代理人姓名,\r\n 若没有, 则请勿单独填写 手机号码");
    		return ;
    	}else
		{
			window.dlrForm.submit();
			window.getElementById('nextBtn').disabled=true;
		}
		
	}
	
	
	function gotoIndexPage()
	{
		if(confirm("你确定要返回首页吗？你可以在三天内通过提供“案件代码”在“在线申请-继续填写”来完成复议申请的填写。"))  
	    {
	    	window.location.href="../zxfy/mainPage.action?funcCode=${funcCode}";
	    }
	}

</script>
</body>
</html>










<#--

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <title>法制办</title>
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
</head>
<body>

    <div class="xzfy mh-700 pos-rel">
        <div class="xzfy-hd fn-clear">
            <a class="xzfy-hd-r fhsy fn-right" href="javascript:gotoIndexPage()"></a>
            <div class="xzfy-hd-bg fn-left"></div>
        </div>
        <ul class="xzfy-nav fn-clear">
            <li><p>申请人信息</p><span>1</span></li>
            <li class="xzfy-nav-on"><p>选择代理人</p><span>2</span></li>
            <li><p>被申请人信息</p><span>3</span></li>
            <li><p>填写复议请求</p><span>4</span></li>
            <li><p>填写事实及理由</p><span>5</span></li>
            <li><p>上传证据及依据</p><span>6</span></li>
        </ul>



	<p class="xzfy0-p"> 没有代理人则不需要填以下信息写，请直接跳过此步 </p>
	

<form name="dlrForm" action="../zxsq/runDlrSave.action?funcCode=${funcCode}"  method="post" enctype="multipart/form-data" >
<@ww.hidden name="'infoId'" />
	 <div class="xzfy-table">
            <table class="table">
             <colgroup>
                    <col style="width: 30%;" />
                    <col style="width: 40%;" />
                </colgroup>
            	<tbody>
		<tr >
			<td >
				 <label class="fn-right">代理人姓名：</label>
			</td>
			<td>
				<@ww.textfield name="'app.appName'" cssClass="fn-left"  />
			</td>
		</tr> 
        <tr>
        	<td>
				<label class="fn-right">代理人电话：</label>
			</td>
			<td>
				<@ww.textfield name="'app.mobile'" cssClass="fn-left"  />
			</td>
	     </tr>
	     <tr>
	     	<td>
	     		<div class="xzfy-next">
	     			<input type="button" class="next-btn" name="backBtn" value="上一步" onClick="history.back()" />
	     		</div>
	     	</td>
	     	<td>
	     		<div class="xzfy-next">
	     			<input type="submit" class="next-btn" name="nextBtn" value="下一步" />
	     		</div>
	     	</td>
	     </tr>
	     </tbody>
     </table>
     
   </div>
	
</form>
</body>
</html>
-->