<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Calendar,oracle.sql.BLOB,java.io.*,oracle.jdbc.driver.OracleResultSet" pageEncoding="UTF-8"%>
<%!
	//Oracle
	private static String DBDRIVER="oracle.jdbc.driver.OracleDriver";  
	private static String DBConnectionString = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	private static String DBNAME="gfbxzfy";
	private static String DBPASS="gfbxzfy";
	

	public static Connection getConn(){
		Connection conn = null;
    	try{
		  Class.forName(DBDRIVER);  
		  conn=DriverManager.getConnection(DBConnectionString,DBNAME,DBPASS); 
		}catch(Exception e){
			System.out.println(e.getMessage());
			conn = null;
		}
		return conn;
	}
	public static void closeAll(Connection con,Statement stmt,ResultSet rs){
		try {
			if(rs != null)
				rs.close();
			if(stmt != null)
				stmt.close();
			if(con != null){
				con.close();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
	}
	public static ResultSet ExecuteQuery(Connection con,String SqlString)
	{
	    ResultSet result=null;
	    try
	    {
	    	Statement stmt = con.createStatement();
	    	result=stmt.executeQuery(SqlString);
	    }
	    catch(Exception e)
	    {
	      System.out.println(e.toString());
	    }
	    return (result);
	 }
	public static int ExecuteUpdate(Connection con,String SqlString)
	  {
	    int result=0;
	    try
	    {
	    	Statement stmt = con.createStatement();
	      result=stmt.executeUpdate(SqlString);
	    }
	    catch(Exception e)
	    {
	      System.out.println(e.toString());
	    }
	    return (result);
	  }

	public static String GetDateTime()
	  {
	   Calendar cal  = Calendar.getInstance();
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   String mDateTime=formatter.format(cal.getTime());
	   return (mDateTime);
	  }
	  public static java.sql.Date GetDate()
	  {   
	    Calendar cal  = Calendar.getInstance();
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String mDateTime=formatter.format(cal.getTime());
	    return (java.sql.Date.valueOf(mDateTime));
	  }
	  public static boolean isNullOrEmpty(String input) {
			return input == null || input.length() == 0;
		}
	  public static String getDateTimeFormat(){
		  Calendar cal  = Calendar.getInstance();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			return formatter.format(cal.getTime());
		  
	  }
	  
	  public boolean WriteBlob(Connection conn,String s_sql,byte[] a_FileBody){
    	boolean b_result=false;
    	OracleResultSet ors = null;
    	PreparedStatement stmt=null;
    	try{
    		stmt = conn.prepareStatement(s_sql);
    	    ors = (OracleResultSet)stmt.executeQuery();
    		if(ors.next()){
    			BLOB vField=ors.getBLOB(1);
    			OutputStream outstream = vField.getBinaryOutputStream();
        		outstream.write(a_FileBody, 0, a_FileBody.length);
        		outstream.close();
    		}
    		b_result=true;
    	}catch(Exception e){
    		b_result=false;
    	}finally{
    		if(ors!=null){
    			try{
    			if(ors!=null)
    			ors.close();
    			if(stmt!=null)
    			stmt.close();
    			}catch(Exception e1){
    			}
    		}
    	}
    	return b_result;
    }
    
    //从数据库取文档数据内容
    public byte[] ReadBlob(BLOB vField, int vSize){
    	byte[] a_FileBody =null;
	      try {
	        a_FileBody = new byte[vSize];
	        InputStream instream = vField.getBinaryStream();
	        instream.read(a_FileBody, 0, vSize);
	        instream.close();
	      }
	      catch (Exception e) {
	      	a_FileBody=null;
	      }
	      return a_FileBody;
    }
%>