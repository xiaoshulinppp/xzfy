<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title></title>
<link rel="stylesheet" href="../../${Session["_USER_STYLE_"].cssPath}/head_style.css" type="text/css">
<script type="text/javascript" src="../../${Session["_USER_STYLE_"].jsPath}/poslib.js"></script>
<script type="text/javascript" src="../../${Session["_USER_STYLE_"].jsPath}/scrollbutton.js"></script>
<script type="text/javascript" src="../../${Session["_USER_STYLE_"].jsPath}/menu4.js"></script>
<script type="text/javascript" src="../../${Session["_USER_STYLE_"].jsPath}/winxp.css.js"></script>
<link href="../../${Session["_USER_STYLE_"].cssPath}/winxp.css" rel="stylesheet" type="text/css">
<!--JavaScript部分-->
<style type="text/css">
<!--
.STYLE1 {color: #FFFFFF}
-->
</style>
</head>

<script type="text/javascript">

var ie55 = /MSIE ((5\.[56789])|([6789]))/.test( navigator.userAgent ) &&
			navigator.platform == "Win32";

if ( !ie55 ) {
	window.onerror = function () {
		return true;
	};
}

function writeNotSupported() {
	if ( !ie55 ) {
		document.write( "<p class=\"warning\">" +
			"This script only works in Internet Explorer 5.5" +
			" or greater for Windows</p>" );
	}
}

</script>

<script type="text/javascript">
//<![CDATA[

var tmp, tmp2;

// set default css file to use
Menu.prototype.cssText = cssText;

// test menu

/*var testMenu = new Menu();

testMenu.add(tmp = new MenuItem("New Window", document.location.href));
tmp.target = "_blank";
tmp.mnemonic = 'n';
tmp.shortcut = "Ctrl+N";
tmp.toolTip = "Tool Tip";

testMenu.add(tmp = new MenuItem("WebFX Home", "http://webfx.eae.net", "http://webfx.eae.net/images/favicon.gif"));
tmp.mnemonic = 'w';

testMenu.add(tmp = new MenuItem("Alert", function () { alert("Clicked " + this.text); }) );
tmp.mnemonic = 'a';

testMenu.add(new MenuSeparator);

testMenu.add(tmp = new MenuItem("Close", function () { window.close(); }) );
tmp.mnemonic = 'c';


// Check box menu

var cbm = new Menu();

function onCheckBoxChanged() {
	alert("The menu item with the text " + this.text +
		" is now " + (this.checked ? "checked" : "unchecked"));
}

cbm.add( new CheckBoxMenuItem("Check Me 1", false, onCheckBoxChanged) );
cbm.add( new CheckBoxMenuItem("Check Me 2", false, onCheckBoxChanged) );


// Radio Menu

var rm = new Menu();

function onRadioChanged() {	
	var text;
	if (rb1.checked)
		text = rb1.text;
	else if (rb2.checked)
		text = rb2.text;
	else if (rb3.checked)
		text = rb3.text;
	alert("You selected " + text);
};

var rb1 = new RadioButtonMenuItem("Vanilla", false, "flavorGroup", onRadioChanged);
var rb2 = new RadioButtonMenuItem("Chocolate", true, "flavorGroup", onRadioChanged);
var rb3 = new RadioButtonMenuItem("Strawberry", false, "flavorGroup", onRadioChanged);
rm.add(rb1);
rm.add(rb2);
rm.add(rb3);


// sub menus

var sm = new Menu();

// manual
var sm2 = new Menu();
var sm3 = new Menu();
var sm4 = new Menu();
var sm5 = new Menu();
var sm6 = new Menu();
sm.add( tmp = new MenuItem( "STAR卡账户信息查询", null, null, sm2) );
sm.add( tmp = new MenuItem( "在线还款", null, null, sm3) );
sm.add( tmp = new MenuItem( "STAR自动扣还款设置", null, null, sm4) );
sm.add( tmp = new MenuItem( "STAR电话银行还款设置", null, null, sm5) );
sm.add( tmp = new MenuItem( "独立副卡信用额度调整", null, null, sm6) );
sm2.add( new MenuItem("账户信息查询",""));
sm2.add(new MenuItem("个人资料查询",""));
sm2.add(new MenuItem("未出账单查询",""));
sm2.add(new MenuItem("已出账单查询",""));

sm3.add(new MenuItem("STAR卡还款","http://172.16.31.203:8001/servlets/EService/CSM/MainService?txcode=330900&SERVICE_ID=90"));
sm3.add(new MenuItem("STAR卡购汇还款",""));

sm4.add(new MenuItem("STAR卡自动还款开通",""));
sm4.add(new MenuItem("STAR卡自动还款开通(主-副)",""));
sm4.add(new MenuItem("STAR卡自动还款查询",""));
sm4.add(new MenuItem("STAR卡自动还款修改",""));
sm4.add(new MenuItem("STAR卡自动还款解除",""));
//sm.add( new MenuSeparator());

// loop
/*for (var i = 0; i < 5; i++) {
	tmp = new Menu;
	sm.add( new MenuItem("Sub Menu " + i, null, null, tmp) );
	for (var j = 0; j < 5; j++) {
		tmp2 = new Menu();
		tmp.add( new MenuItem("Item " + i + "." + j, null, null, tmp2) );
		for (var k = 0; k < 5; k++) {
			tmp2.add( new MenuItem("Item " + i + "." + j + "." + k) );	
		}
	}	
}
*/


// menu bar

var menuBar = new MenuBar();

/*var testButton = new MenuButton("Text", testMenu);
testButton.mnemonic = "t";
menuBar.add(testButton);

menuBar.add( tmp = new MenuButton("Check Box Menu", cbm) );
tmp.mnemonic = 'c';

menuBar.add( tmp = new MenuButton("Radio Menu", rm) );
tmp.mnemonic = 'r';

menuBar.add( tmp = new MenuButton("我的STAR卡", sm) );
tmp.mnemonic = 's';
*/
//======================================


//============menu_1================
var cat3 = new Menu();
menuBar.add(new MenuButton('我的户口',cat3));
var cat4 = new Menu();
menuBar.add(new MenuButton('我的投资',cat4));
var cat6 = new Menu();
menuBar.add(new MenuButton('我的融资',cat6));
var cat7 = new Menu();
menuBar.add(new MenuButton('我的出国金融',cat7));
var cat8 = new Menu();
menuBar.add(new MenuButton('我的居家金融',cat8));
var cat10 = new Menu();
menuBar.add(new MenuButton('电子商务',cat10));
var cat34 = new Menu();
menuBar.add(new MenuButton('客户服务',cat34));
var cat35 = new Menu();
menuBar.add(new MenuButton('安全管理',cat35));

//============menu_2================
var cat36 = new Menu();
cat8.add(new MenuItem('我的账户转账',null,null,cat36));
var cat40 = new Menu();
cat8.add(new MenuItem('缴费站',null,null,cat40));
var cat41 = new Menu();
cat8.add(new MenuItem('保管箱','30099d'));
var cat147 = new Menu();
cat6.add(new MenuItem('我的STAR卡',null,null,cat147));
var cat73 = new Menu();
cat6.add(new MenuItem('产品介绍',null,null,cat73));
var cat200 = new Menu();
cat10.add(new MenuItem('支付功能开通','362000'));
var cat201 = new Menu();
cat10.add(new MenuItem('支付状态查询','362010'));
var cat44 = new Menu();
cat4.add(new MenuItem('股票',null,null,cat44));
var cat45 = new Menu();
cat4.add(new MenuItem('外汇投资',null,null,cat45));
var cat1 = new Menu();
cat4.add(new MenuItem('基金超市',null,null,cat1));
var cat46 = new Menu();
cat4.add(new MenuItem('中信理财宝产品','30099d'));
var cat47 = new Menu();
cat4.add(new MenuItem('国债','/tmphtml/gz.html'));
var cat54 = new Menu();
cat4.add(new MenuItem('黄金','30099d'));
var cat71 = new Menu();
cat4.add(new MenuItem('信托','30099d'));
var cat146 = new Menu();
cat3.add(new MenuItem('户口一览','0.html'));
var cat9 = new Menu();
cat3.add(new MenuItem('账户明细查询','1.html'));
var cat52 = new Menu();
cat3.add(new MenuItem('户口管理',null,null,cat52));
var cat105 = new Menu();
cat35.add(new MenuItem('安全软件','30099d'));
var cat106 = new Menu();
cat35.add(new MenuItem('证书管理','30099d'));
var cat102 = new Menu();
cat34.add(new MenuItem('理财中心','/tmphtml/lczx.html'));
var cat103 = new Menu();
cat34.add(new MenuItem('业务提醒','/tmphtml/ywtx.html'));
var cat5 = new Menu();
cat34.add(new MenuItem('通知留言',null,null,cat5));
var cat104 = new Menu();
cat34.add(new MenuItem('理财工具','/tmphtml/lcgj.html'));
var cat107 = new Menu();
cat34.add(new MenuItem('积分查询','30099d'));
var cat108 = new Menu();
cat34.add(new MenuItem('收款一览表','/tmphtml/sfylb.html'));
var cat109 = new Menu();
cat34.add(new MenuItem('页面定制','30099d'));

//============menu_3================
var cat69 = new Menu();
cat52.add(new MenuItem('增加签约','bodyframeNomenu.htm'));
var cat70 = new Menu();
cat52.add(new MenuItem('网上账户签约撤销','3.html'));
var cat79 = new Menu();
cat52.add(new MenuItem('修改账户别名','4.html'));
var cat66 = new Menu();
cat52.add(new MenuItem('挂        失','5.html'));
var cat67 = new Menu();
cat52.add(new MenuItem('登录密码修改','6.html'));
var cat68 = new Menu();
cat52.add(new MenuItem('账户密码修改','7.html'));
var cat84 = new Menu();
cat147.add(new MenuItem('STAR账户信息查询','330840'));
var cat89 = new Menu();
cat147.add(new MenuItem('在线还款','330890'));
var cat92 = new Menu();
cat147.add(new MenuItem('STAR卡自动扣款还款设置','330920'));
var cat98 = new Menu();
cat147.add(new MenuItem('STAR卡电话银行还款设置','330980'));
var cat111 = new Menu();
cat147.add(new MenuItem('独立副卡信用额度调整','331110'));
var cat37 = new Menu();
cat5.add(new MenuItem('查看银行通知','300370'));
var cat39 = new Menu();
cat5.add(new MenuItem('发送留言','300390'));
var cat38 = new Menu();
cat5.add(new MenuItem('查看回复留言','300380'));
var cat2 = new Menu();
cat45.add(new MenuItem('外汇通','10.html'));
var cat72 = new Menu();
cat45.add(new MenuItem('外汇理财产品','11.html'));
var cat21 = new Menu();
cat1.add(new MenuItem('开基金账户','12.html'));
var cat30 = new Menu();
cat1.add(new MenuItem('基金账户查询','13.html'));
var cat33 = new Menu();
cat1.add(new MenuItem('基金NAV查询','14.html'));
var cat23 = new Menu();
cat1.add(new MenuItem('基金认购','15.html'));
var cat22 = new Menu();
cat1.add(new MenuItem('基金赎回','16.html'));
var cat24 = new Menu();
cat1.add(new MenuItem('基金申购','17.html'));
var cat25 = new Menu();
cat1.add(new MenuItem('基金撤单','18.html'));
var cat28 = new Menu();
cat1.add(new MenuItem('变更分红方式','19.html'));
var cat29 = new Menu();
cat1.add(new MenuItem('资料变更','20.html'));
var cat121 = new Menu();
cat44.add(new MenuItem('银证通','8.html'));
var cat50 = new Menu();
cat44.add(new MenuItem('银证转账','9.html'));
var cat42 = new Menu();
cat40.add(new MenuItem('在线缴费','/tmphtml/zxjf.html'));
var cat43 = new Menu();
cat40.add(new MenuItem('委托代扣','/tmphtml/wtdk.html'));
var cat148 = new Menu();
cat73.add(new MenuItem('中信家家乐','30099d'));
var cat149 = new Menu();
cat73.add(new MenuItem('其他','30099d'));
var cat51 = new Menu();
cat36.add(new MenuItem('理财宝套餐','300996&TXCODE=380510&SERVICE_ID=51'));
var cat48 = new Menu();
cat36.add(new MenuItem('转账','32048d&SERVICE_ID=48'));
var cat49 = new Menu();
cat36.add(new MenuItem('我的收款人','320490'));


//======================================
</script>


<BODY>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="../../images/15B/bg_head.gif">
  <tr>
    <td width="341" rowspan="2" valign="top" class="titleLogo">
	<div class="topTitleChn">信息门户搭建平台</div>
	<div class="topTitleEng">portal construct platform V2.0beta </div>
	</td>
    <td height="35" align="right"><table border="0" cellspacing="5" cellpadding="0">
      <tr>
        <td class="userInfo">操作员：张学友 用户类型：3 登录时间：2006-09-01 11:10:36</td>
        <td width="73"><a href="#"></a><a href="#"><img src="../../images/15B/button_xgzl.gif" alt="修改个人资料" width="72" height="23" border="0"></a></td>
        <td width="72"><a href="#"><img src="../../images/15B/button_logout.gif" alt="退出登录" width="72" height="23" border="0"></a></td>
      </tr>
      
    </table></td>
    <td width="10" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>
	<table border="0" cellpadding="0" cellspacing="0" align="right">
	<tr>
	  <td width="5" ><img src="../../images/15B/pic_topmenu_left.gif" width="5" height="23"></td>
	  <td height="23" background="../../images/15B/bg_menu_button_off.gif" >
	    <a href="#" class="toplink">首 页</a>	  
	  </td>
	  <td height="23" background="../../images/15B/bg_menu_button_off.gif" >	
		<script type="text/javascript">
			menuBar.write();
		</script>
		
		<script type="text/javascript">
			writeNotSupported();
		</script></td>
	  <td width="5" align="right" ><img src="../../images/15B/pic_topmenu_right.gif" width="5" height="23"></td>
	</tr>
</table>
	</td>
  </tr>
</table>
</BODY>
