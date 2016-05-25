<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%!public String ms_Action;
	public String ms_ActionDesc = "";
	public String ms_ID = "";
	public String ms_BookmarkName = "";
	public String ms_BookmarkDesc = "";
	public String ms_BookmarkText = "";
	public String ms_TemplateID;%>
<%
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	ms_Action = request.getParameter("action") + "";
	ms_ID = request.getParameter("id");
	ms_TemplateID = request.getParameter("d_templateid") + "";
	if (!isNullOrEmpty(ms_ID)) {
		ms_ActionDesc = "修改";

		//判断是否存在相同标签
		String s_sql = "select * from eWebOffice_T_BookMark where D_ID = "
				+ ms_ID;
		con = getConn();
		rs = ExecuteQuery(con, s_sql);
		if (rs.next()) {
			ms_BookmarkName = rs.getString("D_BookMarkName");
			ms_BookmarkDesc = rs.getString("D_BookMarkDesc");
			ms_BookmarkText = rs.getString("D_BookMarkText");
		} else {
			response
					.getWriter()
					.write(
							"<script>alert('数据库不存在此标签!');window.location='bookmark_list.jsp';</script>");
		}
		closeAll(con, stmt, rs);
	} else {
		ms_ID = "";
		ms_ActionDesc = "新增";
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>eWebOffice示例 : 书签管理</title>
		<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />


		<script type="text/javascript">
function DoCheckSubmit() {
	if (document.form1.d_bookmarkname.value == "") {
		alert("请输入书签名称！");
		return false;
	}
	return true;
}
</script>

	</head>
	<body>
		<div id="bdy">

			<div id="nav">
				您当前位置 &gt;&gt;
				<a href="default.jsp">eWebOffice示例首页</a> &gt;&gt;
				<a href="bookmark_list.jsp">书签管理</a> &gt;&gt; 编辑书签[
				<span class=red><%=ms_ActionDesc%></span>]
			</div>
			<hr />

			<form name=form1 action="bac_bookmark_save.jsp" method="post"
				onsubmit="return DoCheckSubmit();">
				<input type=hidden name=d_id value="<%=ms_ID%>" />
				<input type=hidden name=d_templateid value="<%=ms_TemplateID%>" />
				<table class="edit">
					<tr>
						<td>
							书签名称
						</td>
						<td>
							<input type="text" name="d_bookmarkname" size="50" class="txt"
								value="<%=ms_BookmarkName%>">
						</td>
					</tr>
					<tr>
						<td>
							书签说明
						</td>
						<td>
							<input type="text" name="d_bookmarkdesc" size="50" class="txt"
								value="<%=ms_BookmarkDesc%>">
						</td>
					</tr>
					<tr>
						<td>
							书签备注
						</td>
						<td>
							<input type="text" name="d_bookmarktext" size="50" class="txt"
								value="<%=ms_BookmarkText%>">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value=" 保 存 " class="btn">
							<input type="reset" value=" 重 填 " class="btn">
							<input type="button" value=" 返 回 " onclick="history.back();"
								class="btn">
						</td>
					</tr>
				</table>
			</form>

			<hr />
			<div id="footer">
				Copyright &copy;
				<span style="color: Blue;">eWebSoft.com</span>, All Rights Reserved
				.&nbsp; 福州极限软件开发有限公司&nbsp; 邮箱：
				<a href="mailto:service@ewebsoft.com">service@ewebsoft.com</a>&nbsp;
				官网：
				<a href="http://www.ewebsoft.com/eweboffice/" target="_blank">http://www.ewebsoft.com/eweboffice/</a>
			</div>

		</div>
	</body>
</html>

