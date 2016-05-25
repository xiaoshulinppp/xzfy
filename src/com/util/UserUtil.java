package com.util;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.service.ICoreService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;

public class UserUtil {

	private static ICoreService coreService;
	
	public static int getUserId() {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		Integer userId = user.getId();
		
		return userId;
		
	}
	
	public static String getUserName() {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		String userName = user.getName();
		return userName;
	}
	public static String getLoginName() {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		String logName = user.getLogName();
		return logName;
	}
	public static String getUserPassword() {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get("_USER_LOGIN_");
		String password = user.getPassword();
		return password;
	}
	public static int getDeptId() {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		Org org = user.getOrg();
		Integer deptId = org.getId();
		return deptId;
	}
	public static String getLocBM(){
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		Org org = user.getOrg();
		org = (Org)getCoreService().loadEntityObjectById(Org.class, org.getId());
		return org.getLocbm();  
	}

	public static ICoreService getCoreService() {
		return coreService;
	}

	public void setCoreService(ICoreService coreService) {
		this.coreService = coreService;
	}
	
}
