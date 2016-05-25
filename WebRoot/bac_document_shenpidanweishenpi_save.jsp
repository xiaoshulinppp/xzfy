<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%
	Connection con = getConn();
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String mRecordID = "";
	String mSubject = "";
	String mAuthor = "";
	String mFileDate = "";
	String mFileType = "";
	String ms_caseId = "";
	String ms_TemplateID = "";
	String ms_type="审批单未审批";
	String misqinggao="";

	String s_sql = "";
	String s_alert = "";
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	mRecordID = request.getParameter("d_recordid") + "";
	mSubject = request.getParameter("d_subject") + "";
	mAuthor = request.getParameter("d_author") + "";
	mFileType = request.getParameter("d_filetype") + "";
	ms_caseId = request.getParameter("caseId") + "";
	misqinggao = request.getParameter("ms_isqinggao") + "";
	ms_TemplateID = request.getParameter("d_templateid") + "";
	mFileDate = GetDateTime();%>
<%!
	public String ms_cassid;
	public String ms_userrName;
	public String ms_checkstatus;
%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

	ms_cassid = request.getParameter("caseId") + "";
	ms_checkstatus = request.getParameter("d_checkstatus") + "";

	ms_userrName =new String(request.getParameter("d_username").getBytes("ISO-8859-1"),"UTF-8") + "";

System.out.println(ms_cassid);
%>
<%
	//保存表单基本信息
	s_sql = "SELECT D_RecordID from  eWebOffice_T_Document Where D_RecordID='"
			+ mRecordID + "'";
	rs = ExecuteQuery(con, s_sql);
	if (rs.next()) {
		s_sql = "update eWebOffice_T_Document set D_RecordID=?,D_Subject=?,D_Author=?,D_FileDate=?,D_FileType=?,CASEID=?,D_TEMPLATEID=?,D_TYPE=?,D_ISQINGGAO=?,D_SHENPIDANTYPE where D_RecordID='"
				+ mRecordID + "'";
	} else {
		s_sql = "insert into eWebOffice_T_Document (D_RecordID,D_Subject,D_Author,D_FileDate,D_FileType,CASEID,D_TEMPLATEID,D_TYPE,D_ISQINGGAO,D_SHENPIDANTYPE) values (?,?,?,?,?,?,?,?,?,?)";
	}
	stmt = con.prepareStatement(s_sql);
	stmt.setString(1, mRecordID);
	stmt.setString(2, mSubject);
	stmt.setString(3, mAuthor);
	stmt.setDate(4, this.GetDate());
	stmt.setString(5, mFileType);
	stmt.setString(6, ms_caseId);
	stmt.setString(7, ms_TemplateID);
	stmt.setString(8, ms_type);
	stmt.setString(9, misqinggao);
	stmt.setString(10, ms_checkstatus);

	int count = stmt.executeUpdate();
	if (count > 0) {
	
		s_alert = "<script>alert('操作成功!');window.opener=null;window.close()</script>";
	} else {
		s_alert = "<script>alert('操作失败!');window.opener=null;window.close()</script>";
	}
	response.getWriter().write(s_alert);
%>