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
	                <td class="lf_wid">申请人</td>
	                <td class="mid_wid">
	                   <input name="appsqr" type="text" value=""/>
	                </td>
	                <td class="lf_wid">性别</td>
	                <td class="borrf">
	                    <select name="appsex">
	                      <option value ="男">男</option>
	                      <option value ="女">女</option>
	                    </select>
	                </td>
	            </tr>
	            <tr>
	                <td class="lf_wid">身份证号</td>
	                <td class="mid_wid">
	                    <input type="text" name="appnum" value=""/>
	                </td>
	                <td class="lf_wid">送达地址</td>
	                <td class="mid_wid">
	                    <input type="text" name="appaddress" value=""/>
	                </td>
	            </tr>
	            <tr>	
	                <td class="lf_wid">邮编</td>
	                <td class="mid_wid"><input name="apppost" type="text" value=""/></td>
	                <td class="lf_wid">联系电话</td>
	                <td class="mid_wid">
	                	<input name="appphone" type="text" class="phone" value=""/>
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
        var bjdr1=document.getElementsByName("appsqr");//申请人
		var appsex=document.getElementsByName("appsex");//性别
		var bnum=document.getElementsByName("appnum");//身份证号码
		var baddress=document.getElementsByName("appaddress");//送达地址
		var bpost=document.getElementsByName("apppost");//邮编
		var bphone=document.getElementsByName("appphone");//联系电话
		var bjdr1arr = new Array();var appsexarr = new Array();var bphonearr = new Array();
		var bnumarr = new Array();var baddressarr = new Array();var bpostarr = new Array();
		
		for(var i=0;i<bjdr1.length;i++){
			bjdr1arr[i]=bjdr1.item(i).value;
			appsexarr[i]=appsex.item(i).value;
			bnumarr[i]=bnum.item(i).value;
			baddressarr[i]=baddress.item(i).value;
			bpostarr[i]=bpost.item(i).value;
			bphonearr[i]=bphone.item(i).value;
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
        for(var i=0;i<bjdr1arr.length;i++){
			
			bjdr1new.item(i).value=bjdr1arr[i];
			appsexnew.item(i).value=appsexarr[i];
			bnumnew.item(i).value=bnumarr[i];
			baddressnew.item(i).value=baddressarr[i];
			bpostnew.item(i).value=bpostarr[i];
			bphonenew.item(i).value=bphonearr[i];
		}
        
    } 
    //删除table 
    function deletetable(id){
    	var tableid = id.replace("delete", "yl");
    	$('#'+tableid).remove();
    }
    //提交
    function subApp_w(){
		var bjdr1=document.getElementsByName("appsqr");//申请人
		var appsex=document.getElementsByName("appsex");//性别
		var bnum=document.getElementsByName("appnum");//身份证号码
		var baddress=document.getElementsByName("appaddress");//送达地址
		var bpost=document.getElementsByName("apppost");//邮编
		var bphone=document.getElementsByName("appphone");//联系电话
		
		var userString="";
		var userString_cang="";
		var reg = new RegExp("^[0-9]*$");  
		for(var i=0;i<bjdr1.length;i++){
			
			if(bjdr1.item(i).value==""){
				alert("请填写申请人姓名！");return;
			}
			if(bnum.item(i).value==""){
				alert("请填写身份证号！");return;
			}else{
				//if(!IdCardValidate(bnum.item(i).value)){
				//	alert("请输入正确格式的身份证号！");return;
				//}
			}
			if(baddress.item(i).value==""){
				alert("请填写送达地址！");return;
			}
			if(bpost.item(i).value==""){
				alert("请填写邮编！");return;
			}else{
				//if(!youzheng(bpost.item(i).value)){
				//	alert("请输入正确格式的邮编！");return;
				//}
			}
			if(bphone.item(i).value==""){
				alert("请填写联系电话！");return;
			}else{
				//if(!(isMob.test(bphone.item(i).value)||isPhone.test(bphone.item(i).value))){ 
	    	    //	alert("请输入正确的电话格式！");return;
	    	    //}
		    }
			userString=userString+"( "+(i+1)+" ) ";
		
			userString=userString+"申请人："+bjdr1.item(i).value.replace("，", " ");
			userString_cang=userString_cang+bjdr1.item(i).value.replace("，", " ");
			
			userString=userString+"，性别："+appsex.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+appsex.item(i).value.replace("，", " ");
			
			userString=userString+"，身份证号："+bnum.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+bnum.item(i).value.replace("，", " ");
		
		
			userString=userString+"，送达地址："+baddress.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+baddress.item(i).value.replace("，", " ");
		
		
			userString=userString+"，邮编："+bpost.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+bpost.item(i).value.replace("，", " ");
		
		
			userString=userString+"，联系电话："+bphone.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+bphone.item(i).value.replace("，", " ");
			
			userString=userString+"；<br/>"  
			userString_cang=userString_cang+"&"  
		}
		userString = userString+"共计"+bjdr1.length+"人";
		$("#rencount",window.parent.document).val(bjdr1.length); 
		$("#shenqingren",window.parent.document).html(userString);
		$("#appdetail",window.parent.document).val(userString);
		$("#shenqingren_cang",window.parent.document).val(userString_cang); 
		api.close();
	}
</script>