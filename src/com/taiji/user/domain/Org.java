/*
 * Created on 2005-5-23
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 * author zhang xue lian
 */
package com.taiji.user.domain;

import java.util.LinkedHashSet;
import java.util.Set;

import com.taiji.core.domain.Entity;

public class Org extends Entity {
	private Org parent;
	private Set users = new LinkedHashSet();
	private Set childs = new LinkedHashSet();
	private Set roles = new LinkedHashSet<Object>();
	private String locbm;
	private String bm;
	private String name;
	private Integer state;
	private Integer level;
	private Integer gk_dept;
	private String departCode;// CA部门编码
	private String epartUpCode;// CA上级部门编码
	private Integer seq = 0; // 组织顺序
	private String org_manage;// CA部门编码
	private String org_fy;// CA部门编码

	private Integer fyLv;// 用户所在组织机构类型 1.市政府法制办2.市级委办局3.区县法制办4.区县委办局
	private Integer fyBeAppType;// 被申请人种类
	// 1.省部级行政机关2.省级政府的部门3.市(地)级政府4.市(地)级政府的部门5.县级政府6.县级政府的部门7.乡镇政府8.其他
	private Integer fyParent;// 复议机构上级单位ID
	private String fyParentName;// 复议机构上级单位名称
	private Integer fySup;// 复议机构督报单位ID
	private String fySupName;// 复议机构督报单位名称

	public Integer getFySup() {
		return fySup;
	}

	public void setFySup(Integer fySup) {
		this.fySup = fySup;
	}

	public String getFySupName() {
		return fySupName;
	}

	public void setFySupName(String fySupName) {
		this.fySupName = fySupName;
	}

	public Integer getFyParent() {
		return fyParent;
	}

	public void setFyParent(Integer fyParent) {
		this.fyParent = fyParent;
	}

	public String getFyParentName() {
		return fyParentName;
	}

	public void setFyParentName(String fyParentName) {
		this.fyParentName = fyParentName;
	}

	public Integer getFyLv() {
		return fyLv;
	}

	public void setFyLv(Integer fyLv) {
		this.fyLv = fyLv;
	}

	public Integer getFyBeAppType() {
		return fyBeAppType;
	}

	public void setFyBeAppType(Integer fyBeAppType) {
		this.fyBeAppType = fyBeAppType;
	}

	public String getOrg_manage() {
		return org_manage;
	}

	public void setOrg_manage(String org_manage) {
		this.org_manage = org_manage;
	}

	public String getOrg_fy() {
		return org_fy;
	}

	public void setOrg_fy(String org_fy) {
		this.org_fy = org_fy;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Org getParent() {
		return parent;
	}

	public void setParent(Org parent) {
		this.parent = parent;
	}

	public Set getUsers() {
		return users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

	public Set getChilds() {
		return childs;
	}

	public void setChilds(Set childs) {
		this.childs = childs;
	}

	public Set getRoles() {
		return roles;
	}

	public void setRoles(Set roles) {
		this.roles = roles;
	}

	public String getLocbm() {
		return locbm;
	}

	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}

	public String getBm() {
		return bm;
	}

	public void setBm(String bm) {
		this.bm = bm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getGk_dept() {
		return gk_dept;
	}

	public void setGk_dept(Integer gkDept) {
		gk_dept = gkDept;
	}

	public String getDepartCode() {
		return departCode;
	}

	public void setDepartCode(String departCode) {
		this.departCode = departCode;
	}

	public String getEpartUpCode() {
		return epartUpCode;
	}

	public void setEpartUpCode(String epartUpCode) {
		this.epartUpCode = epartUpCode;
	}

	public void addUser(User user) {
		if (user == null)
			throw new IllegalArgumentException("Null User");
		user.setOrg(this);
		this.users.add(user);
	}

	public void addChildOrg(Org childOrg) {
		if (childOrg == null)
			throw new IllegalArgumentException("Null Org");
		if (childOrg.getParent() != null)
			childOrg.getParent().getChilds().remove(childOrg);
		childOrg.setParent(this);
		this.childs.add(childOrg);
	}
}
