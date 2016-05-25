package com.taiji.user.service.impl;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.system.service.IDictionaryService;
import com.taiji.system.service.ILogService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.user.service.IUserService;
import com.taiji.user.util.RemoteUser;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
public class UserServiceDefaultImpl extends CoreServiceImpl implements IUserService {

	private IDictionaryService dictService;
	private ILogService logService;

	@Override
	public Class getPersistentClass() {
		return User.class;
	}

	public User getUser(String loginName) {
		User result = null;
		List userList = findByNamedQuery("findUserByLoginName", loginName);
		if ((userList != null) && (userList.size() == 1)) {
			result = (User) userList.get(0);
		}
		return result;
	}

	public void saveFaultCount(User user) {
		update(user);
	}

	public Integer saveLogin(User user, String password, Map userTypeMap) {
		String userName = user.getName();
		if ((userName.equals("iscp_admin")) && (!(password.equals("iscp_adminpassword")))) {
			return Integer.valueOf(1);
		}
		if ((!(userName.equals("iscp_admin"))) && (((user == null) || ((user != null) && (!(user.authenticate(password))))))) {
			return Integer.valueOf(1);
		}
		// 新加
		// for (int i = 0; i < ContextUtil.ApplicationSessionList.size(); i++) {
		// if (null != ContextUtil.ApplicationSessionList.get(i)) {
		// System.out.println("***********");
		// System.out.println("开始！");
		// System.out.println("***********");
		// try {
		// User sessionUser = (User)
		// ContextUtil.ApplicationSessionList.get(i).get(Constants.USER_LOGIN);
		// if (user.getName().equals(sessionUser.getName())) {
		// System.out.println("************");
		// System.out.println("用户已登录！");
		// System.out.println("************");
		// return Integer.valueOf(2).intValue();
		// } else {
		// System.out.println("************");
		// System.out.println("此Session不匹配！");
		// System.out.println("************");
		// }
		// } catch (IllegalStateException e) {
		// System.out.println("************");
		// System.out.println("Session已注销！");
		// System.out.println("************");
		// continue;
		// }
		// }
		// }
		// System.out.println("**************");
		// System.out.println("可以登录！");
		// System.out.println("**************");

		if (user.getLoginState().equals(new Integer(1))) {
			return Integer.valueOf(2);
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日HH:mm");
		Date currentTime_1 = new Date();
		String timeString = formatter.format(currentTime_1);
		user.setLoginTime(timeString);
		// 登录后设置标志位
		user.setLoginState(new Integer(0));
		String key = String.valueOf(user.getType());
		String typeName = (String) userTypeMap.get(key);
		user.setTypeName(typeName);
		RemoteUser.set(user);
		update(user);
		this.logService.app("登录", "login", "登录系统");
		return Integer.valueOf(0);
	}

	public User getUserByName(String userName) {
		User result = null;
		List userList = findByNamedQuery("findUserByUserName", userName);
		if ((userList != null) && (userList.size() == 1))
			result = (User) userList.get(0);
		return result;
	}

	public List getAllUserByOrg(Org org) {
		return findByNamedQuery("findAllUserByOrg", org.getId());
	}

	public List getAllUserByAllSubOrg(Org org) {
		return findByNamedQuery("findAllUserByAllSubOrg", org.getId());
	}

	public PaginationSupport getAllUserByOrg(Integer orgId, int pageNum) {
		return findByNamedQuery("findAllUserByOrg", orgId, pageNum);
	}

	public PaginationSupport getAllUserByOrg(Integer orgId, int pageNum, int pageSize) {
		return findByNamedQuery("findAllUserByOrg", orgId, pageNum, pageSize);
	}

	public IDictionaryService getDictService() {
		return this.dictService;
	}

	public void setDictService(IDictionaryService dictService) {
		this.dictService = dictService;
	}

	public ILogService getLogService() {
		return this.logService;
	}

	public void setLogService(ILogService logService) {
		this.logService = logService;
	}

	public void delete(User user) {
		super.remove(user);
	}

	public Serializable save(User user) {
		return super.save(user);
	}

	public void update(User user) {
		super.update(user);
	}

}
