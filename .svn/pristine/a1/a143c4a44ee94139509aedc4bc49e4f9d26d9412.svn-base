<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
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
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String s_recordID = request.getParameter("d_recordid") + "";
	String s_alert = "";
	if (!isNullOrEmpty(s_recordID)) {
		Connection conn = getConn();

		try {
			conn.setAutoCommit(false);
			String s_sql = "delete from eWebOffice_T_VersionFile where D_RecordID ='"
					+ s_recordID + "'";
			ExecuteUpdate(conn, s_sql);
			s_sql = "delete from eWebOffice_T_DocumentFile where D_RecordID ='"
					+ s_recordID + "'";
			ExecuteUpdate(conn, s_sql);
			s_sql = "delete from eWebOffice_T_Document where D_RecordID ='"
					+ s_recordID + "'";
			ExecuteUpdate(conn, s_sql);
			conn.commit();
			s_alert = "<script>alert('删除成功!');window.location='bac_default_shenpidan_list.jsp?caseId="+ms_cassid+"&d_username="+ms_userrName+"';</script>";

		} catch (Exception ex) {
			s_alert = "<script>alert('删除失败!');window.location='bac_default_shenpidan_list.jsp?caseId="+ms_cassid+"&d_username="+ms_userrName+"';</script>";
			conn.rollback();
		} finally {
			closeAll(conn, null, null);
		}
	} else {
		s_alert = "<script>alert('参数有误!');window.location='bac_default_shenpidan_list.jsp?caseId="+ms_cassid+"&d_username="+ms_userrName+"';</script>";
	}
	response.getWriter().write(s_alert);
%>

