<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link href="../pages/css/base.css" rel="stylesheet" type="text/css">
<link href="../pages/css/register.css" rel="stylesheet" type="text/css">
<script src="../pages/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../pages/js/lhgdialog.min.js"></script>
<title>教育培训中心</title>
</head>
<body>
<form action="''" name="form1" id="form1" method="post" ENCTYPE="multipart/form-data">
<input type="hidden" name="fyjg" value="${fyjg}"/>
<input id="xzfyId" name="xzfyInfo.id" value="${xzfyId}" type="hidden">
<input type="hidden" name="yuedusj" value="${yuedusj}" />
<input type="hidden" name="xzfyInfo.receive_type" value="1" />
<input type="hidden" name="xzfyInfo.yuedusj" value="${todate?default('')}" />
	<div class="main">
    	<div class="logo">
        	<img src="../pages/img/name.png"/>
        </div>
        <div class="content">
        	<div class="top_title">
            	<p>信息填写</p>
                <a href="">返回首页</a>
            </div>
            <div class="mian_cont">
            	<table class="tab tabmar">

                    <tr><td class="lf_wid">申请人类别<span class="xh">*</span></td>
                        <td class="mid_wid">
                        	 <label class="lbpad" style="cursor:pointer ">
                        	 	<input name="xzfyInfo.app_type" id="applicationtype1" class="sex" type="radio" value="1" checked onchange="changeType(1);"/>
                        	 	<span class="labsp">公民</span>  
                        	 </label> 
                             <label class="labspf" style="cursor:pointer ">
                             	<input name="xzfyInfo.app_type" id="applicationtype2" class="sex" type="radio" value="2"  onchange="changeType(2);"/>
                             	<span class="labsp labspf">法人或其他组织</span>  
                             </label> 
    						<input name="applicationtype" id="applicationtype"  type="hidden" value="1"  />
                        </td>
                    </tr>
                    <tr>
                    	<td class="lf_wid">申请人<span class="xh">*</span></td>
                    	<td class="mid_wid">
                        	<div class="btn" id="sqrtj" onclick="javascript:addSqr();">添加</div>
                            <div class="tdxtx tdtxtpad" id="shenqingren"></div>
                            
                            <input type="hidden" name="xzfyInfo.appdetail" type="text" id="appdetail"/>
                            <input type="hidden" name="xzfyInfo.agentDetail" type="text" id="agentDetail"/>
                            
                            <input type="hidden" name="xzfyInfo.appdetail_cang" type="text" id="shenqingren_cang"/>
                            <input type="hidden" name="xzfyInfo.agentDetail_cang" type="text" id="agentDetail_cang"/>
                            
                            <input class="input2" name="xzfyInfo.renCount" id="rencount" type="hidden"/>
                      	</td>
                    </tr>
                    <tr>
                        <td class="lf_wid">是否有代理人<span class="xh">*</span></td>
                        <td class="mid_wid">
                                <label class="lbpad">
                                	<input name="xzfyInfo.agent" class="sex" type="radio" value="1" onclick="checkdlr(1)"/><span class="labsp">有</span>  </label> 
                                <label class="labspf">
                                	<input name="xzfyInfo.agent" class="sex" type="radio" value="0" onclick="checkdlr(0)" checked/><span class="labsp labspf">无</span>  </label> 
                        </td>
                    </tr>
                    <tr id="dlrxm" style="display:none">
                    	<td class="lf_wid">代理人姓名<span class="xh">*</span></td>
                   	 	<td class="mid_wid">
                        	<label><input id="agent_name" name="xzfyInfo.agent_name" type="text" class="yzm" value="" /></label> 
                        </td>
                   	</tr>
                    <tr>
                        <td class="lf_wid">是否申请行政赔偿<span class="xh">*</span></td>
                        <td class="mid_wid">
                                <label class="lbpad">
                                	<input name="xzfyInfo.ismoney" class="sex" type="radio" value="是" onclick="checkpc('是')"/><span class="labsp">有</span>  </label> 
                                <label class="labspf">
                                	<input name="xzfyInfo.ismoney" class="sex" type="radio" value="否"  onclick="checkpc('否')" checked/><span class="labsp labspf">否</span>  </label> 
                        </td>
                    </tr>
                    <tr id="pcjh" style="display:none">
                    	<td class="lf_wid">赔偿金额<span class="xh">*</span></td>
                   	 	<td class="mid_wid">
                        	<label><input id="money_detail" name="xzfyInfo.money_detail" type="text" class="yzm" value="" /></label> 
                        </td>
                   	</tr>
                    <tr>
                    	<td class="lf_wid">受损证明材料<span class="xh">&nbsp;&nbsp;</span></td>
                    	<td class="mid_wid">
                        	<textarea rows="5" cols="55" class="tdxtx" name="xzfyInfo.money_file"></textarea>
                    	</td>
                    </tr>
                    <tr><td class="lf_wid">被申请人种类<span class="xh">*</span></td>
                        <td class="borrf">
                             <select name="xzfyInfo.defendant_type" id="beapptype" onchange="changesqrzl()">
							    <option value="0">--请选择--</option>
									<#list zlList as zl>
										<option value="${zl.value}" >${zl.name}</option>
								    </#list>
							</select>  
                        </td>
                    </tr>
                    <tr>
					    <td class="lf_wid">被申请人名称<span class="xh">*</span></td>
					     <td class="mid_wid" style="display:none;" id="beappnametd" width="25%">   
					   	 	 <label><input id="beappnameinput" name="ssss" type="text" class="yzm" value="" /></label> 
					     </td> 
					     <td class="borrf" style="display:block;" id="beappnamesel">  
						    <select name="xzfyInfo.defendant_name" id="beappname" onchange="beappcode()">
						      <option value="0" deptcode="0">----请选择----</option>     	 
						    </select>    
					     </td>
				    </tr>
    
                     <tr>
                        <td class="lf_wid">是否行政不作为<span class="xh">*</span></td>
                        <td class="mid_wid">
                                <label>
                                	<input name="xzfyInfo.ismanage" class="sex" type="radio" value="2" onchange="sfxzbzw(2)"/><span class="labsp">是</span> </label> 
                                <label class="labspf">
                                	<input name="xzfyInfo.ismanage" class="sex" type="radio" value="0" onchange="sfxzbzw(0)" checked/><span class="labsp labspf">否</span> </label> 
                        </td>
                    </tr>
                    <tr id="jtxzxqqk">
                    	<td class="lf_wid">要求复议的具体行政行为情况<span class="xh">*</span></td>
                    	<td class="mid_wid">
                        	<div class="btn" id="sqrtj" onclick="javascript:addXwqk();">添加</div>
                            <div class="tdxtx tdtxtpad" id="xw_an_cang_div"></div>
                            <input type="text" value="" name="xzfyInfo.require_fy_cang" id="xw_an_cang">
                            <input type="hidden" id="require_fy_input" name="xzfyInfo.require_fy" value="">
                      	</td>
                    </tr>
                    <tr id="bsqrlxzz" style="display:none;">
                    	<td class="lf_wid">申请人曾要求被申请人履行何种<br/>法定职责(50字以内)<span class="xh">&nbsp;&nbsp;</span></td>
                    	<td class="mid_wid">
                        	<textarea name="xzfyInfo.is_prof_detail" id="is_prof_detail" rows="5" cols="55" class="tdxtx"></textarea>
                    	</td>
                    </tr>
                    <tr id="bsqrlxr" style="display:none;">
                    	<td class="lf_wid">要求被申请人履行日<span class="xh">*</span></td>
                   	 	<td class="mid_wid">
                        	<label><input name="xzfyInfo.zhidaosj" id="bsrqlxr" type="text" class="yzm" value="" /></label> 
                        </td>
                   	</tr>
                    <tr>
                    	<td class="lf_wid">行政复议请求<span class="xh">*</span></td>
                    	<td class="mid_wid">
                    			<div id="xzfyqqf">
	                                <label class="labsty">
	                                	<input id="xzfyqqcf1" name="xzfyInfo.xzfy_requset" class="sex" type="radio" value="撤销该具体行政行为" checked/><span class="labsp labspf">撤销该具体行政行为</span> </label> 
	                                 <label class="labsty">
	                                	<input id="xzfyqqcf2" name="xzfyInfo.xzfy_requset" class="sex" type="radio" value="变更该具体行政行为" /><span class="labsp labspf">变更该具体行政行为</span> </label>
	                                 <label class="labsty">
	                                	<input id="xzfyqqcf3" name="xzfyInfo.xzfy_requset" class="sex" type="radio" value="确认该具体行政行为违法" /><span class="labsp labspf">确认该具体行政行为违法</span> </label>
                                </div>
                                <div id="xzfyqqs" style="display:none">
	                                <label class="labsty">
	                                	<input id="xzfyqqcs1" name="xzfyInfo.xzfy_requset" class="sex" type="radio" value="责令被申请人履行法定职责"/><span class="labsp labspf">责令被申请人履行法定职责</span> </label>
	                                <label class="labsty">
	                                	<input id="xzfyqqcs2" name="xzfyInfo.xzfy_requset" class="sex" type="radio" value="确认被申请人不履行法定职责违法" /><span class="labsp labspf">确认被申请人不履行法定职责违法</span> </label>
                                </div>	
                      	</td>
                    </tr>
                    <tr>
                    	<td class="lf_wid">是否申请对规范性文件附带审查<span class="xh">&nbsp;&nbsp;</span></td>
                    	<td class="mid_wid">
                                <label><input name="xzfyInfo.ischeck" class="sex" type="radio" value="是" onclick="checkshencha('是')"/><span class="labsp">是</span> </label> 
                                <label class="labspf"><input name="xzfyInfo.ischeck" class="sex" type="radio" value="否" onclick="checkshencha('否')" checked/><span class="labsp labspf">否</span> </label>    
                    	</td>
                    </tr>
                    <tr id="gfxwjscsm" style="display:none">
                    	<td class="lf_wid">规范文件审查说明<span class="xh">&nbsp;&nbsp;</span></td>
                    	<td class="mid_wid">
                        	<textarea id="check_file" name="xzfyInfo.check_file" rows="5" cols="55" class="tdxtx"></textarea>
                    	</td>
                    </tr>
                    <tr>
                    	<td class="lf_wid">请填写事实与理由（2500字以内）<span class="xh">&nbsp;&nbsp;</span></td>
                    	<td class="mid_wid">
                        	<textarea name="xzfyInfo.shishiyuly" rows="5" cols="55" class="tdxtx"></textarea>
                    	</td>
                    </tr>
                    <tr>
                    	<td class="lf_wid">请输入联系手机号码<span class="xh">*</span></td>
                   	 	<td class="mid_wid">
                        	<label><input name="xzfyInfo.yanzhengsj" type="text" class="tel" value="" /> <p class="yzmbtn">获取验证码</p></label> 
                        </td>
                   	</tr>
                    <tr>
                    	<td class="lf_wid">请输入验证码<span class="xh">*</span></td>
                   	 	<td class="mid_wid">
                        	<label><input name="yanzhenma" type="text" class="yzm" value="" /></label> 
                        </td>
                   	</tr>
                   	<tr>
                    	<td class="lf_wid">请输入邮箱<span class="xh">*</span></td>
                   	 	<td class="mid_wid">
                        	<label><input name="xzfyInfo.checkMail" type="text" class="yzm" value="" />&nbsp;<span><font> * 该邮箱将用于找回案件码,请确认邮箱正确</font></span></label> 
                        </td>
                   	</tr>
                </table>
                <div class="ybutton">
                	<p class="tj" onclick="javascript:saveNew('${xzfyId}')">提交</p>
                    <p class="fh" onclick="javascript:back()">返回</p>
                </div>
            </div>
        </div>
    </div>
</form>
<script language="javascript" type="text/javascript">

function saveNew(id){ 
		listForm_= document.getElementById("form1");
		listForm_.action="../xzfy/saveFace.action?xzfyId=" + id;
		if(confirm("您确认提交吗?"))
			listForm_.submit();
}


function openhg(dgurl,title) {
	$.dialog( {
		width:'840px',
		height:'420px',
		fixed: true,
		title: title,
		lock: true,
		content : 'url:' + dgurl
	});
}
//添加申请人
function addSqr() {
	var type = getAppType();
	if(type==1){
		openhg('addSqrFR.action','添加申请人');
	}else{
		openhg('addSqrOther.action','添加申请人');
	}
}
//添加要求复议的具体行政行为情况
function addXwqk() {
	openhg('addXwqk.action','添加要求复议的具体行政行为情况');
}
function changeType(a){
	if(a==2){
		$("#shenqingren").html("");
		document.getElementById("shenqingren_cang").value="";
		document.getElementById("rencount").value="0";
	}else{
		$("#shenqingren").html("");
		document.getElementById("shenqingren_cang").value="";
		document.getElementById("rencount").value="0";
	}
}
function getAppType(){
  var temp = document.getElementsByName("xzfyInfo.app_type");
  for(var i=0;i<temp.length;i++){
     if(temp[i].checked){
       	var intHot = temp[i].value;
		return intHot;
     }
  }
}
function checkdlr(type){
	if(type==1){
		document.getElementById("dlrxm").style.display="table-row";
	}else{
		document.getElementById("dlrxm").style.display="none";
		$("#agent_name").val("");
	}
}
function checkpc(type){
	if(type=="是"){
		document.getElementById("pcjh").style.display="table-row";
	}else{
		document.getElementById("pcjh").style.display="none";
		$("#money_detail").val("");
	}
}
function checkshencha(type){
	if(type=="是"){
		document.getElementById("gfxwjscsm").style.display="table-row";
	}else{
		document.getElementById("gfxwjscsm").style.display="none";
		$("#check_file").val("");
	}
}
function sfxzbzw(type){
	if(type==2){
		document.getElementById("bsqrlxzz").style.display="table-row";
		document.getElementById("bsqrlxr").style.display="table-row";
		document.getElementById("jtxzxqqk").style.display="none";
		document.getElementById("xzfyqqs").style.display="block";
		document.getElementById("xzfyqqf").style.display="none";

		document.getElementById("xzfyqqcf1").checked=false;
		document.getElementById("xzfyqqcf2").checked=false;
		document.getElementById("xzfyqqcf3").checked=false;
		document.getElementById("xzfyqqcs1").checked=true;
		document.getElementById("xw_an_cang").value="";
		$("#xw_an_cang_div").html("");
	}else{
		document.getElementById("bsqrlxzz").style.display="none";
		document.getElementById("bsqrlxr").style.display="none";
		document.getElementById("jtxzxqqk").style.display="table-row";
		document.getElementById("xzfyqqs").style.display="none";
		document.getElementById("xzfyqqf").style.display="block";
		document.getElementById("is_prof_detail").value="";
		document.getElementById("bsrqlxr").value="";
		document.getElementById("xzfyqqcs1").checked=false;
		document.getElementById("xzfyqqcs2").checked=false;
		document.getElementById("xzfyqqcf1").checked=true;
	}
}

var subcat = new Array();
var count=0;

<#list bList as dl>	
   subcat[${dl_index}]=new Array("${dl.type}","${dl.name}","${dl.value}"); 
   count++;    
</#list>
function changesqrzl() {
	var beapptype = document.getElementById('beapptype').value;
	if(beapptype==8||beapptype==11){//8--‘其他’
		document.getElementById("beappnametd").style.display="block";
		document.getElementById("beappnamesel").style.display="none";
		document.getElementById("beappnameinput").name="xzfyInfo.defendant_name";
		document.getElementById("beappname").name="ssss";
	} else {
	    document.getElementById("beappnamesel").style.display="block";
		document.getElementById("beappnametd").style.display="none";
		document.getElementById("beappname").name="xzfyInfo.defendant_name";
		document.getElementById("beappnameinput").name="ssss";
		document.getElementById('beappname').length = 0; 
		document.getElementById('beappname').options[document.getElementById('beappname').length] = new Option("----请选择-----", "0");
        for (var x=0; x < count; x++)
         {
            if (subcat[x][0] == beapptype)

               {   var tempOption=new Option(subcat[x][1], subcat[x][1]);
               	   tempOption.deptcode=subcat[x][2];
                   document.getElementById('beappname').options[document.getElementById('beappname').length] = tempOption;
                } 
           }
	}
}
</script>
</body>
</html>
