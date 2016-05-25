<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	
	<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
	
	<link href="../sys_theme/css/base.css" rel="stylesheet" type="text/css" />
	<link href="../sys_theme/css/main_style.css" rel="stylesheet" type="text/css" />
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
			if(document.getElementById("select1").value==""||document.getElementById("select2").value==""){
				alert("请选择栏目！");
				document.getElementById("select1").focus();
				return false;
			}else{
				if(ims.length>0&&ims.length==1){
					document.getElementById("firstImage").value=ims[0].src;
					return true;
				}else if(ims.length>1){
					alert("只允许上传一张图片！");
					return false;
				}
			}
		}
	
	var stack_s1 = [];
	stack_s1.push(['请选择一级栏目','']);
	stack_s1.push(['复议动态','1']);
	stack_s1.push(['时政快递','2']);
	stack_s1.push(['法律法规','3']);
	stack_s1.push(['典型案例','4']);


	var stack_s2 = [];
	stack_s2.push(['图片新闻','1','11']);
	stack_s2.push(['行政复议工作动态','1','12']);
	stack_s2.push(['领导讲话','2','21']);
	stack_s2.push(['法制舆情摘报','2','22']);
	stack_s2.push(['法律法规','3','31']);
	stack_s2.push(['行政处罚','4','41']);
	stack_s2.push(['行政许可','4','42']);
	stack_s2.push(['行政强制实施','4','43']);
	stack_s2.push(['行政不作为','4','44']);
	stack_s2.push(['行政征收','4','45']);
	stack_s2.push(['行政确权','4','46']);
	stack_s2.push(['干预经营自主权','4','47']);
	stack_s2.push(['信息公开','4','48']);
	stack_s2.push(['其他','4','49']);


	 
	function creatSelect1(a){
	//初始化S1
		var s1 = document.getElementById("select1");
		if(s1!=null){
			document.getElementById("div1").removeChild(s1);
		}
		var select1 = document.createElement("select");
		select1.id="select1";
		select1.name="articleInfo.column";
		select1.onchange="autoSelectSubColumn(this.value);"
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
			creatSelect2(this.value,"");
	 
		}
	}
	function creatSelect2(x,b){
		var select2 = document.createElement("select");
		select2.id="select2";
		select2.name="articleInfo.subColumn";
		document.getElementById("div2").appendChild(select2);
		addOption(select2.id,"请选择二级栏目","");
		//根据单选框1传递的value值，删选stack_s2符合需求的数据
		for(var i=0;i<stack_s2.length;i++){
			if(x==stack_s2[i][1]){
				addOption(select2.id,stack_s2[i][0],stack_s2[i][2]);
				if(x==3)
				select2.options[1].selected=true;
			}
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
<body onload="creatSelect1('');creatSelect2('','')">

<div id="conDiv" style="display:none"> </div>
<form name="form" method="post" action="../website/saveArticleInfo.action" ENCTYPE="multipart/form-data"
onSubmit="return getFirstImage();">
<input type="hidden" name="funcCode" value="${funcCode}" />
<input type="hidden" name="articleInfo.firstImage" id="firstImage" value="">

<div class="ui-title fn-clear">
     
      <h2 class="ui-title-cnt fn-left">内容管理 - 新闻发布</h2>  </div>       
<!--标题结束-->

<div class="ui-form fn-clear">


<table width="100%"  class="ui-table ui-table-form ">
<tr>
	<th>请输入标题</th>
	<td width="30%"><input name="articleInfo.title" type="text" class="input-web" value="" /></th>
	<th width="20%">请输入文章来源</td>
	<td width="30%"><input type="text" name="articleInfo.resource" class="input-web" value="" /></td>
	
<tr>
	<th width="20%">所属栏目</th>
	<td colspan=3>
		<a id="div1" /><a id="div2" />
	</td>
</tr>
<!--	<tr>
		<th width="20%">所属栏目</th>
		<td colspan=3>
		<@ww.select name="'articleInfo.column'" id=""  headerKey="'0'" headerValue="'--请选择--'"  list="getDictMap('column')" 
    onchange="'aaa()'"/>
		</td>-->

	
		<tr><td colspan=4><textarea name="content" cols="150" rows="15" style="width:100%;height:400px;visibility:hidden;">
		</textarea></td></tr>
    <tfoot>
      <tr>
        <td colspan="4"  >
        <input   class="ui-btn ui-btn-yellow" type="submit" name="button" id="" value="提交新闻"  title="提交" />
        </td>
      </tr>
    </tfoot>
</table>

</div>
</form>
</body>
</html>