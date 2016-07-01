<%@ page language="java"
	import="java.util.*,java.sql.*,java.text.SimpleDateFormat"
	pageEncoding="UTF-8"%>

<%@include file="DBHelper.jsp"%>
<%!public Connection con = null;
	public PreparedStatement stmt = null;
	public ResultSet rs = null;
	public String ms_TemplateDOC = "";
	public String ms_TemplateXLS = "";
	public String ms_TemplatePPT = "";
	public String ms_TemplateWPS = "";
	public String ms_TemplateET = "";
	public String ms_TemplateDPS = "";
	public String d_username = "userTest";//秘书名称
	public String d_templateid = "20131024142832";//模板编号
	public String caseId = "1";//案件ID%
	public String GetTemplateData(String sType) {
		con = getConn();
		String s_sql = "select * from eWebOffice_T_TemplateFile where D_FileType='"
				+ sType + "'";
		String Data = "";
		try {
			rs = ExecuteQuery(con, s_sql);
			while (rs.next()) {
				Data += rs.getString("D_TemplateID") + ","
						+ rs.getString("D_Descript") + "|";
			}
			closeAll(null, null, rs);
			Data = Data.equals("") ? "" : Data.substring(0, Data.length() - 1);
		} catch (Exception e) {
			Data = "";
		} finally {
			closeAll(con, null, rs);
		}
		return Data;
	}%>
<%!
	public String ms_cassid;
	public String ms_userrName;
%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
ms_cassid = request.getParameter("caseId") + "";
ms_userrName =new String(request.getParameter("d_username").getBytes("ISO-8859-1"),"UTF-8") + "";
System.out.println(ms_cassid);
%>

<%
	ms_TemplateDOC = GetTemplateData("doc");
	ms_TemplateXLS = GetTemplateData("xls");
	ms_TemplatePPT = GetTemplateData("ppt");
	ms_TemplateWPS = GetTemplateData("wps");
	ms_TemplateET = GetTemplateData("et");
	ms_TemplateDPS = GetTemplateData("dps");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行政复议接待笔录列表</title>
<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />

<script type="text/javascript">

function ChangeFileType() {
	var s_TemplateData = "";
	var s_FileType = document.getElementById("d_filetype").value;
	switch (s_FileType) {
	case "doc":
		s_TemplateData = "<%=ms_TemplateDOC%>";
		break;
	case "xls":
		s_TemplateData = "<%=ms_TemplateXLS%>";
		break;
	case "ppt":
		s_TemplateData = "<%=ms_TemplatePPT%>";
		break;
	case "wps":
		s_TemplateData = "<%=ms_TemplateWPS%>";
		break;
	case "et":
		s_TemplateData = "<%=ms_TemplateET%>";
		break;
	case "dps":
		s_TemplateData = "<%=ms_TemplateDPS%>";
		break;
	default:
		s_TemplateData = "<%=ms_TemplateDOC%>";
		break;
	}

	document.getElementById("d_templateid").options.length = 1;

	var arr = s_TemplateData.split('|');
	for ( var i = 0; i < arr.length; i++) {
		var arr2 = arr[i].split(',');
		AddOption("d_templateid", arr2[0], arr2[1]);
	}
}

function AddOption(s_Id, s_Value, s_Text) {
	var el = document.getElementById(s_Id);
	el.options[el.length] = new Option(s_Text, s_Value);
}
</script>

</head>


<body onload="ChangeFileType()">

	<div id="bdy">


		<hr />

		<table class="lst">
			<tr>
				<th colspan="2">接待笔录编辑管理——历史版本列表</th>
			</tr>
			<tr>
				<td>
					<form name="form1"
						action="bac_document_cailiaochulidan_edit.jsp?action=new"
						method="post">
						用户名： <input name="d_username" id="d_username" style="width: 75px"
							type="text" value="<%=ms_userrName%>" />

						<script>


//调用示例：window.open("http://localhost:8011/eWebOffice/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20130725154319&d_username=user1&caseId=1")

</script>
					</form>
				</td>
			</tr>
		</table>

		<br />

		<table class="lst">
			<tr>
				<th style="width: 60px;">编号</th>
				<th style="width: 120px;">文档编号</th>
				<th style="width:;">标题</th>
				<th style="width: 80px;">作者</th>
				<th style="width: 40px;">类型</th>
				<th style="width: 100px;">日期</th>
				<th style="width: 240px;">操作</th>
			</tr>
			<%
					String sql = "select * from eWebOffice_T_Document where D_TYPE='接待笔录'  and caseId="+ms_cassid+" order by d_id desc ";
					try {
						con = getConn();
						rs = ExecuteQuery(con, sql);
						while (rs.next()) {

							String s_Link = "";
							if (rs.getString("D_FileType").toLowerCase().equals("doc")
									|| rs.getString("D_FileType").toLowerCase().equals(
											"wps")) {
								s_Link = "<a href='bac_document_cailiaochulidan_edit.jsp?action=norevision&d_templateid="
										+ d_templateid
										+ "&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>修改无痕迹</a>"
										+ "→<a href='bac_document_cailiaochulidan_edit.jsp?action=yesrevision&d_templateid="
										+ d_templateid
										+ "&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>修改有痕迹</a>"
										+ "→<a href='bac_document_cailiaochulidan_edit.jsp?action=read&d_templateid="
										+ d_templateid
										+ "&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>阅读</a>"
										+ " <a style='color:red;' href='bac_document_cailiaochulidan_delete.jsp?d_recordid="
										+ rs.getString("D_RecordID")
										+ "&d_username="
										+ ms_userrName
										+ "&caseId="
										+ ms_cassid + "'>删除</a>";
							} else {
								s_Link = "<a href='bac_document_cailiaochulidan_edit.jsp?action=norevision&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>修改无痕迹</a>"
										+ "→修改有痕迹"
										+ "→领导手写圈批"
										+ "→核搞"
										+ "→套红"
										+ "→签章"
										+ "→<a href='bac_document_cailiaochulidan_edit.jsp?action=read&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>阅读</a>"
										+ " <a style='color:red;' href='document_cailiaochulidan_delete.jsp?d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid + "'>删除</a>";
							}

							out.print("<tr align=center>" + "<td>"
									+ rs.getString("D_ID") + "</td>" + "<td>"
									+ rs.getString("D_RecordID") + "</td>"
									+ "</td>" + "<td>" + rs.getString("D_Subject")
									+ "</td>" + "<td>" + rs.getString("D_Author")
									+ "</td>" + "<td>" + rs.getString("D_FileType")
									+ "</td>" + "<td>" + rs.getDate("D_FileDate")
									+ "</td>" + "<td>" + s_Link + "</td>" + "</tr>");

						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
						out.print("<tr><td colspan=7>您还没有保存过已生成的文书</td></tr>");

						//response.getWriter().write(e.getMessage());
					} finally {
						closeAll(con, stmt, rs);
					}
				%>
		</table>

		<hr />
	</div>
</body>
</html>

















