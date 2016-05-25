package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.hibernate.cfg.Configuration;


public class JdbcUtil {
	private static Connection conn = null;
	public static Connection getConn(String driverName, String url, String username, String password) {

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;

	}

	public static Connection getConnByHibernateConfig() {
		HibernateSessionFactory.getSession();
		Configuration configuration = HibernateSessionFactory.getConfiguration();
		String driverName = configuration.getProperty("hibernate.connection.driver_class");
		String url = configuration.getProperty("hibernate.connection.url");
		String username = configuration.getProperty("hibernate.connection.username");
		String password = configuration.getProperty("hibernate.connection.password");
		conn=getConn(driverName, url, username, password);
		return conn;
	}

	public static ArrayList<ArrayList<String>> getListBySql(Connection connection, String sql) {
		Statement selectStatement = null;
		ResultSet resultSet = null;
		ArrayList<ArrayList<String>> arrayLists = new ArrayList<ArrayList<String>>();
		try {
			selectStatement = connection.createStatement();
			resultSet = selectStatement.executeQuery(sql);
			while (resultSet.next()) {
				ArrayList<String> arrayList = new ArrayList<String>();
				Object[] objects = new Object[resultSet.getMetaData().getColumnCount()];
				for (int i = 1; i < resultSet.getMetaData().getColumnCount() + 1; i++) {
					objects[i - 1] = resultSet.getObject(i);
					if (null == objects[i - 1]) {
						arrayList.add("");
					} else {
						arrayList.add(objects[i - 1].toString());
					}
				}
				arrayLists.add(arrayList);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (selectStatement != null) {

					selectStatement.close();
					selectStatement = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		}
		return arrayLists;
	}

	public static ArrayList<String> getSingleListBySql(Connection connection, String sql) {
		Statement selectStatement = null;
		ResultSet resultSet = null;
		ArrayList<String> arrayList = new ArrayList<String>();
		try {
			selectStatement = connection.createStatement();
			resultSet = selectStatement.executeQuery(sql);
			while (resultSet.next()) {
				Object[] objects = new Object[resultSet.getMetaData().getColumnCount()];
				for (int i = 1; i < resultSet.getMetaData().getColumnCount() + 1; i++) {
					objects[i - 1] = resultSet.getObject(i);
					if (null == objects[i - 1]) {
						arrayList.add("");
					} else {
						arrayList.add(objects[i - 1].toString());
					}
				}
				break;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (selectStatement != null) {

					selectStatement.close();
					selectStatement = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return arrayList;
	}

	public static String getSingleValBySql(Connection connection, String sql) {
		Statement selectStatement = null;
		ResultSet resultSet = null;
		String val = "";
		try {
			selectStatement = connection.createStatement();
			resultSet = selectStatement.executeQuery(sql);
			while (resultSet.next()) {
				if (resultSet.getMetaData().getColumnCount() > 0) {
					if (null != resultSet.getObject(1)) {

						val = resultSet.getObject(1).toString();
					}
				}
				break;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (selectStatement != null) {

					selectStatement.close();
					selectStatement = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		}
		return val;
	}
	public static void doQuery(Connection connection, String sql,Object[] params) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				pstmt.setObject(i+1, params[i]);
			}
			pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			try {
				if (pstmt != null) {

					pstmt.close();
					pstmt = null;
				}
				if (connection != null) {

					connection.close();
					connection = null;

				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		}
	}

	public static void main(String[] args) {
		getConnByHibernateConfig();
	}
}
