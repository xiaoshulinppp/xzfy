<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<link href="../pages/css/base.css" rel="stylesheet" type="text/css">
<link href="../pages/css/notice.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="js/lhgdialog.min.js"></script>
<title>教育培训中心</title>
</head>
<body>
	<div class="main">
    	<div class="logo">
        	<img src="../pages/img/name.png"/>
        </div>
        <div class="content">
        	<div class="top_title">
            	<p>申请须知</p>
                <a href="javascript:gotoIndexPage();">返回首页</a>
            </div>
            <div class="mian_cont">
            	<div class="xztitle">北京市人民政府法制办公室&#12288;行政复议信息服务平台须知</div>
                <ul class="yd">
                    <li><a href="javascript:void(0);" class="main_text">阅读行政复议信息服务平台须知</a><span class="ydbg"></span></li>
                    <li><a href="javascript:void(0);" class="main_text">按要求填写信息并通过手机进行验证<span class="lfsj"></span></a><span class="ydbg"></span></li>
                    <li><a href="javascript:void(0);" class="main_textpad">自行或到接待场所现场打印行政复议申请书<span class="lfsj"></span></a><span class="ydbg"></span></li>
                    <li class="marnone"><a href="javascript:void(0);">对行政复议申请书和提交的相关材料进行签字确认，当面或邮寄提交<span class="lfsj"></span></a><span class="ydbg"></span></li>
                </ul>
                    
				<div class="jd">
                	<p class="jdsite">接待地点：北京市东城区正义路1号&#12288;市政府行政复议接待室</p>
                    <p class="jdtime">接待时间：8:30~12:00&#12288;&#12288;13:30~16:00</p>
                </div>
                <div class="xian"></div>
                <div class="content_text">
                	<p class="tophead"> 您好！在您填写信息之前，请认真阅读并了解以下内容：</p>
                    <p class="contentwz">
                    	<span>一、本平台为自动的行政复议信息服务平台，信息提示仅供参考。</span>
                        为方便群众申请行政复议，提高工作效率和规范化水平， 我们开通行政复议信息服务平台。如果您希望申请行政复议，请认真填写相关信息，平台将自动生成规范的《行政复议申请书》，并自动提示申请行政复议期限、应当提交的证据材料、提交方式等信息。由于提示信息由系统自动生成，并非人工操作，因此仅供您参考。申请人未在本平台填写信息的，不影响其依法行使行政复议权利。
                    </p>
                    <p class="contentwz">
                    	<span>二、在本平台保存基本信息，不视为已经向行政复议机关提出了行政复议申请。</span>
                        您在“行政复议信息服务平台”填写、保存的信息，是您申请行政复议所必须提供的基本信息。除基本信息之外，申请人还需依法向行政复议机构提供相关证据材料，并应当在申请书上签名、盖章。上述步骤暂无法在线进行，申请人需要以邮寄或者当面确认形式完成。因此，您在“行政复议信息服务平台”保存信息，不能视为已经向行政复议机关提出了行政复议申请。
                    </p>
                    <p class="contentwz">
                    	<span>三、未在法定期限内向行政复议机关申请行政复议的，法律后果由申请人自行承担。</span>
                        保存信息后，申请人应当在法定申请期限内，向行政复议机构提交齐全的行政复议申请材料。提交申请材料分为邮寄和当面两种方式：申请人保存信息后，可以打印自动生成的《行政复议申请书》（一式两份），签名或盖章后，连同其他申请材料一并邮寄给行政复议机构；申请人也可以携带其他申请材料到行政复议机构现场确认，并可在现场免费打印行政复议申请书。只有通过以上两种方式提交申请材料，才视为已经向行政复议机关提出了行政复议申请。未在法定请期限内提出行政复议申请的，法律后果由申请人自行承担。
                    </p>
                </div>
          
            </div>
            <div class="ybutton">
            	<label style="cursor:pointer;">
           		 <input id="agreement" type="checkbox" class="check" value="checkbox"> <span class="cor">我已阅读并同意</span>在线服务平台申请须知
                </label>
               <p class="tj" onclick="javascript:checkAgreement();">提交</p>
            </div>
        </div>
    </div>
</body>
</html>
<script type="text/javascript">
function checkAgreement(){
    if (document.getElementById("agreement").checked == false){
		alert("请先阅读协议并勾选已阅读！");
		document.getElementById("agreement").focus();
		return false;
	}else{
		//window.location.href="../zxsq/newsq.action?fyjg=${fyjg}";
		window.location.href="../xzfy/appFYfaceInsert.action?fyjg=${fyjg}";
		//<a href="../xzfy/appFYfaceInsert.action">
	}
	
}
function gotoIndexPage(){
	if(confirm("你确定要返回首页吗？你可以在三天内通过提供“案件代码”在“在线申请-继续填写”来完成复议申请的填写。")){
    	window.location.href="../zxfy/mainPage.action?fyjg=${fyjg}";
    }
}
</script>