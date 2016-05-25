<%@ page language="java"
	import="java.util.*,java.sql.*,java.text.SimpleDateFormat"
	pageEncoding="UTF-8"%>
<%@ page isThreadSafe="false"%>
<%@include file="DBHelper.jsp"%>
<%!public String ms_Action;
	public String ms_UserName;
	public String ms_TemplateID;
	public String ms_FileType;
	public String ms_RecordID;
	public String ms_Author;
	public String ms_FileDate;
	public String ms_Subject;
	public String ms_WebUrl;
	public String ms_NodeDesc;

	public String ms_RecordID_parent;//修改前ID
	public String ms_caseId;
	public String ms_RecordID_current = getDateTimeFormat();//当前ID，用于清稿
	public Connection con = null;
	public PreparedStatement stmt = null;
	public ResultSet rs = null;
	public String ms_isqinggao="未清稿";
	public String ms_issqinggao="已清稿";
	public String ms_checkstatus="";
	public String ms_finishtype="";
	public String ms_all;
	public String userrid = "";
	public String iszuizhong="";
%>
<%
				userrid =request.getParameter("userrid") + "";
				String	usql = "select * from U_USER where USER_ID='"+userrid+"'";
	
				try {
						con = getConn();
						Statement stttmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
						rs = stttmt.executeQuery(usql);
						while (rs.next()) {
							ms_UserName=rs.getString(3);
							ms_Author = ms_UserName;
						}
						
			if(rs != null){rs.close();}
			if(stttmt != null){stttmt.close();}
			if(con != null){con.close();}
					}catch (Exception e) {
						System.out.println(e.getMessage());
						//response.getWriter().write(e.getMessage());
					} 
%>
<%

	ms_checkstatus=request.getParameter("d_checkstatus") + "";
	ms_finishtype=request.getParameter("finish_type") + "";
	ms_caseId = request.getParameter("caseId") + "";
	ms_RecordID_current = getDateTimeFormat();
	con = getConn();
	ms_all=ms_caseId+";"+ms_checkstatus+";"+ms_finishtype;
	String[] allshuzu=ms_all.split(";");
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	ms_Action = request.getParameter("action");
	if (ms_Action.equals("new")) {
		ms_NodeDesc = "新建文档";
	} else if (ms_Action.equals("read")) {
		ms_NodeDesc = "阅读";
	} else if (ms_Action.equals("norevision")) {
		ms_NodeDesc = "修改无痕迹";
	} else if (ms_Action.equals("yesrevision")) {
		ms_NodeDesc = "修改有痕迹";
	} else if (ms_Action.equals("comment")) {
		ms_NodeDesc = "领导手写圈批";
	} else if (ms_Action.equals("verify")) {
		ms_NodeDesc = "核稿";
	} else if (ms_Action.equals("embed")) {
		ms_NodeDesc = "一键套红";
	} else if (ms_Action.equals("seal")) {
		ms_NodeDesc = "签章";
	} else {
		response.sendRedirect("fzb_default_shenpidan_list.jsp?caseId="+ms_caseId+"&d_username"+ms_Author);
	}

	

	if (ms_Action.equals("new")) {
		//新建文档
		ms_FileType = request.getParameter("d_filetype") + "";
		ms_TemplateID = request.getParameter("d_templateid") + "";

		ms_RecordID = getDateTimeFormat();
		ms_Subject = "请输入主题";
		ms_Author = ms_UserName;
		ms_FileDate = GetDateTime();
	} else if (ms_Action.equals("yesrevision")) {
		//保留修改痕迹
		ms_RecordID_parent = request.getParameter("d_recordid") + "";
		ms_TemplateID = request.getParameter("d_templateid") + "";
		ms_RecordID = getDateTimeFormat();

		if (!isNullOrEmpty(ms_RecordID)) {
			try {
				String sql = " select * from  eWebOffice_T_Document   where D_RecordID= '"
						+ ms_RecordID_parent + "' ";
				rs = ExecuteQuery(con, sql);
				if (rs.next()) {
					ms_FileType = rs.getString("D_FileType") + "";
					ms_FileDate = rs.getString("D_FileDate") + "";
					ms_Author = rs.getString("D_Author") + "";
					ms_Subject = rs.getString("D_Subject") + "";
				} else {
					response.sendRedirect("fzb_default_shenpidan_list.jsp?caseId="+ms_caseId+"&d_username"+ms_Author);
				}
			} catch (Exception e) {
				response.getWriter().write(e.getMessage());
				response.sendRedirect("fzb_default_shenpidan_list.jsp?caseId="+ms_caseId+"&d_username"+ms_Author);
			} finally {
				closeAll(con, stmt, rs);
			}
		} else {
			response.sendRedirect("fzb_default_shenpidan_list.jsp?caseId="+ms_caseId+"&d_username"+ms_Author);
		}
	} else {
		ms_RecordID = request.getParameter("d_recordid") + "";
		ms_TemplateID = request.getParameter("d_templateid") + "";

		if (!isNullOrEmpty(ms_RecordID)) {
			try {
				String sql = " select * from  eWebOffice_T_Document   where D_RecordID= '"
						+ ms_RecordID + "' ";
				rs = ExecuteQuery(con, sql);
				if (rs.next()) {
					ms_FileType = rs.getString("D_FileType") + "";
					ms_FileDate = rs.getString("D_FileDate") + "";
					ms_Author = rs.getString("D_Author") + "";
					ms_Subject = rs.getString("D_Subject") + "";
				} else {
					response.sendRedirect("fzb_default_shenpidan_list.jsp?caseId="+ms_caseId+"&d_username"+ms_Author);
				}
			} catch (Exception e) {
				response.getWriter().write(e.getMessage());
				response.sendRedirect("fzb_default_shenpidan_list.jsp?caseId="+ms_caseId+"&d_username"+ms_Author);
			} finally {
				closeAll(con, stmt, rs);
			}
		} else {
			response.sendRedirect("fzb_default_shenpidan_list.jsp?caseId="+ms_caseId+"&d_username"+ms_Author);
		}
	}

	ms_WebUrl = request.getContextPath();
	ms_WebUrl = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getServerPort() + ms_WebUrl + "/";
	ms_WebUrl += "eWebOffice/eWebOfficeAction3.jsp";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>编辑文档</title>
		<link rel="stylesheet" type="text/css" href="css/eweboffice.css" />
<script type="text/javascript" src="sys_theme/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="sys_theme/js/jquery.form.js"></script> 
		<!--引用eWebOffice公用脚本-->
		<script type="text/javascript" src="eWebOffice/eWebOffice.js">
</script>

		<script type="text/javascript" for="eWebOffice1" event="OnInit()">
//控件初始化事件
//标题栏、快捷工具栏、边框等界面相关设置可以在此事件中作，使得界面上不会有转变过程显现
//如：隐藏快捷工具栏。当访问此网页时，如在OnLoad中设，则会先显示出工具栏，再看到工具栏没了。如在OnInit中设，直接打开就看不到。没有这个变化过程。
eWebOfficeJS.SetWorkModeOnInit("eWebOffice1", "<%=ms_Action%>");
eWebOffice1.SetRibbonVisible("TabAddIns", false);
eWebOffice1.TitleVisible = false;
//eWebOffice1.TitleCaption="极限软件有限公司";
</script>

<script type="text/javascript" for="eWebOffice1" event="OnDocumentAfterOpen()">
//文档打开后触发此事件
//在此事件中设置初始Office菜单、工具栏、痕迹、保护等。
eWebOfficeJS.SetWorkModeOnOpen("eWebOffice1", "<%=ms_Action%>");
eweboffice1.SetFileMenuVisible("SYS_FM_About", false);
eweboffice1.SetFileMenuVisible("SYS_FM_Open", false);
</script>

		<script type="text/javascript" for="eWebOffice1" event="OnLoad()">
eWebOffice1.WebUrl = "<%=ms_WebUrl%>";
eWebOffice1.RecordID = "<%=ms_RecordID%>";
eWebOffice1.TemplateID = "<%=ms_TemplateID%>";
eWebOffice1.UserName = "<%=ms_UserName%>";
eWebOffice1.FileType = "<%=ms_FileType%>";<%if (ms_Action.equals("new")) {%>
	eWebOffice1.WebNew();
	<%} else if (ms_Action.equals("yesrevision")) {%>
	eWebOffice1.RecordID = "<%=ms_RecordID_parent%>";
	eWebOffice1.WebOpen();
	eWebOffice1.RecordID = "<%=ms_RecordID%>";
	<%} else {%>
    eWebOffice1.WebOpen();
	<%}%>  
eWebOffice1.CusParam="<%=ms_all%>";
eWebOffice1.WebLoadBookmark();
            document.getElementById("bg").style.display = "none";
            document.getElementById("show").style.display = "none";
</script>

		<script type="text/javascript" for="eWebOffice1"
			event="OnCustomButtonClick(s_Key, s_Value)">

//s_Key: 为自定义按钮关键字，可以随便定义，不要与系统自带冲突即可，演示中为了区别，快捷工具栏上的按钮定义为"QB_"开头，Office文件菜单下的按钮定义为"File_"开头。
switch (s_Key) {
case "QB_ViewThumbnails":
	eWebOffice1.WebObject.Application.ActiveWindow.Thumbnails = true;
	break;
case "QB_ViewDocumentMap":
	eWebOffice1.WebObject.Application.ActiveWindow.DocumentMap = true;
	break;
case "QB_ViewPage":
	eWebOffice1.WebObject.Application.ActiveWindow.Thumbnails = false;
	eWebOffice1.WebObject.Application.ActiveWindow.DocumentMap = false;
	break;
case "QB_Print":
	eWebOffice1.PrintDialog();
	break;
case "QB_WebSave":
	eWebOffice1.WebSave();
	break;
case "QB_EmbedTemplate":
	var o_Arg = new Object(); //准备传递到模式窗口的对象
	o_Arg.TemplateID = ""; //初始化对象的模板属性
	//弹出模板列表的模式窗体（url， 传递到模式窗口的参数，模式窗口的样式属性）
	window
			.showModalDialog("template_select.jsp", o_Arg,
					"dialogHeight:130px; dialogWidth:360px;center:yes;scroll:no;status:no;");
	if (o_Arg.TemplateID != "") {
		eWebOffice1.TemplateID = o_Arg.TemplateID; //将模式窗口取得的TemplateID赋值给控件中的TemplateID属性
		eWebOffice1.WebEmbedTemplate(); //嵌入模板
	}
	break;
case "QB_OpenSeal":
	eWebOffice1.WebOpenSeal();
	break;
case "QB_VerifySeal":
	eWebOffice1.WebVerifySeal();
	break;
}
</script>


		<script type="text/javascript">

function DoCheckSubmit() {
	if (document.getElementById("d_subject").value == "") {
		alert("主题不能为空！");
		return false;
	}
	if (document.getElementById("d_author").value == "") {
		alert("作者不能为空！");
		return false;
	}
	try {
		return eWebOffice1.WebSave();
	} catch (e) {
		alert("请选安装eWebOffice控件，再操作！");
		return false;
	}
}
</script>

	</head>
	<body>
	 <style type="text/css">
        #bg{ display: block;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  background-color: black;  z-index:1001;  -moz-opacity: 0.7;  opacity:.70;  filter: alpha(opacity=70);}
        #show{display: block;  position: absolute;  top: 0%;  left: 0%;  width: 100%;  height: 100%;  padding: 8px;  border: 8px solid #E8E9F7;  background-color: white;  z-index:1002;  overflow: auto;}
    </style>
    <div id="bg">
<iframe  style="position:absolute;top: 0%;  left: 0%;  width:100%;height:100%;_filter:alpha(opacity=0);opacity=0;border-style:none;">正在加载中。。。</iframe>    
    </div>
    <div id="show">
        <img src="images/loading.jpg">
    </div>
        <div style="background:url(images/loading1.jpg);width:100%;height:100%">
		<div id="bdy">


			<hr />
						<%if(ms_NodeDesc.equals("阅读")){ %>

							
							<% }else{%>
			<form id="form1" name="form1" method="post" action="fzb_document_shenpidan_save.jsp?caseId=<%=ms_caseId%>&d_username=<%=ms_Author%>&d_checkstatus=<%=ms_checkstatus%>&userrid=<%=userrid%>"
				onsubmit="return DoCheckSubmit()">
				
				<input type="hidden" name="d_recordid" id="d_recordid"
					value="<%=ms_RecordID%>" />
				<input type="hidden" name="ms_isqinggao" id="ms_isqingao"
					value="" />
				<input type="hidden" name="iszuizhong" id="iszuizhong"
				value="" />	
				<input type="hidden" name="d_filetype" id="d_filetype"
					value="<%=ms_FileType%>" />
				<input type="hidden" name=caseId id="caseId" value="<%=ms_caseId%>" />
				<input type="hidden" name=d_templateid id="d_templateid"
					value="<%=ms_TemplateID%>" />
				<table class="">

											<td width="50%" rowspan="2" align="center">

							<input type="submit" class="btn4" value="保存最终文书" onclick="acceptAllRevisions()" style="visibility:visible">
							<!--  <input type="button" class="btn4"
								onclick="location.href='fzb_default_shenpidan_list.jsp?caseId=<%=ms_caseId%>&d_username=<%=ms_Author%>'" value="查看历史版本">-->
							<input type="submit" value="清稿" class="btn4"
								onclick="acceptAllRevisions()">
							<input type="button" value="暂存" class="btn4"
								onclick="createApp()">


							&nbsp;
							
							<!--  <input type="button" class="btn4"
								onclick="location.href='fzb_default_shenpidan_list.jsp?caseId=<%=ms_caseId%>&d_username=<%=ms_Author%>'" value="返回列表">*/-->
							<br>
							<br>
							<span class=red>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注意：只有进行“保存文档”后，所做的操作才有效！</span>




							<input class="txt" type="text" name="d_subject" id="d_subject"
								value="<%=ms_Subject%>" size="50" style="visibility:hidden"/>




							<input class="txt" type="text" name="d_author" id="d_author"
								value="<%=ms_Author%>" size="50" style="visibility:hidden"/>


											</td>

				</table>
			</form>
										<%} %>



			<!--创建eWebOffice实例-->
			<script type="text/javascript">
eWebOfficeJS.Create("eWebOffice1", "100%", "700px");
function DoLoadBookmark() {
	eWebOffice1.WebLoadBookmark(); //交互Action="LOADBOOKMARK"
}




//清稿
function acceptAllRevisions(){
	eWebOffice1.AcceptAllRevisions();
	eWebOffice1.RecordID = "<%=ms_RecordID_current%>";
	document.getElementById("d_recordid").value="<%=ms_RecordID_current%>";
	document.getElementById("ms_isqingao").value="已清稿";
	document.getElementById("iszuizhong").value="1";
	
  
}
function acceptAllRevisions2(){
	
	document.getElementById("ms_isqingao").value="未清稿";
	document.getElementById("iszuizhong").value="1";
	

}
	function createApp(){
	
		document.getElementById("ms_isqingao").value="未清稿";
		document.getElementById("iszuizhong").value="0";
		var options = {

			url:'<%="fzb_document_shenpidan_save.jsp?caseId="+ms_caseId+"&d_username="+ms_Author+"&d_checkstatus="+ms_checkstatus+"&userrid="+userrid%>', //提交给哪个执行 
			type:'POST',
			success: callbackfun
		};
			
		$('#form1').ajaxSubmit(options);
		return eWebOffice1.WebSave(); //为了不刷新页面,返回false，反正都已经在后台执行完了，没事！ 		
	}
	function callbackfun(){
	setTimeout('alert("保存成功")',1000);

	}
</script>


			<hr />

		</div>
		</div>
	</body>
</html>


