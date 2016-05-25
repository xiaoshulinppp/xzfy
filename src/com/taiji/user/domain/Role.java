package com.taiji.user.domain;

import com.taiji.core.domain.Entity;
import java.util.LinkedHashSet;
import java.util.Set;

public class Role extends Entity {
	private Role parent;
	private Integer userCount;
	private Set permissions = new LinkedHashSet();
	private Set childs = new LinkedHashSet();
	private Set users = new LinkedHashSet();
	private Set groups = new LinkedHashSet();
	private String name;
	private Org org; 
	
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Role getParent() {
		return this.parent;
	}

	public void setParent(Role parent) {
		this.parent = parent;
	}

	public Integer getUserCount() {
		return this.userCount;
	}

	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}

	public Org getOrg() {
		return this.org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public Set getPermissions() {
		return this.permissions;
	}

	public void setPermissions(Set permissions) {
		this.permissions = permissions;
	}

	public void addPermission(Permission perm) {
		if (perm == null)
			throw new IllegalArgumentException("Null Permission!");
		perm.getRoles().add(this);
		this.permissions.add(perm);
	}

	public Set getChilds() {
		return this.childs;
	}

	private void setChilds(Set childs) {
		this.childs = childs;
	}

	public void addChildRole(Role childRole) {
		if (childRole == null)
			throw new IllegalArgumentException("Null Role");
		if (childRole.getParent() != null)
			childRole.getParent().getChilds().remove(childRole);
		childRole.setParent(this);
		this.childs.add(childRole);
	}

	public Set getUsers() {
		return this.users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

	public void addUser(User user) {
		if (user == null)
			throw new IllegalArgumentException("Null User");
		user.getRoles().add(this);
		this.users.add(user);
	}

	public Set getGroups() {
		return this.groups;
	}

	private void setGroups(Set groups) {
		this.groups = groups;
	}

	public void addGroup(Group group) {
		if (group == null)
			throw new IllegalArgumentException("Null Group");
		group.getRoles().add(this);
		this.groups.add(group);
	}
}