package com.taiji.user.webwork.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.user.domain.User;
import com.taiji.user.service.IUserService;
import com.util.JdbcUtil;

public class ChangePwdAction extends ProtectedDetailAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String getPasswordOld() {
		return passwordOld;
	}
	public void setPasswordOld(String passwordOld) {
		this.passwordOld = passwordOld;
	}
	public String getPasswordNew() {
		return passwordNew;
	}
	public void setPasswordNew(String passwordNew) {
		this.passwordNew = passwordNew;
	}
	public IUserService getUserService() {
		return userService;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	private String passwordOld="";
	private String passwordNew="";
	private IUserService userService = null;
	private PaginationSupport ps;
	private int pNum=1;
	private int pageSize;
	private int totalCount;
	private int totalPage;
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	private List pageList;
	private String loginname;
	private String realname;
	private String passwd;
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public PaginationSupport getPs() {
		return ps;
	}
	public void setPs(PaginationSupport ps) {
		this.ps = ps;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List getPageList() {
		return pageList;
	}
	public void setPageList(List pageList) {
		this.pageList = pageList;
	}
	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}
	private int userid;
	private int id=0;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String changePwd(){
		User user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		userid = user.getId();
		return SUCCESS;
	}
	public String doChange(){
		User user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		User u = (User) userService.getEntityObjectById(user.getId());
		if(!u.getPassword().equals(passwordOld)){
			return "wrongpassword";
		}
		u.setPassword(passwordNew);
		userService.saveOrUpdate(u);
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}
	public String gfbUserList(){     //用户列表
		ps = userService.getAllUserByOrg(2, pNum,15);
		pageList = ps.getItems();
		totalCount = ps.getTotalCount();
		totalPage = ps.getTotalPage();
		return SUCCESS;
	}
	public String gfbAddUser(){
		return SUCCESS;
	}
	public void check() throws Exception{
		String msg="0";
		String sql ="select t.user_id from u_user t where t.user_logname ='"+loginname+"'";
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		List list = JdbcUtil.getListBySql(connection, sql);
		if(list.size()!=0){
			msg="1";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		PrintWriter out =response.getWriter();
		out.print(msg);
		out.flush();
		out.close();
	}
	public String doGfbAddUser(){
		Connection connection = JdbcUtil.getConnByHibernateConfig();
		String sql = "select max(user_id) from u_user";
		String maxid = JdbcUtil.getSingleValBySql(connection, sql);
		Connection connection1 = JdbcUtil.getConnByHibernateConfig();
		Connection connection2 = JdbcUtil.getConnByHibernateConfig();
		String sql1 = "insert into u_user(user_id,user_logname,user_name,user_mail,group_id,org_id,user_password,user_style,user_type,user_page,user_mphone,user_address,user_postman" +
		",user_phone,user_logintime,user_loginstate,user_idcode,seq,releasepermission)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String sql2 = "insert into u_user_role(user_id,role_id)values(?,?)";
		List paramList1 = new ArrayList();
		paramList1.add(Integer.valueOf(maxid)+1);
		paramList1.add(loginname);
		paramList1.add(realname);
		paramList1.add(null);
		paramList1.add(null);
		paramList1.add("2");
		paramList1.add(passwd);
		paramList1.add("2");
		paramList1.add("732");
		paramList1.add(null);
		paramList1.add(null);
		paramList1.add(null);
		paramList1.add(null);
		paramList1.add(null);
		paramList1.add(null);
		paramList1.add("0");
		paramList1.add(null);
		paramList1.add(null);
		paramList1.add(null);
	
		List paramList2 = new ArrayList();
		paramList2.add(Integer.valueOf(maxid)+1);
		paramList2.add("30");
		Object[] params1 = paramList1.toArray();
		Object[] params2 = paramList2.toArray();
		JdbcUtil.doQuery(connection1, sql1, params1);
		JdbcUtil.doQuery(connection2, sql2, params2);
		return SUCCESS;
	}

}
