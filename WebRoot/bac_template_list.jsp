<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>

<%@include file="DBHelper.jsp"%>
<%!
public String GetTemplateList()
    {
        String s_List = "";
        String strSelectCmd = "Select D_Filesize,D_TemplateID,D_FileType,D_FileName,D_Descript From eWebOffice_T_TemplateFile order by D_ID desc";
        Connection con = null;
		ResultSet rs = null;
        try{
    
	    	con = getConn();
			rs = ExecuteQuery(con,strSelectCmd);
        	while (rs.next())
            {
        	    int ms_FileSize=rs.getInt("D_Filesize");
        	    String workModel;
        	    if(ms_FileSize==0){
        	    	workModel="init";
        	    }else{
        	    	workModel="edit";      	    	
        	    }
                s_List += "<tr align=center>";
	            s_List += "<td>" + rs.getString("D_TemplateID") + "&nbsp;</td>";
	            s_List += "<td>" + rs.getString("D_FileName") + "&nbsp;</td>";
	            s_List += "<td>" + rs.getString("D_FileType")+ "&nbsp;</td>";
	            s_List += "<td>" + rs.getString("D_Descript") + "&nbsp;</td>";
	            s_List += "<td>";
	            s_List += "<a href='bac_template_content_save.jsp?d_templateid=" + rs.getString("D_TemplateID") + "&d_filetype=" + rs.getString("D_FileType") + "&action="+workModel+"'>编辑</a>&nbsp;";
	            s_List += "<a href='bac_template_delete.jsp?d_templateid=" + rs.getString("D_TemplateID") + "'>删除</a>";
	            s_List += "</td>";
	            s_List += "</tr>";
                
            }
        	if (s_List.equals(""))
        	{
            s_List = "<tr><td colspan=5>没有数据！</td></tr>";
        	}
        }catch(Exception e){
        	 s_List = "<tr><td colspan=5>没有数据！</td></tr>";
        }
        finally{
        	closeAll(con,null,rs);
        }
        return (s_List);

    }%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>模板管理</title>
<link rel="Stylesheet" type="text/css" href="css/eweboffice.css" />

</head>
<body>
	<div id="bdy">

		<div id="nav">您当前位置 &gt;&gt; 模板管理</div>
		<hr />

		<table border=0 width="100%">
			<tr>
				<td><input type=button class="btn" value="新建Word模板"
					onclick="location.href='bac_template_save.jsp?d_filetype=doc&action=new';">
				</td>
				<td align="right"><input type=button class="btn" value="返回首页"
					onclick="location.href='bac_default.jsp';"></td>
			</tr>
		</table>

		<br />

		<table class="lst">
			<tr>
				<th>编号</th>
				<th>模板名称</th>
				<th>模板类型</th>
				<th>模板说明</th>
				<th>操作</th>
			</tr>
			<%=GetTemplateList()%>
		</table>
		<hr />
	</div>
</body>
</html>

