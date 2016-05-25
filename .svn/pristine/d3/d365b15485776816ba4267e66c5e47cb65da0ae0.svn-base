<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%
	Connection con = getConn();
	Connection conn = getConn();
	ResultSet rss = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String mRecordID = "";
	String mSubject = "";
	String mAuthor = "";
	String mFileDate = "";
	String mFileType = "";
	String ms_caseId = "";
	String ms_TemplateID = "";
	String ms_type;
	String misqinggao="";
	String ms_iszuizhong="";
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
	String userrid = "";
	userrid =request.getParameter("userrid") + "";
	mFileDate = GetDateTime();%>
<%!
	public String ms_cassid;
	public String ms_userrName;
%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

	ms_cassid = request.getParameter("caseId") + "";
	ms_iszuizhong=request.getParameter("iszuizhong");
	ms_type=request.getParameter("mstype") + "";
	ms_userrName =new String(request.getParameter("d_username").getBytes("ISO-8859-1"),"UTF-8") + "";


%>
<%
				String	usql = "select * from U_USER where USER_ID='"+userrid+"'";
		
				try {
						conn = getConn();
						Statement stttmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
						rss = stttmt.executeQuery(usql);
						while (rss.next()) {
							ms_userrName=rss.getString(3);
							mAuthor = ms_userrName;
						}
						
			if(rss != null){rss.close();}
			if(stttmt != null){stttmt.close();}
			if(conn != null){conn.close();}
					}catch (Exception e) {
						System.out.println(e.getMessage());
						//response.getWriter().write(e.getMessage());
					} 
%>
<%
	//保存表单基本信息
	s_sql = "SELECT D_RecordID from  eWebOffice_T_Document Where D_RecordID='"
			+ mRecordID + "'";
	rs = ExecuteQuery(con, s_sql);
	if (rs.next()) {
		s_sql = "update eWebOffice_T_Document set D_RecordID=?,D_Subject=?,D_Author=?,D_FileDate=?,D_FileType=?,CASEID=?,D_TEMPLATEID=?,D_TYPE=?,D_ISQINGGAO=?,D_ISZUIZHONG=? where D_RecordID='"
				+ mRecordID + "'";
	} else {
		s_sql = "insert into eWebOffice_T_Document (D_RecordID,D_Subject,D_Author,D_FileDate,D_FileType,CASEID,D_TEMPLATEID,D_TYPE,D_ISQINGGAO,D_ISZUIZHONG) values (?,?,?,?,?,?,?,?,?,?)";
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
	stmt.setString(10,ms_iszuizhong);
	int count = stmt.executeUpdate();
	if (count > 0) {
	
		s_alert = "<script>alert('操作成功!');window.opener=null;window.close()</script>";
	} else {
		s_alert = "<script>alert('操作失败!');window.opener=null;window.close()</script>";
	}
	closeAll(con, stmt, rs);
	response.getWriter().write(s_alert);
%>