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
	String s_alert = "";
	String d_alert = "";
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
	public String ms_type;
	public String d_templateid="";
%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

	ms_cassid = request.getParameter("caseId") + "";
	ms_type=new String(request.getParameter("mstype").getBytes("ISO-8859-1"),"UTF-8") + "";
	ms_userrName =new String(request.getParameter("d_username").getBytes("ISO-8859-1"),"UTF-8") + "";
	if(ms_type.equals("dafutongzhi"))
	{
		d_templateid = "20131017111354";//模板编号
	}
	if(ms_type.equals("buyushouligaozhishu"))
	{
		d_templateid = "20131024142832";//模板编号
	}
	if(ms_type.equals("shouju"))
	{
		d_templateid = "20131014160005";//模板编号
	}
	if(ms_type.equals("xingzhengfuyiyijianshu"))
	{
		d_templateid = "20131017113148";//模板编号
	}
	if(ms_type.equals("xingzhengfuyijianyishu"))
	{
		d_templateid = "20131017134544";//模板编号
	}
	if(ms_type.equals("jiedaibilu"))
	{
		d_templateid = "20131021070651";//模板编号
	}
	if(ms_type.equals("buzhengtongzhishu"))
	{
		d_templateid = "20131021111523";//模板编号
	}
	if(ms_type.equals("shoulitongzhishu"))
	{
		d_templateid = "20131021113134";//模板编号
	}
	if(ms_type.equals("songdadizhiquerenshu"))
	{
		d_templateid = "20131021132019";//模板编号
	}
	if(ms_type.equals("huifushenlitongzhishu"))
	{
		d_templateid = "20131108174435";//模板编号
	}
	if(ms_type.equals("yanqishenlitongzhishu"))
	{
		d_templateid = "20131106175131";//模板编号
	}
	if(ms_type.equals("zhongzhishenlitongzhishu"))
	{
		d_templateid = "20131107175118";//模板编号
	}
	if(ms_type.equals("buzhengtongzhishu"))
	{
		d_templateid = "20131021111523";//模板编号
	}
	if(ms_type.equals("yuejuanbilu"))
	{
		d_templateid = "20131118123056";//模板编号
	}
	if(ms_type.equals("songdabilu"))
	{
		d_templateid = "20131118124309";//模板编号
	}
	if(ms_type.equals("zhuanjiaocailiaobilu"))
	{
		d_templateid = "20131118125037";//模板编号
	}
	if(ms_type.equals("yibanjiedaibilu"))
	{
		d_templateid = "20131118125758";//模板编号
	}
	if(ms_type.equals("xingzhengfuyijuedingshu"))
	{
		d_templateid = "20131118203011";//模板编号
	}
	if(ms_type.equals("dafudafutongzhishu"))
	{
		d_templateid = "20131118204844";//模板编号
	}

	if(ms_type.equals("xingzhengfuyibohui"))
	{
		d_templateid = "20131127143209";//模板编号
	}
	if(ms_type.equals("xingzhengfuyizelinglvxing"))
	{
		d_templateid = "20131127143314";//模板编号
	}
	if(ms_type.equals("xingzhengfuyitiaojie"))
	{
		d_templateid = "20131127144009";//模板编号
	}
	if(ms_type.equals("xingzhengfuyizhongzhi"))
	{
		d_templateid = "20131127144136";//模板编号
	}
		if(ms_type.equals("bilubuzheng"))
	{
		d_templateid = "20131203173237";//模板编号
	}
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
<title>答复通知</title>
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

		<div id="nav">
			您当前位置 &gt;&gt; <a
				href="bac_default_dafutongzhi.jsp?caseId=<%=ms_cassid%>&d_username=<%=ms_userrName%>">首页</a>
		</div>
		<hr />

		<table class="lst">
			<tr>
				<th colspan="2">答复通知编辑管理</th>
			</tr>
			<tr>
				<td>
					<form name="form1"
						action="bac_document_dafutongzhi_edit.jsp?action=new"
						method="post">
						用户名： <input name="d_username" id="d_username" style="width: 75px"
							type="text" value="<%=ms_userrName%>" /> <input type=button
							value="编辑答复通知" onclick="printNotice()">
						<script>
<%!//首先用模板管理新建模板，并添加相关书签，然后修改相关参数，包括d_username、d_templateid、caseId 
	public String tempUrl;
	//秘书名称

	//案件ID%>
<%tempUrl = request.getContextPath();
			tempUrl = request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + tempUrl + "/";
			tempUrl += "bac_document_dafutongzhi_edit.jsp?action=new&d_filetype=doc&d_templateid="
					+ d_templateid
					+ "&d_username="
					+ ms_userrName
					+ "&caseId="
					+ ms_cassid
					+ "&mstype="
					+ ms_type;
					%>
//调用示例：window.open("http://localhost:8011/eWebOffice/bac_document_edit.jsp?action=new&d_filetype=doc&d_templateid=20130725154319&d_username=user1&caseId=1")

function printNotice(){	
	window.open("<%=tempUrl%>");
}
</script>
					</form>
				</td>
			</tr>
		</table>

		<br />

		<table class="lst">
			<tr>
				<th style="width: 40px;">编号</th>
				<th style="width: 120px;">文档编号</th>
				<th style="width:;">标题</th>
				<th style="width: 60px;">作者</th>
				<th style="width: 40px;">类型</th>
				<th style="width: 80px;">日期</th>
				<th style="width: 220px;">操作</th>
			</tr>
			<%
				String	sql = "select * from (select * from eWebOffice_T_Document where D_TYPE='"+ms_type+"' and caseId="+ms_cassid+" order by d_id desc ) where rownum=1 ";

					try {
						con = getConn();
						Statement sttmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
						rs = sttmt.executeQuery(sql);
						rs.last(); // 游标移到最后, 获得rs长度
						int length = rs.getRow();
						System.out.println(length);
						rs.previous(); // 还原游标到rs开头  
						if (length == 0)
						{
							s_alert = "<script>window.location='bac_document_dafutongzhi_edit.jsp?action=new&d_filetype=doc&d_templateid="+d_templateid+"&caseId="+ms_cassid+"&d_username="+ms_userrName+"&mstype="+ms_type+"'</script>";
							response.getWriter().write(s_alert);
						}
						while (rs.next()) {
							if(rs.getString("D_isqinggao").equals("未清稿")){
								s_alert = "<script>window.location='bac_document_dafutongzhi_edit.jsp?action=yesrevision&caseId="+ms_cassid+"&d_username="+ms_userrName+"&d_recordid="+rs.getString("D_RecordID")+"&mstype="+ms_type+"'</script>";
							response.getWriter().write(s_alert);
							}
							if(rs.getString("D_isqinggao").equals("已清稿")){
								s_alert = "<script>window.location='bac_document_dafutongzhi_edit.jsp?action=read&caseId="+ms_cassid+"&d_username="+ms_userrName+"&d_recordid="+rs.getString("D_RecordID")+"&mstype="+ms_type+"'</script>";
							response.getWriter().write(s_alert);
							}
							String s_Link = "";
							if (rs.getString("D_FileType").toLowerCase().equals("doc")
									|| rs.getString("D_FileType").toLowerCase().equals(
											"wps")) {
								s_Link = "<a href='bac_document_dafutongzhi_edit.jsp?action=norevision&d_templateid="
										+ d_templateid
										+ "&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>修改无痕迹</a>"
										+ "→<a href='bac_document_dafutongzhi_edit.jsp?action=yesrevision&d_templateid="
										+ d_templateid
										+ "&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>修改有痕迹</a>"
										+ "→<a href='bac_document_dafutongzhi_edit.jsp?action=read&d_templateid="
										+ d_templateid
										+ "&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>阅读</a>"
										+ " <a style='color:red;' href='bac_document_delete.jsp?d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ caseId + "'>删除</a>";
							} else {
								s_Link = "<a href='bac_document_dafutongzhi_edit.jsp?action=norevision&d_username="
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
										+ "→<a href='bac_document_dafutongzhi_edit.jsp?action=read&d_username="
										+ ms_userrName
										+ "&d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ ms_cassid
										+ "'>阅读</a>"
										+ " <a style='color:red;' href='document_delete.jsp?d_recordid="
										+ rs.getString("D_RecordID")
										+ "&caseId="
										+ caseId + "'>删除</a>";
							}

							out.print("<tr align=center>" + "<td>"
									+ rs.getString("D_ID") + "</td>" + "<td>"
									+ rs.getString("D_RecordID") + "</td>"
									+ "<td align=left>" + rs.getString("D_Subject")
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

















