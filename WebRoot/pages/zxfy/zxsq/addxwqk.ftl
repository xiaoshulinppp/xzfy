<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link href="../pages/css/base.css" rel="stylesheet" type="text/css">
<link href="../pages/css/form.css" rel="stylesheet" type="text/css">
<script src="../pages/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../sys_theme/js/function.js"></script>
<title>添加申请人</title>
</head>
<body>
	<div class="main">
    	<div class="jxtj" onclick="inserttable()">继续添加</div>
    </div>
    <div id="div_bjbr">
	    <table class="tab" id="yltable1">
	            <tr>
	                <td class="lf_wid">行为名称</td>
	                <td class="mid_wid">
	                   <input name="xwname" type="text" value=""/>
	                </td>
	                <td class="lf_wid">行为文号</td>
	                <td class="mid_wid">
	                    <input type="text" name="xwnum" value=""/>
	                </td>
	            </tr>
	            <tr>
	                <td class="lf_wid">知道时间</td>
	                <td class="mid_wid">
	                    <input type="text" name="zdtime" value=""/>
	                </td>
	                <td class="lf_wid">得知途径</td>
	                <td class="mid_wid">
	                    <input type="text" name="tujing" class="phone" value=""/>
	                    <p class="clear" style="display:none;" onclick="deletetable('deletetable1')">删除</p>
	                </td>
	            </tr>
	      </table>
	  </div>
	  <p class="tj" onclick="subApp_w()">提交</p>
</body>
</html>
<script language="javascript" type="text/javascript">
	var api = frameElement.api;//调用父页面数据
	//添加table
	 function inserttable() {  
        var newnode = $('#yltable1')[0].cloneNode(true);
        var content = newnode.innerHTML;  
        var num = $('#div_bjbr')[0].childNodes.length-1;
        content = content.replace("display:none;", "display:block;");
        content = content.replace("deletetable1", "deletetable"+ num);  
        content = "<table class='tab' id='yltable"+num+"'>" + content + "</table>";
        //获取table上的值
        var xwname=document.getElementsByName("xwname");//行为名称
		var xwnum=document.getElementsByName("xwnum");//行为文号
		var zdtime=document.getElementsByName("zdtime");//知道时间
		var tujing=document.getElementsByName("tujing");//得知途径
		
		var xwnamearr = new Array();var xwnumarr = new Array();
		var zdtimearr = new Array();var tujingarr = new Array();
		
		for(var i=0;i<xwname.length;i++){
			xwnamearr[i]=xwname.item(i).value;
			xwnumarr[i]=xwnum.item(i).value;
			zdtimearr[i]=zdtime.item(i).value;
			tujingarr[i]=tujing.item(i).value;
		}
		//添加table
        $('#div_bjbr')[0].innerHTML=$('#div_bjbr')[0].innerHTML+content;
        //重新赋值
        var bjdr1new=document.getElementsByName("appsqr");//申请人
		var appsexnew=document.getElementsByName("appsex");//性别
		var bnumnew=document.getElementsByName("appnum");//身份证号码
		var baddressnew=document.getElementsByName("appaddress");//送达地址
		var bpostnew=document.getElementsByName("apppost");//邮编
		var bphonenew=document.getElementsByName("appphone");//联系电话
        for(var i=0;i<xwnamearr.length;i++){
			
			document.getElementsByName("xwname").item(i).value=xwnamearr[i];
			document.getElementsByName("xwnum").item(i).value=xwnumarr[i];
			document.getElementsByName("zdtime").item(i).value=zdtimearr[i];
			document.getElementsByName("tujing").item(i).value=tujingarr[i];
		}
        
    } 
    //删除table 
    function deletetable(id){
    	var tableid = id.replace("delete", "yl");
    	$('#'+tableid).remove();
    }
    //提交
    function subApp_w(){
		var xwname=document.getElementsByName("xwname");//行为名称
		var xwnum=document.getElementsByName("xwnum");//行为文号
		var zdtime=document.getElementsByName("zdtime");//知道时间
		var tujing=document.getElementsByName("tujing");//得知途径
		
		var xw_an_cang_div="";
		var xw_an_cang="";
		for(var i=0;i<xwname.length;i++){
			
			if(xwname.item(i).value==""){
				alert("请填写行为名称！");return;
			}
			if(xwnum.item(i).value==""){
				alert("请填写行为文号！");return;
			}
			if(zdtime.item(i).value==""){
				alert("请填写知道时间！");return;
			}
			if(tujing.item(i).value==""){
				alert("请填写得知途径！");return;
			}
			xw_an_cang_div=xw_an_cang_div+"( "+(i+1)+" ) ";
		
			xw_an_cang_div=xw_an_cang_div+""+xwname.item(i).value.replace("，", " ");
			xw_an_cang=xw_an_cang+xwname.item(i).value.replace("，", " ");
			
			xw_an_cang_div=xw_an_cang_div+"("+xwnum.item(i).value.replace("，", " ")+")";
			xw_an_cang=xw_an_cang+"$"+xwnum.item(i).value.replace("，", " ");
			
			xw_an_cang_div=xw_an_cang_div+"，知道时间："+zdtime.item(i).value.replace("，", " ");
			xw_an_cang=xw_an_cang+"$"+zdtime.item(i).value.replace("，", " ");
			
			xw_an_cang_div=xw_an_cang_div+"("+tujing.item(i).value.replace("，", " ")+")";
			xw_an_cang=xw_an_cang+"$"+tujing.item(i).value.replace("，", " ");
			
			xw_an_cang_div=xw_an_cang_div+"；<br/>"  
			xw_an_cang=xw_an_cang+"&"  
		}
		xw_an_cang_div = xw_an_cang_div+"共"+xwname.length+"件";
		$("#xw_an_cang_div",window.parent.document).html(xw_an_cang_div);
		$("#xw_an_cang",window.parent.document).val(xw_an_cang); 
		$("#require_fy_input",window.parent.document).html(xw_an_cang_div);
		api.close();
	}
</script>