<%@ page language="java"
	import="java.util.*,java.sql.*,java.text.SimpleDateFormat"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%
	String ms_TemplateID;
	String ms_FileName;
	String ms_Descript;
	String ms_FileType;
	String ms_Action;
	Connection con = null;
	PreparedStatement stmt = null;
	String s_alert = "";
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	ms_TemplateID = request.getParameter("d_templateid") + "";
	ms_FileName = request.getParameter("d_filename") + "";
	ms_Descript = request.getParameter("d_descript") + "";
	ms_FileType = request.getParameter("d_filetype") + "";
	ms_Action = request.getParameter("action") + "";
	String s_sql = "";
	if (!isNullOrEmpty(ms_TemplateID)) {
		if (ms_Action.equals("new")) {
			try {
				con = getConn();
				s_sql = "insert into eWebOffice_T_TemplateFile (D_TemplateID,D_FileName,D_Filetype,D_Descript) values(?,?,?,?)";
				stmt = con.prepareStatement(s_sql);
				stmt.setString(1, ms_TemplateID);
				stmt.setString(2, ms_FileName);
				stmt.setString(3, ms_FileType);
				stmt.setString(4, ms_Descript);
				if (stmt.executeUpdate() > 0) {
					s_alert = "<script>alert('保存成功!');window.location='bac_template_list.jsp';</script>";
				} else {
					s_alert = "<script>alert('保存失败!');window.location='bac_template_list.jsp';</script>";
				}
			} catch (Exception ex) {
				s_alert = "<script>alert('保存失败!');window.location='bac_template_list.jsp';</script>";
			} finally {
				closeAll(con, stmt, null);
			}
		} else {
			try {
				con = getConn();
				s_sql = "Update eWebOffice_T_TemplateFile Set D_FileName =?,D_Filetype=?,D_Descript =? Where D_TemplateID=?";
				stmt = con.prepareStatement(s_sql);
				stmt.setString(1, ms_FileName);
				stmt.setString(2, ms_FileType);
				stmt.setString(3, ms_Descript);
				stmt.setString(4, ms_TemplateID);
				if (stmt.executeUpdate() > 0) {
					s_alert = "<script>alert('修改成功!');window.location='bac_template_list.jsp';</script>";
				} else {
					s_alert = "<script>alert('修改失败!');window.location='bac_template_list.jsp';</script>";
				}
			} catch (Exception ex) {
				s_alert = "<script>alert('修改失败!');window.location='bac_template_list.jsp';</script>";
			} finally {
				closeAll(con, stmt, null);
			}
		}
		response.getWriter().write(s_alert);
	}
%>