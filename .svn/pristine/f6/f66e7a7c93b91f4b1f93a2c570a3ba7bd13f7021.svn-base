<html>
	<head> 
		<meta name="renderer" content="webkit|ie-comp|ie-stand" />
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script  type="text/javascript" src="../js/jquery-1.8.2.min.js"></script>
    	<title>在线阅卷</title>
    	<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<form name="listForm" action=""  method="post" enctype="multipart/form-data" >
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
				<tr>				
					<td>案卷文件查询结果</td>
				</tr>
			</table>
			<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  				<tr>
  					<td>&nbsp;共计: ${resultSize} 条数据</td>
  				</tr>
			</table>
			<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
    			<tr>
					<th class="thListNormal" width="40">序号</th>	      
					<#list displayInfo.fieldNameList as fieldName>
					<th class="thListNormal">${fieldName}</th>
					</#list>
					<#--><th class="thListNormal" width="300">材料类别</th>		
					<th class="thListNormal" >材料名称</th>
					<th class="thListNormal" width="80">状态</th><-->
					<th width="150" class="thListNormal">案卷材料下载</th>
    			</tr>
   				<#assign count =0>
   				<#list displayInfo.fieldValueList as recordValueList >  
   				<#assign keyColumn = recordValueList[0]>
   				<tr class="trcolor">
   					<#assign seq = 1>
    				<td align="center" class="tdlistCenter">${count+1} </td>
    				<#list recordValueList as field>
   					<#assign seq = seq +1>
   					</#list>
					<td class="tdlistCenter">${action.getDictValue2('reportQLStatus','${list.items[count].type?default("")}')}</td>
					<td class="tdlistCenter">${list.items[count].fileName?default('')}</td>
						<td class="tdlistCenter" id="td1">
							<a href="../zxyj/downloadFile.action?entityId=${list.items[count].id}&funcCode=${funcCode}">
								<img src="../images/16B/sicons/file_modf.gif" alt="下载" width="16" height="16" border="0" />
							</a>
						</td>
  				</tr>
  				<#assign count = count +1>
  				</#list>
  				<tr class="trcolor">
					<td class="tdFormText" colspan=5>
						<input type="button" name="backBtn1" class="button" value="首页" onClick="Back()">
						&nbsp; &nbsp;
						<input type="button" name="backBtn2" class="button" value="案卷查询页" onClick="Back2()">
					</td>
				</tr>
			</table>
			<br />
			<br />
			<br />
			
			<#if ''==infoModel.appAdviceType?default('')>
			<#if  displayInfo.fieldValueList?has_content>
				<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
					<tr class="trcolor">
						<td class="tdlistCenter" style="font-size:18px">请填写案件阅卷意见</td>
					</tr>
				</table>
				<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
					<input type="hidden" value="${id?default('')}" name="id"></input>
					<input type="hidden" value="${caseNum?default('')}" name="caseNum"></input>
					<tr>
						<td>
							<img src="../images/16B/icondj.gif" width="15" height="15" border="0" />
							<span style="color:red;font-size:18px">注意：</span><br />
							&nbsp; &nbsp;&nbsp; &nbsp;<span style="color:red">1.请阅读全部案卷之后再填写意见，意见和相关材料只能提交一次<br />
							&nbsp; &nbsp;&nbsp; &nbsp;2.输入的字数（含标点）不能超过1000个，否则超过部分将无法输入</span>
						</td>
					</tr>
					<tr>
						<td>
							<textarea onpropertychange="if(value.length>1000) value=value.substr(0,1000)"  name="appAdviceType" id="appAdviceType" rows="8" style="width:100%"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<span style="font-size:16px;color:red">
							*相关证据材料(至少一份且格式必须为jpg,doc,xls,txt,pdf)：
							</span>	
						</td>
					</tr>
					<tr>
						<td>
							材料1：
							<input type="file" id="other1" name="other1" class="inputTextNormal" unselectable="on"></input>
						</td>
					</tr>
					<tr>
						<td>
							材料2：
							<input type="file" id="other2" name="other2" class="inputTextNormal" unselectable="on"></input>
						</td>
					</tr>
					<tr>
						<td>
							材料3：
							<input type="file" id="other3" name="other3" class="inputTextNormal" unselectable="on"></input>
						</td>
					</tr>
					<tr>
						<td>
							材料4：
							<input type="file" id="other4" name="other4" class="inputTextNormal" unselectable="on"></input>
						</td>
					</tr>
					<tr>
						<td>
							材料5：
							<input type="file" id="other5" name="other5" class="inputTextNormal" unselectable="on"></input>
						</td>
					</tr>
				</table>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
					<tr>
						<td>
							<input type="button" name="subBut" class="button" value="提交" onClick="Submit()">
							&nbsp; &nbsp;
							<input type="button" name="resetBtn" class="button" value="重置" onClick="Ret()">
						</td>
					</tr>
				</table>
			</#if>
				<#else>
				<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
					<tr class="trcolor">
						<td style="font-size:12px;color:red">已填写过案件阅卷意见:</td>
					</tr>
					<tr>
						<td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${appAdviceType?default('')}	
						</td>
					</tr>
				</table>
			</#if>
			<script>
			//提交意见
			function Submit(){
				var appAdviceType= $("#appAdviceType").val();  
				if($.trim(appAdviceType)=='' || $.trim(appAdviceType)==null){
					alert("意见未输入，无法提交");
				}else{
					var file1=$("#other1");
					var file2=$("#other2");
					var file3=$("#other3");
					var file4=$("#other4");
					var file5=$("#other5");
					
              		if(file1.val()=='' && file2.val()=='' && file3.val()=='' && file4.val()=='' && file5.val()==''){
                    	alert("请至少选择一份文件");
					}else{
						if(fileCheck()){
							if(confirm("确认提交意见和证据材料？")){
								saveRun();
								return true;
							}
						}
					}
				}
			}
			//判断意见证据材料格式
			function fileCheck(){
				var $fileObj = $("input[type='file']");
				var flag = 0;
				for(var i=0;i<$fileObj.length;i++){
					var obj = $fileObj[i].value;
					if(obj!=''){
						var strTemp = obj.split(".");
						var strCheck = strTemp[strTemp.length-1];
						if(strCheck.toUpperCase()=='JPG'||strCheck.toUpperCase()=='DOC'||strCheck.toUpperCase()=='XLS'||strCheck.toUpperCase()=='TXT'||strCheck.toUpperCase()=='PDF'){
							flag = 1;
						}
						else{
							alert("材料"+(i+1)+"格式("+strCheck+")不符合要求！");
							return false;
						}
					}
				}
				if(flag==1){
					return true;
				}
				
			}
			//重置意见
			function Ret(){
				var appAdviceType= $("#appAdviceType").val();
				var file1=$("#other1");
				var file2=$("#other2");
				var file3=$("#other3");
				var file4=$("#other4");
				var file5=$("#other5");  
				if(($.trim(appAdviceType)=='' || $.trim(appAdviceType)==null)&& $.trim(file1.val())=='' && $.trim(file2.val())=='' && $.trim(file3.val())=='' && $.trim(file4.val())=='' && $.trim(file5.val())==''){
					alert("未输入意见或文件，无需重置");
				}else{
					if(confirm("重置将清空已输入的意见和文件，确认重置？")){
						listForm.reset(); 
						return true;
					}	
				}
			}
			function saveRun(){
				window.listForm.action="../zxyj/addSug.action?funcCode=${funcCode}&caseNum=${caseNum}";
				window.listForm.submit(); 
			}
			//返回首页
			function Back(){
				window.listForm.action="../zxfy/mainPage.action?funcCode=${funcCode}";
				window.listForm.submit(); 
			}
			//返回案卷查找页
			function Back2(){
				window.listForm.action="../zxyj/searchList.action?funcCode=${funcCode}";
				window.listForm.submit(); 
			}
			</script>
		</form>
	</body>
</html>