<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%
	Connection con = null;
	PreparedStatement relStmt = null;
	PreparedStatement bookmarkStmt = null;
	PreparedStatement stmt = null;
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String s_TemplateID = request.getParameter("d_templateid") + "";
	String s_alert = "";
	if (!isNullOrEmpty(s_TemplateID)) {
		String rel_sql = "Delete from EWEBOFFICE_T_TEMPLATEBOOKMARK where D_TemplateID =?";
		String bookmark_sql = "Delete from EWEBOFFICE_T_BOOKMARK where D_TemplateID =?";
		String s_sql = "Delete from eWebOffice_T_TemplateFile where D_TemplateID =?";
		try {
			con = getConn();
			con.setAutoCommit(false);
			relStmt = con.prepareStatement(rel_sql);
			relStmt.setString(1, s_TemplateID);
			bookmarkStmt = con.prepareStatement(bookmark_sql);
			bookmarkStmt.setString(1, s_TemplateID);
			stmt = con.prepareStatement(s_sql);
			stmt.setString(1, s_TemplateID);
			relStmt.executeUpdate();
			bookmarkStmt.executeUpdate();
			if (stmt.executeUpdate() > 0) {
				con.commit();
				s_alert = "<script>alert('删除成功!');window.location='bac_template_list.jsp'</script>";
			} else {
				s_alert = "<script>alert('数据不存在!');window.location='bac_template_list.jsp'</script>";
			}
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (Exception e1) {
			}
		} finally {
			closeAll(con, stmt, null);
		}
	} else {
		s_alert = "<script>alert('无效的参数!');window.location='bac_template_list.jsp'</script>";
	}
	response.getWriter().write(s_alert);
%>