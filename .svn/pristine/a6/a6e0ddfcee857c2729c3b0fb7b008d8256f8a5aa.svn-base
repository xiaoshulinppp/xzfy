package com.taiji.user.webwork.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import org.hibernate.Session;

import sun.misc.BASE64Decoder;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.security.SecurityService;
import com.taiji.core.util.Constants;
import com.taiji.core.webwork.action.BaseAction;
import com.taiji.system.domain.Style;
import com.taiji.user.domain.Role;
import com.taiji.user.domain.User;
import com.taiji.user.service.IUserService;
import com.taiji.user.util.RemoteUser;
import com.util.EncryptDecryptData;
import com.util.HibernateSessionFactory;

/**
 * @author xuelian zhang
 * @since 2005-11-28
 * @version $Revision: 1.0 $
 */
public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String frameURL;
	private String username;
	private String password;
	private IUserService userService;
	@SuppressWarnings("unused")
	private static Properties prop;
	private Timer timer;
	private String errorContent = "";
	private Integer userRole = 1;
	private Integer funcCode;
	private String userIdCode = "";

	private void login() {
	}

	public String loginerror() {
		login();
		addActionError("login.error");
		return SUCCESS;
	}

	public String valierror() {
		login();
		addActionError("valivate.error");
		return SUCCESS;
	}

	public String loginrepeat() {
		login();
		addActionError("repeatLogin.error");
		return SUCCESS;
	}

	public String loginMuiltError() {
		login();
		addActionError("fault.error");
		return SUCCESS;
	}

	public String viewLogin() {
		login();
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	private User appendUserInfo() {
		User user = null;
		if (username == null)
			return user;
		if (username.equals(SecurityService.ADMIN)) {
			user = new User();
			user.setLogName(SecurityService.ADMIN);
			user.setStyle(new Integer(1));
			user.setName(SecurityService.ADMINNAME);
		} else {
			List userList = coreService.findByNamedQuery("findUserByLoginName",
					username);
			if (userList != null && userList.size() == 1) {
				user = (User) userList.get(0);
			}
		}
		// user = userService.getUser(username);
		return user;
	}

	class RemindTask extends TimerTask {
		@Override
		public void run() {
			User user = appendUserInfo();
			user.setFaultLogin(0);
			userService.update(user);
			timer.cancel(); // Terminate the timer thread
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			User user = null;
			byte rawKeyData[] = "taiji.com.cn".getBytes();
			if (userIdCode != null && !"".equals(userIdCode)) {
				// 解密转换
				BASE64Decoder dec = new BASE64Decoder();
				try {
					byte[] encryptedData = dec.decodeBuffer(userIdCode);
					userIdCode = EncryptDecryptData.decrypt(rawKeyData,
							encryptedData);
				} catch (IOException e) {
					e.printStackTrace();
				}
				// 如果来自法制平台，则抓取本系统用户信息
				List uList = this.coreService
						.find("from User u where u.userIdCode='" + userIdCode
								+ "'");
				// 用户信息唯一，正确，否则错误
				if (uList != null && uList.size() == 1) {
					user = (User) uList.get(0);
					// 加入CA认证，在反向短信平台会使用
					ActionContext.getContext().getSession().put(
							"UUMS_USERINFORMATION", user.getUserIdCode());
				} else {
					return "error";
				}
			} else {
				user = appendUserInfo();
				// 加入CA认证，在反向短信平台会使用
				ActionContext.getContext().getSession().put(
						"UUMS_USERINFORMATION", user.getUserIdCode());
				Map userTypeMap = getDictMap("userType");
				int isLoging = 0;
				if (user != null)
					isLoging = userService.saveLogin(user, password, userTypeMap);
				if (isLoging >= 1) {
					return ERROR;
				}
			}
			ActionContext.getContext().getSession().put(Constants.USER_LOGIN,
					user);
			if (null == user) {
				System.err.println("The User Object is Null!");
				System.err.println("Please login!");
				this.errorContent = "error";
				return ERROR;
			}
			Style style = (Style) coreService.getEntityObjectById(Style.class,
					user.getStyle());
			frameURL = style.getFramePath() + "/index_frame.ftl";
			ActionContext.getContext().getSession().put(Constants.USER_STYLE,
					style);
			RemoteUser.set(user);
			Iterator<Role> roles = user.getRoles().iterator();
			if (roles.hasNext()) {
				this.userRole = roles.next().getId();
			}
			// web跳转
			if (funcCode == null) {
				funcCode = this.getOneFuncCode(user.getId());
			}
			if (("admin").equals(user.getLogName())) {
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return "web";
	}

	public Integer getOneFuncCode(Integer userId) {
		Integer funcCodeTemp = 0;

		Session session = null;
		List resultList = null;
		try {
			session = HibernateSessionFactory.getSession();
			resultList = (List) session
					.createSQLQuery(
							"select f.function_id from u_user_role ur,u_role_permission rp,u_permission p,u_functionpermission f where ur.role_id = rp.role_id and rp.permission_id=p.permission_id and p.permission_id=f.permission_id and ur.user_id ="
									+ userId).list();
		} catch (Exception e) {
			System.out.println("该用户没有系统使用权限，请联系管理员，谢谢！");
			e.printStackTrace();
		}
		if (session != null && session.isOpen()) {
			session.close();
		}
		if (resultList != null && resultList.size() != 0) {
			funcCodeTemp = Integer.parseInt(String.valueOf(resultList.get(0)));
		}
		return funcCodeTemp;
	}

	public String unLogin() {
		try {
			User user = (User) ActionContext.getContext().getSession().get(
					Constants.USER_LOGIN);
			user.setLoginState(new Integer(0));
			coreService.update(user);
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 登录后台页面 Kerbol 2011-05-25
	 */
	public String gotoBackFrame() {
		// User user = (User)
		// ActionContext.getContext().getSession().get("_USER_LOGIN_");
		Style style = (Style) ActionContext.getContext().getSession().get(
				"_USER_STYLE_");
		this.frameURL = style.getFramePath() + "/index_frame.ftl";
		return "success";
	}

	// Set和Get方法

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {

		this.password = password;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String getFrameURL() {
		return frameURL;
	}

	public String getErrorContent() {
		return errorContent;
	}

	public void setErrorContent(String errorContent) {
		this.errorContent = errorContent;
	}

	public Integer getUserRole() {
		return userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}

	public Integer getFuncCode() {
		return funcCode;
	}

	public void setFuncCode(Integer funcCode) {
		this.funcCode = funcCode;
	}

	public String getUserIdCode() {
		return userIdCode;
	}

	public void setUserIdCode(String userIdCode) {
		this.userIdCode = userIdCode;
	}

}