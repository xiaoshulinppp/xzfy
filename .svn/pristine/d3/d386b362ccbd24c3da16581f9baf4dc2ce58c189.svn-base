<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@include file="DBHelper.jsp" %>
<%!
public String GetBookMarkList()
    {
        String s_List = "";
        String strSelectCmd = "select * from eWebOffice_T_BookMark order by D_ID desc";
        Connection con = null;
		ResultSet rs = null;
		
        try{
    
	    	con = getConn();
			rs = ExecuteQuery(con,strSelectCmd);
        	while (rs.next())
            {
                
                 s_List += "<tr align=center>";
                s_List += "<td>" + rs.getString("D_ID") + "</td>";
                s_List += "<td>" + rs.getString("D_BookMarkName") + "</td>";
                s_List += "<td>" + rs.getString("D_BookMarkDesc") + "</td>";
                s_List += "<td>" + rs.getString("D_BookMarkText") + "</td>";
                s_List += "<td>";
                s_List += "<a href='bookmark_edit.jsp?action=edit&id=" + rs.getString("D_ID") + "'>修改</a>&nbsp;";
                s_List += "<a href='bookmark_delete.jsp?id=" + rs.getString("D_ID") + "'>删除</a>";
                s_List += "</td>";
                s_List += "</tr>";
            }
        	if (s_List == "")
        {
            s_List = "<tr><td colspan=5>没有数据！</td></tr>";
        }
        }catch(Exception e){
        	s_List = "<tr><td colspan=5>没有数据！</td></tr>";
        }finally{
        	closeAll(con,null,rs);
        }
        return (s_List);

    }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>eWebOffice示例 : 书签管理</title>
<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />

</head>
<body>
<div id="bdy">

<div id="nav">您当前位置 &gt;&gt; <a href="default.jsp">eWebOffice示例首页</a> &gt;&gt; 书签管理</div> 
<hr />

<table border=0 width="100%">
<tr>
    <td>
        <input type="button" class="btn" value="增加书签" onclick="location.href='bookmark_edit.jsp?action=new'">
    </td>
    <td align="right">
        <input type="button" class="btn" value="返回首页" onclick="location.href='default.jsp';">
    </td>
</tr>
</table>

<br />

<table class="lst">
<tr>
    <th>编号</th>
    <th>书签名称</th>
    <th>书签说明</th>
    <th>书签备注</th>
    <th>操作</th>
</tr>
<%=GetBookMarkList()%>
</table>


<hr />
<div id="footer">Copyright &copy; <span style="color:Blue;">eWebSoft.com</span>, All Rights Reserved .&nbsp; 福州极限软件开发有限公司&nbsp; 邮箱：<a href="mailto:service@ewebsoft.com">service@ewebsoft.com</a>&nbsp; 官网：<a href="http://www.ewebsoft.com/eweboffice/" target="_blank">http://www.ewebsoft.com/eweboffice/</a></div>


</div>
</body>
</html>