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
			var editor1 = K.create('textarea[name="content"]', {
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
		alert(editor1.html());
			document.getElementById("conDiv").innerHTML=editor1.html();
			alert(1);
			var ims=document.getElementsByTagName("img");
			if(ims.length>0&&ims.length==1){
				document.getElementById("firstImage").value=ims[0].src;
				return true;
			}else if(ims.length>1){
				alert("只允许上传一张图片！");
				return false;
			}
		}
	</script>
</head>
<body>
<div id="conDiv" style="display:none">${content}</div>
<form name="form" method="post" ENCTYPE="multipart/form-data"
onsubmit="return getFirstImage()">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="articleId" value="${articleInfo.id}" />
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
	<th>请输入标题</th>
	<td><input name="articleInfo.title" value="${articleInfo.title}"></td>
	<th>关键词</th>
	<td><input name="articleInfo.keyword" value="${articleInfo.keyword?default('')}"></td>
</tr>
</table></div>
<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
<tr>
	<td><textarea name="content" cols="150" rows="10" style="width:1100px;height:400px;visibility:hidden;">
		${content}</textarea>
	</td>
</tr>
</table></div>
<div class="z_info">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="z_info_table">
<tr>		
	<th>所属栏目</th>
	<td><select name="articleInfo.column">
			<option value="1" <#if articleInfo.column=="1">selected</#if>>图片信息</option>
			<option value="2" <#if articleInfo.column=="2">selected</#if>>领导讲话</option>
			<option value="3" <#if articleInfo.column=="3">selected</#if>>动态新闻</option>
			<option value="4" <#if articleInfo.column=="4">selected</#if>>法律法规</option>
			<option value="5" <#if articleInfo.column=="5">selected</#if>>法制舆情摘报</option>
			<option value="6" <#if articleInfo.column=="6">selected</#if>>典型案例</option>
			<option value="7" <#if articleInfo.column=="7">selected</#if>>工作建议</option>
			<option value="8" <#if articleInfo.column=="8">selected</#if>>法制动态摘编</option>
		</select>
	</td>
	<th>请输入文章来源</th>
	<td><input type="text" name="articleInfo.resource" value="${articleInfo.resource}"></td>
</tr>
</table></div>
<div class="align-center">
		<input type="button" name="button" value="审核通过" class="btn-blue btn" onclick="setPass()" />
		<input type="button" name="button" value="退回" class="btn-blue btn" onclick="setNotPass()"/>
		<input type="button" name="button" value="返回" class="btn-blue btn" onclick="history.back()"/>
</div>
</form>
</body>
<script>
	function setPass(){
		document.form.action="setPass.action";
		document.form.submit();
	}
	function setNotPass(){
		
		document.form.action="setNotPass.action";
		document.form.submit();
	}
</script>
</html>