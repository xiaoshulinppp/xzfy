<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%
		Connection con = null;
	    PreparedStatement stmt = null;;
	 	String s_alert="";
	    String ms_ID;
        String ms_BookmarkName;
        String ms_BookmarkDesc;
        String ms_BookmarkText;
	 	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	 	ms_ID = request.getParameter("d_id") + "";
        ms_BookmarkName = request.getParameter("d_bookmarkname") + "";
        ms_BookmarkDesc = request.getParameter("d_bookmarkdesc") + "";
        ms_BookmarkText = request.getParameter("d_bookmarktext") + "";
        String s_sql = "";
	 	if(!isNullOrEmpty(ms_ID)){
        	 s_sql = "Update eWebOffice_T_Bookmark Set D_BookmarkName=?,D_BookmarkDesc=?,D_BookmarkText=? where D_ID="+ms_ID;
        }else{
        	 s_sql="Insert Into eWebOffice_T_Bookmark (D_BookmarkName,D_BookmarkDesc,D_BookmarkText) values(?,?,?)";;
        }
        con = getConn();
        stmt = con.prepareStatement(s_sql);
		stmt.setString(1,ms_BookmarkName);
		stmt.setString(2,ms_BookmarkDesc);
		stmt.setString(3,ms_BookmarkText);
		if(stmt.executeUpdate()>0){
					s_alert = "<script>alert('保存成功!');window.location='bookmark_list.jsp';</script>";
		}else{
					s_alert = "<script>alert('保存失败!');history.back();</script>";
		}
		closeAll(con,stmt,null);
        response.getWriter().write(s_alert);
%>