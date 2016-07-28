package com.taiji.fzb.util;

import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import com.taiji.waf.WAFConfigure;
import com.taiji.waf.cxproject.proxy.FilecodingProxy;
import com.taiji.waf.db.IdGenerator;
import com.taiji.waf.db.WAFDBConnectionFactory;
import com.taiji.waf.sys.business.WafUser;
import com.taiji.waf.sys.proxy.WafUserProxy;

import jxl.Workbook;
import jxl.Sheet;
import jxl.Cell;

public class LoadWafUserExcel {

	public List<LoadExcelEntity> readExcel(String excelFileName) {
		InputStream stream = null;
		Workbook workBook = null;
		List<LoadExcelEntity> data = new ArrayList<LoadExcelEntity>();
		if (excelFileName == null || "".equals(excelFileName)) {
			System.out.println("读取excel文件失败：路径或文件名为空");
			return null;
		}
		File file = new File(excelFileName);
		if (!file.exists()) {
			System.out.println("读取excel文件失败：路径或文件名不存在");
			return null;
		}
		try {
			stream = new FileInputStream(file);
			workBook = Workbook.getWorkbook(stream);
			Sheet sheet = workBook.getSheet(0);
			int columns = sheet.getColumns();
			int rows = sheet.getRows();
			for (int i = 1; i < rows; i++) {
				LoadExcelEntity entity = new LoadExcelEntity();
				for (int j = 0; j < columns; j++) {
					Cell cell = sheet.getCell(j, i);
					String cellValue = cell.getContents();

					if (j == 0) {
						entity.setUsertype(cellValue.trim());
					} else if (j == 1) {
						entity.setName(cellValue.trim());
					}else if (j == 2) {
						String str = "";
						str = cellValue.substring(0, 8)+"-"+cellValue.substring(8, 9);
						entity.setCodeing(str);
					}
				}
				data.add(entity);
			}
		} catch (Exception e) {
			System.out.println("读取excel文件失败：" + e.getMessage());
			return null;
		} finally {
			/** *********关闭流和工作簿************* */
			try {
				if (workBook != null) {
					workBook.close();
				}
				if (stream != null) {
					stream.close();
				}
			} catch (Exception ex) {
				System.out.println("关闭文件流失败：" + ex.getMessage());
				return null;
			}
		}
		return data;
	}

	public void insertData(List<LoadExcelEntity> list,
			Connection conn) throws SQLException {
		String testRole = WAFConfigure.getProperty("testRole");
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				WafUser user = new WafUser();

				user.setUserId(IdGenerator.getId(WafUser.class));
				user.setUserName(list.get(i).getName());
				user.setLoginName(list.get(i).getCodeing());
				user.setUserType(list.get(i).getUsertype());
				user.setPassWord("827ccb0eea8a706c4c34a16891f84e7b");
				String[] testRoles = { testRole };
				WafUserProxy.insertWafUserRoles(user.getUserId(), testRoles,conn);
				WafUserProxy.insertWafUser(user, conn);
				System.out.println("插入数据"+i+"："+list.get(i).getName());
			}
		}
	}
	public void insertXHUser(String[] testRoles,Connection conn) throws SQLException{
		
		WafUser u1 = new WafUser();
		u1.setUserId(IdGenerator.getId(WafUser.class));
		u1.setUserName("北京软件行业协会");
		u1.setLoginName("RJXH");
		u1.setUserType("RJXH");
		u1.setPassWord("827ccb0eea8a706c4c34a16891f84e7b");
		WafUserProxy.insertWafUserRoles(u1.getUserId(), testRoles,conn);
		WafUserProxy.insertWafUser(u1, conn);
		
		WafUser u2 = new WafUser();
		u2.setUserId(IdGenerator.getId(WafUser.class));
		u2.setUserName("北京信息化协会");
		u2.setLoginName("XXHXH");
		u2.setUserType("XXHXH");
		u2.setPassWord("827ccb0eea8a706c4c34a16891f84e7b");
		WafUserProxy.insertWafUserRoles(u2.getUserId(), testRoles,conn);
		WafUserProxy.insertWafUser(u2, conn);
		
		WafUser u3 = new WafUser();
		u3.setUserId(IdGenerator.getId(WafUser.class));
		u3.setUserName("北京电源行业协会");
		u3.setLoginName("DYXH");
		u3.setUserType("DYXH");
		u3.setPassWord("827ccb0eea8a706c4c34a16891f84e7b");
		WafUserProxy.insertWafUserRoles(u3.getUserId(), testRoles,conn);
		WafUserProxy.insertWafUser(u3, conn);
		
		WafUser u4 = new WafUser();
		u4.setUserId(IdGenerator.getId(WafUser.class));
		u4.setUserName("北京信用协会");
		u4.setLoginName("BJXY");
		u4.setUserType("BJXY");
		u4.setPassWord("827ccb0eea8a706c4c34a16891f84e7b");
		WafUserProxy.insertWafUserRoles(u4.getUserId(), testRoles,conn);
		WafUserProxy.insertWafUser(u4, conn);
		
	}
//步骤一：导入Excel数据
//步骤二：insertXHUser添加协会账号
	public static void main(String[] args) {
		LoadWafUserExcel l = new LoadWafUserExcel();
		List<LoadExcelEntity> data = l.readExcel("D:\\LoadWafUserExcel.xls");
		Connection conn = null;
		String[] testRoles = {"1622"};
		try {
			conn = WAFDBConnectionFactory.getInstance().getConnection();
			l.insertData(data, conn);
			l.insertXHUser(testRoles,conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				WAFDBConnectionFactory.getInstance().closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}