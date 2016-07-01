var isfirst=0;
var issecond=0;
function updateUser(ev){
    
    if(isfirst==0){
	var user=document.getElementById("user").value;
	var users=user.split(",");
	
	var ob1=document.getElementById("app");//table
	var ins=document.getElementById("ins");//next table
	var tuser=document.getElementById("tuser");//td
	
	
	//ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	handleList.item(0).value=users[0];
	
	/*for(var j=0;j<handleList.length;j++){
		var temp=handleList.item(j).parentNode;
		tuser.removeChild(temp);
	}*/
	//tuser.insertBefore(ob1,ins);
	
	//alert(users.length);
	//alert(users[0]);
	
	if(users.length>1)
	for(var i=1;i<users.length;i++)
	{
		ob1=ob1.cloneNode(true);
		var handleList=ob1.getElementsByTagName("input");
		handleList.item(0).value=users[i];
		tuser.insertBefore(ob1,ins);
		//alert(users[i]);
	}
	isfirst=1;
	setUser(ev);
	}
	else{
	setUser(ev);}
	
}

function getFile(tid){
	window.open('http://127.0.0.1:8089/fzb/t/getfile.jsp?tid='+tid);
}
function getFile1(id){
	window.open('http://127.0.0.1:8089/fzb/t/getfile2.jsp?id='+id);
}

function getFileHandle(tid){ 
	var content=document.getElementById("content").value;
	var remark=document.getElementById("remark").value;
	var newWindow =window.open ('about:blank','newwindow','toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	var keys=['content','remark','tid'];   
	var values=[content,remark,tid];   
	var html = "";
	 html += "<html><head></head><body><form id='formid' method='post' action='http://172.24.176.10:8068/fzb/t/getfilehandle.jsp'>";
    if (keys && values && (keys.length == values.length)){
	for (var i=0; i < keys.length; i++)   
	 {   
		html += "<input type='hidden' name='" + keys[i] + "' value='" + values[i] + "'/>";	
	 }         
    }
    
    html += "</form><script type='text/javascript'>document.getElementById('formid').submit();";
    html += "<\/script></body></html>".toString().replace(/^.+?\*|\\(?=\/)|\*.+?$/gi, ""); 
    newWindow.document.write(html);
}

function setCountAppname(id,idsum){
	var idob=document.getElementById(id).value;
	var idsum=document.getElementById(idsum).value;
	var conutAppname=document.getElementById("conutAppname");
	if(idsum<=1){
		var app=idob.indexOf("，");
		if(app>0)
			conutAppname.value=idob.substring(0,app);
		else
			conutAppname.value=idob;
	}else{
		var app=idob.indexOf("，");
		if(app>0)
			conutAppname.value=idob.substring(0,app)+"等"+idsum+"位";
		else
			conutAppname.value=idob+"等"+idsum+"位";
	}

}

function back(){
		if(confirm("返回后所做操作将无法保存，确认要返回吗？")){
		history.back(-1);
	}
}

function faceScan(type,id){
	if(type==1){
		window.open('../xzfy/editXzfy.action?xzfyId='+id+'&funcCode=447');
	}
	if(type==2 || type==3){
		window.open('../jds/app_paperUpdate.action?id='+id+'&funcCode=154');
	}
	if(type==4){
		window.open('../jds/app_normalUpdate.action?id='+id+'&funcCode=154');
	}
	if(type==5){
		window.open('../jds/App_FaceGenaralLookAction.action?id='+id+'&funcCode=154');
	}
	if(type==9){
		window.open('../jds/app_normalUpdate.action?id='+id+'&funcCode=154');
	}

}
function setUser1(divName){
	//closeSelect();
	var top = ($(window).height())/2;    
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : 680, 'left' : left + scrollLeft } ).show();   
//	var udiv=document.getElementById("userDiv");
//	var userspan=document.getElementById("userspan");
//	var areaObject=document.getElementById("user");
//	
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x;
//	udiv.style.display="block";
	//userspan.style.display="none";
//	}
}

function closeDiv1(){
//	openSelect();
	document.getElementById("userDiv").style.display="none";
	var tuser=document.getElementById("tuser");
	var userString="";
	var bjdr1=document.getElementsByName("bjdr1");
	var bsex=document.getElementsByName("bsex");
	var bnum=document.getElementsByName("bnum");
	var baddress=document.getElementsByName("baddress");
	var bpost=document.getElementsByName("bpost");
	var bphone=document.getElementsByName("bphone");
	for(var i=0;i<bjdr1.length;i++){
		if(bjdr1.item(i).value==""){
			alert("请填写被接待人姓名！");return;
		}
		userString=userString+bjdr1.item(i).value+"，"+bsex.item(i).value;
		if(bnum.item(i).value!="")
			userString=userString+"，身份证号"+bnum.item(i).value;
		if(baddress.item(i).value!="")
			userString=userString+"，住所地"+baddress.item(i).value;
		if(bpost.item(i).value!="")
			userString=userString+"，邮编"+bpost.item(i).value;
		if(bphone.item(i).value!="")
			userString=userString+"，电话"+bphone.item(i).value;
		userString=userString+"；"
	}
	var applicationsum=document.getElementById("applicationsum").value;
	//userString=userString+"共计"+applicationsum+"人。";
	document.getElementById("user").value=userString;
}

function countNum(idValue){
	var mem_value = document.getElementById(idValue).value;
	for(var i=0; i<mem_value.length; i++)
	{
	if(mem_value.charAt(i)<'0' || mem_value.charAt(i)>'9')
	{
	alert("请输入数字");
	document.getElementById(idValue).value="";
	return false;
	}
	}

}

   function textCounter(field, maxlimit) 
	 
   {   

      if (field.value.length > maxlimit) 
   {
      alert("输入的字数过多，系统将自动删除多出的字符"); 
	  field.value = field.value.substring(0, maxlimit);		
	
   
   }

  }

function setUser(ev){
	var udiv=document.getElementById("userDiv");
	var userspan=document.getElementById("userspan");
	var areaObject=document.getElementById("user");
	if(udiv.style.display!="block"){
	ev = ev || window.event;
	var mousePos = getPosition(areaObject);
	udiv.style.position = "absolute";
	udiv.style.top      = mousePos.y+20;
	udiv.style.left     = mousePos.x+180;
	udiv.style.display="block";
	userspan.style.display="none";
	}
}

function addUser(){
	var ob1=document.getElementById("app");
	var ins=document.getElementById("ins");
	var tuser=document.getElementById("tuser");
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	handleList.item(0).value="";
	handleList.item(1).value="";
	handleList.item(2).value="";
	handleList.item(3).value="";
	tuser.insertBefore(ob1,ins);
}

function addUser1(){
	var ob1=document.getElementById("app");
	var ins=document.getElementById("ins");
	var tuser=document.getElementById("tuser");
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	handleList.item(0).value="";
	tuser.insertBefore(ob1,ins);
}

function closeDiv(){
	var userspan=document.getElementById("userspan");
	userspan.style.display="block";
	document.getElementById("userDiv").style.display="none";
//	openSelect();
}

function closeDiv2(){
	var userspan=document.getElementById("userspan");
	userspan.style.display="block";
	document.getElementById("userDiv").style.display="none";
	setValue();
}


function deleteUser(e){
	var tuser=document.getElementById("tuser");
	if(tuser.getElementsByTagName("TABLE").length>2){
		var deleteObject=e.parentNode.parentNode.parentNode.parentNode;
		tuser.removeChild(deleteObject);
	}
	//setValue();
}

function setValue(){
	var tuser=document.getElementById("tuser");
	var userList=tuser.getElementsByTagName("input");
	var userString="";
	for(var i=0;i<userList.length;i++){
		if(userList.item(i).isUser){
			if(userList.item(i).value!="")
			userString=userString+userList.item(i).value+",";
		}
	}
	if(userString.length>0){
		userString=userString.substring(0,userString.length-1);
	}
	document.getElementById("user").value=userString;
	var appString="";
	for(var j=0;j<userList.length;j++){
		if(userList.item(j).isUser){
			if(userList.item(j).value!="")
			appString=appString+userList.item(j).value+"#";
		}
	}
	if(appString.length>0){
		appString=appString.substring(0,appString.length-1);
	}
	document.getElementById("appstring").value=appString;
}

function closeSelect(){
	var userList=document.getElementsByTagName("select");
	for(var i=0;i<userList.length;i++){
		if(userList.item(i).retSelect){

		}else{
			userList.item(i).style.display="none";
		}
	}

}

function openSelect(){
	var userList=document.getElementsByTagName("select");
	for(var i=0;i<userList.length;i++){
		if(userList.item(i).retSelect){
		}else{
			userList.item(i).style.display="block";
		}
	}
}


/***************************************当面接待**********************************************************/
function updateFile(){
	/*
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	*/
    if(issecond==0){
	var user=document.getElementById("filedetail").value;
	var users=user.split(",");
	
	var ob1=document.getElementById("fileapp");//table
	var ins=document.getElementById("infile");//next table
	var tuser=document.getElementById("tfile");//td

	//var handleList=ob1.getElementsByTagName("input");
	//handleList.item(0).value=users[0];
	
	/*for(var j=0;j<handleList.length;j++){
		var temp=handleList.item(j).parentNode;
		tuser.removeChild(temp);
	}*/
	//tuser.insertBefore(ob1,ins);
	
	//alert(users.length);
	//alert(users[0]);
	/*
	if(users.length>1)
	for(var i=1;i<users.length;i++)
	{
		ob1=ob1.cloneNode(true);
		var handleList=ob1.getElementsByTagName("input");
		handleList.item(0).value=users[i];
		tuser.insertBefore(ob1,ins);
		//alert(users[i]);
	}
	*/
	issecond=1;
	setFile('#fileDiv');
	}
	else{
	setFile('#fileDiv');}
	
}

function setbjd(){
	var bjd=document.getElementById("beadvice").value;
	var otheradvice=document.getElementById("otheradvice");
	var ov=document.getElementById("otheradvice").value;
	if(bjd==1){
		otheradvice.value=ov+"答：同意。";
	}else if(bjd==2){
		otheradvice.value=ov+"答：坚持申请行政复议。";
	}else if(bjd==3){
		otheradvice.value=ov+"答：其他。";
	}else if(bjd==4){
		otheradvice.value=ov+"答：知道了。";
	}
}

function setFile(divName){
	var top = ($(window).height())/2;    
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : 1300, 'left' : left + scrollLeft } ).show();   
}
function resetFile(){
	document.getElementById("filedetail").value="由于申请人今天补齐申请材料或者明确有关内容，我们从今日起计算行政复议受理审查和案件审理期限，并将依法处理。";
	document.getElementById("fileDiv").style.display="none";
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="block";
		}
	}
	var userspan=document.getElementById("filespan");
	userspan.style.display="block";
}

function resetFile1(){
	document.getElementById("filedetail").value="我们今天接收你提交的申请材料，并将依法处理。";
	document.getElementById("fileDiv").style.display="none";
//	var selectList=document.getElementsByTagName("select");
//	for(var i=0;i<selectList.length;i++){
//		if(selectList.item(i).retSelect){
//
//		}else{
//			selectList.item(i).style.display="block";
//		}
//	}
	var userspan=document.getElementById("filespan");
	userspan.style.display="block";
}

function addFile(){
	var ob1=document.getElementById("fileapp");//table
	var ins=document.getElementById("infile");//next table
	var tuser=document.getElementById("tfile");//td
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	handleList.item(0).value="";
	handleList.item(1).value="";
	handleList.item(2).value="";
	tuser.insertBefore(ob1,ins);
}

function deleteFile(e){
	var tuser=document.getElementById("tfile");
	if(tuser.getElementsByTagName("table").length>=2){
		var deleteObject=e.parentNode.parentNode.parentNode.parentNode;
		tuser.removeChild(deleteObject);
	}
	setFileValue();
}


function setFileValue(){
	var tuser=document.getElementById("tfile");
	var userList=tuser.getElementsByTagName("table");
	var userString="我们今天接收你提交的下列申请材料：\n";
	/*
	for(var i=0;i<userList.length;i++){
		if(userList.item(i).isfilediv){
			var fileput=userList.item(i);
			var filelist=fileput.getElementsByTagName("input")
			for(var j=0;j<filelist.length;j++){
				if(filelist.item(j).isUser){
					userString=userString+filelist.item(j).value+","
				}
			}
			var selectlist=userList.item(i).getElementsByTagName("select")
			for(var jj=0;jj<selectlist.length;jj++){
				if(selectlist.item(jj).isUser){
					userString=userString+selectlist.item(jj).value+".\n"
				}
			}
		}
	}
	*/
	var filemodels=document.getElementsByName("filemodel");
	var filetypes=document.getElementsByName("filetype");
	var filepages=document.getElementsByName("filepage");
	var filecounts=document.getElementsByName("filecount");
	for(var i=0;i<filemodels.length;i++){

		var ivalue=i+1;
		if(ivalue<filemodels.length){
			userString=userString+"材料"+ivalue+"："+filemodels.item(i).value+filetypes.item(i).value;
			if(filepages.item(i).value!=""){
				userString=userString + filepages.item(i).value+"（页）";
			}
			if(filecounts.item(i).value!=""){
				userString=userString + filecounts.item(i).value+"（份）；\n";
			} else {
				userString=userString+"；\n";
			}
		}else{
			userString=userString+"材料"+ivalue+"："+filemodels.item(i).value+filetypes.item(i).value;
			if(filepages.item(i).value!=""){
				userString=userString + filepages.item(i).value+"（页）";
			}
			if(filecounts.item(i).value!=""){
				userString=userString + filecounts.item(i).value+"（份）；\n并将依法处理。";
			} else {
				userString=userString+"；\n并将依法处理。";
			}
		}
	}
	document.getElementById("filedetail").value=userString;
}

function closeFile(){
	var userspan=document.getElementById("filespan");
	userspan.style.display="block";
	document.getElementById("fileDiv").style.display="none";
	setFileValue();
//		var selectList=document.getElementsByTagName("select");
//	for(var i=0;i<selectList.length;i++){
//		if(selectList.item(i).retSelect){
//
//		}else{
//			selectList.item(i).style.display="block";
//		}
//	}
}


function addAnswer(){
	var ob1=document.getElementById("answerapp");//table
	var ins=document.getElementById("inanswer");//next table
	var tuser=document.getElementById("tanswer");//td
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	handleList.item(0).value="问：";
	handleList.item(1).value="答：";
	tuser.insertBefore(ob1,ins);
}

function getAnswer(ev){
	//var selectList=document.getElementsByTagName("select");
	//for(var i=0;i<selectList.length;i++){
	//	if(selectList.item(i).retSelect){

	//	}else{
	//		selectList.item(i).style.display="none";
	//	}
	//}
	var udiv=document.getElementById("answerDiv");
	var userspan=document.getElementById("answerspan");
	var areaObject=document.getElementById("answerValue");
	if(udiv.style.display!="block"){
	ev = ev || window.event;
	var mousePos = getPosition(areaObject);
	udiv.style.position = "absolute";
	udiv.style.top      = mousePos.y+20;
	udiv.style.left     = mousePos.x+180;
	udiv.style.display="block";
	}
}


function setBzw(){
	var bzw=document.getElementById("use_type").value;
	if(bzw==""){
		document.getElementById("bzwbc").value="";
	}else{
		if(bzw!="其他"){
			document.getElementById("bzwbc").value=bzw;
		}
		
	}
}

function deleteAnswer(e){
	var tuser=document.getElementById("tanswer");
	if(tuser.childNodes.length>2){
	var deleteObject=e.parentNode.parentNode.parentNode.parentNode;
	tuser.removeChild(deleteObject);
	}
}

function closeAnswer(){
	document.getElementById("answerDiv").style.display="none";
	//setFileValue();
//	var selectList=document.getElementsByTagName("select");
//	for(var i=0;i<selectList.length;i++){
//		if(selectList.item(i).retSelect){
//
//		}else{
//			selectList.item(i).style.display="block";
//		}
//	}
	var userString="";
	var filemodels=document.getElementsByName("answer");
	var filetypes=document.getElementsByName("answerto");
	for(var i=0;i<filemodels.length;i++){
		userString=userString+filemodels.item(i).value+"\n"+filetypes.item(i).value+"\n";
	}
	document.getElementById("answerValue").value=userString;
}

/***************************************当面接待**********************************************************/


function getDept(id){
	if(id=="bename1"){
		document.getElementById("appname").readonly=true;
		document.getElementById("appname").value="";
		window.open ("../fzb/getDeptTree.action",'newwindow','height=300,width=300,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
	}else{
		document.getElementById("appname").readonly=true;
		document.getElementById("appname").value="";
		document.getElementById("deptid").value=20000;
	}
}

function getUserSet(){
	window.open ("../fzb/getUserHandle.action",'newwindow','height=300,width=300,top=300,left=300,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
}

function getSearchTree(){
	window.open ("../fzb/getSearchTree.action",'newwindow','height=300,width=300,top=300,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes'); 
}


function getSearchTreeBe(){
	window.open ("../fzb/getSearchTreeBe.action",'newwindow','height=300,width=300,top=300,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes'); 
}

function countKeyN(ev){
	var key1 = document.getElementById("keyword").value;
	if(key1==2){
		document.getElementById("jdcl1").style.display="none";
		document.getElementById("count3Div1").style.display="none";
		udiv=document.getElementById("count2Div1");
		var areaObject=document.getElementById("keyword");
		if(udiv.style.display!="block"){
			ev = ev || window.event;
			var mousePos = getPosition(areaObject);
			udiv.style.position = "absolute";
			udiv.style.top= mousePos.y+25;
			udiv.style.left= mousePos.x;
			udiv.style.display="block";
		}
	}else if(key1==3){
		document.getElementById("jdcl1").style.display="none";
		document.getElementById("count2Div1").style.display="none";
		var disList = document.getElementsByName("xzfyInfo.keyword3");
		disList.item(0).checked=true;	
	}

}

function countKey(ev){
	var key1 = document.getElementById("keyword").value;
	if(key1==1){
		var disList = document.getElementsByName("xzfyInfo.keyword2");
		for(var i=0;i<disList.length;i++){
			disList.item(i).checked=false;

		}
		var disList3 = document.getElementsByName("xzfyInfo.keyword3");
		for(var i=0;i<disList3.length;i++){
			disList3.item(i).checked=false;

		}
		document.getElementById("jdcl1").style.display="block";
		document.getElementById("count2Div1").style.display="none";
		document.getElementById("count3Div1").style.display="none";
		udiv=document.getElementById("count1Div1");
		var areaObject=document.getElementById("keyword");

		if(udiv.style.display!="block"){
			ev = ev || window.event;
			var mousePos = getPosition(areaObject);
			var h=document.body.clientHeight 
			udiv.style.position = "absolute";
			udiv.style.top= mousePos.y+25;
			udiv.style.left= mousePos.x;
			udiv.style.display="block";
		}
	}else if(key1==2){
		var disList = document.getElementsByName("xzfyInfo.reception2");
		for(var i=0;i<disList.length;i++){
			disList.item(i).checked=false;

		}
		var disList3 = document.getElementsByName("xzfyInfo.keyword3");
		for(var i=0;i<disList3.length;i++){
			disList3.item(i).checked=false;

		}
		var disList4 = document.getElementsByName("xzfyInfo.casetype");
		for(var i=0;i<disList4.length;i++){
			disList4.item(i).checked=false;

		}
		var disList5 = document.getElementsByName("xzfyInfo.casetype2");
		for(var i=0;i<disList5.length;i++){
			disList5.item(i).checked=false;

		}
		var disList6 = document.getElementsByName("xzfyInfo.refer");
		for(var i=0;i<disList6.length;i++){
			disList6.item(i).checked=false;

		}
		var disList7 = document.getElementsByName("xzfyInfo.refer2");
		for(var i=0;i<disList7.length;i++){
			disList7.item(i).checked=false;

		}
		document.getElementById("youxing").style.display="none";
		document.getElementById("jdcl1").style.display="none";
		document.getElementById("count1Div1").style.display="none";
		document.getElementById("count3Div1").style.display="none";
		udiv=document.getElementById("count2Div1");
		var areaObject=document.getElementById("keyword");
		if(udiv.style.display!="block"){
			ev = ev || window.event;
			var mousePos = getPosition(areaObject);
			udiv.style.position = "absolute";
			udiv.style.top= mousePos.y+25;
			udiv.style.left= mousePos.x;
			udiv.style.display="block";
		}
	}else if(key1==3){
		var disList = document.getElementsByName("xzfyInfo.reception");
		for(var i=0;i<disList.length;i++){
			disList.item(i).checked=false;

		}
		var disList2 = document.getElementsByName("xzfyInfo.reception2");
		for(var i=0;i<disList2.length;i++){
			disList2.item(i).checked=false;

		}
		var disList3 = document.getElementsByName("xzfyInfo.keyword2");
		for(var i=0;i<disList3.length;i++){
			disList3.item(i).checked=false;

		}
		var disList4 = document.getElementsByName("xzfyInfo.casetype");
		for(var i=0;i<disList4.length;i++){
			disList4.item(i).checked=false;

		}
		var disList5 = document.getElementsByName("xzfyInfo.casetype2");
		for(var i=0;i<disList5.length;i++){
			disList5.item(i).checked=false;

		}
		var disList6 = document.getElementsByName("xzfyInfo.refer");
		for(var i=0;i<disList6.length;i++){
			disList6.item(i).checked=false;

		}
		var disList7 = document.getElementsByName("xzfyInfo.refer2");
		for(var i=0;i<disList7.length;i++){
			disList7.item(i).checked=false;

		}
		document.getElementById("youxing").style.display="none";
		document.getElementById("jdcl1").style.display="none";
		document.getElementById("count1Div1").style.display="none";
		document.getElementById("count2Div1").style.display="none";
		udiv=document.getElementById("count3Div1");
		var areaObject=document.getElementById("keyword");
		if(udiv.style.display!="block"){
			ev = ev || window.event;
			var mousePos = getPosition(areaObject);
			udiv.style.position = "absolute";
			udiv.style.top= mousePos.y+25;
			udiv.style.left= mousePos.x;
			udiv.style.display="block";
		}
	}

}
function update_count1(keyValue,reception){
	listForm_= document.getElementById("form1");
	listForm_.action="../jds/update_conut1.action";
	if(confirm("确认要修改吗！")){
		listForm_.submit();
	}
		
}

function setAppname(){
	document.getElementById("shenqingren").value=document.getElementById("appname").value;
}

function update_count(keyValue,reception){
	var key=document.getElementById("keyword").value;

	var recp=0;
	var disList = document.getElementsByName("xzfyInfo.reception");
	for(var i=0;i<disList.length;i++){reception
		if(disList.item(i).checked==true){
			recp=disList.item(i).value;

		}
	}
	var recp2=0;
	var disListr = document.getElementsByName("xzfyInfo.reception2");
	for(var i=0;i<disListr.length;i++){
		if(disListr.item(i).checked==true){
			recp2=disListr.item(i).value;

		}
	}

	var casetype=0;
	var disList1 = document.getElementsByName("xzfyInfo.casetype");
	for(var i=0;i<disList1.length;i++){
		if(disList1.item(i).checked==true){
			casetype=disList1.item(i).value;

		}
	}
	var refer=0;
	var disList2 = document.getElementsByName("xzfyInfo.refer");
	for(var i=0;i<disList2.length;i++){
		if(disList2.item(i).checked==true){
			refer=disList2.item(i).value;

		}
	}

	var keyword2=0;
	var disList3 = document.getElementsByName("xzfyInfo.keyword2");
	for(var i=0;i<disList3.length;i++){
		if(disList3.item(i).checked==true){
			keyword2=disList3.item(i).value;

		}
	}

	var keyword3=0;
	var disList4 = document.getElementsByName("xzfyInfo.keyword3");
	for(var i=0;i<disList4.length;i++){
		if(disList4.item(i).checked==true){
			keyword3=disList4.item(i).value;

		}
	}
	listForm_= document.getElementById("form1");
	listForm_.action="../jds/update_conut.action";
	if(key==1){
		if(recp==0 || recp>3){
			alert("请选择接待处理意见");
			return false;
		}else if(casetype==0){
			alert("请选择申请复议事项");
			return false;
		}else if(refer==0){
			alert("请选择行政管理类别");
			return false;
		}else if(recp==1 && recp2==0){
			alert("请选择接待处理意见");
			return false;
		}else{
			if(confirm("您的操作将影响流程！")){
				listForm_.submit();
			}
		}
	}else if(key==2){
		if(recp==0){
			alert("请选择接待处理意见");
			return false;
		}else if(keyword2==0){
			alert("请选择申请复议事项");
			return false;
		}else if(reception!=6 && recp==6){
			if(confirm("将作为监督案件接收！")){
				listForm_.submit();
			}
		}else{
			if(confirm("您的操作将影响流程！")){
				listForm_.submit();
			}
		}	
	}else if(key==3){
		 if(keyword3==0){
			alert("请选择申请复议事项");
			return false;
		}else if(keyValue!=3){
			if(confirm("您的操作将影响流程！")){
				listForm_.submit();
			}
		}else{
			if(confirm("确认要修改吗！")){
				listForm_.submit();
			}
		}

	}else{
			alert("请选择统计关键词！");
			return false;
	}
}
function dispose()
{
	var disList = document.getElementsByName("xzfyInfo.reception");
	for(var i=0;i<disList.length;i++){
		if(disList.item(i).checked==true){
			if(disList.item(i).value=="1"){
				document.getElementById("reception1").style.display="block";
			}else{
				document.getElementById("reception1").style.display="none";
			}
		}
	}
}

function closeKey1Div(idValue){
	document.getElementById(idValue).style.display="none";
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="block";
		}
	}
		if(idValue=="count1Div1"){
		var ct="申请复议事项->";
		var xzlb="行政管理类别->";
		var jdcl="接待处理->";
		var  casetypes=document.getElementsByName("xzfyInfo.casetype");
		for(var i=0;i<casetypes.length;i++){
			if(casetypes.item(i).checked){
				var ctValue=casetypes.item(i).value;
				if(ctValue==4){
					ct=ct+"行政许可";
				}else if(ctValue==5){
					ct=ct+"行政确权";
				}else if(ctValue==6){
					ct=ct+"干预经营自主权";
				}else if(ctValue==7){
					ct=ct+"信息公开";
				}else if(ctValue==8){
					ct=ct+"行政不作为";
				}else if(ctValue==9){
					ct=ct+"其他";
				}
			}
		}
		var  casetypes2=document.getElementsByName("xzfyInfo.casetype2");
		for(var i=0;i<casetypes2.length;i++){
			if(casetypes2.item(i).checked){
				var ctValue=casetypes2.item(i).value;
				if(ctValue==1){
					ct=ct+"行政处罚->拘留";
				}else if(ctValue==2){
					ct=ct+"行政处罚->没收";
				}else if(ctValue==3){
					ct=ct+"行政处罚->罚款";
				}else if(ctValue==4){
					ct=ct+"行政处罚->其他";
				}else if(ctValue==5){
					ct=ct+"行政强制措施->对人身的强制措施";
				}else if(ctValue==6){
					ct=ct+"行政强制措施->对不动产的强制措施";
				}else if(ctValue==7){
					ct=ct+"行政强制措施->对其它财产的强制措施";
				}else if(ctValue==8){
					ct=ct+"行政征收->征收土地";
				}else if(ctValue==9){
					ct=ct+"行政征收->版税";
				}else if(ctValue==10){
					ct=ct+"行政征收->收费";
				}else if(ctValue==11){
					ct=ct+"行政征收->要求履行其他义务";
				}
			}
		}
		var  refers=document.getElementsByName("xzfyInfo.refer");
		for(var i=0;i<refers.length;i++){
			if(refers.item(i).checked){
				var referValue=refers.item(i).value;
				if(referValue==2){
					xzlb=xzlb+"国家安全";
				}else if(referValue==3){
					xzlb=xzlb+"劳动和社会保障";
				}else if(referValue==4){
					xzlb=xzlb+"司法行政";
				}else if(referValue==5){
					xzlb=xzlb+"民政";
				}else if(referValue==11){
					xzlb=xzlb+"其他";
				}
			}
		}
		var  refers2=document.getElementsByName("xzfyInfo.refer2");
		for(var i=0;i<refers2.length;i++){
			if(refers2.item(i).checked){
				var referValue=refers2.item(i).value;
				if(referValue==1){
					xzlb=xzlb+"公安->治安";
				}else if(referValue==2){
					xzlb=xzlb+"公安->劳教";
				}else if(referValue==3){
					xzlb=xzlb+"公安->其他";
				}else if(referValue==9){
					xzlb=xzlb+"农林环资->土地";
				}else if(referValue==10){
					xzlb=xzlb+"农林环资->地矿";
				}else if(referValue==11){
					xzlb=xzlb+"农林环资->环保";
				}else if(referValue==12){
					xzlb=xzlb+"农林环资->农业";
				}else if(referValue==13){
					xzlb=xzlb+"农林环资->水利";
				}else if(referValue==14){
					xzlb=xzlb+"农林环资->林业";
				}else if(referValue==15){
					xzlb=xzlb+"农林环资->其他";
				}else if(referValue==17){
					xzlb=xzlb+"城建->规划";
				}else if(referValue==18){
					xzlb=xzlb+"城建->拆迁";
				}else if(referValue==19){
					xzlb=xzlb+"城建->房屋登记";
				}else if(referValue==20){
					xzlb=xzlb+"城建->其他";
				}else if(referValue==22){
					xzlb=xzlb+"工交商事->工商";
				}else if(referValue==23){
					xzlb=xzlb+"工交商事->质监";
				}else if(referValue==24){
					xzlb=xzlb+"工交商事->商务";
				}else if(referValue==25){
					xzlb=xzlb+"工交商事->物价";
				}else if(referValue==26){
					xzlb=xzlb+"工交商事->能源";
				}else if(referValue==27){
					xzlb=xzlb+"工交商事->交通";
				}else if(referValue==28){
					xzlb=xzlb+"工交商事->信息产业";
				}else if(referValue==29){
					xzlb=xzlb+"工交商事->邮政";
				}else if(referValue==30){
					xzlb=xzlb+"工交商事->烟草专买";
				}else if(referValue==32){
					xzlb=xzlb+"财政金融->税务";
				}else if(referValue==33){
					xzlb=xzlb+"财政金融->人民银行";
				}else if(referValue==34){
					xzlb=xzlb+"财政金融->证监";
				}else if(referValue==35){
					xzlb=xzlb+"财政金融->保监";
				}else if(referValue==36){
					xzlb=xzlb+"财政金融->银监";
				}else if(referValue==37){
					xzlb=xzlb+"财政金融->外汇";
				}else if(referValue==38){
					xzlb=xzlb+"财政金融->财政";
				}else if(referValue==39){
					xzlb=xzlb+"财政金融->统计";
				}else if(referValue==40){
					xzlb=xzlb+"财政金融->审计";
				}else if(referValue==41){
					xzlb=xzlb+"财政金融->海关";
				}else if(referValue==42){
					xzlb=xzlb+"财政金融->商检";
				}else if(referValue==44){
					xzlb=xzlb+"教科文卫->药监";
				}else if(referValue==45){
					xzlb=xzlb+"教科文卫->卫生";
				}else if(referValue==46){
					xzlb=xzlb+"教科文卫->计划生育";
				}else if(referValue==47){
					xzlb=xzlb+"教科文卫->教育";
				}else if(referValue==48){
					xzlb=xzlb+"教科文卫->文化";
				}else if(referValue==49){
					xzlb=xzlb+"教科文卫->专利";
				}else if(referValue==50){
					xzlb=xzlb+"教科文卫->商标";
				}else if(referValue==51){
					xzlb=xzlb+"教科文卫->版权";
				}else if(referValue==52){
					xzlb=xzlb+"教科文卫->旅游";
				}
			}
		}
		document.getElementById("menuSave").value=ct+"  |  "+xzlb;
		document.getElementById("countRs").innerHTML=ct+" | "+xzlb;
	}
	else if(idValue=="count2Div1"){
		var ct="申请复议事项->";
		var jdcl="接待处理->";
		var  casetypes=document.getElementsByName("xzfyInfo.keyword2");
		for(var i=0;i<casetypes.length;i++){
			if(casetypes.item(i).checked){
				var ctValue=casetypes.item(i).value;
				if(ctValue==1){
					ct=ct+"抽象行政行为";
				}else if(ctValue==2){
					ct=ct+"行政处分、人事处理决定";
				}else if(ctValue==3){
					ct=ct+"行政机关对民事纠纷作出的调解、处理";
				}else if(ctValue==4){
					ct=ct+"国防、外交等国家行为";
				}else if(ctValue==6){
					ct=ct+"司法鉴定";
				}else if(ctValue==7){
					ct=ct+"涉及刑事行为";
				}else if(ctValue==8){
					ct=ct+"民事行为";
				}else if(ctValue==9){
					ct=ct+"司法行为";
				}else if(ctValue==10){
					ct=ct+"对当事人权利不产生影响的信访行为";
				}else if(ctValue==11){
					ct=ct+"不具有强制力的行政指导";
				}else if(ctValue==12){
					ct=ct+"其他行政复议机关对复议申请的处理";
				}else if(ctValue==13){
					ct=ct+"涉及市政府行政复议工作的来信";
				}else if(ctValue==14){
					ct=ct+"其他";
				}
			}
		}
		var  receptions=document.getElementsByName("xzfyInfo.reception");
		for(var i=0;i<receptions.length;i++){
			if(receptions.item(i).checked){
				var ctValue=receptions.item(i).value;
				if(ctValue==4){
					jdcl=jdcl+"口头告知";
				}else if(ctValue==5){
					jdcl=jdcl+"接收复议申请材料";
				}else if(ctValue==6){
					jdcl=jdcl+"接收行政复议监督案件";
				}else if(ctValue==7){
					jdcl=jdcl+"接收其他来信、电子邮件";
				}
			}
		}
		document.getElementById("menuSave").value=ct+"  |  "+jdcl;
		document.getElementById("countRs").innerHTML=ct+"  |  "+jdcl;
	}

	else if(idValue=="count3Div1"){
		var ct="申请复议事项->";
		var  casetypes=document.getElementsByName("xzfyInfo.keyword3");
		for(var i=0;i<casetypes.length;i++){
			if(casetypes.item(i).checked){
				var ctValue=casetypes.item(i).value;
				if(ctValue==1){
					ct=ct+"送达";
				}else if(ctValue==2){
					ct=ct+"询问案件进展情况";
				}else if(ctValue==3){
					ct=ct+"阅卷";
				}else if(ctValue==4){
					ct=ct+"谈话、调查";
				}else if(ctValue==5){
					ct=ct+"当面补交申请材料、明确有关事项";
				}else if(ctValue==6){
					ct=ct+"来信补交申请材料";
				}else if(ctValue==7){
					ct=ct+"当面代为接转其他材料";
				}else if(ctValue==8){
					ct=ct+"来信、邮件提交其他材料";
				}else if(ctValue==9){
					ct=ct+"其他涉及案件审理的事项";
				}
			}
		}
	document.getElementById("menuSave").value=ct;
	document.getElementById("countRs").innerHTML=ct;
	}
}
function setAq(ck){
	if(ck==1){
		document.getElementById("aqDiv").style.display="block";
		document.getElementById("aqspan").style.display="block";
		 AqPos();
	}else{
		document.getElementById("aqDiv").style.display="none";
		document.getElementById("aqspan").style.display="none";
	}
}

function checksqr(){
	if(document.getElementById("applicationtype").value==2){
		document.getElementById("sqr").style.display="block";
		document.getElementById("shenqingren1").style.display="none";
		document.getElementById("daibiaorendiv").style.display="none";
		document.getElementById("shenqingren").value="";
		document.getElementById("deputy").value="";
	}else{
		document.getElementById("sqr").style.display="none";
		document.getElementById("shenqingren1").style.display="block";
		document.getElementById("appname").value="";
		document.getElementById("deputy").value="";
		renCount();
	}
}

function AqPos(ev){
	var udiv=document.getElementById("aqDiv");
	var areaObject=document.getElementById("admit2");
	ev = ev || window.event;
	var mousePos = getPosition(areaObject);
	udiv.style.position = "absolute";
	udiv.style.top      = mousePos.y+20;
	udiv.style.left     = mousePos.x+180;
}

function setAqf(ck){
	if(ck==1){
//		closeSelect()
		document.getElementById("aqDiv").style.display="block";
		document.getElementById("aqspan").style.display="block";
		 AqPosf('#aqDiv');
	}else{
//		openSelect();
		document.getElementById("aqDiv").style.display="none";
		document.getElementById("aqspan").style.display="none";
		document.getElementById("aqcontent").value="";
	}
}

function AqPosf(divName){
	var top = ($(window).height())/2;    
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : 480, 'left' : left + scrollLeft } ).show();   
//	var udiv=document.getElementById("aqDiv");
//	var areaObject=document.getElementById("aqcontent");
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y;
//	udiv.style.left     = mousePos.x;
}
function recheckAq(){
	document.getElementById("aqcontent").value="";
}

function closeAq(){
//	openSelect();
	document.getElementById("aqDiv").style.display="none";
}

function addAq(advice){
var bzDiv=document.getElementById("aqDiv");
	var filelist=bzDiv.getElementsByTagName("input");
	var bzString="";
	var count=1;
	for(var j=0;j<filelist.length;j++){
		if(filelist.item(j).type=="checkbox"){
			if(filelist.item(j).checked==true){
				bzString=bzString+count+"、"+filelist.item(j).value+"\n";
				count++;
			}
		}
	}
	document.getElementById("aqcontent").value=bzString;
}
function sqfysx(idValue){
			if(idValue==1){
				document.getElementById("xzfysx2xzcf").style.display="block";
				document.getElementById("leibieTable").style.display="none";
				document.getElementById("xzfysx2xzqzcs").style.display="none";
				document.getElementById("xzfysx2xzsx").style.display="none";
				document.getElementById("leibie2Table").style.display="none";
			}else if(idValue==2){
				document.getElementById("xzfysx2xzcf").style.display="none";
				document.getElementById("xzfysx2xzqzcs").style.display="block";
				document.getElementById("leibieTable").style.display="none";
				document.getElementById("xzfysx2xzsx").style.display="none";
				document.getElementById("leibie2Table").style.display="none";
			}else if(idValue==3){
				document.getElementById("xzfysx2xzcf").style.display="none";
				document.getElementById("xzfysx2xzqzcs").style.display="none";
				document.getElementById("leibieTable").style.display="none";
				document.getElementById("xzfysx2xzsx").style.display="block";
				document.getElementById("leibie2Table").style.display="none";
			}else{
				document.getElementById("xzfysx2xzcf").style.display="none";
				document.getElementById("xzfysx2xzqzcs").style.display="none";
				document.getElementById("leibieTable").style.display="block";
				document.getElementById("xzfysx2xzsx").style.display="none";
				document.getElementById("leibie2Table").style.display="none";
			}

}

function leibieClose(){
	document.getElementById("leibieTable").style.display="none";
}

function checkRefer2(refer1Id,refer2Id){
	if(refer2Id!=0){
	document.getElementById(refer2Id).checked=true;
	}
	document.getElementById(refer1Id).checked=true;
	if(document.getElementById(refer1Id).value==1){
	document.getElementById("youxing").style.display="block";
	}else{
	document.getElementById("youxing").style.display="none";
	}
	closeKey1Div('count1Div1');
}


function checkRefer(refer1Id,refer2Id){
	if(refer2Id!=0){
	document.getElementById(refer2Id).checked=true;
	}
	document.getElementById(refer1Id).checked=true;
	if(document.getElementById(refer1Id).value==1){
	document.getElementById("youxing").style.display="block";
	}else{
	document.getElementById("youxing").style.display="none";
	}
}

function checkRefer1(refer1Id){
	document.getElementById(refer1Id).checked=true;
}


function checkCase(case2Id,caseId){
	document.getElementById(case2Id).checked=true;
	document.getElementById(caseId).checked=true;
}

function checkCase1(caseId){
	document.getElementById(caseId).checked=true;
}

function checkxz(idValue){
		document.getElementById(idValue).checked=true;
		var appTypeList2=document.getElementsByName("xzfyInfo.refer2")
		for(var i=0;i<appTypeList2.length;i++){
			if(appTypeList2.item(i).checked==true){
				appTypeList2.item(i).checked=false;
			}
		}
}

function checkFysx(ck){
	var appTypeList=document.getElementsByName("xzfyInfo.casetype");
		for(var i=0;i<appTypeList.length;i++){
			if(appTypeList.item(i).value==ck){
				appTypeList.item(i).checked=true;
			}
		}
	var appTypeList2=document.getElementsByName("xzfyInfo.casetype2")
		for(var i=0;i<appTypeList2.length;i++){
			if(appTypeList2.item(i).checked==true){
				appTypeList2.item(i).checked=false;
			}
		}
}
function setSqfy2(idValue){
	if(idValue==1 || idValue==2 || idValue==3 || idValue==4){
		var appTypeList=document.getElementsByName("xzfyInfo.casetype")
		for(var i=0;i<appTypeList.length;i++){
			if(appTypeList.item(i).value==1){
				appTypeList.item(i).checked=true;
			}
		}
		var appTypeList2=document.getElementsByName("xzfyInfo.casetype2")
		for(var i=0;i<appTypeList2.length;i++){
			if(appTypeList2.item(i).value==idValue){
				appTypeList2.item(i).checked=true;
			}
		}
	}else if(idValue==5 || idValue==6 || idValue==7){
		var appTypeList=document.getElementsByName("xzfyInfo.casetype")
		for(var i=0;i<appTypeList.length;i++){
			if(appTypeList.item(i).value==2){
				appTypeList.item(i).checked=true;
			}
		}
		var appTypeList2=document.getElementsByName("xzfyInfo.casetype2")
		for(var i=0;i<appTypeList2.length;i++){
			if(appTypeList2.item(i).value==idValue){
				appTypeList2.item(i).checked=true;
			}
		}
	}else if(idValue==8 || idValue==9 || idValue==10 || idValue==11){
		var appTypeList=document.getElementsByName("xzfyInfo.casetype")
		for(var i=0;i<appTypeList.length;i++){
			if(appTypeList.item(i).value==3){
				appTypeList.item(i).checked=true;
			}
		}
		var appTypeList2=document.getElementsByName("xzfyInfo.casetype2")
		for(var i=0;i<appTypeList2.length;i++){
			if(appTypeList2.item(i).value==idValue){
				appTypeList2.item(i).checked=true;
			}
		}
	}
	document.getElementById("leibieTable").style.display="block";
	document.getElementById("leibie2Table").style.display="none";
}


function setxz(idValue){
	if(idValue==1){		
		//document.getElementById("yxswlabel").style.display="block";
		//document.getElementById("yxswinput").style.display="block";
		document.getElementById("ajgllbga").style.display="block";
		document.getElementById("leibie2Table").style.display="block";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
	
	}
	else if(idValue==6){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="block";
		document.getElementById("leibie2Table").style.display="block";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
	}
	else if(idValue==7){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="block";
		document.getElementById("leibie2Table").style.display="block";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";

	}

	else if(idValue==8){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="block";
		document.getElementById("leibie2Table").style.display="block";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
	}
	else if(idValue==9){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="block";
		document.getElementById("leibie2Table").style.display="block";
		document.getElementById("ajgllbjkww").style.display="none";
	}
	else if(idValue==10){
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="block";
		document.getElementById("leibie2Table").style.display="block";
	}

	else
	{
		document.getElementById("ajgllbga").style.display="none";
		document.getElementById("ajgllbnlhz").style.display="none";
		document.getElementById("ajgllbcj").style.display="none";
		document.getElementById("ajgllbgjss").style.display="none";
		document.getElementById("ajgllbczjr").style.display="none";
		document.getElementById("ajgllbjkww").style.display="none";
		document.getElementById("leibie2Table").style.display="none";
	}
}


function setApp(divName,type){
	document.getElementById("tiqu").value="0";
	//alert("111");
	//closeSelect();
	if (type == 1){
		var top = 550;    
	} else {
		var top = 560; 
	}
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : top, 'left' : left + scrollLeft } ).show();   
//	var udiv=document.getElementById("appDiv");
//	var userspan=document.getElementById("appspan");
//	var areaObject=document.getElementById("shenqingren");
//
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x;
//	udiv.style.display="block";
	//userspan.style.display="none";
//	}
}

function setApp1(divName,type){
	document.getElementById("tiqu").value="0";
	//closeSelect();
	if (type == 1){
		var top = 10;    
	} else {
		var top = 560; 
	}
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : top, 'left' : 15} ).show();   
//	var udiv=document.getElementById("appDiv");
//	var userspan=document.getElementById("appspan");
//	var areaObject=document.getElementById("shenqingren");
//
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x;
//	udiv.style.display="block";
	//userspan.style.display="none";
//	}
}
function addApp(){
	
	var ob1=document.getElementById("appapp");
	var ins=document.getElementById("insapp");
	var tuser=document.getElementById("tapp");
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	handleList.item(0).value="";
	handleList.item(1).value="";
	handleList.item(2).value="";
	handleList.item(3).value="";
	var taList=ob1.getElementsByTagName("textarea");
	taList.item(0).value="";
	tuser.insertBefore(ob1,ins);
}

function closeApp(){
//	openSelect();
	
	document.getElementById("appDiv").style.display="none";
	var tuser=document.getElementById("tapp");
	var userString="";
	var bjdr1=document.getElementsByName("appsqr");
	var bsex=document.getElementsByName("appsex");
	var bnum=document.getElementsByName("appnum");
	var baddress=document.getElementsByName("appaddress");
	var bpost=document.getElementsByName("apppost");
	var bphone=document.getElementsByName("appphone");
	
	for(var i=0;i<bjdr1.length;i++){
		if(bjdr1.item(i).value==""){
			alert("请填写被申请人姓名！");return;
		}
		if(i<5){
		if(bnum.item(i).value==""){
			alert("请填写身份证号码！");return;
		}
		}
		userString=userString+bjdr1.item(i).value+"，"+bsex.item(i).value;
		if(bnum.item(i).value==""){userString=userString+"，";}
		else{userString=userString+"，身份证号"+bnum.item(i).value;}
			
		if(baddress.item(i).value==""){userString=userString+"，";}
		else{userString=userString+"，送达地址"+baddress.item(i).value;}
			
		if(bpost.item(i).value==""){userString=userString+"，";}
		else {userString=userString+"，邮编"+bpost.item(i).value;}
		
		if(bphone.item(i).value==""){userString=userString+"，";}
		else{ userString=userString+"，电话"+bphone.item(i).value;}
		
		userString=userString+"；"
	}
	
	var applicationsum=document.getElementById("rencount").value;
	document.getElementById("rencount").value=bjdr1.length;

	renCount();
	//userString=userString+"共计"+applicationsum+"人。";
	////var sqroldvalue = document.getElementById("shenqingren").value;
	document.getElementById("shenqingren").value=userString;
}

var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/; 
var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/; 
function closeApp_w(){//gongmin
//	openSelect();
	
	document.getElementById("appDiv").style.display="none";
	var tuser=document.getElementById("tapp");
	var bjdr1=document.getElementsByName("appsqr");
	var bsex=document.getElementsByName("appsex");
	var bnum=document.getElementsByName("appnum");
	var baddress=document.getElementsByName("appaddress");
	var bpost=document.getElementsByName("apppost");
	var bphone=document.getElementsByName("appphone");
	
	var userString="";
	var userString_cang="";
	var reg = new RegExp("^[0-9]*$");  
	
	for(var i=0;i<bjdr1.length;i++){
		if(bjdr1.item(i).value==""){
			alert("请填写被申请人姓名！");return;
		}
		if(bsex.item(i).value==""){
			alert("请填写被申请人性别！");return;
		}
		if(bnum.item(i).value==""){
			alert("请填写被申请人身份证号！");return;
		}else{
			if(!IdCardValidate(bnum.item(i).value)){
				alert("请输入正确格式的身份证号！");return;
				
			}
			
			
		}
		if(baddress.item(i).value==""){
			alert("请填写被申请人送达地址！");return;
		}
		if(bpost.item(i).value==""){
			alert("请填写被申请人邮编！");return;
		}else{
			
			if(!youzheng(bpost.item(i).value)){
				
				alert("请输入正确格式的邮政编码！");return;
			}
		}
		if(bphone.item(i).value==""){
			alert("请填写被申请人电话！");return;
		}else{
	    	
			 if(isMob.test(bphone.item(i).value)||isPhone.test(bphone.item(i).value)){ 
	    	       
	    	    }else{
	    	    	
	    	    	alert("请输入正确的电话格式！");return;
	    	    	
	    	    }
	    }
		userString=userString+"( "+(i+1)+" )"+bjdr1.item(i).value+"，"+bsex.item(i).value;
		userString_cang=userString_cang+bjdr1.item(i).value+"$"+bsex.item(i).value;
		if(bnum.item(i).value==""){
		
			userString=userString+"，";
			
		}
		else{
		
			userString=userString+"，身份证号："+bnum.item(i).value;
			userString_cang=userString_cang+"$身份证号"+bnum.item(i).value;
			
		}
			
		if(baddress.item(i).value==""){
			
			userString=userString+"，";
			}
		else{
			
			userString=userString+"，送达地址："+baddress.item(i).value;
			userString_cang=userString_cang+"$送达地址"+baddress.item(i).value;
		}
			
		if(bpost.item(i).value==""){
			userString=userString+"，";
			}
		else {
			userString=userString+"，邮编："+bpost.item(i).value;
			userString_cang=userString_cang+"$邮编"+bpost.item(i).value;
			}
		
		if(bphone.item(i).value==""){
			userString=userString+"，";
			}
		else{ 
			
			userString=userString+"，电话："+bphone.item(i).value;
			userString_cang=userString_cang+"$电话"+bphone.item(i).value;
			
		}
		
		userString=userString+"；"  
		userString_cang=userString_cang+"&"  
	}
	
	var applicationsum=document.getElementById("rencount").value;
	document.getElementById("rencount").value=bjdr1.length;

	renCount();
	//userString=userString+"共计"+applicationsum+"人。";
	////var sqroldvalue = document.getElementById("shenqingren").value;
	document.getElementById("shenqingren").value=userString+" 共计  "+bjdr1.length+" 人";
	document.getElementById("shenqingren_cang").value=userString_cang;
}


var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];    // 加权因子   
var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];            // 身份证验证位值.10代表X   
function IdCardValidate(idCard) {   //身份证校验实例
    idCard = trim(idCard.replace(/ /g, ""));               //去掉字符串头尾空格                     
    if (idCard.length == 15) {   
        return isValidityBrithBy15IdCard(idCard);       //进行15位身份证的验证    
    } else if (idCard.length == 18) {   
        var a_idCard = idCard.split("");                // 得到身份证数组   
        if(isValidityBrithBy18IdCard(idCard)&&isTrueValidateCodeBy18IdCard(a_idCard)){   //进行18位身份证的基本验证和第18位的验证
            return true;   
        }else {   
            return false;   
        }   
    } else {   
        return false;   
    }   
}   
/**  
 * 判断身份证号码为18位时最后的验证位是否正确  
 * @param a_idCard 身份证号码数组  
 * @return  
 */  
function isTrueValidateCodeBy18IdCard(a_idCard) {   
    var sum = 0;                             // 声明加权求和变量   
    if (a_idCard[17].toLowerCase() == 'x') {   
        a_idCard[17] = 10;                    // 将最后位为x的验证码替换为10方便后续操作   
    }   
    for ( var i = 0; i < 17; i++) {   
        sum += Wi[i] * a_idCard[i];            // 加权求和   
    }   
    valCodePosition = sum % 11;                // 得到验证码所位置   
    if (a_idCard[17] == ValideCode[valCodePosition]) {   
        return true;   
    } else {   
        return false;   
    }   
}   
/**  
  * 验证18位数身份证号码中的生日是否是有效生日  
  * @param idCard 18位书身份证字符串  
  * @return  
  */  
function isValidityBrithBy18IdCard(idCard18){   
    var year =  idCard18.substring(6,10);   
    var month = idCard18.substring(10,12);   
    var day = idCard18.substring(12,14);   
    var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
    // 这里用getFullYear()获取年份，避免千年虫问题   
    if(temp_date.getFullYear()!=parseFloat(year)   
          ||temp_date.getMonth()!=parseFloat(month)-1   
          ||temp_date.getDate()!=parseFloat(day)){   
            return false;   
    }else{   
        return true;   
    }   
}   
  /**  
   * 验证15位数身份证号码中的生日是否是有效生日  
   * @param idCard15 15位书身份证字符串  
   * @return  
   */  
  function isValidityBrithBy15IdCard(idCard15){   
      var year =  idCard15.substring(6,8);   
      var month = idCard15.substring(8,10);   
      var day = idCard15.substring(10,12);   
      var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));   
      // 对于老身份证中的你年龄则不需考虑千年虫问题而使用getYear()方法   
      if(temp_date.getYear()!=parseFloat(year)   
              ||temp_date.getMonth()!=parseFloat(month)-1   
              ||temp_date.getDate()!=parseFloat(day)){   
                return false;   
        }else{   
            return true;   
        }   
  }   
//去掉字符串头尾空格   
function trim(str) {   
    return str.replace(/(^\s*)|(\s*$)/g, "");   
}  

//邮件地址的验证（包含@和.）
function  youxiang(ss){
var re;
//var ss=document.getElementById(textboxid).value;
re= /\w@\w*\.\w/
if(re.test(ss))
	return true;
else
{
	return false; 
 //document.getElementById('label4').innerText="请输入正确的邮件地址！";
// document.getElementById('imagebutton1').disabled=true;
}
}
//邮政编码的验证（开头能为0，共6位）

//var ss=document.getElementById('TextBox4').value;
function youzheng(ss){
var re= /^[0-9]{6}$/
if(re.test(ss))
	return true;
else
{
	return false;

}
}
function closeApp_gaiqianbeifen(){
//	openSelect();
	
	document.getElementById("appDiv").style.display="none";
	var tuser=document.getElementById("tapp");
	var userString="";
	var bjdr1=document.getElementsByName("appsqr");
	var bsex=document.getElementsByName("appsex");
	var bnum=document.getElementsByName("appnum");
	var baddress=document.getElementsByName("appaddress");
	var bpost=document.getElementsByName("apppost");
	var bphone=document.getElementsByName("appphone");
	
	for(var i=0;i<bjdr1.length;i++){
		if(bjdr1.item(i).value==""){
			alert("请填写被申请人姓名！");return;
		}
		if(i<5){
		if(bnum.item(i).value==""){
			alert("请填写身份证号码！");return;
		}
		}
		userString=userString+bjdr1.item(i).value+"，"+bsex.item(i).value;
		if(bnum.item(i).value!="")
			userString=userString+"，身份证号"+bnum.item(i).value;
		if(baddress.item(i).value!="")
			userString=userString+"，送达地址"+baddress.item(i).value;
		if(bpost.item(i).value!="")
			userString=userString+"，邮编"+bpost.item(i).value;
		if(bphone.item(i).value!="")
			userString=userString+"，电话"+bphone.item(i).value;
		userString=userString+"；"
	}
	
	var applicationsum=document.getElementById("rencount").value;
	document.getElementById("rencount").value=bjdr1.length;

	renCount();
	//userString=userString+"共计"+applicationsum+"人。";
	////var sqroldvalue = document.getElementById("shenqingren").value;
	document.getElementById("shenqingren").value=userString;
}

function renCount()
{

	var cc = document.getElementById("rencount").value;
		for(var j=0; j<cc.length; j++)
		{
			if(cc.charAt(j)<'0' || cc.charAt(j)>'9')
			{
				alert("请输入数字");
				document.getElementById("rencount").value=1;
				return false;
			}else{

			}
		}


}


function deleteApp(e){
	var tuser=document.getElementById("tapp");
	if(tuser.getElementsByTagName("table").length>2){
	var deleteObject=e.parentNode.parentNode.parentNode.parentNode;
	tuser.removeChild(deleteObject);
	}
}

function setDeputy(divName,type){
	var isTiqu = document.getElementById("tiqu").value;
	if (isTiqu == 0){
		var dbr=""
		if (document.getElementById("applicationtype").value==1){
			appsqr=document.getElementsByName("appsqr");
		} else {
			appsqr=document.getElementsByName("frsqr");
		}
		for(var j=0;j<appsqr.length;j++){
			var htm=appsqr.item(j).value+"&nbsp;&nbsp;<input type='checkbox' name='depsqr' id='deputySqr' value='"+appsqr.item(j).value+"'/>";
			if (dbr==""){
				dbr=htm;
			} else {
				dbr+=htm; 
			}
		}
		$("#xuandbr").html(dbr);
	}
	//closeSelect($(divName));
	if (type == 1) {
		var top = 830;
	} else {
		var top = 730;
	}
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : top, 'left' : left + scrollLeft } ).show();   
//	var udiv=document.getElementById("deputyDiv");
//	var userspan=document.getElementById("deputyspan");
//	var areaObject=document.getElementById("deputy");
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x;
//	udiv.style.display="block";
	//userspan.style.display="none";
//	}
}

function setDeputy1(divName,type){
	var isTiqu = document.getElementById("tiqu").value;
	if (isTiqu == 0){
		var dbr=""
		if (document.getElementById("applicationtype").value==1){
			appsqr=document.getElementsByName("appsqr");
		} else {
			appsqr=document.getElementsByName("frsqr");
		}
		for(var j=0;j<appsqr.length;j++){
			var htm=appsqr.item(j).value+"&nbsp;&nbsp;<input type='checkbox' name='depsqr' id='deputySqr' value='"+appsqr.item(j).value+"'/>";
			if (dbr==""){
				dbr=htm;
			} else {
				dbr+=htm; 
			}
		}
		$("#xuandbr").html(dbr);
	}
	
	//closeSelect($(divName));
	if (type == 1) {
		var top = 200;
	} else {
		var top = 730;
	}
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : top, 'left' : left + scrollLeft } ).show();   
//	var udiv=document.getElementById("deputyDiv");
//	var userspan=document.getElementById("deputyspan");
//	var areaObject=document.getElementById("deputy");
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x;
//	udiv.style.display="block";
	//userspan.style.display="none";
//	}
}

function addDep(){
	var ob1=document.getElementById("dep");
	var ins=document.getElementById("insdep");
	var tuser=document.getElementById("tdep");
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("select");
	handleList.item(0).value="";
	tuser.insertBefore(ob1,ins);
}

function closeDep(){
//	openSelect();
	document.getElementById("deputyDiv").style.display="none";
	var tuser=document.getElementById("tdep");
	var userString="";
	var bjdr1=document.getElementsByName("depsqr");
	for(var i=0;i<bjdr1.length;i++){
		if (bjdr1[i].checked){
			userString=userString+bjdr1.item(i).value+"，";
		}
	}
	userString=userString.substring(0,userString.length - 1);

	document.getElementById("deputy").value=userString;
}

function deleteDep(e){
	var tuser=document.getElementById("tdep");
	if(tuser.getElementsByTagName("table").length>2){
	var deleteObject=e.parentNode.parentNode.parentNode.parentNode;
	tuser.removeChild(deleteObject);
	}
}


function setFr(divName,type){
	document.getElementById("tiqu").value="0";
	/*
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	*/
	if (type == 1) {
		var top = 560;
	} else {
		var top = 560;
	}
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : top, 'left' : left + scrollLeft } ).show();   
//	var udiv=document.getElementById("frDiv");
//	var userspan=document.getElementById("frspan");
//	var areaObject=document.getElementById("appname");
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x+10;
//	udiv.style.display="block";
//	}
}


function setFr1(divName,type){
	document.getElementById("tiqu").value="0";
	/*
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	*/
	if (type == 1) {
		var top = 10;
	} else {
		var top = 560;
	}
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : top, 'left' : 15 } ).show();   
//	var udiv=document.getElementById("frDiv");
//	var userspan=document.getElementById("frspan");
//	var areaObject=document.getElementById("appname");
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x+10;
//	udiv.style.display="block";
//	}
}

function addFr(){
	var ob1=document.getElementById("appfaren");
	var ins=document.getElementById("insfaren");
	var tuser=document.getElementById("tfaren");
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	for(var i=0;i<handleList.length;i++){
		if(handleList.item(i).isUser)
		handleList.item(i).value="";
	}
	var taList=ob1.getElementsByTagName("textarea");
	
	var taList2=ob1.getElementsByTagName("select");
	taList.item(0).value="";
	tuser.insertBefore(ob1,ins);
	
}

function checkFr(){
	var tuser=document.getElementById("tfaren");
	var userString="";
	var frsqr=document.getElementsByName("frsqr");
	var fuzeren=document.getElementsByName("fuzeren");
	var fzrlb=document.getElementsByName("fzrlb");
	var fzraddress=document.getElementsByName("fzraddress");
	var fzrpost=document.getElementsByName("fzrpost");
	var fzrtele=document.getElementsByName("fzrtele");
	var fzrother=document.getElementsByName("fzrother");
	for(var i=0;i<frsqr.length;i++){
		userString=userString+frsqr.item(i).value;
		if (frsqr.item(i).value==""){
			alert("请填写被申请人姓名！");return false;
		}
		
		if(fzrother.item(i).value!=0)
			userString=userString+"（"+fzrother.item(i).value+"）";
		if(fuzeren.item(i).value!="")
			userString=userString+"，"+fzrlb.item(i).value+"是："+fuzeren.item(i).value;
		if(fzraddress.item(i).value!="")
			userString=userString+"，送达地址"+fzraddress.item(i).value;
		if(fzrpost.item(i).value!="")
			userString=userString+"，邮编"+fzrpost.item(i).value;
		if(fzrtele.item(i).value!="")
			userString=userString+"，电话"+fzrtele.item(i).value;

		userString=userString+"；"
	}
	document.getElementById("rencount").value=frsqr.length;
	document.getElementById("appname").value=userString;
	renCount();
//	setAppname();
//	setCountAppname('shenqingren','rencount');
}
function checkFr_w(){  //faren
	var tuser=document.getElementById("tfaren");
	var frsqr=document.getElementsByName("frsqr");
	var fuzeren=document.getElementsByName("fuzeren");
	var fzrlb=document.getElementsByName("fzrlb");
	var fzraddress=document.getElementsByName("fzraddress");
	var fzrpost=document.getElementsByName("fzrpost");
	var fzrtele=document.getElementsByName("fzrtele");
	var fzrother=document.getElementsByName("fzrother");
	
	var userString="";
	var userString_cang="";
	for(var i=0;i<frsqr.length;i++){
		
		
		userString=userString+"("+(i+1)+")"+frsqr.item(i).value;
		userString_cang=userString_cang+frsqr.item(i).value;
		
		if (frsqr.item(i).value==""){
			alert("请填写申请人姓名！");return false;
		}
		if (fuzeren.item(i).value==""){
			alert("请填写代表人姓名！");return false;
		}
		if (fzrlb.item(i).value==""){
			alert("请填写代表人类别！");return false;
		}
		if (fzraddress.item(i).value==""){
			alert("请填写申请人送达地址！");return false;
		}
		if (fzrpost.item(i).value==""){
			alert("请填写申请人邮编！");return false;
		}else{
			
			if(!youzheng(fzrpost.item(i).value)){
				
				alert("请输入正确格式的邮政编码！");return;
			}
		}
		if (fzrtele.item(i).value==""){
			alert("请填写申请人电话！");return false;
		}else{
	    	
			 if(isMob.test(fzrtele.item(i).value)||isPhone.test(fzrtele.item(i).value)){ 
	    	       
	    	    }else{
	    	    	
	    	    	alert("请输入正确的电话格式！");return;
	    	    	
	    	    }
	    }
		if (fzrother.item(i).value==""){
			alert("请填写申请人其他！");return false;
		}
		
		if(fzrother.item(i).value!=0)
			{userString=userString+"（"+fzrother.item(i).value+"）";
			userString_cang=userString_cang+"$"+fzrother.item(i).value;}
		else{
			userString_cang=userString_cang+"$"+fzrother.item(i).value;
			
		}
		if(fuzeren.item(i).value!="")
			{
			     userString=userString+"，"+fzrlb.item(i).value+"是："+fuzeren.item(i).value;
			userString_cang=userString_cang+"$"+fzrlb.item(i).value+"$"+fuzeren.item(i).value;
			}
		if(fzraddress.item(i).value!="")
			
			{
			userString=userString+"，送达地址"+fzraddress.item(i).value;
			userString_cang=userString_cang+"$"+fzraddress.item(i).value;

			
			}
		if(fzrpost.item(i).value!="")
			{
			userString=userString+"，邮编"+fzrpost.item(i).value;
			userString_cang=userString_cang+"$"+fzrpost.item(i).value;
			
			
			}
		if(fzrtele.item(i).value!="")
			{
			userString=userString+"，电话"+fzrtele.item(i).value;
			userString_cang=userString_cang+"$"+fzrtele.item(i).value;
			
			
			}
		userString=userString+"；"
		userString_cang=userString_cang+"&"

	}
	document.getElementById("rencount").value=frsqr.length;
	document.getElementById("appname").value=userString+"  共"+frsqr.length+" 人";
	document.getElementById("appname_cang").value=userString_cang;
	renCount();
//	setAppname();
//	setCountAppname('shenqingren','rencount');
}




function setFrCount(){
	document.getElementById("rencount").value=document.getElementById("arencount").value;
}

function setFrCount1(){
	document.getElementById("arencount").value=document.getElementById("rencount").value;
}

function deleteFr(e){
	var tuser=document.getElementById("tfaren");
	if(tuser.getElementsByTagName("table").length>2){
	var deleteObject=e.parentNode.parentNode.parentNode.parentNode;
	tuser.removeChild(deleteObject);
	}
}

function closeDivById(divId){

	document.getElementById(divId).style.display="none";
}

function openXw(divName){
	/*
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	*/
	if (document.getElementById("rencount").value >= 6){
		var top = 1000;    
	} else {
		var top = 880;
	}
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : top, 'left' : left + scrollLeft } ).show();   
	
//	var udiv=document.getElementById("xwDiv");
//	var userspan=document.getElementById("xwspan");
//	var areaObject=document.getElementById("mingan");
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x+10;
//	udiv.style.display="block";
//	}
}


function openXw1(divName){
	/*
	var selectList=document.getElementsByTagName("select");
	for(var i=0;i<selectList.length;i++){
		if(selectList.item(i).retSelect){

		}else{
			selectList.item(i).style.display="none";
		}
	}
	*/
	if (document.getElementById("rencount").value >= 6){
		var top = 1000;    
	} else {
		var top = 880;
	}
    var left = ($(window).width() - $(divName).width())/2;    
    var scrollTop = $(document).scrollTop();    
    var scrollLeft = $(document).scrollLeft();    
    $(divName).css( { position : 'absolute', 'top' : 450, 'left' : left + scrollLeft } ).show();   
	
//	var udiv=document.getElementById("xwDiv");
//	var userspan=document.getElementById("xwspan");
//	var areaObject=document.getElementById("mingan");
//	if(udiv.style.display!="block"){
//	ev = ev || window.event;
//	var mousePos = getPosition(areaObject);
//	udiv.style.position = "absolute";
//	udiv.style.top      = mousePos.y+20;
//	udiv.style.left     = mousePos.x+10;
//	udiv.style.display="block";
//	}
}

function addXw(){
	var ob1=document.getElementById("xwapp");
	var ins=document.getElementById("insxw");
	var tuser=document.getElementById("txw");
	ob1=ob1.cloneNode(true);
	var handleList=ob1.getElementsByTagName("input");
	for(var i=0;i<handleList.length;i++){
		if(handleList.item(i).isUser)
		handleList.item(i).value="";
	}
	tuser.insertBefore(ob1,ins);
}


function checkXw(){//原始内网页面用
	var tuser=document.getElementById("txw");
	var userString="";
	var userStringAll="";
	var frsqr=document.getElementsByName("xzfyInfo.xwname");
	var fuzeren=document.getElementsByName("xzfyInfo.xwnum");
	var zd1=document.getElementsByName("zd1");
	var zd2=document.getElementsByName("zd2");
	var zd3=document.getElementsByName("zd3");
	var tujing=document.getElementsByName("tujing");

//	var oldvalue=document.getElementById("xw_an_old").value;
	
	var userString1="";
	var userString2="";
	var xingwei1="";
	var xingwei2="";
	for(var i=0;i<frsqr.length;i++){
		var n=i+1;
		if(frsqr.length==1){
			if(frsqr.item(i).value=="") {
				alert("被复议的具体行为-名称");
				return false;;
			}
			userString=userString+frsqr.item(i).value;
			userString1=userString1+frsqr.item(i).value+"；";
			userStringAll=userStringAll+frsqr.item(i).value;
			if(fuzeren.item(i).value!=""){
				userString=userString+"（"+fuzeren.item(i).value+"）";
				userStringAll=userStringAll+"（"+fuzeren.item(i).value+"）；";
				userString2=userString2+fuzeren.item(i).value+"；";
			} 
			var zdate="";
			if(zd1.item(i).value!=0){
			zdate=zd1.item(i).value+"年";
			if(zd2.item(i).value!=0){
				zdate=zdate+zd2.item(i).value+"月";
				if(zd3.item(i).value!=0){
					zdate=zdate+zd3.item(i).value+"日";
				}	
			}
			}
			if(zdate!=""){
				userStringAll=userStringAll+"知道时间："+zdate;
				document.getElementById("buzheng_from").value=zdate;
			}
			
			if(tujing.item(i).value!=""){
				userStringAll=userStringAll+"（"+tujing.item(i).value+"）；";
				document.getElementById("buzheng_from").value=document.getElementById("buzheng_from").value+"（"+tujing.item(i).value+"）";
			}else{
				userStringAll=userStringAll+"；";
			}
		}else{
			if(frsqr.item(i).value=="") {
				alert("被复议的具体行为-名称");
				return false;
			}
			userString=userString+"（"+n+"）"+frsqr.item(i).value;
			userString1=userString1+"（"+n+"）"+frsqr.item(i).value+"；";
			userStringAll=userStringAll+"（"+n+"）"+frsqr.item(i).value+"；";
			if(fuzeren.item(i).value!=""){
				userString=userString+"（"+fuzeren.item(i).value+"）";
				userString2=userString2+n+fuzeren.item(i).value+"；";
				userStringAll=userStringAll+fuzeren.item(i).value+"；";
			}
			var zdate="";
			if(zd1.item(i).value!=0){
			zdate=zd1.item(i).value+"年";
			if(zd2.item(i).value!=0){
				zdate=zdate+zd2.item(i).value+"月";
				if(zd3.item(i).value!=0){
					zdate=zdate+zd3.item(i).value+"日";
				}	
			}
			}
			if(zdate!=""){
				userStringAll=userStringAll+"知道时间："+zdate;
				document.getElementById("buzheng_from").value=zdate;
			}
			if(tujing.item(i).value!=""){
				userStringAll=userStringAll+"（"+tujing.item(i).value+"）；";
				document.getElementById("buzheng_from").value=document.getElementById("buzheng_from").value+"（"+tujing.item(i).value+"）；";
			}else{
				userStringAll=userStringAll+"；";
			}
		}
		if(i<frsqr.length-1)
			userString=userString+"；";
		else
			userString=userString+"。";
	}
	document.getElementById("xingwei1").value=userString;
	
	document.getElementById("xingwei").value=userString1;
	//document.getElementById("anum").value=userString2;

	for(var j=0;j<tujing.length;j++){
		var n=j+1;
		var zdate="";
		if(zd1.item(j).value!=0){
			zdate=zd1.item(j).value+"年";
			if(zd2.item(j).value!=0){
				zdate=zdate+zd2.item(j).value+"月";
				if(zd3.item(j).value!=0){
					zdate=zdate+zd3.item(j).value+"日";
				}	
			}
		}
		if(tujing.length==1){
			xingwei2=xingwei2+zdate;
			if(tujing.item(j).value!=""){
				xingwei2=xingwei2+"（"+tujing.item(j).value+"）";
			}
		}else{
			xingwei2=xingwei2+"（"+n+"）"+zdate;
			if(tujing.item(j).value!=""){
				xingwei2=xingwei2+"（"+tujing.item(j).value+"）";
			}
		}
		if(j<tujing.length-1)
			xingwei2=xingwei2+"；";
		else
			xingwei2=xingwei2+"。";
	}
	document.getElementById("xingwei2").value=xingwei2;
	userString=userString+"<br>"+xingwei2;
	document.getElementById("xw_an").innerHTML=userStringAll;
	document.getElementById("require_fy").value=userStringAll;
}

function checkXw_zl(){ //转录页面用
	var tuser=document.getElementById("txw");
	var userString="";
	var userStringAll="";
	var frsqr=document.getElementsByName("xzfyInfo.xwname");
	var fuzeren=document.getElementsByName("xzfyInfo.xwnum");
	var zd1=document.getElementsByName("zd1");
	var zd2=document.getElementsByName("zd2");
	var zd3=document.getElementsByName("zd3");
	var tujing=document.getElementsByName("tujing");

	var oldvalue=document.getElementById("xw_an_old").value;
	
	var userString1="";
	var userString2="";
	var xingwei1="";
	var xingwei2="";
	for(var i=0;i<frsqr.length;i++){
		var n=i+1;
		if(frsqr.length==1){
			if(frsqr.item(i).value=="") {
				alert("被复议的具体行为-名称");
				return false;;
			}
			userString=userString+frsqr.item(i).value;
			userString1=userString1+frsqr.item(i).value+"；";
			userStringAll=userStringAll+frsqr.item(i).value;
			if(fuzeren.item(i).value!=""){
				userString=userString+"（"+fuzeren.item(i).value+"）";
				userStringAll=userStringAll+"（"+fuzeren.item(i).value+"）；";
				userString2=userString2+fuzeren.item(i).value+"；";
			} 
			var zdate="";
			if(zd1.item(i).value!=0){
			zdate=zd1.item(i).value+"年";
			if(zd2.item(i).value!=0){
				zdate=zdate+zd2.item(i).value+"月";
				if(zd3.item(i).value!=0){
					zdate=zdate+zd3.item(i).value+"日";
				}	
			}
			}
			if(zdate!=""){
				userStringAll=userStringAll+"知道时间："+zdate;
				document.getElementById("buzheng_from").value=zdate;
			}
			
			if(tujing.item(i).value!=""){
				userStringAll=userStringAll+"（"+tujing.item(i).value+"）；";
				document.getElementById("buzheng_from").value=document.getElementById("buzheng_from").value+"（"+tujing.item(i).value+"）";
			}else{
				userStringAll=userStringAll+"；";
			}
		}else{
			if(frsqr.item(i).value=="") {
				alert("被复议的具体行为-名称");
				return false;
			}
			userString=userString+"（"+n+"）"+frsqr.item(i).value;
			userString1=userString1+"（"+n+"）"+frsqr.item(i).value+"；";
			userStringAll=userStringAll+"（"+n+"）"+frsqr.item(i).value+"；";
			if(fuzeren.item(i).value!=""){
				userString=userString+"（"+fuzeren.item(i).value+"）";
				userString2=userString2+n+fuzeren.item(i).value+"；";
				userStringAll=userStringAll+fuzeren.item(i).value+"；";
			}
			var zdate="";
			if(zd1.item(i).value!=0){
			zdate=zd1.item(i).value+"年";
			if(zd2.item(i).value!=0){
				zdate=zdate+zd2.item(i).value+"月";
				if(zd3.item(i).value!=0){
					zdate=zdate+zd3.item(i).value+"日";
				}	
			}
			}
			if(zdate!=""){
				userStringAll=userStringAll+"知道时间："+zdate;
				document.getElementById("buzheng_from").value=zdate;
			}
			if(tujing.item(i).value!=""){
				userStringAll=userStringAll+"（"+tujing.item(i).value+"）；";
				document.getElementById("buzheng_from").value=document.getElementById("buzheng_from").value+"（"+tujing.item(i).value+"）；";
			}else{
				userStringAll=userStringAll+"；";
			}
		}
		if(i<frsqr.length-1)
			userString=userString+"；";
		else
			userString=userString+"。";
	}
	document.getElementById("xingwei1").value=userString;
	
	document.getElementById("xingwei").value=userString1;
	//document.getElementById("anum").value=userString2;

	for(var j=0;j<tujing.length;j++){
		var n=j+1;
		var zdate="";
		if(zd1.item(j).value!=0){
			zdate=zd1.item(j).value+"年";
			if(zd2.item(j).value!=0){
				zdate=zdate+zd2.item(j).value+"月";
				if(zd3.item(j).value!=0){
					zdate=zdate+zd3.item(j).value+"日";
				}	
			}
		}
		if(tujing.length==1){
			xingwei2=xingwei2+zdate;
			if(tujing.item(j).value!=""){
				xingwei2=xingwei2+"（"+tujing.item(j).value+"）";
			}
		}else{
			xingwei2=xingwei2+"（"+n+"）"+zdate;
			if(tujing.item(j).value!=""){
				xingwei2=xingwei2+"（"+tujing.item(j).value+"）";
			}
		}
		if(j<tujing.length-1)
			xingwei2=xingwei2+"；";
		else
			xingwei2=xingwei2+"。";
	}
	document.getElementById("xingwei2").value=xingwei2;
	userString=userString+"<br>"+xingwei2;
	document.getElementById("xw_an").innerHTML=oldvalue+  userStringAll;
	document.getElementById("require_fy").value=oldvalue+ userStringAll;
}

function checkXw_w(){//外网页面用
	var tuser=document.getElementById("txw");
	var frsqr=document.getElementsByName("xzfyInfo.xwname");//复议名称，即是字符串项，也是数据库表单项
	var fuzeren=document.getElementsByName("xzfyInfo.xwnum");//复议文号，即是字符串项，也是数据库表单项
	var zd1=document.getElementsByName("zd1");//知道时间 年
	var zd2=document.getElementsByName("zd2");//知道时间 月
	var zd3=document.getElementsByName("zd3");//知道时间  日
	var tujing=document.getElementsByName("tujing"); //知道途径

//	var oldvalue=document.getElementById("xw_an_old").value;
	
	//名称1$文号1$1998-2-3$途径1&
	//名称$文号$1997-2-3$途径&名称$文号$2013-6-16$途径&
	var userString="";
	//userString: "文书名称（文书文号）。<br>2005年10月17日（途径为他人告知）。
	//userString: "（1）文书名称（文书文号）；（2）文书名称（文书文号）。<br>（1）2005年10月17日（途径为他人告知）；（2）2015年6月14日（城管告知）。"
	var userStringAll="";
	var userStringAll_cang="";
	//userStringAll: "（1）文书名称；文书文号；知道时间：2005年10月17日（途径为他人告知）；（2）文书名称；文书文号；知道时间：2015年6月14日（城管告知）；"
	//userStringAll: "文书名称（文书文号）；知道时间：2005年10月17日（途径为他人告知）；"
	var userString1="";
	//userString1: "文书名称；"
	//userString1: "（1）文书名称；（2）文书名称；"
	var userString2="";
	//userString2: "1文书文号；2文书文号；"
	//userString2: "文书文号；"
	var xingwei1="";
	//无值
	var xingwei2="";
	var jianshu="";
	//xingwei2: "（1）2005年10月17日（途径为他人告知）；（2）2015年6月14日（城管告知）。"
	//xingwei2: "2005年10月17日（途径为他人告知）。"
	for(var i=0;i<frsqr.length;i++){
			var n=i+1;
			if(frsqr.length==1){ //一个案子的时候
					if(frsqr.item(i).value=="") {  //为空验证
						alert("被复议的具体行为-名称");
						return false;;
					}
					userString=userString+frsqr.item(i).value;
					userString1=userString1+frsqr.item(i).value+"；";
					userStringAll=userStringAll+frsqr.item(i).value;
					userStringAll_cang=userStringAll_cang+frsqr.item(i).value;
					if(fuzeren.item(i).value!=""){
						userString=userString+"（"+fuzeren.item(i).value+"）";
						userStringAll=userStringAll+"（"+fuzeren.item(i).value+"）；";
						
						jianshu=fuzeren.item(i);
						userStringAll_cang=userStringAll_cang+"$"+fuzeren.item(i).value+"$";
						userString2=userString2+fuzeren.item(i).value+"；";
					} 
					var zdate="";
					var zdate_cang="";
					if(zd1.item(i).value!=0){
					zdate=zd1.item(i).value+"年";
					zdate_cang=zd1.item(i).value+"-";
					if(zd2.item(i).value!=0){
						zdate=zdate+zd2.item(i).value+"月";
						zdate_cang=zdate_cang+zd2.item(i).value+"-";
						if(zd3.item(i).value!=0){
							zdate=zdate+zd3.item(i).value+"日";
							zdate_cang=zdate_cang+zd3.item(i).value;
						}	
					}
					}
					if(zdate!=""){
						userStringAll=userStringAll+"知道时间："+zdate;
						userStringAll_cang=userStringAll_cang+zdate_cang;
						
						document.getElementById("buzheng_from").value=zdate;
					}
					
					if(tujing.item(i).value!=""){
						userStringAll=userStringAll+"（"+tujing.item(i).value+"）；";
						userStringAll_cang=userStringAll_cang+"$"+tujing.item(i).value+"&";
						
						document.getElementById("buzheng_from").value=document.getElementById("buzheng_from").value+"（"+tujing.item(i).value+"）";
					}else{
						userStringAll=userStringAll+"；";
					}
		 }else{//多个案子的时候。
					if(frsqr.item(i).value=="") {
						alert("被复议的具体行为-名称");
						return false;
					}
					userString=userString+"（"+n+"）"+frsqr.item(i).value;
					userString1=userString1+"（"+n+"）"+frsqr.item(i).value+"；";
					userStringAll=userStringAll+"（"+n+"）"+frsqr.item(i).value+"；";
					userStringAll_cang=userStringAll_cang+frsqr.item(i).value+"$";
					
					if(fuzeren.item(i).value!=""){
						userString=userString+"（"+fuzeren.item(i).value+"）";
						userString2=userString2+n+fuzeren.item(i).value+"；";
						userStringAll=userStringAll+fuzeren.item(i).value+"；";
						userStringAll_cang=userStringAll_cang+fuzeren.item(i).value+"$";
					}
					var zdate="";
					var zdate_cang="";
					if(zd1.item(i).value!=0){
					zdate=zd1.item(i).value+"年";
					zdate_cang=zd1.item(i).value+"-";
					if(zd2.item(i).value!=0){
						zdate=zdate+zd2.item(i).value+"月";
						zdate_cang=zdate_cang+zd2.item(i).value+"-";
						if(zd3.item(i).value!=0){
							zdate=zdate+zd3.item(i).value+"日";
							zdate_cang=zdate_cang+zd3.item(i).value;
						}	
					}
					}
					if(zdate!=""){
						userStringAll=userStringAll+"知道时间："+zdate;
						userStringAll_cang=userStringAll_cang+zdate_cang;
						document.getElementById("buzheng_from").value=zdate;
					}
					if(tujing.item(i).value!=""){
						userStringAll=userStringAll+"（"+tujing.item(i).value+"）；";
						userStringAll_cang=userStringAll_cang+"$"+tujing.item(i).value+"&";
						document.getElementById("buzheng_from").value=document.getElementById("buzheng_from").value+"（"+tujing.item(i).value+"）；";
					}else{
						userStringAll=userStringAll+"；";
						userStringAll_cang=userStringAll_cang+"&";
					}
			}
				if(i<frsqr.length-1)
					userString=userString+"；";
				else
					userString=userString+"。";
	}
	document.getElementById("xingwei1").value=userString;
	
	document.getElementById("xingwei").value=userString1;
	//document.getElementById("anum").value=userString2;

	for(var j=0;j<tujing.length;j++){
			var n=j+1;
			var zdate="";
			if(zd1.item(j).value!=0){
				zdate=zd1.item(j).value+"年";
				if(zd2.item(j).value!=0){
					zdate=zdate+zd2.item(j).value+"月";
					if(zd3.item(j).value!=0){
						zdate=zdate+zd3.item(j).value+"日";
					}	
				}
			}
			if(tujing.length==1){
				xingwei2=xingwei2+zdate;
				if(tujing.item(j).value!=""){
					xingwei2=xingwei2+"（"+tujing.item(j).value+"）";
				}
			}else{
				xingwei2=xingwei2+"（"+n+"）"+zdate;
				if(tujing.item(j).value!=""){
					xingwei2=xingwei2+"（"+tujing.item(j).value+"）";
				}
			}
			if(j<tujing.length-1)
				xingwei2=xingwei2+"；";
			else
				xingwei2=xingwei2+"。";
	}
	document.getElementById("xingwei2").value=xingwei2;
	userString=userString+"<br>"+xingwei2;
	document.getElementById("xw_an").innerHTML=  userStringAll +"共"+jianshu+"件";
	document.getElementById("require_fy").value= userStringAll +"共"+jianshu+"件";
	document.getElementById("xw_an_cang").value=userStringAll_cang;
	
}



function closeDivXw(){
	checkXw();
	closeDivById('xwDiv');
}

function closeDivXw_w(){
	checkXw_w();
	closeDivById('xwDiv');
}


function deleteXw(e){
	var tuser=document.getElementById("txw");
	if(tuser.getElementsByTagName("table").length>=2){
		var deleteObject=e.parentNode.parentNode.parentNode.parentNode;
		tuser.removeChild(deleteObject);
	}
}


function setFT(){
	if(document.getElementById("finishtype1").value==8){
		document.getElementById("finishtype2").style.display="block";
	}else{
		document.getElementById("finishtype2").style.display="none";
	}
}

function  setJDCL(recp2){
	var ms=document.getElementById("menuSave").value;
	var cr=document.getElementById("countRs").innerHTML;
	if(recp2==21){
		ms=ms+" | 接待处理->告知、解释规定（申请复议有关知识）";
		cr=cr+" | 接待处理->告知、解释规定（申请复议有关知识）";
	}else if(recp2==22){
		ms=ms+" | 接待处理->告知补正（明确表述，补齐材料）";
		cr=cr+" | 接待处理->告知补正（明确表述，补齐材料）";
	}else if(recp2==23){
		ms=ms+" | 接待处理->告知因没有利害关系，不符合受理条件";
		cr=cr+" | 接待处理->告知因没有利害关系，不符合受理条件";
	}else if(recp2==24){
		ms=ms+" | 接待处理->因其他机关已受理，或法院已受理，不符合受理条件";
		cr=cr+" | 接待处理->因其他机关已受理，或法院已受理，不符合受理条件";
	}else if(recp2==25){
		ms=ms+" | 接待处理->超过复议期限,不符合受理条件";
		cr=cr+" | 接待处理->超过复议期限,不符合受理条件";
	}else if(recp2==26){
		ms=ms+" | 接待处理->不属于市政府职责范围，不符合受理条件";
		cr=cr+" | 接待处理->不属于市政府职责范围，不符合受理条件";
	}else if(recp2==27){
		ms=ms+" | 接待处理->告知其他事项";
		cr=cr+" | 接待处理->告知其他事项";
	}else if(recp2==2){
		ms=ms+" | 接待处理->书面告知补正";
		cr=cr+" | 接待处理->书面告知补正";
	}else if(recp2==3){
		ms=ms+" | 接待处理->接收复议申请材料";
		cr=cr+" | 接待处理->接收复议申请材料";
	}
	document.getElementById("menuSave").value=ms;
	document.getElementById("countRs").innerHTML=cr;
	document.getElementById("jdcl1").style.display="none";
}

function openInfo(faceid,funcCode){
	window.open ('../jds/getInfo1.action?id='+faceid+"&funcCode="+funcCode,'newwindow','toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes'); 
}

function checkKeyWord(){
	var recp=0;
	var disList = document.getElementsByName("xzfyInfo.reception");
	for(var i=0;i<disList.length;i++){
		if(disList.item(i).checked==true){
			recp=disList.item(i).value;

		}
	}
	var recp2=0;
	var disList0 = document.getElementsByName("xzfyInfo.reception2");
	for(var i=0;i<disList0.length;i++){
		if(disList0.item(i).checked==true){
			recp2=disList0.item(i).value;

		}
	}

	var casetype=0;
	var disList1 = document.getElementsByName("xzfyInfo.casetype");
	for(var i=0;i<disList1.length;i++){
		if(disList1.item(i).checked==true){
			casetype=disList1.item(i).value;

		}
	}
	var refer=0;
	var disList2 = document.getElementsByName("xzfyInfo.refer");
	for(var i=0;i<disList2.length;i++){
		if(disList2.item(i).checked==true){
			refer=disList2.item(i).value;

		}
	}

	var keyword2=0;
	var disList3 = document.getElementsByName("xzfyInfo.keyword2");
	for(var i=0;i<disList3.length;i++){
		if(disList3.item(i).checked==true){
			keyword2=disList3.item(i).value;

		}
	}

	var keyword3=0;
	var disList4 = document.getElementsByName("xzfyInfo.keyword3");
	for(var i=0;i<disList4.length;i++){
		if(disList4.item(i).checked==true){
			keyword3=disList4.item(i).value;

		}
	}
	var key=document.getElementById("keyword").value;
	if(key==1){
		if(recp==0){
			alert("请选择接待处理意见");
			return false;
		}else if(casetype==0){
			alert("请选择申请复议事项");
			return false;
		}else if(refer==0){
			alert("请选择行政管理类别");
			return false;
		}else{
			if(recp==1){
				if(recp2==0){
					alert("请选择接待处理意见");
					return false;
				}else{
					return true;
				}
			}else{
				return true;
			}
		}
	}else if(key==2){
		if(recp<4){
			alert("请选择接待处理意见");
			return false;
		}else if(keyword2==0){
			alert("请选择申请复议事项");
			return false;
		}else{
				return true;
		}	
	}else if(key==3){
		 if(keyword3==0){
			alert("请选择复议审理");
			return false;
		}else{
				return true;
		}

	}else{
		alert("请选择统计关键词");
			return false;
	}
}

function check_qtfyjg(idValue){
	if(idValue==1)
		document.getElementById("qtfyjg").style.display="block";
	else
		document.getElementById("qtfyjg").style.display="none";
		//document.getElementById("shuoming").value="";
}

function checkComma(obj){
	var c=obj.value;
	if (c.indexOf("，")>-1){
		alert("不能含有，字符！");
	}
}
/***********************************Ajax---Begin***********************************/

/***********************************Ajax---End***********************************/
/***********************************以下为计算坐标用，不需要理解***********************************/
Number.prototype.NaN0=function(){return isNaN(this)?0:this;}
function getMouseOffset(target, ev){
ev = ev || window.event;
var docPos    = getPosition(target);
var mousePos  = mouseCoords(ev);
return {x:mousePos.x - docPos.x, y:mousePos.y - docPos.y};
}
function getPosition(e){
var left = 0;
var top  = 0;
while (e.offsetParent){
left += e.offsetLeft + (e.currentStyle?(parseInt(e.currentStyle.borderLeftWidth)).NaN0():0);
top  += e.offsetTop  + (e.currentStyle?(parseInt(e.currentStyle.borderTopWidth)).NaN0():0);
e     = e.offsetParent;
}
left += e.offsetLeft + (e.currentStyle?(parseInt(e.currentStyle.borderLeftWidth)).NaN0():0);
top  += e.offsetTop  + (e.currentStyle?(parseInt(e.currentStyle.borderTopWidth)).NaN0():0);
return {x:left, y:top};
}
function mouseCoords(ev){
if(ev.pageX || ev.pageY){
return {x:ev.pageX, y:ev.pageY};
}
return {
x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
y:ev.clientY + document.body.scrollTop  - document.body.clientTop
};
} 