<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%
	Connection con = null;
	PreparedStatement stmt = null;
	String s_alert = "";
	String ms_TemplateID;
	String ms_ID;
	String ms_BookmarkName;
	String ms_BookmarkDesc;
	String ms_BookmarkText;
	String ms_BookmarkShow;
	String ms_BookmarkShowType;
	String ms_BookmarkEndType;
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	ms_TemplateID = request.getParameter("d_templateid") + "";
	ms_ID = request.getParameter("d_id") + "";
	ms_BookmarkName = request.getParameter("d_bookmarkname") + "";
	ms_BookmarkDesc = request.getParameter("d_bookmarkdesc") + "";
	ms_BookmarkText = request.getParameter("d_bookmarktext") + "";
	ms_BookmarkShow = request.getParameter("d_bookmarkshow") + "";
	ms_BookmarkShowType = request.getParameter("d_bookmarkshowtype")
			+ "";
	ms_BookmarkEndType = request.getParameter("d_bookmarkendtype") + "";
	String s_sql = "";
	if (!isNullOrEmpty(ms_ID)) {
		s_sql = "Update eWebOffice_T_Bookmark Set D_BookmarkName=?,D_BookmarkDesc=?,D_BookmarkText=?,D_TEMPLATEID=?,d_bookmarkshow=?,d_bookmarkshowtype=?,D_BOOKMARKENDTYPE=? where D_ID="
				+ ms_ID;
	} else {
		s_sql = "Insert Into eWebOffice_T_Bookmark (D_BookmarkName,D_BookmarkDesc,D_BookmarkText,D_TEMPLATEID,d_bookmarkshow,d_bookmarkshowtype,D_BOOKMARKENDTYPE) values(?,?,?,?,?,?,?)";
		;
	}
	con = getConn();
	stmt = con.prepareStatement(s_sql);
	stmt.setString(1, ms_BookmarkName);
	stmt.setString(2, ms_BookmarkDesc);
	stmt.setString(3, ms_BookmarkText);
	stmt.setString(4, ms_TemplateID);
	stmt.setString(5, ms_BookmarkShow);
	stmt.setString(6, ms_BookmarkShowType);
	stmt.setString(7, ms_BookmarkEndType);
	if (stmt.executeUpdate() > 0) {
		s_alert = "<script>alert('保存成功!');window.location='bac_bookmark_list.jsp?d_templateid="
				+ ms_TemplateID + "';</script>";
	} else {
		s_alert = "<script>alert('保存失败!');history.back();</script>";
	}
	closeAll(con, stmt, null);
	response.getWriter().write(s_alert);
%>