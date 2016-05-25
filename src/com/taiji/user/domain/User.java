/*
 * Created on 2005-5-23
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 *  author:zhang xue lian 
 */

package com.taiji.user.domain;

import java.util.LinkedHashSet;
import java.util.Set;

import com.taiji.core.domain.Entity;
import com.taiji.core.util.Encrypt;

/**
 * @author Administrator
 * 
 *         To change the template for this generated type comment go to
 *         Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class User extends Entity { 
	private String logName = "";
	private String password = "";
	private String email = "";
	private Integer style = null;
	private Set roles = new LinkedHashSet();
	private Set groups = new LinkedHashSet();
	private Org org = null;
	private String name = "";
	private String type = "";
	private String typeName = "";
	private String loginTime = "";
	private Integer userPage = null;
	private String phone = "";
	private String mphone = "";
	private String address = "";
	private String postMan = "";
	private String userIdCode = "";
	private Integer loginState = null;;
	private Integer faultLogin = null;
	private String userSeq;
	
	private String releasePermission;
	public String getReleasePermission() {
		return releasePermission;
	}
	public void setReleasePermission(String releasePermission) {
		this.releasePermission = releasePermission;
	}

	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}

	public Integer getFaultLogin() {
		return faultLogin;
	}

	public void setFaultLogin(Integer faultLogin) {
		this.faultLogin = faultLogin;
	}

	public Integer getLoginState() {
		return loginState;
	}

	public void setLoginState(Integer loginState) {
		this.loginState = loginState;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogName() {
		return logName;
	}

	public void setLogName(String logname) {
		this.logName = logname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getStyle() {
		return style;
	}

	public void setStyle(Integer style) {
		this.style = style;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	public Integer getUserPage() {
		return userPage;
	}

	public void setUserPage(Integer userPage) {
		this.userPage = userPage;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String phone) {
		this.mphone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostMan() {
		return postMan;
	}

	public void setPostMan(String postMan) {
		this.postMan = postMan;
	}

	/*
	 * public Group getGroup() { return group; } public void setGroup(Group
	 * group) { this.group = group; }
	 */
	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public Set getRoles() {
		return roles;
	}

	public void setRoles(Set roles) {
		this.roles = roles;
	}

	public void addRole(Role role) {
		if (role == null)
			throw new IllegalArgumentException("Null Role");
		role.getUsers().add(this);
		roles.add(role);
	}

	public Set getGroups() {
		return groups;
	}

	public void setGroups(Set groups) {
		this.groups = groups;
	}

	public void addGroup(Group group) {
		if (group == null)
			throw new IllegalArgumentException("Null Role");
		group.getUsers().add(this);
		groups.add(group);
	}

	public boolean authenticate(String password) {
		String tempPassword = Encrypt.encryptString(password);
		return this.password.equals(password);
	}

	public boolean equals(Object other) {
		if (this == other)
			return true;
		if (!(other instanceof User))
			return false;
		final User user = (User) other;
		if (!getName().equals(user.getName()))
			return false;
		if (!getLogName().equals(user.getLogName()))
			return false;

		return true;
	}

	public int hashCode() {
		int result = 14;
		result = result + 29 * getName().hashCode();
		result = result + 29 * logName.hashCode();
		return result;
	}

	public String getUserIdCode() {
		return userIdCode;
	}

	public void setUserIdCode(String userIdCode) {
		this.userIdCode = userIdCode;
	}

}
