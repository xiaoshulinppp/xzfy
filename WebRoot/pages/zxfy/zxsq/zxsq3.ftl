<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <title>法制办</title>
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/base.css" >
    <link rel="stylesheet" type="text/css" href="../pages/zxfy/css/xzfy.ts.css" >
</head>
<body>
<div class="xzfy mh-700">
    <div class="xzfy-hd fn-clear">
        <a class="xzfy-hd-r fhsy fn-right" href="javascript:gotoIndexPage()"></a>
        <div class="xzfy-hd-bg fn-left"></div>
       <br>
       <br>
       <br>
       <br>
      
      
       
     <div>&nbsp;
     &nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
   <h2 style="font-size:25px"  align="center">注意事项</h2>
   <br>
   <br>

  
 <p style = "margin:15px ;line-height:160%;font-size:20px"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您好！您的在线注册检索码为：${jiansuom}</p>
 <br>发送至<input type="text" id="aa" name="bb"  readonly="readonly" value="${fasongsj}"></input><input type="button" name="button"  value="发送"  onclick="checkAgreement()"></input>

<p style = "margin:15px ; line-height:160%;font-size:20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>一、本平台为自动的行政复议信息服务平台，信息提示仅供参考。</b>为方便群众申请行政复议，提高工作效率和规范化水平，
我们开通行政复议信息服务平台。如果您希望申请行政复议，请认真填写相关信息，平台将自动生成规范的《行政复议申请书》，
并自动提示申请行政复议期限、应当提交的证据材料、提交方式等信息。由于提示信息由系统自动生成，并非人工操作，因此仅供您参考。
申请人未在本平台填写信息的，不影响其依法行使行政复议权利。
</p>

<p style = "margin:15px ;line-height:160% ;font-size:20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>二、在本平台保存基本信息，不视为已经向行政复议机关提出了行政复议申请。</b>
您在“行政复议信息服务平台”填写、保存的信息，是您申请行政复议所必须提供的基本信息。
除基本信息之外，申请人还需依法向行政复议机构提供相关证据材料，并应当在申请书上签名、盖章。
上述步骤暂无法在线进行，申请人需要以邮寄或者当面确认形式完成。
因此，您在“行政复议信息服务平台”保存信息，不能视为已经向行政复议机关提出了行政复议申请。
</p>

<p style = "margin:10px ;line-height:160% ;font-size:20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>三、未在法定期限内向行政复议机关申请行政复议的，法律后果由申请人自行承担。</b>



</p>
         
     
     </div>
        <br>
        
        
    <form name="form1" id="form1" method="POST" action="youpage.jsp" >
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<p  style = "font-size:13px">&nbsp; &nbsp;&nbsp; &nbsp;<input type="checkbox" name="agreement" id="agreement">&nbsp; &nbsp;<h style = "color:red">我已阅读并同意</h><a>&nbsp;在线服务平台申请协议</a></input>
  &nbsp; &nbsp; &nbsp;   </p>
  <br>
     <p style="font-size:20px"  align="center">
  <input type="button" name="button" type="submit" value="开始注册"  onclick="checkAgreement()"></input>
  </p>
 <br>
     <br>
      <br>
       <br>
        <br>
</form>    
        
        
        
    </div>
    
   
   









</body>
</html>
<script type="text/javascript">
	function checkAgreement()
{
    if (document.getElementById("agreement").checked == false)
	{
		alert("请先阅读协议并勾选已阅读！");
		document.getElementById("agreement").focus();
		return false;
	}else{
	
	//window.location.href="../zxsq/newsq.action?funcCode=${funcCode}&fyjg=${fyjg?default('0000')}";
	window.location.href="../xzfy/appFYfaceInsert.action?funcCode=${funcCode}";
	//<a href="../xzfy/appFYfaceInsert.action?funcCode=${funcCode}">
	}
	
}
	
	
	function gotoIndexPage()
	{
		if(confirm("你确定要返回首页吗？你可以在三天内通过提供“案件代码”在“在线申请-继续填写”来完成复议申请的填写。"))  
	    {
	    	window.location.href="../zxfy/mainPage.action?funcCode=${funcCode}";
	    }
	}
	
</script>