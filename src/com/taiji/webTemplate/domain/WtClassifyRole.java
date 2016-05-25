package com.taiji.webTemplate.domain;

import java.io.Serializable;

import com.taiji.core.domain.Entity;

public class WtClassifyRole extends Entity implements Serializable {

	private static final long serialVersionUID = 1L;

	// 类成员

	private Integer roleId = Integer.valueOf(0); // 角色ID

	private Integer classifyId = Integer.valueOf(0); // 栏目ID

	// Set和Get方法

	public Integer getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}
