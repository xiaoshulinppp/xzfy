package com.taiji.webTemplate.domain;

import java.io.Serializable;
import java.util.Set;
import java.util.TreeSet;

import com.taiji.core.domain.Entity;
import com.taiji.user.domain.Role;

public class WtClassify extends Entity implements Serializable {

	private static final long serialVersionUID = 1L;

	// 类成员

	private Integer templateId = Integer.valueOf(0); // 模板ID

	private WtClassify parentClassify = null; // 父栏目对象

	private Set<WtClassify> classifyChilds = new TreeSet<WtClassify>(); // 子栏目集合

	private String name = ""; // 栏目名称

	private Integer seq = Integer.valueOf(0); // 栏目顺序

	private String state = ""; // 栏目状态

	private Integer level = Integer.valueOf(0); // 栏目级别

	private Set<Role> roles = new TreeSet<Role>(); // 栏目对应的角色集合

	// Set和Get方法

	public WtClassify getParentClassify() {
		return parentClassify;
	}

	public void setParentClassify(WtClassify parentClassify) {
		this.parentClassify = parentClassify;
	}

	public Set<WtClassify> getClassifyChilds() {
		return classifyChilds;
	}

	public void setClassifyChilds(Set<WtClassify> classifyChilds) {
		this.classifyChilds = classifyChilds;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getTemplateId() {
		return templateId;
	}

	public void setTemplateId(Integer templateId) {
		this.templateId = templateId;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

}
