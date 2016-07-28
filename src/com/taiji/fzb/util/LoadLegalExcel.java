package com.taiji.waf.cxproject.util;

import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import com.taiji.waf.WAFConfigure;
import com.taiji.waf.cxproject.business.LegalLibrary;
import com.taiji.waf.cxproject.proxy.FilecodingProxy;
import com.taiji.waf.cxproject.proxy.LegalLibraryProxy;
import com.taiji.waf.db.IdGenerator;
import com.taiji.waf.db.WAFDBConnectionFactory;
import com.taiji.waf.sys.business.WafUser;
import com.taiji.waf.sys.proxy.WafUserProxy;

import jxl.Workbook;
import jxl.Sheet;
import jxl.Cell;

public class LoadLegalExcel {

	public List<LegalLibrary> readExcel(String excelFileName) {
		InputStream stream = null;
		Workbook workBook = null;
		List<LegalLibrary> data = new ArrayList<LegalLibrary>();
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
				LegalLibrary entity = new LegalLibrary();
				for (int j = 0; j < columns; j++) {
					Cell cell = sheet.getCell(j, i);
					String cellValue = cell.getContents();
					if (j == 0) {
						cellValue=cellValue.trim();
						String str = "";
						str = cellValue.substring(0, 8)+"-"+cellValue.substring(8, 9);
						entity.setLegalcode(str);
					} else if (j == 1) {
						entity.setLegalname(cellValue.trim());
					} else if (j == 2) {
						entity.setLegalperson(cellValue.trim());
					} else if (j == 3) {
						entity.setLegalregistercode(cellValue.trim());
					} else if (j == 4) {
						entity.setLegalscope(cellValue.trim());
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

	public void insertData(List<LegalLibrary> list,
			Connection conn) throws SQLException {
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				LegalLibrary l = list.get(i);
				l.setId(IdGenerator.getId(LegalLibrary.class));
				LegalLibraryProxy.insertLegalLibrary(l, conn);
				System.out.println("插入数据" + i + "：" + list.get(i).getLegalname());
			}
		}
	}
//新增表LoadLegal
	public static void main(String[] args) {
		LoadLegalExcel l = new LoadLegalExcel();
		List<LegalLibrary> data = l.readExcel("D:\\LoadLegalExcel.xls");
		Connection conn = null;
		try {
			conn = WAFDBConnectionFactory.getInstance().getConnection();
			l.insertData(data, conn);
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