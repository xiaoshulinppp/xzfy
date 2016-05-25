<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp"%>
<%!public String ms_Action;
	public String ms_ActionDesc = "";
	public String ms_ID = "";
	public String ms_BookmarkName = "";
	public String ms_BookmarkDesc = "";
	public String ms_BookmarkText = "";
	public String ms_BookmarkShow = "";
	public String ms_BookmarkShowType = "";
	public String ms_BookmarkEndType = "";
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
			ms_BookmarkText = ms_BookmarkText == null ? ""
					: ms_BookmarkText;
			ms_BookmarkShow = rs.getString("D_BookmarkShow");
			if (ms_BookmarkShow.indexOf("\\n") != -1) {
				ms_BookmarkShow = ms_BookmarkShow.replace("\\n",
						"\\\\n");
			}
			ms_BookmarkShowType = rs.getString("D_BookmarkShowType");
			ms_BookmarkEndType = rs.getString("D_BookmarkEndType");
		} else {
			response
					.getWriter()
					.write(
							"<script>alert('数据库不存在此标签!');window.location='bac_bookmark_list.jsp?d_templateid="
									+ ms_TemplateID + "';</script>");
		}
		closeAll(con, stmt, rs);
	} else {
		ms_ID = "";
		ms_ActionDesc = "新增";
		ms_BookmarkName = "";
		ms_BookmarkDesc = "";
		ms_BookmarkText = "";
		ms_BookmarkShow = "";
		ms_BookmarkShowType = "single";
		ms_BookmarkEndType = "";
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>书签管理</title>
		<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />


		<script type="text/javascript">
function DoCheckSubmit() {
	if (document.form1.d_bookmarkname.value == "") {
		alert("请输入书签名称！");
		return false;
	}
	if (document.form1.d_bookmarkdesc.value == "") {
		alert("请输入书签说明！");
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
				<a href="#" onclick="window.close();">模板管理</a> &gt;&gt;
				<a href="bac_bookmark_list.jsp?d_templateid=<%=ms_TemplateID%>">书签管理</a>
				&gt;&gt; 编辑书签[
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
							（在Word模板中显示名称）
						</td>
					</tr>
					<tr>
						<td>
							书签说明
						</td>
						<td>
							<input type="text" name="d_bookmarkdesc" size="50" class="txt"
								value="<%=ms_BookmarkDesc%>">
							（在Word模板中书签说明）
						</td>
					</tr>
					<tr>
						<td>
							数据查询
						</td>
						<td>
							<textarea class="textarea" wrap="VIRTUAL" name="d_bookmarktext"><%=ms_BookmarkText%></textarea>
							<br />
							（查询示例：select showField from tableName where caseId=@caseId）
						</td>
					</tr>
					<tr>
						<td>
							显示方式
						</td>
						<td>
							<select name="d_bookmarkshowtype" id="d_bookmarkshowtype"
								onchange="showTypeChange()">
								<option value="single"
									<%if ("single".equals(ms_BookmarkShowType)) {%> selected <%}%>>
									单一显示
								</option>
								<option value="loop"
									<%if ("loop".equals(ms_BookmarkShowType)) {%> selected <%}%>>
									循环显示
								</option>
								<option value="sysdate"
									<%if ("sysdate".equals(ms_BookmarkShowType)) {%> selected <%}%>>
									系统日期
								</option>
							</select>
							<tbody id="endType" style="display: none">
								<tr>
									<td>
										是否去除末尾符号
									</td>
									<td>
										<input type="radio" name="d_bookmarkendtype" value="是"
											id="d_bookmarkendtype_y"
											<%if ("是".equals(ms_BookmarkEndType)) {%> checked <%}%> />
										去除
										<input type="radio" name="d_bookmarkendtype" value="否"
											id="d_bookmarkendtype_n"
											<%if ("否".equals(ms_BookmarkEndType)) {%> checked <%}%> />
										不去除
										<br />
										（循环显示填写说明：{显示字段名称}{标点}{换行(选填)},如：{shenqinren}{、}{}）
									</td>
								</tr>
							</tbody>
						</td>
					</tr>
					<tr>
						<td>
							数据显示
						</td>
						<td>
							<textarea class="textarea" wrap="VIRTUAL" name="d_bookmarkshow"
								id="d_bookmarkshow"><%=ms_BookmarkShow%></textarea>
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

		</div>
	</body>
	<script>
function showTypeChange() {
	var showTypeValue = document.getElementById("d_bookmarkshowtype").value;
	if (showTypeValue == "loop") {
		document.getElementById("endType").style.display = "block";
		document.getElementById("d_bookmarkshow").value = "{showField}{：}{\\n}";
	} else {
		if (showTypeValue == "sysdate") {
			document.getElementById("d_bookmarkshow").value = "sysdate";
		} else {
			document.getElementById("d_bookmarkshow").value = "showField";
		}
		document.getElementById("d_bookmarkendtype_y").checked = false;
		document.getElementById("d_bookmarkendtype_n").checked = false;
		document.getElementById("endType").style.display = "none";
	}
}
showTypeChange();<%if (!"".equals(ms_BookmarkShow)) {%>
document.getElementById("d_bookmarkshow").value = "<%=ms_BookmarkShow%>";
<%}%>
</script>
</html>

