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
            <li><p>选择代理人</p><span>2</span></li>
            <li class="xzfy-nav-on"><p>被申请人信息</p><span>3</span></li>
            <li><p>填写复议请求</p><span>4</span></li>
            <li><p>填写事实及理由</p><span>5</span></li>
            <li><p>上传证据及依据</p><span>6</span></li>
        </ul>
        
		<div class="xzfy6">
				<div class="xzfy6-bg ">
					<div class="xzfy1-btn fn-clear"><p class="zxfy1-btn-p fn-left">被申请人资料填写</p></div>    
					<form name="bsqrForm" action="" method="post" enctype="multipart/form-data">
						<@ww.hidden name="'infoId'" />
						<@ww.hidden name="'funcCode'" />
						<@ww.hidden name="'caseIndex'" />
	                <div class="xzfy-table">
	                    <table class="table">
		                    	<colgroup>
						            <col style="width: 30%;" />
									<col style="width: 50%;" />
						        </colgroup>
							<tbody>
								<tr>
									<td class="text-r"><font color="red">*</font>被申请人种类：</td>
						   			<td >
						  				<select class="select" name="infoModel.defendantType" id="beapptype" onchange="aaa()">
							    				<option value="0">--请选择--</option>
											<#list zlList as zl>
												<option value="${zl.value}" >${zl.name}</option>
							    			</#list>
										</select>      
						    		</td>
					    		</tr>
					    		<tr>
						     		<td class="text-r"><font color="red">*</font>被申请人名称：</td>
						     		<td  style="display:none;" id="beappnametd">   
						     			<input name="ssss" type="text" class="input2" id="beappnameinput" altname="被申请人名称">
						    		</td> 
						    		<td  style="display:block;" id="beappnamesel">  
						    			<select class="select" name="infoModel.defendantName" ischeck="y" id="beappname" onchange="beappcode()" altname="被申请人名称" class="selectStyleNormal">
						      				<option value="0" deptcode="0">----请选择----</option>     	 
						    			</select>
						    		</td>
						    
						    		<td  style="display:none;" id="beappnametd">
						   				<input name="sss" type="text" class="input2" id="beappname2" >
						    		</td>
						    	</tr>
								<tr>
									<td colspan="2">
										<p class="xzfy0-p">如果您的被申请人不在以上类别当中，请向市政府行政复议接待室咨询，咨询电话：65191000</p>
									</td>
								</tr>
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
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<script type="text/javascript" src="../pages/zxfy/js/jquery-1.10.2.min.js"></script>
<script>
	
	
	
	
	subcat = new Array();
	var count=0;
	
	<#list bList as dl>	
	       subcat[${dl_index}]=new Array("${dl.type}","${dl.name}","${dl.value}"); 
	       count++;    
	</#list>
	
	function aaa() {
		var aaa = document.getElementById('beapptype').value;
		if(aaa==8){
			document.getElementById("beappnameinput").setAttribute("ischeck","y");
			document.getElementById("beappnametd").style.display="block";
			document.getElementById("beappnamesel").style.display="none";
			document.getElementById("beappnameinput").name="infoModel.defendantName";
			document.getElementById("beappname").name="ssss";
			document.getElementById("beappname").removeAttribute("ischeck");
		} else {
			document.getElementById("beappname").setAttribute("ischeck","y");
		    document.getElementById("beappnamesel").style.display="block";
			document.getElementById("beappnametd").style.display="none";
			document.getElementById("beappname").name="infoModel.defendantName";
			document.getElementById("beappnameinput").name="ssss";
			document.getElementById("beappnameinput").removeAttribute("ischeck");
			document.getElementById('beappname').length = 0; 
			document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
	       var x;
	        for (x=0; x < count; x++)
	        {
	            if (subcat[x][0] == aaa)
				{
					var tempOption=new Option(subcat[x][1], subcat[x][1]);
	               	   tempOption.deptcode=subcat[x][2];
	                   document.getElementById('beappname').options[document.getElementById('beappname').length] = tempOption;
	            } 
	        }
		}
	}
	
	function beappcode(){
		var code=document.getElementById('beappname').options[document.getElementById('beappname').selectedIndex].deptcode;	
		//alert(document.getElementById('beappname').value)
		if(document.getElementById('beappname').value!=''){
		//var code=document.getElementById('beappname').deptcode;
//		document.getElementById('beappnametd').value=code;
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
    	window.location.href="../zxsq/zylxrSave.action?funcCode=${funcCode}&caseIndex=${caseIndex}&infoId=${infoId}";
	   	window.getElementById('nextBtn').disabled=true;
    }
    
	
	function xiaYiBu()
	{
		var str = $("#beapptype").val();
		if(str == "0")
		{
			alert("请选择被申请人种类");
			return;
		}
		str = $("#beappname").val();
		if(str == "0")
		{
			alert("请选择被申请人名称");
			return;
		}
		
		window.bsqrForm.action="../zxsq/runBsqrSave.action";
		window.bsqrForm.submit();
	}
</script>