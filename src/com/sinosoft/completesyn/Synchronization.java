package com.sinosoft.completesyn;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.xml.rpc.ServiceException;

import org.springframework.remoting.jaxrpc.ServletEndpointSupport;

import com.bjca.uums.client.bean.DepartmentInformation;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.Role;
import com.taiji.user.domain.User;
import com.taiji.user.service.IOrgService;
import com.taiji.user.service.IUserService;

public class Synchronization extends ServletEndpointSupport {
	private IUserService userService;

	private IOrgService orgService;

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	protected void onInit() throws ServiceException {
		userService = (IUserService) getApplicationContext().getBean(
				"userService");
		orgService = (IOrgService) getApplicationContext()
				.getBean("orgService");
	}

	public Synchronization() {
	}

	public boolean synchronizedUserInfo(int operateID, String operateCode,
			String operateType) {
		User user = null;
		Org org = null;
		// 新增，修改用户信息
		if (operateID == 11 || operateID == 12) {
			uumsinterface.services.User.UserSoapBindingStub binding;
			try {
				binding = (uumsinterface.services.User.UserSoapBindingStub) new uumsinterface.services.User.UserServiceLocator()
						.getUser();
			} catch (javax.xml.rpc.ServiceException jre) {
				if (jre.getLinkedCause() != null)
					jre.getLinkedCause().printStackTrace();
				throw new junit.framework.AssertionFailedError(
						"JAX-RPC ServiceException caught: " + jre);
			}
			// Time out after a minute
			binding.setTimeout(60000);

			// 如果是个人用户，读取详细信息
			if (operateType != null && operateType.equals("1")) {
				com.bjca.uums.client.bean.PersonInformation Person = null;
				try {
					user = new User();
					// 判断用户是否已经存在，存在取得该对象
					List userList = this.userService
							.find("from User a where a.userIdCode='"
									+ operateCode + "'");
					// 读取CA用户数据
					Person = binding.findPersonInfosByUserIDForDC(operateCode);
					if (Person == null) {
						return false;
					}
					List localUserList = new ArrayList();
					if (userList.size() == 0) {
						// System.out.println("新增用户");
						user = getNewUser();
					} else {
						// System.out.println("修改用户");
						user = (User) userList.get(0);
					}
					// 赋值到本系统用户表
					user.setName(Person.getUserName());
					user.setAddress(Person.getUserAddress());
					user.setEmail(Person.getUserEmail());
					user.setMphone(Person.getUserMobile());
					user.setPhone(Person.getUserPhone());
					user.setUserIdCode(operateCode);
					user.setLogName(operateCode);
					// CA中存在用户在多个组织，不适应本系统规则，默认取第一个单位
					if (user.getOrg() == null) {
						Collection departs = Person.getDeparts();
						for (Iterator iter = departs.iterator(); iter.hasNext();) {
							DepartmentInformation depart = (DepartmentInformation) iter
									.next();
						}
						// 循环获取CA存在的组织，若本系统中有该组织，则赋予新增加的用户
						for (Iterator iter = departs.iterator(); iter.hasNext();) {
							DepartmentInformation depart = (DepartmentInformation) iter
									.next();
							String departCode = depart.getDepartCode();
							if (departCode != null) {
								List depList = this.orgService
										.find("from Org a where a.departCode='"
												+ departCode + "'");
								// 找到单位
								if (depList.size() > 0) {
									org = (Org) depList.get(0);
								}
								// 找不到单位时，有可能编码为市级委办局下设的处室，则取该委办局
								if (depList.size() == 0
										&& departCode.length() == 13) {
									org = getShiJiOrg(org, departCode);
								}
								if (org == null) {
									continue;
								} else {
									System.out
											.println("所属单位是 " + org.getName());
									user.setOrg(org);
									break;
								}
							}
						}
						// 若CA中用户所在组织不存在与本系统组织树中，则认为新增失败，请先增加组织到本系统中
						if (org == null) {
							return false;
						}
					}
				} catch (RemoteException ex) {
					ex.printStackTrace();
				}
			} else if (operateType != null && operateType.equals("2")) {
				return false;
			}
			// 调用插入数据库记录方法，将获得的用户信息以及用户的角色信息插入数据库中
			this.userService.saveOrUpdate(user);
			return true;
		}
		// 删除用户，包括个人用户、单位用户
		if (operateID == 13) {

			List userList = this.userService
					.find("from User a where a.userIdCode='" + operateCode
							+ "'");
			// 存在CA要删除的用户，则删除
			if (userList.size() > 0) {
				user = (User) userList.get(0);
				this.userService.remove(user);
			}
			return true;
		}

		if (operateID == 41 || operateID == 42) {
			// 获得部门的信息
			org = new Org();
			uumsinterface.services.Department.DepartmentSoapBindingStub binding2;
			try {
				binding2 = (uumsinterface.services.Department.DepartmentSoapBindingStub) new uumsinterface.services.Department.DepartmentServiceLocator()
						.getDepartment();
			} catch (javax.xml.rpc.ServiceException jre) {
				if (jre.getLinkedCause() != null)
					jre.getLinkedCause().printStackTrace();
				throw new junit.framework.AssertionFailedError(
						"JAX-RPC ServiceException caught: " + jre);
			}
			// Time out after a minute
			binding2.setTimeout(60000);

			com.bjca.uums.client.bean.DepartmentInformation Departvalue = null;

			try {
				Departvalue = binding2.findDepartByDepartCodeForDC(operateCode);
			} catch (RemoteException ex1) {
				ex1.printStackTrace();
			}
			List depList = this.orgService
					.find("from Org a where a.departCode='" + operateCode + "'");
			if (depList.size() > 0) {
				org = (Org) depList.get(0);
			}
			org.setName(Departvalue.getDepartName());
			org.setDepartCode(Departvalue.getDepartCode());
			org.setEpartUpCode(Departvalue.getDepartUpcode());
			if (depList.size() > 0) {
				orgService.update(org);
			} else {
				Org parent = null;

				String departCode = Departvalue.getDepartCode();
				// 编码中含"C"的为政府机构，其余3家领导机构不参与,其他含Z，总工会
				if (departCode != null
						&& (departCode.contains("C") || departCode
								.contains("Z"))) {

					switch (departCode.length()) {
					case 7:
						// 如果是区县政府，直接放置"北京市政府法制机构"下方
						parent = (Org) orgService.getEntityObjectById(0);
						break;
					case 10:
						// 如果是市级委办局，也直接放置"北京市政府法制机构"下方
						if (departCode.contains("110000C")
								|| departCode.contains("110000Z")) {
							parent = (Org) orgService.getEntityObjectById(0);
						} else {
							// 如果是区县委办局，尝试获得区县政府ORG的ID

							List parentList = this.orgService
									.find("from Org a where a.departCode='"
											+ departCode.substring(0, 7) + "'");
							// 尝试失败，返回通知CA
							if (parentList.size() > 0) {
								parent = (Org) parentList.get(0);
							} else {
								/*
								 * 未考虑在16区县外的数据，以及宣武，崇文
								 */
								return false;
							}
						}
						break;
					case 13:
						// 如果是市级委办局下属处室，尝试获得市委办局ORG的ID
						List parentList = this.orgService
								.find("from Org a where a.departCode='"
										+ departCode.substring(0, 10) + "'");
						// 尝试失败，返回通知CA
						if (parentList.size() > 0) {
							parent = (Org) parentList.get(0);
						} else {
							// System.out.println("处室没有找到父节点");
							return false;
						}

						break;
					default:
						break;
					}
					org.setParent(parent);
					org.setState(1);
					orgService.saveOrUpdate(org);
				} else {
					return false;
				}
			}
			return true;
		}
		if (operateID == 43) {
			List depList = this.orgService
					.find("from Org a where a.departCode='" + operateCode + "'");
			// 存在CA要删除的组织，则删除
			if (depList.size() > 0) {
				org = (Org) depList.get(0);
				org.setState(0);
				this.orgService.update(org);
			}
			return true;
		}
		return false;
	}

	/**
	 * 获得初始化用户
	 * 
	 * @param user
	 * @return
	 */
	private User getNewUser() {
		User tempUser = new User();
		tempUser.setStyle(2);
		tempUser.setType("732");
		tempUser.setPassword("password");
		tempUser.setLoginState(0);
		List roleList = this.userService.find("from Role t where t.id= 30");
		if (roleList.size() > 0) {
			Role role = (Role) this.userService.getEntityObjectById(Role.class,
					((Role) roleList.get(0)).getId());
			Set roleSet = new HashSet();
			roleSet.add(role);
			tempUser.setRoles(roleSet);
		}
		return tempUser;
	}

	/**
	 * 如果是市委办局下各处室，则获得市委办局ID
	 * 
	 * @param org
	 * @param departCode
	 * @return
	 */
	private Org getShiJiOrg(Org org, String departCode) {
		List weiBanList = this.orgService
				.find("from Org a where a.departCode='"
						+ departCode.substring(0, 10) + "'");
		if (weiBanList.size() > 0) {
			org = (Org) weiBanList.get(0);
		}
		return org;
	}

	/**
	 * 判断当前用户所在的部门是否存在于CA的部门中
	 * 
	 * @param user
	 * @param Person
	 * @return true:存在，false:不存在
	 * 
	 */
	private boolean isExistOrg(User user,
			com.bjca.uums.client.bean.PersonInformation Person) {
		String localOrgCode = getLocalOrg(user);
		String personCode;
		// 本地单位为空，则没有该组织
		if (localOrgCode == null) {
			return false;
		}
		// 如果本地单位长度为13位
		if (localOrgCode.length() == 13) {
			Iterator ite = Person.getDeparts().iterator();
			while (ite.hasNext()) {
				DepartmentInformation depart = (DepartmentInformation) ite
						.next();
				personCode = depart.getDepartCode();
				if (personCode != null) {
					// System.out.println("本地编码长度13，CA单位编码 " + personCode);
					if (personCode.equals(localOrgCode)) {
						return true;
					}
				}
			}
		}
		// 如果本地单位长度为10位
		if (localOrgCode.length() == 10) {
			Iterator ite = Person.getDeparts().iterator();
			while (ite.hasNext()) {
				DepartmentInformation depart = (DepartmentInformation) ite
						.next();
				personCode = depart.getDepartCode();
				if (personCode != null) {
					// System.out.println("本地编码长度10，CA单位编码 " + personCode);
					if (personCode.contains(localOrgCode))
						return true;
				}
			}
		}
		return false;
	}

	/**
	 * 获得本地用户单位DepartCode
	 * 
	 * @param user
	 * @return
	 */
	private String getLocalOrg(User user) {
		Org localOrg = (Org) this.userService.getEntityObjectById(Org.class,
				user.getOrg().getId());
		while (localOrg.getDepartCode() == null) {
			if (localOrg.getParent().getId() == -1) {
				return null;
			} else {
				localOrg = (Org) this.userService.getEntityObjectById(
						Org.class, localOrg.getParent().getId());
			}
		}
		// System.out.println("本地单位编码 " + localOrg.getDepartCode());
		return localOrg.getDepartCode();
	}

	/**
	 * 根据用户的32位码查找用户的权限信息 返回roleId、roleName、是否选中(0未选中,1选中)
	 * 
	 * @param userCode
	 * @return
	 */
	public String[] getOrgRoleXZFY(String userCode, String departCode) {
		String[] userRuleImfo = null;
		String[] orgRuleImfo = null;
		List list = userService.find("from User u where u.userIdCode='"
				+ userCode + "'");
		// 如果不是复议用户，不返回权限
		if (list.size() == 0) {
			return orgRuleImfo;
		}
		String sql = "select distinct(m.role_id),m.role_name from u_role m where m.role_id in (select o.role_id from u_user_role o where o.user_id in (select t.user_id from u_user t where t.user_idcode = '"
				+ userCode + "'))";
		List listUserRole = findByUserCodeAndDeptCode(sql);// 得到userRoleList
		List listOrgRole = this.userService.find("from Role t where t.id= 30");
		if (listOrgRole.size() > 0) {
			orgRuleImfo = new String[listOrgRole.size()];
			for (int i = 0; i < listOrgRole.size(); i++) {
				Role role = (Role) listOrgRole.get(i);// 得到Role
				orgRuleImfo[i] = role.getId() + "," + "复议用户" + "," + 0;

				for (int j = 0; j < listUserRole.size(); j++) {
					if (role.getId().equals(
							((Role) listUserRole.get(j)).getId())) {
						orgRuleImfo[i] = role.getId() + "," + "复议用户" + "," + 1;
						break;
					}
				}

			}
		}
		return orgRuleImfo;
	}

	// 修改用户权限
	public Boolean updateUserRole(String roleIDs, String usercode) {
		Boolean result = false;
		// 查询用户是否存在
		List list = userService.find("from User u where u.userIdCode='"
				+ usercode + "'");
		if (list.size() > 0) {
			User user = (User) list.get(0);
			int number = 0;
			Org org = (Org) userService.getEntityObjectById(Org.class, user
					.getOrg().getId());
			// 删除以前所有权限
			String deleteSql = "delete from u_user_role where USER_ID="
					+ user.getId();
			execByRoleIdAndUserId(deleteSql);
			// 如果有新赋予的权限
			if (roleIDs != null && !"".equals(roleIDs)) {
				String insertSql = "insert into u_user_role values("
						+ user.getId() + "," + roleIDs + ")";
				execByRoleIdAndUserId(insertSql);
				Role role = (Role) this.userService.getEntityObjectById(
						Role.class, Integer.valueOf(roleIDs));
			}
			result = true;
		} else {
			result = true;
		}
		return result;
	}

	public Connection getConnectionByJDBC() {
		Connection conn = null;
		try { // 装载驱动类
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("装载驱动异常！");
			e.printStackTrace();
		}
		try { // 建立JDBC连接
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521:orcl", "xzfy", "xzfy");
		} catch (SQLException e) {
			System.out.println("链接数据库异常！");
			e.printStackTrace();
		}
		return conn;
	}

	public List findByUserCodeAndDeptCode(String hql) {
		Connection conn = getConnectionByJDBC();
		List roleList = new ArrayList();
		try { // 创建一个JDBC声明
			Statement stmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			// 执行查询
			ResultSet rs = stmt.executeQuery(hql);
			while (rs.next()) {
				Role role = new Role();
				role.setId(rs.getInt("role_id"));
				role.setName(rs.getString("role_name"));
				roleList.add(role);
			}
			// insert ,update ,delete用executeUpdate方法
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			// 预防性关闭连接(避免异常发生时在try语句块关闭连接没有执行)
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return roleList;
	}

	/*
	 * 获得返回集
	 */
	public int getCount(String hql) {
		int number = 0;
		Connection conn = getConnectionByJDBC();
		List roleList = new ArrayList();
		try { // 创建一个JDBC声明
			Statement stmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			// 执行查询
			ResultSet rs = stmt.executeQuery(hql);
			while (rs.next()) {
				number = (rs.getInt("cnum"));
			}
			// insert ,update ,delete用executeUpdate方法
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			// 预防性关闭连接(避免异常发生时在try语句块关闭连接没有执行)
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return number;
	}

	/**
	 * 修改Role表，包括删除和添加
	 * 
	 * @param hql
	 */
	public void execByRoleIdAndUserId(String hql) {
		Connection conn = getConnectionByJDBC();
		try { // 创建一个JDBC声明
			Statement stmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			// 执行查询
			stmt.execute(hql);
			// insert ,update ,delete用executeUpdate方法
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 预防性关闭连接(避免异常发生时在try语句块关闭连接没有执行)
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
	}

	// 根据编码获得组织ID
	private String getOrgbyDepartCode(String departCode) {
		Integer org_id = -10;
		Connection conn = getConnectionByJDBC();
		try { // 创建一个JDBC声明
			Statement stmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			// 执行查询
			ResultSet rs = stmt
					.executeQuery("select org_id from u_org where DEPART_CODE='"
							+ departCode + "'");
			while (rs.next()) {
				org_id = rs.getInt("org_id");
			}
			// insert ,update ,delete用executeUpdate方法
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			// 预防性关闭连接(避免异常发生时在try语句块关闭连接没有执行)
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		ids = org_id + "";
		return getAllChildRoleById(org_id);
	}

	// 递归获得所有孩子ID
	private String getAllChildRoleById(Integer orgId) {
		List childIds = new ArrayList();
		Connection conn = getConnectionByJDBC();
		try { // 创建一个JDBC声明
			Statement stmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			// 执行查询
			ResultSet rs = stmt
					.executeQuery("select org_id from u_org where org_parent="
							+ orgId);
			while (rs.next()) {
				childIds.add(rs.getInt("org_id"));
				if (ids == null || "".equals(ids)) {
					ids = "" + (rs.getInt("org_id"));
				} else {
					ids += "," + (rs.getInt("org_id"));
				}

			}
			// insert ,update ,delete用executeUpdate方法
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			// 预防性关闭连接(避免异常发生时在try语句块关闭连接没有执行)
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (childIds.size() > 0) {
			for (Object id : childIds) {
				getAllChildRoleById(Integer.valueOf(id.toString()));
			}
		}
		return ids;
	}

}
