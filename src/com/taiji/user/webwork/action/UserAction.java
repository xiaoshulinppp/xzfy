package com.taiji.user.webwork.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.CommonTool;
import com.taiji.core.util.Constants;
import com.taiji.core.util.Encrypt;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.Role;
import com.taiji.user.domain.User;
import com.taiji.user.service.IOrgService;
import com.taiji.user.service.IUserService;

public class UserAction extends ProtectedDetailAction {
	private static final Log log = LogFactory.getLog(UserAction.class);
	private IUserService userService;
	private IOrgService orgService;
	private Integer orgId;
	private Integer backId;
	private List selectRole;
	private Integer userId;
	private User userVO;
	private String massageContent = ""; // 返回信息页面的信息内容
	private String actionUrl = ""; // 返回跳转Action的Url

	public String repeatUser() {
		super.setOpName("create");
		addActionError("userlogName.error");
		return SUCCESS;
	}

	public String repeatUpdateUser() {
		super.setOpName("update");
		this.setUserId(getUser().getId());
		addActionError("userlogName.error");
		return SUCCESS;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public Integer getBackId() {
		return backId;
	}

	public void setBackId(Integer backId) {
		this.backId = backId;
	}

	@Override
	public void validate() {
		User user = getUserVO();
		List userList = userService.findByNamedQuery("findUserByLoginName",
				user.getLogName());
		if (userList != null && userList.size() == 1) {
			if (super.getEntityId() != 0) {
				User userTemp = (User) userList.get(0);
				if (userTemp.getId().equals(super.getEntityId())) {
					return;
				}
			}
			this.addFieldError("userVO.logName", getText("userlogName.error"));
		}
	}

	public String userInfo() {
		try {
			User currentUser = (User) ActionContext.getContext().getSession()
					.get(Constants.USER_LOGIN);
			setUser(currentUser);
			ActionContext.getContext().getSession().remove("_UPDATE_USERINFO_");
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	public String updateUserInfo() {
		User currentUser = (User) ActionContext.getContext().getSession().get(
				Constants.USER_LOGIN);
		String loginName = getUser().getLogName();
		if (!currentUser.getLogName().equalsIgnoreCase(loginName)) {
			String hql = "from User user where user.logName='" + loginName
					+ "'";
			int count = coreService.find(hql).size();
			if (count >= 1) {
				ActionContext.getContext().getSession().put(
						"_UPDATE_USERINFO_", getUser());
				addActionError("loginName.error");
				setUser(currentUser);
				return INPUT;
			}
		}

		try {

			getUser().setId(userId);
			getUser().setOrg(currentUser.getOrg());
			getUser().setLoginState(currentUser.getLoginState());
			getUser().setLoginTime(currentUser.getLoginTime());
			getUser().setPassword(currentUser.getPassword());
			getUser().setRoles(currentUser.getRoles());
			getUser().setType(currentUser.getType());
			getUser().setStyle(currentUser.getStyle());
			getUser().setGroups(currentUser.getGroups());
			getUser().setPostMan(currentUser.getPostMan());
			ActionContext.getContext().getSession().put(Constants.USER_LOGIN,
					getUser());

			coreService.merge(getUser());

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}

		return SUCCESS;

	}

	public String initPassword() {
		try {
			getUser().setPassword(Encrypt.encryptString("password"));
			userService.update(getUser());
			super.setOpName("update");
			User currentUser = (User) ActionContext.getContext().getSession()
					.get(Constants.USER_LOGIN);
			if (currentUser.getId().equals(getUser().getId())) {
				ActionContext.getContext().getSession().put(
						Constants.USER_LOGIN, getUser());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	@Override
	public String execute() {
		setUserVO(getUser());
		return SUCCESS;
	}

	@Override
	@SuppressWarnings("unchecked")
	public String save() {
		try {
			Org org = (Org) orgService.getEntityObjectById(getOrgId());
			org.addUser(getUserVO());
			getUserVO().setStyle(new Integer(1));

			getUserVO().setPassword("123456");
			if (getSelectRole() != null) {
				Iterator iter = getSelectRole().iterator();
				while (iter.hasNext()) {
					Role role = (Role) iter.next();
					// role.getUsers().add(getUserVO()); // 原代码
					getUserVO().getRoles().add(role); // 改错 Kerbol 2011-05-09
				}
			}
			getUserVO().setLoginState(0);
			User currentUser = (User) ActionContext.getContext().getSession()
					.get("_USER_LOGIN_");
			getUserVO().setStyle(2);
			userService.save(getUserVO());
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	@Override
	public String update() {
		try {
			User currentUser = (User) ActionContext.getContext().getSession()
					.get(Constants.USER_LOGIN);
			if (getUserVO() != null) {
				// if (getUserVO().equals(currentUser)) {
				// return INPUT;
				// }
				String password = getUser().getPassword();
				Integer userid = getUser().getId();
				Org org = getUser().getOrg();
				Integer style = getUser().getStyle();
				String loginTime = getUser().getLoginTime();
				Integer userPage = getUser().getUserPage();
				Integer loginState = getUser().getLoginState();
				// CommonTool.copyBean(getUser(), getUserVO());
				getUser().setName(getUserVO().getName());
				getUser().setLogName(getUserVO().getLogName());
				getUser().setPhone(getUserVO().getPhone());
				getUser().setMphone(getUserVO().getMphone());
				getUser().setAddress(getUserVO().getAddress());
				getUser().setPostMan(getUserVO().getPostMan());
				getUser().setEmail(getUserVO().getEmail());
				getUser().setType(getUserVO().getType());
				getUser().setPassword(password);
				getUser().setId(userid);
				getUser().setOrg(org);
				getUser().setStyle(style);
				getUser().setLoginTime(loginTime);
				getUser().setUserPage(userPage);
				getUser().setLoginState(loginState);

				/*
				 * if(getSelectRole()!=null){
				 * 
				 * Iterator iter = getSelectRole().iterator();
				 * while(iter.hasNext()){ Role role =(Role)iter.next();
				 * role.getUsers().add(getUser()); } }
				 */
				getUser().setRoles(getSelectRole());
				userService.update(getUser());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	@Override
	public String delete() {
		try {
			boolean result = true;
			super.setOpName("delete");
			User currentUser = (User) ActionContext.getContext().getSession()
					.get(Constants.USER_LOGIN);
			if (getUser() != null) {
				if (getUser().equals(currentUser)) {
					return INPUT;
				}
				Iterator iter = getUser().getRoles().iterator();
				while (iter.hasNext()) {
					Role role = (Role) iter.next();
					role.getUsers().remove(getUser());
				}
				coreService.remove(getUser());
			} else {
				List deleteList = getDeleteObjectList();
				if (deleteList != null) {
					if (deleteList.contains(currentUser))
						return INPUT;
					Iterator iter1 = deleteList.iterator();
					while (iter1.hasNext()) {
						User userTemp = (User) iter1.next();
						Iterator iter = userTemp.getRoles().iterator();
						while (iter.hasNext()) {
							Role role = (Role) iter.next();
							role.getUsers().remove(userTemp);
						}
					}
					coreService.batchRemove(deleteList);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	private Set getSelectRole() {
		Set roleSet = null;
		if (selectRole != null) {
			Iterator iter = selectRole.iterator();
			roleSet = new HashSet();
			while (iter.hasNext()) {
				int roleId = Integer.valueOf((String) iter.next()).intValue();
				Role role = (Role) coreService.getEntityObjectById(Role.class,
						roleId);
				roleSet.add(role);
			}
		}

		return roleSet;
	}

	public Map getAllRole() {
		Map result = new LinkedHashMap();
		String hql = " from Role role where role.org.id=" + orgId
				+ " or role.org.id = 8 or role.org.id = 1";
		// List objectList = coreService.findAll(Role.class);
		List objectList = coreService.find(hql);
		if (objectList != null) {
			Iterator iter = objectList.iterator();
			while (iter.hasNext()) {
				Role object = (Role) iter.next();
				result.put(String.valueOf(object.getId()), object.getName());
			}
		}
		return result;
	}

	public List getAllRoleAll() {
		String hql = " from Role role where role.org.id=" + orgId
				+ " or role.org.id = 8 or role.org.id = 1";
		// List objectList = coreService.findAll(Role.class);
		List objectList = coreService.find(hql);
		return objectList;
	}

	public List getAllCutsomRole() {
		List result = new ArrayList();
		result = this.getAllRoleAll();
		// Set roles = getUser().getRoles();
		if (result != null) {
			Iterator iter = result.iterator();
			while (iter.hasNext()) {
				result.add(String.valueOf(((Role) iter.next()).getId()));
			}
		}
		return result;
	}

	// Set roles = getUser().getRoles();
	// if (roles != null) {
	// Iterator iter = roles.iterator();
	// while (iter.hasNext()) {
	// result.add(String.valueOf(((Role) iter.next()).getId()));
	// }
	// }
	// return result;
	// }

	/**
	 * 跳转修改个人信息页面
	 * 
	 * @return
	 */
	public String updateUserInfoyf() {
		this.userVO = (User) userService.getEntityObjectById(User.class,
				((User) ActionContext.getContext().getSession().get(
						"_USER_LOGIN_")).getId());
		return SUCCESS;
	}

	/**
	 * 修改个人信息
	 * 
	 * @return
	 */
	public String doUpdateUserInfoyf() {
		User cUser = (User) userService.getEntityObjectById(User.class,
				((User) ActionContext.getContext().getSession().get(
						"_USER_LOGIN_")).getId());
		this.userVO = getUserVO();
		cUser.setAddress(userVO.getAddress());
		cUser.setEmail(userVO.getEmail());
		cUser.setName(userVO.getName());
		cUser.setMphone(userVO.getMphone());
		cUser.setPhone(userVO.getPhone());
		cUser.setPostMan(userVO.getPostMan());
		userService.saveOrUpdate(cUser);
		this.userVO = cUser;
		ActionContext.getContext().getSession().put("_USER_LOGIN_", userVO);
		this.actionUrl = "../user/updateUserInfo.action?funcCode="
				+ super.getFuncCode();
		this.massageContent = "个人资料已经成功修改！";
		return SUCCESS;
	}

	public void setSelectRole(List selectRole) {
		this.selectRole = selectRole;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService service) {
		this.userService = service;
	}

	public IOrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(IOrgService service) {
		this.orgService = service;
	}

	public User getUser() {
		return (User) getEntity();
	}

	public void setUser(User user) {
		setEntity(user);
	}

	public User getUserVO() {
		return this.userVO;
	}

	public void setUserVO(User userVO) {
		this.userVO = userVO;
	}

	@Override
	public Class getPersistentClass() {
		return User.class;
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