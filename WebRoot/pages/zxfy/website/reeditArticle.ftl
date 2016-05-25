<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
	<link href="../css/style_form.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../sys_theme/js/tpl.base.js"></script>
	<script>
		KindEditor.ready(function(K) {	

			 editor1 = K.create('textarea[name="content"]', {
				cssPath : '../kindeditor/plugins/code/prettify.css',
				uploadJson : '../kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '../kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						//document.forms['form'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						//document.forms['form'].submit();
					});
				}
			});			
			prettyPrint();
		});
		
		function getFirstImage(){
			document.getElementById("conDiv").innerHTML=editor1.html();
			var ims=document.getElementsByTagName("img");
			if(ims.length>0&&ims.length==1){
				document.getElementById("firstImage").value=ims[0].src;
				return true;
			}else if(ims.length>1){
				alert("只允许上传一张图片！");
				return false;
			}
		}
		var stack_s1 = [];
		stack_s1.push(['请选择一级栏目','']);
		stack_s1.push(['复议动态','1']);
		stack_s1.push(['时政快递','2']);
		stack_s1.push(['法律法规','3']);
		stack_s1.push(['典型案例','4']);
		stack_s1.push(['统计查询','5']);
		stack_s1.push(['工作管理','6']);
		stack_s1.push(['在线调查','7']);
		stack_s1.push(['软件资料','8']);
		var stack_s2 = [];
		stack_s2.push(['图片新闻','1','11']);
		stack_s2.push(['行政复议工作动态','1','12']);
		stack_s2.push(['领导讲话','2','21']);
		stack_s2.push(['法制舆情摘报','2','22']);
		stack_s2.push(['法律法规','3','31']);
		stack_s2.push(['典型案例','4','41']);
		stack_s2.push(['统计查询','5','51']);
		stack_s2.push(['案卷管理','6','61']);
		stack_s2.push(['委员会管理','6','62']);
		stack_s2.push(['诉讼案件管理','6','63']);
		stack_s2.push(['接待/新增案件','6','64']);
		stack_s2.push(['工作建议','7','71']);
		stack_s2.push(['在线调查','7','72']);
		stack_s2.push(['资料库','8','81']);
		stack_s2.push(['常用软件','8','82']);
		stack_s2.push(['电话本','8','83']);
 
function creatSelect1(a){
//初始化S1
	var s1 = document.getElementById("select1");
	if(s1!=null){
		document.getElementById("div1").removeChild(s1);
	}
	var select1 = document.createElement("select");
	select1.id="select1";
	select1.name="articleInfo.column";
	document.getElementById("div1").appendChild(select1);
	for(var i=0;i<stack_s1.length;i++){
		addOption(select1.id,stack_s1[i][0],stack_s1[i][1]);
		if(a==stack_s1[i][1])
		select1.options[i].selected=true;
	}
	var s = document.getElementById("select1");
//给单选框1增加选择事件
	s.onchange = function(){
//初始化S2
		var s2 = document.getElementById("select2");
		if(s2!=null){
			document.getElementById("div2").removeChild(s2);
		}
		creatSelect2(this.value);
	}
}
function creatSelect2(x,b){
	var select2 = document.createElement("select");
	select2.id="select2";
	select2.name="articleInfo.subColumn";
	document.getElementById("div2").appendChild(select2);
	addOption(select2.id,"请选择二级栏目","");
	var j=0;
//根据单选框1传递的value值，删选stack_s2符合需求的数据
	for(var i=0;i<stack_s2.length;i++){
		if(x==stack_s2[i][1]){
			addOption(select2.id,stack_s2[i][0],stack_s2[i][2]);
			j++;
		}
		if(b==stack_s2[i][2])
			select2.options[j].selected=true;
	}
	select2.onchange = function(){
//初始化S2
	console.debug(this.options[this.selectedIndex].text+":"+this.value);
	}
}
function addOption(id,name,value){
	var obj=document.getElementById(id);
	obj.options.add(new Option(name,value));
}
	</script>
</head>
<body onload="creatSelect1(${articleInfo.column});creatSelect2(${articleInfo.column},${articleInfo.subColumn})">
<div id="conDiv" style="display:none"></div>
<form name="form" method="post" action="../website/resubmit.action" ENCTYPE="multipart/form-data" onsubmit="return getFirstImage()">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="articleInfo.id" value="${articleInfo.id}" />
<input type="hidden" name="articleInfo.author" value="${articleInfo.author}" />
<input type="hidden" name="articleInfo.authorId" value="${articleInfo.authorId}" />
<input type="hidden" name="articleInfo.createdDate" value="${articleInfo.createdDate}" />
<input type="hidden" name="articleInfo.viewCount" value="${articleInfo.viewCount?default(0)}" />
<input type="hidden" name="articleInfo.isTop" value="${articleInfo.isTop?default('0')}" />
<input type="hidden" name="articleInfo.isRelease" value="${articleInfo.isRelease?default('0')}" />
<input type="hidden" name="articleInfo.isPass" value="${articleInfo.isPass?default('0')}" />
<input type="hidden" name="articleInfo.firstImage" value="${articleInfo.firstImage?default('')}" id="firstImage">
<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
<tr>	
	<th width="20%">请输入标题</th>
	<td width="30%"><input name="articleInfo.title" value="${articleInfo.title}"></td>
	<th width="20%">请输入文章来源</th>
	<td width="30%"><input type="text" name="articleInfo.resource" value="${articleInfo.resource}"></td>
</tr>
</table></div>
<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">	
<tr>		
	<th width="20%">所属栏目</th>
	<td><a id="div1" /><a id="div2" /></td>
</tr>
</table></div>
<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
<tr>	
	<td><textarea name="content" cols="150" rows="10" style="width:1100px;height:400px;visibility:hidden;">
		${content}</textarea></td>
</tr>
</table></div>

<div class="align-center">
	<input type="submit" value="提交" class="btn-blue btn" onclick="saveAndSubmit()"/>
	<input type="button" name="button" value="返回" class="btn-blue btn" onclick="history.back()"/>
</div>
</form>
</body>
</html>