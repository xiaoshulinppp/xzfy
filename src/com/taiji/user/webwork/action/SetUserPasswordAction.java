package com.taiji.user.webwork.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.Constants;
import com.taiji.core.util.Encrypt;
import com.taiji.core.webwork.action.BaseAction;
import com.taiji.user.domain.User;
import com.taiji.user.service.IUserService;

public class SetUserPasswordAction extends BaseAction {

	private static final Log log = LogFactory.getLog(SetUserPasswordAction.class);
	private IUserService userService;
	private String oldPassword;
	private String newPassword;
	private String confirmPassword;
	private String userLogName;

	private String massageContent = ""; // 返回信息页面的信息内容

	private String actionUrl = ""; // 返回跳转Action的Url

	public String save() {

		User currentUser = (User) ActionContext.getContext().getSession().get(Constants.USER_LOGIN);
		try {
			currentUser = (User) userService.getEntityObjectById(currentUser.getId());
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		if (currentUser.authenticate(oldPassword)) {
			if (confirmPassword.equals(newPassword)) {
				currentUser.setPassword(Encrypt.encryptString(newPassword));
				userService.update(currentUser);
				ActionContext.getContext().getSession().put(Constants.USER_LOGIN, currentUser);
				this.actionUrl = "../user/viewSetUserPassword.action?funcCode=" + super.getFuncCode();
				this.massageContent = "密码已经成功修改！";
				return SUCCESS;
			}
		}
		this.actionUrl = "../user/viewSetUserPassword.action?funcCode=" + super.getFuncCode();
		this.massageContent = "输入的密码不正确，请重新输入密码！";
		addActionError("password.error");
		return INPUT;
	}

	public String adminSave() {
		try {
			User currentUser = userService.getUser(userLogName);
			if (currentUser != null) {
				currentUser.setPassword(Encrypt.encryptString(newPassword));
				userService.update(currentUser);
				return SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

		return INPUT;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public void setUserLogName(String userLogName) {
		this.userLogName = userLogName;
	}

	public String getMassageContent() {
		return massageContent;
	}

	public void setMassageContent(String massageContent) {
		this.massageContent = massageContent;
	}

	public String getActionUrl() {
		return actionUrl;
	}

	public void setActionUrl(String actionUrl) {
		this.actionUrl = actionUrl;
	}
}