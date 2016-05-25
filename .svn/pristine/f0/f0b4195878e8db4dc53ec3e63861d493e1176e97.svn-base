<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%!public String ms_TemplateID;%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
ms_TemplateID = request.getParameter("d_templateid") + "";
//System.out.println(ms_TemplateID);
%>
<%!
	public String GetBookMarkList() {
		String s_List = "";
		String strSelectCmd = "select * from eWebOffice_T_BookMark   where D_TEMPLATEID='"
				+ ms_TemplateID + "' order by D_ID desc";
		Connection con = null;
		ResultSet rs = null;

		try {

			con = getConn();
			rs = ExecuteQuery(con, strSelectCmd);
			while (rs.next()) {
				String D_BookMarkText=rs.getString("D_BookMarkText");
				D_BookMarkText=D_BookMarkText==null?"":D_BookMarkText;
				s_List += "<tr align=center>";
				s_List += "<td>" + rs.getString("D_ID") + "</td>";
				s_List += "<td>" + rs.getString("D_BookMarkName") + "</td>";
				s_List += "<td>" + rs.getString("D_BookMarkDesc") + "</td>";
				s_List += "<td>" + D_BookMarkText + "</td>";
				s_List += "<td>";
				s_List += "<a href='bac_bookmark_edit.jsp?action=edit&id="
						+ rs.getString("D_ID")+"&d_templateid="+ms_TemplateID + "'>修改</a>&nbsp;";
				s_List += "<a href='bac_bookmark_delete.jsp?id="
						+ rs.getString("D_ID") +"&d_templateid="+ms_TemplateID+ "'>删除</a>";
				s_List += "</td>";
				s_List += "</tr>";
			}
			if (s_List == "") {
				s_List = "<tr><td colspan=5>没有数据！</td></tr>";
			}
		} catch (Exception e) {
			s_List = "<tr><td colspan=5>没有数据！</td></tr>";
		} finally {
			closeAll(con, null, rs);
		}
		return (s_List);

	}%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1" runat="server">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>书签管理</title>
		<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />

	</head>
	<body>
		<div id="bdy">

			<div id="nav">
				您当前位置 &gt;&gt;
				<a href="#" onclick="window.close()">模板管理</a> &gt;&gt; 书签管理
			</div>
			<hr />

			<table border=0 width="100%">
				<tr>
					<td>
						<input type="button" class="btn" value="增加书签"
							onclick="window.location='bac_bookmark_edit.jsp?action=new&d_templateid=<%=ms_TemplateID%>'">
					</td>
					<td align="right">
						<input type="button" class="btn" value=" 返 回 "
							onclick="window.close()">
					</td>
				</tr>
			</table>

			<br />

			<table class="lst">
				<tr>
					<th>
						编号
					</th>
					<th>
						书签名称
					</th>
					<th>
						书签说明
					</th>
					<th>
						数据查询
					</th>
					<th>
						操作
					</th>
				</tr>
				<%=GetBookMarkList()%>
			</table>
<hr />

		</div>
	</body>
</html>