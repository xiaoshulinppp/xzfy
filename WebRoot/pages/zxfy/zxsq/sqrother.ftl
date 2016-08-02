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
	                   <input name="frsqr" type="text" value=""/>
	                </td>
	                <td class="lf_wid">代表人类别</td>
	                <td class="borrf">
	                    <select name="fzrlb">
							<option value="法定代表人">法定代表人</option>
							<option value="负责人">负责人</option>
						    <option value="执行合伙事务的合伙人">执行合伙事务的合伙人</option>
						    <option value="合伙人">合伙人</option>
						    <option value="主要负责人">主要负责人</option>
						    <option value="被共同推选的非法人组织其他成员">被共同推选的非法人组织其他成员</option>
						</select>
	                </td>
	            </tr>
	            <tr>
	                <td class="lf_wid">代表人姓名</td>
	                <td class="mid_wid">
	                    <input type="text" name="fuzeren" value=""/>
	                </td>
	                <td class="lf_wid">送达地址</td>
	                <td class="mid_wid">
	                    <input type="text" name="fzraddress" value=""/>
	                </td>
	            </tr>
	            <tr>	
	                <td class="lf_wid">邮编</td>
	                <td class="mid_wid"><input name="fzrpost" type="text" value=""/></td>
	                <td class="lf_wid">联系电话</td>
	                <td class="mid_wid"><input name="fzrtele" type="text" class="phone" value=""/></td>
	            </tr>
	            <tr>
	                <td class="lf_wid">其他情形</td>
	                <td class="borrf">
	                    <select name="fzrother">
							<option value="0">无</option>
						    <option value="由股东代表大会以股份制企业名义提出申请">由股东代表大会以股份制企业名义提出申请</option>
						    <option value="由董事会以股份制企业名义提出申请">由董事会以股份制企业名义提出申请</option>
						    <option value="其他">其他</option>
						</select>
	                </td>
	                <td class="lf_wid" colspan="2"><p class="clear" style="display:none;" onclick="deletetable('deletetable1')">删除</p></td>
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
        var frsqr=document.getElementsByName("frsqr");//申请人
		var fzrlb=document.getElementsByName("fzrlb");//代表人类别
		var fuzeren=document.getElementsByName("fuzeren");//代表人姓名
		var fzraddress=document.getElementsByName("fzraddress");//送达地址
		var fzrpost=document.getElementsByName("fzrpost");//邮编
		var fzrtele=document.getElementsByName("fzrtele");//联系电话
		var fzrother=document.getElementsByName("fzrother");//其他情形
		
		var frsqrarr = new Array();var fzrlbarr = new Array();var fuzerenarr = new Array();
		var fzraddressarr = new Array();var fzrpostarr = new Array();var fzrtelearr = new Array();var fzrotherarr = new Array();
		for(var i=0;i<frsqr.length;i++){
			frsqrarr[i]=frsqr.item(i).value;
			fzrlbarr[i]=fzrlb.item(i).value;
			fuzerenarr[i]=fuzeren.item(i).value;
			fzraddressarr[i]=fzraddress.item(i).value;
			fzrpostarr[i]=fzrpost.item(i).value;
			fzrtelearr[i]=fzrtele.item(i).value;
			fzrotherarr[i]=fzrother.item(i).value;
		}
		//添加table
        $('#div_bjbr')[0].innerHTML=$('#div_bjbr')[0].innerHTML+content;
         //重新赋值
        for(var i=0;i<frsqrarr.length;i++){
			document.getElementsByName("frsqr").item(i).value=frsqrarr[i];
			document.getElementsByName("fzrlb").item(i).value=fzrlbarr[i];
			document.getElementsByName("fuzeren").item(i).value=fuzerenarr[i];
			document.getElementsByName("fzraddress").item(i).value=fzraddressarr[i];
			document.getElementsByName("fzrpost").item(i).value=fzrpostarr[i];
			document.getElementsByName("fzrtele").item(i).value=fzrtelearr[i];
			document.getElementsByName("fzrother").item(i).value=fzrotherarr[i];
		}
    } 
    //删除table 
    function deletetable(id){
    	var tableid = id.replace("delete", "yl");
    	$('#'+tableid).remove();
    }
    //提交
    function subApp_w(){
		var frsqr=document.getElementsByName("frsqr");//申请人
		var fzrlb=document.getElementsByName("fzrlb");//代表人类别
		var fuzeren=document.getElementsByName("fuzeren");//代表人姓名
		var fzraddress=document.getElementsByName("fzraddress");//送达地址
		var fzrpost=document.getElementsByName("fzrpost");//邮编
		var fzrtele=document.getElementsByName("fzrtele");//联系电话
		var fzrother=document.getElementsByName("fzrother");//其他情形
		
		var userString="";
		var userString_cang="";
		for(var i=0;i<frsqr.length;i++){
			
			if(frsqr.item(i).value==""){
				alert("请填写申请人姓名！");return;
			}
			if(fuzeren.item(i).value==""){
				alert("请填写代表人姓名！");return;
			}
			if(fzraddress.item(i).value==""){
				alert("请填写送达地址！");return;
			}
			if(fzrpost.item(i).value==""){
				alert("请填写邮编！");return;
			}else{
				//if(!youzheng(fzrpost.item(i).value)){
				//	alert("请输入正确格式的邮编！");return;
				//}
			}
			if(fzrtele.item(i).value==""){
				alert("请填写联系电话！");return;
			}else{
				//if(!(isMob.test(fzrtele.item(i).value)||isPhone.test(fzrtele.item(i).value))){ 
	    	    //	alert("请输入正确的电话格式！");return;
	    	    //}
		    }
			userString=userString+"( "+(i+1)+" ) ";
		
			if(fzrother.item(i).value=="0"){
			   userString=userString+frsqr.item(i).value.replace("，", " ");
			}else{
				userString=userString+frsqr.item(i).value.replace("，", " ")+"（"+fzrother.item(i).value.replace("，", " ")+"）";
			}
		
			userString_cang=userString_cang+frsqr.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+fzrother.item(i).value.replace("，", " ");
			
			userString=userString+"，"+fzrlb.item(i).value.replace("，", " ")+"是：";
			userString_cang=userString_cang+"$"+fzrlb.item(i).value.replace("，", " ");
			
			userString=userString+fuzeren.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+fuzeren.item(i).value.replace("，", " ");
		
			userString=userString+"，送达地址："+fzraddress.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+fzraddress.item(i).value.replace("，", " ");
		
			userString=userString+"，邮编："+fzrpost.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+fzrpost.item(i).value.replace("，", " ");
		
			userString=userString+"，联系电话："+fzrtele.item(i).value.replace("，", " ");
			userString_cang=userString_cang+"$"+fzrtele.item(i).value.replace("，", " ");
			
			
			userString=userString+"；<br/>"  
			userString_cang=userString_cang+"&"  
		}
		userString = userString+"共计"+frsqr.length+"人";
		$("#rencount",window.parent.document).val(frsqr.length); 
		$("#shenqingren",window.parent.document).html(userString);
		$("#agentDetail",window.parent.document).val(userString);
		$("#agentDetail_cang",window.parent.document).val(userString_cang); 
		api.close();
	}
</script>