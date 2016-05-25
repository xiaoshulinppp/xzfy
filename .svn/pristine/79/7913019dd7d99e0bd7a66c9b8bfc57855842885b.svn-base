<%@ page language="java"
	import="java.util.*,com.ewebsoft.eweboffice.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat,oracle.sql.BLOB,java.io.*,oracle.jdbc.driver.OracleResultSet"
	pageEncoding="UTF-8"%>
<%!public eWebOfficeServer EWEBOS = null;

	//Oracle
	private static String DBDRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String DBConnectionString = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	private static String DBNAME = "xzfy";
	private static String DBPASS = "xzfy";

	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	private HttpServletRequest m_request = null;
	private HttpServletResponse m_response = null;

	private Connection connTemp = null;
	private PreparedStatement stmtTemp = null;
	private PreparedStatement stmtTempp = null;
	private ResultSet rsTemp = null;
	private ResultSet rsTempp = null;
	//根据RecordID加载文件
	public void DoLoadFile() {
		String s_RecordID = EWEBOS.WebMsgGetString("RecordID");
		EWEBOS.WebMsgClear();
		if (s_RecordID != "") {
			String sql = "select * from eWebOffice_T_DocumentFile where D_RecordID=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, s_RecordID);
				rs = stmt.executeQuery();
				if (rs.next()) {
					EWEBOS.WebMsgSetString("FileType", rs
							.getString("D_FileType"));//设置返回客户端的参数
					EWEBOS.WebMsgSetStream("FileBody", ReadBlob((BLOB) rs
							.getBlob("D_FileBody"), rs.getInt("D_FileSize")));
					EWEBOS.WebMsgStatus("TRUE", "文件加载成功!");
				} else {
					EWEBOS.WebMsgAlert("文件加载失败!");
				}
			} catch (Exception e) {
				EWEBOS.WebMsgAlert("请求有误,异常:" + e.getMessage());
			} finally {
				this.closeAll();
			}
		} else {
			EWEBOS.WebMsgAlert("文件加载失败!");
		}
		EWEBOS.WebMsgSend();

	}

	/// <summary>
	/// 保存文件
	/// </summary>
	public void DoSaveFile() {
		String s_all=EWEBOS.WebMsgGetString("CusParam");
		String[] allshuzu=s_all.split(";");
		String caseId = allshuzu[0];
		String checkstatus=allshuzu[1];
		String finishtype=allshuzu[2];
		String s_RecordID = EWEBOS.WebMsgGetString("RecordID");
		String s_TemplateID = EWEBOS.WebMsgGetString("TemplateID");
		String s_UserName = EWEBOS.WebMsgGetString("UserName");
		String s_Descript = EWEBOS.WebMsgGetString("Descript");
		String s_FileName = EWEBOS.WebMsgGetString("FileName");
		String s_FileType = EWEBOS.WebMsgGetString("FileType");
		String s_FilePath = EWEBOS.WebMsgGetString("FilePath");
		byte[] a_FileBody = EWEBOS.WebMsgGetStream("FileBody");
		int n_FileSize = EWEBOS.WebMsgGetFileSize("FileBody");
		s_FileName = s_FileName + s_FileType;
		String sql = " select count(*) from eWebOffice_T_DocumentFile where D_RecordID=?";
		EWEBOS.WebMsgClear();
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, s_RecordID);
			rs = stmt.executeQuery();
			rs.next();
			int n_count = rs.getInt(1);
			if (n_count > 0) {
				sql = "update eWebOffice_T_DocumentFile set D_RecordID=?,D_FileName=?,d_FileType=?,D_FileSize=?,D_FileBody=EMPTY_BLOB(),D_FilePath=?,D_UserName=?,D_Descript=?,D_FileDate=?,CASEID=?,D_TEMPLATEID=? where D_RecordID='"
						+ s_RecordID + "'";
			} else {
				sql = "insert into eWebOffice_T_DocumentFile(D_RecordID,D_FileName,D_FileType,D_FileSize,D_FileBody,D_FilePath,D_UserName,D_Descript,D_FileDate,CASEID,D_TEMPLATEID) values(?,?,?,?,EMPTY_BLOB(),?,?,?,?,?,?)";
			}
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, s_RecordID);
			stmt.setString(2, s_FileName);
			stmt.setString(3, s_FileType);
			stmt.setInt(4, n_FileSize);
			stmt.setString(5, s_FilePath);
			stmt.setString(6, s_UserName);
			stmt.setString(7, s_Descript);
			stmt.setDate(8, this.GetDate());
			stmt.setString(9, caseId);
			stmt.setString(10, s_TemplateID);
			n_count = stmt.executeUpdate();
			sql = "select D_FileBody from eWebOffice_T_DocumentFile where D_RecordID='"
					+ s_RecordID + "' for update";
			boolean b_return = this.WriteBlob(sql, a_FileBody);
			conn.commit();
			if (n_count > 0 && b_return) {
				EWEBOS.WebMsgStatus("TRUE", "文件保存成功!");
			} else {
				EWEBOS.WebMsgAlert("文件保存失败!");
			}

		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception e1) {
			}
			EWEBOS.WebMsgAlert("保存出错,错误信息:" + e.getMessage());
		} finally {
			this.closeAll();
			EWEBOS.WebMsgSend();
		}
	}

	/// <summary>
	/// 根据RecordId显示该ID的所有版本列表
	/// </summary>
	public void DoListVersion() {
		int i = 0;
		String s_RecordID = EWEBOS.WebMsgGetString("RecordID");
		EWEBOS.WebMsgClear();
		if (!s_RecordID.equals("")) {
			String sql = "select * from eWebOffice_T_VersionFile where D_RecordID=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, s_RecordID);
				rs = stmt.executeQuery();
				while (rs.next()) {
					i++;
					EWEBOS.WebMsgSetString("FileName" + i, rs
							.getString("D_FileName"));
					EWEBOS.WebMsgSetString("UserName" + i, rs
							.getString("D_UserName"));
					EWEBOS.WebMsgSetString("FilePath" + i, rs
							.getString("D_FilePath"));
					EWEBOS.WebMsgSetString("ID" + i, rs.getString("D_ID"));
					EWEBOS.WebMsgSetString("FileDate" + i, rs
							.getString("D_FileDate"));
					EWEBOS.WebMsgSetString("Descript" + i, rs
							.getString("D_Descript"));

				}

				EWEBOS.WebMsgSetString("VersionCount", String.valueOf(i));
				EWEBOS.WebMsgStatus("TRUE", "版本列表加载成功!");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
			}
		} else {
			EWEBOS.WebMsgAlert("参数不正确!");
		}
		EWEBOS.WebMsgSend();
	}

	/// <summary>
	/// 根据版本ID打开文件
	/// </summary>
	public void DoLoadVersion() {
		int n_FileId = EWEBOS.WebMsgGetString("ID") == "" ? 0 : Integer
				.parseInt(EWEBOS.WebMsgGetString("ID"));
		EWEBOS.WebMsgClear();
		if (n_FileId > 0) {
			String sql = "select * from eWebOffice_T_VersionFile where D_ID=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, n_FileId);
				rs = stmt.executeQuery();

				if (rs.next()) {
					EWEBOS.WebMsgSetStream("FileBody", this.ReadBlob((BLOB) rs
							.getBlob("D_FileBody"), rs.getInt("D_FileSize")));
					EWEBOS.WebMsgSetString("FileType", rs
							.getString("D_FileType"));
					EWEBOS.WebMsgStatus("TRUE", "版本列表加载成功!");
				} else {
					EWEBOS.WebMsgAlert("文件不存在!");
				}
			} catch (Exception e) {
				EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
			} finally {
				this.closeAll();
			}

		} else {
			EWEBOS.WebMsgAlert("参数不正确!");
		}
		EWEBOS.WebMsgSend();
	}

	/// <summary>
	/// 添加版本
	/// </summary>
	public void DoSaveVersion() {
		String s_RecordID = EWEBOS.WebMsgGetString("RecordID");
		String s_UserName = EWEBOS.WebMsgGetString("UserName");
		String s_Descript = EWEBOS.WebMsgGetString("Descript");
		String s_FileName = EWEBOS.WebMsgGetString("FileName");
		String s_FilePath = EWEBOS.WebMsgGetString("FilePath");
		String s_FileType = EWEBOS.WebMsgGetString("FileType");
		int n_FileSize = EWEBOS.WebMsgGetFileSize("FileBody");
		byte[] a_FileBody = EWEBOS.WebMsgGetStream("FileBody");
		int n_id = 0;
		boolean b_return = false;
		EWEBOS.WebMsgClear();
		if (s_RecordID != "") {
			String sql = "insert into eWebOffice_T_VersionFile(D_RecordID,D_FileName,D_Filetype,D_Filesize,D_FileDate,D_FileBody,D_FilePath,D_UserName,D_Descript)values(?,?,?,?,?,EMPTY_BLOB(),?,?,?)";

			try {
				conn.setAutoCommit(false);
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, s_RecordID);
				stmt.setString(2, s_FileName);
				stmt.setString(3, s_FileType);
				stmt.setInt(4, n_FileSize);
				stmt.setDate(5, GetDate());
				stmt.setString(6, s_FilePath);
				stmt.setString(7, s_UserName);
				stmt.setString(8, s_Descript);
				int n_result = stmt.executeUpdate();
				if (n_result > 0) {
					sql = "select Max(D_ID) from eWebOffice_T_Seal";
					stmt = conn.prepareStatement(sql);
					rs = stmt.executeQuery();
					if (rs.next()) {
						n_id = rs.getInt(1);
					} else {
						conn.rollback();
					}
					if (n_id > 0) {

						sql = "select D_FileBody from eWebOffice_T_Seal where D_ID="
								+ n_id + " for update";
						b_return = this.WriteBlob(sql, a_FileBody);
					} else {
						conn.rollback();
					}
				}
				if (b_return) {
					conn.commit();
					EWEBOS.WebMsgStatus("TRUE", "版本添加成功!");
				} else {
					conn.rollback();
					EWEBOS.WebMsgAlert("文件添加失败!");
				}
			} catch (Exception e) {
				try {
					conn.rollback();
				} catch (Exception e1) {
				}
				EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
			} finally {
				this.closeAll();
			}
		} else {
			EWEBOS.WebMsgAlert("参数不正确!");
		}
		EWEBOS.WebMsgSend();
	}

	/// <summary>
	/// 根据模板ID获取模板
	/// </summary>
	public void DoLoadTemplate() {
		String n_TemplatId = EWEBOS.WebMsgGetString("TemplateID");
		EWEBOS.WebMsgClear();
		if (!isNullOrEmpty(n_TemplatId)) {
			String sql = "select * from eWebOffice_T_TemplateFile where D_TemplateID=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, n_TemplatId);
				rs = stmt.executeQuery();

				if (rs.next()) {
					EWEBOS.WebMsgSetStream("FileBody", this.ReadBlob((BLOB) rs
							.getBlob("D_FileBody"), rs.getInt("D_FileSize")));
					EWEBOS.WebMsgSetString("FileType", rs
							.getString("D_FileType"));
					EWEBOS.WebMsgStatus("TRUE", "模板加载成功!");
				} else {
					EWEBOS.WebMsgAlert("模板不存在!");
				}
			} catch (Exception e) {
				EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
			} finally {
				this.closeAll();
			}
		} else {
			EWEBOS.WebMsgAlert("模板不存在!");
		}
		EWEBOS.WebMsgSend();
	}

	/// <summary>
	/// 保存模板
	/// </summary>
	public void DoSaveTemplate() {
		String s_TemplateID = EWEBOS.WebMsgGetString("TemplateID");
		String s_UserName = EWEBOS.WebMsgGetString("UserName");
		String s_Descript = EWEBOS.WebMsgGetString("Description");
		String s_FileName = EWEBOS.WebMsgGetString("FileName");
		String s_FilePath = EWEBOS.WebMsgGetString("FilePath");
		byte[] a_FileBody = EWEBOS.WebMsgGetStream("FileBody");
		int n_FileSize = EWEBOS.WebMsgGetFileSize("FileBody");
		String s_FileType = EWEBOS.WebMsgGetString("FileType");
		String sql = "";
		EWEBOS.WebMsgClear();
		if (!isNullOrEmpty(s_TemplateID)) {
			try {
				sql = "select * from eWebOffice_T_TemplateFile where D_TemplateID=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, s_TemplateID);
				rs = stmt.executeQuery();
				if (rs.next()) {
					sql = "update eWebOffice_T_TemplateFile set D_TemplateID=?,D_FileName=?,D_Filetype=?,D_Filesize=?,D_FileDate=?,D_FileBody=EMPTY_BLOB(),D_FilePath=?,D_UserName=?,D_Descript=? where D_TemplateID='"
							+ s_TemplateID + "'";
				} else {
					sql = "insert into eWebOffice_T_TemplateFile(D_TemplateID,D_FileName,D_Filetype,D_Filesize,D_FileDate,D_FileBody,D_FilePath,D_UserName,D_Descript)values(?,?,?,?,?,EMPTY_BLOB(),?,?,?)";
				}
				conn.setAutoCommit(false);
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, s_TemplateID);
				stmt.setString(2, s_FileName);
				stmt.setString(3, s_FileType);
				stmt.setInt(4, n_FileSize);
				stmt.setDate(5, GetDate());
				stmt.setString(6, s_FilePath);
				stmt.setString(7, s_UserName);
				stmt.setString(8, s_Descript);
				int n_result = stmt.executeUpdate();
				sql = "select D_FileBody from eWebOffice_T_TemplateFile where D_TemplateID='"
						+ s_TemplateID + "' for update";
				boolean b_return = this.WriteBlob(sql, a_FileBody);
				conn.commit();
				if (n_result > 0 & b_return) {
					EWEBOS.WebMsgStatus("TRUE", "模板保存成功!");
				} else {
					EWEBOS.WebMsgStatus("TRUE", "模板保存失败!");
				}
			} catch (Exception e) {
				try {
					conn.rollback();
				} catch (Exception e1) {
				}
				EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
			} finally {
				this.closeAll();
			}
		} else {
			EWEBOS.WebMsgStatus("TRUE", "模板保存失败!");
		}
		EWEBOS.WebMsgSend();
	}

	/// <summary>
	/// 获取图章标记名称的列表
	/// </summary>
	public void DoLoadSealList() {
		int i = 0;
		String sql = "select D_SealName,D_ID from eWebOffice_T_Seal"; //查询所有图章的名称列表
		EWEBOS.WebMsgClear();
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				i++;
				EWEBOS.WebMsgSetString("SealName" + i, rs
						.getString("D_SealName"));
				EWEBOS.WebMsgSetString("ID" + i, rs.getString("D_ID"));
			}
			EWEBOS.WebMsgSetString("SealCount", String.valueOf(i));
			EWEBOS.WebMsgStatus("TRUE", "读取成功!");
		} catch (Exception e) {
			EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
		} finally {
			this.closeAll();
		}
		EWEBOS.WebMsgSend();
	}

	/// <summary>
	/// 根据用户名与密码来获取 markBody图片字节流
	/// </summary>
	public void DoLoadSealImage() {
		String s_SealName = EWEBOS.WebMsgGetString("SealName"); //取得要获取的图章名称
		String s_UserName = EWEBOS.WebMsgGetString("USERNAME"); //取得用户名称
		String s_Password = EWEBOS.WebMsgGetString("PASSWORD"); //取得用户密码                                          
		String sql = "SELECT D_FileBody,D_FileType FROM eWebOffice_T_Seal WHERE D_SealName=? and D_PassWord=?";
		EWEBOS.WebMsgClear();
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, s_SealName);
			stmt.setString(2, s_Password);
			rs = stmt.executeQuery();

			if (rs.next()) {
				EWEBOS.WebMsgSetString("FileType", rs.getString("D_FileType"));
				BLOB b = (BLOB) rs.getBlob("D_FileBody");
				int ib = (int) b.length();
				EWEBOS.WebMsgSetStream("FileBody", this.ReadBlob(b, ib));
				EWEBOS.WebMsgStatus("TRUE", "读取成功!");
			} else {
				EWEBOS.WebMsgAlert("没有查询到对应数据!");
			}
		} catch (Exception e) {
			EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
		} finally {
			this.closeAll();
		}
		EWEBOS.WebMsgSend();
	}

	/// <summary>
	/// 获取 书签列表 
	/// </summary>
	public void DoListBookmark() {
		String templateId = EWEBOS.WebMsgGetString("TemplateID");
		int i = 0;
		String sql = "select * from eWebOffice_T_Bookmark where D_TEMPLATEID = ?";
		EWEBOS.WebMsgClear();
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, templateId);
			rs = stmt.executeQuery();
			while (rs.next()) {
				i++;
				EWEBOS.WebMsgSetString("BookMarkName" + i, rs
						.getString("D_BookmarkName"));
				EWEBOS.WebMsgSetString("BookMarkDesc" + i, rs
						.getString("D_BookmarkDesc"));
			}
			;
			EWEBOS.WebMsgSetString("BookMarkCount", String.valueOf(i));
			//System.out.println("--------------"+EWEBOS.WebMsgGetString("BookMarkCount"));
			EWEBOS.WebMsgStatus("TRUE", "打开成功!");
		} catch (Exception e) {
			EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
		} finally {
			this.closeAll();
		}
		EWEBOS.WebMsgSend();

	}

	/// <summary>
	/// 获取 document_signture列表,来验证印章有效性
	/// </summary>
	public void DoLoadDocumentSeal() {
		int i = 0;
		String s_RecordID = EWEBOS.WebMsgGetString("RECORDID"); //取得文档编号
		EWEBOS.WebMsgClear();
		//获取该文档所有签章的列表
		if (s_RecordID != "") {
			String sql = "select * from eWebOffice_T_DocumentSeal where D_RecordID=?";
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, s_RecordID);
				rs = stmt.executeQuery();

				while (rs.next()) {
					i++;
					EWEBOS.WebMsgSetString("SealName" + i, rs
							.getString("D_SealName"));
					EWEBOS.WebMsgSetString("UserName" + i, rs
							.getString("D_UserName"));
					EWEBOS.WebMsgSetString("IP" + i, rs.getString("D_IP"));
					EWEBOS.WebMsgSetString("SealGuid" + i, rs
							.getString("D_SealGuid"));
					EWEBOS.WebMsgSetString("DateTime" + i, rs
							.getString("D_DateTime"));
				}
				EWEBOS.WebMsgSetString("SealCount", String.valueOf(i));
				EWEBOS.WebMsgStatus("TRUE", "打开成功!");

			} catch (Exception e) {
				EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
			} finally {
				this.closeAll();
			}
		} else {
			EWEBOS.WebMsgAlert("参数有误!");
		}
		EWEBOS.WebMsgSend();
	}

	/// <summary>
	/// 根据用户名与密码来获取 markBody 图片字节流 
	/// </summary>
	public void DoSaveDocumentSeal() { //时间
		String s_RecordID = EWEBOS.WebMsgGetString("RECORDID"); //取得文档编号
		String s_SealName = EWEBOS.WebMsgGetString("SealName"); //取得签名名称  
		String s_UserName = EWEBOS.WebMsgGetString("USERNAME"); //取得用户名称
		//时间转换 new SimpleDateFormat("yyyy-MM-ddHH:mm:ss").parse(
		String d_DateTimes = EWEBOS.WebMsgGetString("DATETIME"); //取得签名时间
		String s_IP = m_request.getRemoteAddr(); //取得用户IP 
		String s_SealGuid = EWEBOS.WebMsgGetString("SealGuid"); //取得唯一编号，签章的编号
		String sql = "insert into eWebOffice_T_DocumentSeal(D_RecordID,D_SealName,D_UserName,D_DateTime,D_IP,D_SealGuid) values(?,?,?,?,?,?) ";
		EWEBOS.WebMsgClear();
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, s_RecordID);
			stmt.setString(2, s_SealName);
			stmt.setString(3, s_UserName);
			stmt.setDate(4, GetDate());
			stmt.setString(5, s_IP);
			stmt.setString(6, s_SealGuid);
			if (stmt.executeUpdate() > 0) {
				EWEBOS.WebMsgStatus("TRUE", "保存成功!");
			} else {
				EWEBOS.WebMsgAlert("保存失败!");
			}
		} catch (Exception e) {
			EWEBOS.WebMsgAlert("操作有误!错误信息:" + e.getMessage());
		} finally {
			this.closeAll();
		}
		EWEBOS.WebMsgSend();
	}

	//保存该模板的所有书签
	public void DoSaveBookmark() {
		//System.out.println(EWEBOS.WebMsgGetString("BookmarkName1"));
		String s_TemplateID = EWEBOS.WebMsgGetString("TemplateID"); //取得文档编号		
		//先删除原来该模板存在的标签
		String sql = "DELETE FROM eWebOffice_T_TemplateBookmark Where D_TemplateID=?";
		try {
			conn.setAutoCommit(false);
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, s_TemplateID);
			stmt.executeUpdate();
			//添加书签
			int n_BookmarkCount = isNullOrEmpty(EWEBOS
					.WebMsgGetString("BookmarkCount")) ? 0 : Integer
					.parseInt(EWEBOS.WebMsgGetString("BookmarkCount"));
			for (int i = 0; i < n_BookmarkCount; i++) {
				String s_BookmarkName = EWEBOS.WebMsgGetString("BookmarkName"
						+ (i + 1));
				sql = "insert into eWebOffice_T_TemplateBookmark(D_TemplateId,D_BookmarkName) values(?,?)";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, s_TemplateID);
				stmt.setString(2, s_BookmarkName);
				stmt.executeUpdate();
			}
			conn.commit();
			EWEBOS.WebMsgClear();
			EWEBOS.WebMsgStatus("TRUE", "保存成功!");
		} catch (Exception e) {
			System.out.println("失败");
			EWEBOS.WebMsgStatus("TRUE", "保存失败!");
			try {
				conn.rollback();
			} catch (Exception e1) {
			}
		} finally {
			closeAll();
		}

		EWEBOS.WebMsgSend();
	}

	//将该模板的书签值替换填充
	public void DoLoadBookmark() {
		String s_all=EWEBOS.WebMsgGetString("CusParam");
		String[] allshuzu=s_all.split(";");
		String caseId = allshuzu[0];
		String checkstatus=allshuzu[1];
		String finishtype=allshuzu[2];
		String s_TemplateID = EWEBOS.WebMsgGetString("TemplateID");
		EWEBOS.WebMsgClear();
		//查询该模板文档中所有书签名，在根据书签名去Bookmarks表查询对应值，返回到客户端 ，填充书签值
		String sql = "select b.D_BookmarkName,b.D_BookmarkText,b.D_BOOKMARKSHOW,b.D_BOOKMARKSHOWTYPE,D_BOOKMARKENDTYPE from eWebOffice_T_TemplateBookmark a,eWebOffice_T_Bookmark b where a.D_Bookmarkname=b.D_BookmarkName and a.D_TemplateID=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, s_TemplateID);
			rs = stmt.executeQuery();
			int i = 0;
			while (rs.next()) {
				//说明：我们测试程序把SQL语句直接写到替换标签内容
				//实际使用中，这个标签内容是通过Sql语句得到的。
				i++;
				EWEBOS.WebMsgSetString("BookmarkName" + i, rs
						.getString("D_BookmarkName")
						+ "");
				String valueSql = rs.getString("D_BookmarkText");
				String bookMarkShow = rs.getString("D_BOOKMARKSHOW");
				String bookMarkShowType = rs.getString("D_BOOKMARKSHOWTYPE");
				String bookMarkEndType = rs.getString("D_BOOKMARKENDTYPE");
				String tempValue = "";
				if ("loop".equals(bookMarkShowType)) {
					tempValue = getLoopValue(finishtype,checkstatus,caseId, valueSql, bookMarkShow,
							bookMarkEndType);
				} else if ("sysdate".equals(bookMarkShowType)) {
					tempValue = getCurrentDate();
				} else if ("single".equals(bookMarkShowType)) {
					tempValue = getSingleValue(finishtype,checkstatus,caseId, valueSql,bookMarkShow);
									//System.out.println(valueSql);
				}

				EWEBOS.WebMsgSetString("BookmarkText" + i, tempValue);
			}
			EWEBOS.WebMsgSetString("BookmarkCount", String.valueOf(i));
			EWEBOS.WebMsgStatus("TRUE", "书签列表加载成功!");
		} catch (Exception e) {
			EWEBOS.WebMsgAlert("没有书签记录!");
		} finally {
			closeAll();
			EWEBOS.WebMsgSend();
		}
	}

	//获取循环显示
	public String getLoopValue(String finishtype,String checkstatus,String caseId, String valueSql,
			String bookMarkShow, String bookMarkEndType) {
		String tempValue = "";
		if (valueSql != null && !"".equals(valueSql)) {
			if (valueSql.contains("@caseId")) {
				valueSql = valueSql.replace("@caseId", caseId);
			}
			if (valueSql.contains("@d_checkstatus")) {
				valueSql = valueSql.replace("@d_checkstatus", checkstatus);
			}
			if (valueSql.contains("@finish_type")) {
				valueSql = valueSql.replace("@finish_type", finishtype);
			}
			int startIndex = bookMarkShow.indexOf("{");
			int firstIndex = bookMarkShow.indexOf("}{");
			int lastIndex = bookMarkShow.lastIndexOf("}{");
			int endIndex = bookMarkShow.lastIndexOf("}");
			String showValue = bookMarkShow.substring(startIndex + 1,
					firstIndex);
			String showSymbol = bookMarkShow.substring(firstIndex + 2,
					lastIndex);
			String isReturn = bookMarkShow.substring(lastIndex + 2, endIndex);
			if (isReturn.indexOf("\\n") != -1) {
				isReturn = "\n";
			}
			ArrayList temp = new ArrayList();
			try {
				stmtTemp = conn.prepareStatement(valueSql);
				rsTemp = stmtTemp.executeQuery();
				while (rsTemp.next()) {
					temp.add(rsTemp.getString(showValue));
				}
			} catch (Exception e) {
				EWEBOS.WebMsgAlert("没有书签记录!");
			} finally {
				closeTempAll();
			}
			for (int j = 1; j <= temp.size(); j++) {
				tempValue += temp.get(j - 1);
				if (temp.size() == j) {
					if ("是".equals(bookMarkEndType)) {

					} else {
						tempValue += showSymbol;
						tempValue += isReturn;
					}
				} else {
					tempValue += showSymbol;
					tempValue += isReturn;
				}
			}
		}
		return tempValue;
	}

	//获取单一显示
	public String getSingleValue(String finishtype,String checkstatus,String caseId, String valueSql,
			String bookMarkShow) {
		String tempValue = "";
		String tempValuee = "";
		if (valueSql != null && !"".equals(valueSql)) {
			if (valueSql.contains("@caseId")) {
				valueSql = valueSql.replace("@caseId", caseId);
			}
			if (valueSql.contains("@d_checkstatus")) {
				valueSql = valueSql.replace("@d_checkstatus", checkstatus);
			}
			if (valueSql.contains("@finish_type")) {
				valueSql = valueSql.replace("@finish_type", finishtype);
			}
			try {
				stmtTemp = conn.prepareStatement(valueSql);
				rsTemp = stmtTemp.executeQuery();
				while (rsTemp.next()) {
					tempValue = rsTemp.getString(bookMarkShow);
					if(tempValue==null)
					{
						tempValue="";
					}
		
				}
			} catch (SQLException e) {
				EWEBOS.WebMsgAlert("没有书签记录!");
			} finally {
				closeTempAll();
			}
		}
		return tempValue;
	}

	public String getCurrentDate() {
		Calendar calendar = Calendar.getInstance();
		String nowYear = String.valueOf(calendar.get(Calendar.YEAR));
		String nowMonth = String.valueOf(calendar.get(Calendar.MONTH) + 1);
		String nowDay = String.valueOf(calendar.get(Calendar.DAY_OF_MONTH));
		String date = nowYear + "年" + nowMonth + "月" + nowDay + "日";
		return date;
	}

	//将二进制写入数据库blob字段
	public boolean WriteBlob(String s_sql, byte[] a_FileBody) {
		boolean b_result = false;
		OracleResultSet ors = null;
		try {
			stmt = conn.prepareStatement(s_sql);
			ors = (OracleResultSet) stmt.executeQuery();
			if (ors.next()) {
				BLOB vField = ors.getBLOB(1);
				OutputStream outstream = vField.getBinaryOutputStream();
				outstream.write(a_FileBody, 0, a_FileBody.length);
				outstream.close();
			}
			b_result = true;
		} catch (Exception e) {
			b_result = false;
		} finally {
			if (ors != null) {
				try {
					ors.close();
				} catch (Exception e1) {
				}
			}
		}
		return b_result;
	}

	//从数据库取文档数据内容
	public byte[] ReadBlob(BLOB vField, int vSize) {
		byte[] a_FileBody = null;
		try {
			a_FileBody = new byte[vSize];
			InputStream instream = vField.getBinaryStream();
			instream.read(a_FileBody, 0, vSize);
			instream.close();
		} catch (Exception e) {
			a_FileBody = null;
		}
		return a_FileBody;
	}

	public void DoGetDateTime() {
		EWEBOS.WebMsgClear();
		EWEBOS.WebMsgSetString("DateTime", GetDateTime());
		EWEBOS.WebMsgStatus("TRUE", "获取服务器时间成功！");
		EWEBOS.WebMsgSend();
	}

	public static java.sql.Date GetDate() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String mDateTime = formatter.format(cal.getTime());
		return (java.sql.Date.valueOf(mDateTime));
	}

	public static boolean isNullOrEmpty(String input) {
		return input == null || input.length() == 0;
	}

	public Connection getConn() {
		try {
			Class.forName(DBDRIVER); //加载驱动
			conn = DriverManager.getConnection(DBConnectionString, DBNAME,
					DBPASS); //获取连接
		} catch (Exception e) {
			System.out.println(e.getMessage());
			conn = null;
		}
		return conn;
	}

	public void closeAll() {
		try {

			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}

	public void closeTempAll() {
		try {
			if (rsTemp != null)
				rsTemp.close();
			if (stmtTemp != null)
				stmtTemp.close();
			if (rsTempp != null)
				rsTempp.close();
			if (stmtTempp != null)
				stmtTempp.close();
			if (connTemp != null) {
				connTemp.close();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}

	public static String GetDateTime() {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String mDateTime = formatter.format(cal.getTime());
		return (mDateTime);
	}

	public void page_load(PageContext pagecontext) {
		EWEBOS = new eWebOfficeServer();
		EWEBOS.SetLicense("");
		if (!EWEBOS.WebMsgLoad(pagecontext)) {
			return;
		}

		conn = this.getConn();
		if (conn == null) {
			return;
		}
		String s_action = EWEBOS.WebMsgGetString("Action");
		m_request = (HttpServletRequest) pagecontext.getRequest();
		m_response = (HttpServletResponse) pagecontext.getResponse();

		if (s_action.equals("LOADFILE")) {
			DoLoadFile();
		} else if (s_action.equals("SAVEFILE")) {
			DoSaveFile();
		} else if (s_action.equals("LISTVERSION")) {
			DoListVersion();
		} else if (s_action.equals("LOADVERSION")) {
			DoLoadVersion();
		} else if (s_action.equals("SAVEVERSION")) {
			DoSaveVersion();
		} else if (s_action.equals("LOADTEMPLATE")) {
			DoLoadTemplate();
		} else if (s_action.equals("SAVETEMPLATE")) {
			DoSaveTemplate();
		} else if (s_action.equals("LOADSEALLIST")) {
			DoLoadSealList();
		} else if (s_action.equals("LOADSEALIMAGE")) {
			DoLoadSealImage();
		} else if (s_action.equals("SAVEDOCUMENTSEAL")) {
			DoSaveDocumentSeal();
		} else if (s_action.equals("LOADDOCUMENTSEAL")) {
			DoLoadDocumentSeal();
		} else if (s_action.equals("LISTBOOKMARK")) {
			DoListBookmark();
		} else if (s_action.equals("SAVEBOOKMARK")) {
			DoSaveBookmark();
		} else if (s_action.equals("LOADBOOKMARK")) {
			DoLoadBookmark();
		} else if (s_action.equals("GETDATETIME")) {
			DoGetDateTime();
		}
	}%>
<%
	page_load(pageContext);
	out.clear();
	out = pageContext.pushBody();
%>
