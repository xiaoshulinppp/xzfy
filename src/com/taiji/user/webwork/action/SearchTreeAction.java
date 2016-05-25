package com.taiji.user.webwork.action;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.system.domain.DictItem;
import com.taiji.system.domain.Dictionary;

import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.user.service.IOrgService;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SearchTreeAction extends ProtectedDetailAction {

	private static final Log log;
	private Integer parentId;
	private List dictItemList;
	private String opName;
	public IOrgService orgService;

	public int initId;
	public String initname;
	public String initvalue;
	public int initabbr;

	private String fieldId;
	private String fieldName;
	private String multiSelect;

	public Org org;
	private Integer orgId;

	private String orgName;

	// 初始化树
	public String typeTree() {
		org = (Org) orgService.getEntityObjectById(Org.class, 1);
		initId = org.getId();
		initname = org.getName();
		initvalue = "";
		return SUCCESS;
	}

	// 获取子树信息
	public String typeTreeServer() throws Exception {
		dictItemList = this.coreService.find("from Org o where  o.parent="
				+ parentId + " order by o.id");
		return "success";
	}

	// 初始化树
	public String beAppDeptTree() {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		user = (User) this.coreService.loadEntityObjectById(User.class, user
				.getId());
		org = (Org) this.coreService.loadEntityObjectById(Org.class, user
				.getOrg().getId());
		if (org.getFyLv() == 1) {
			Org tempOrg = (Org) orgService.getEntityObjectById(Org.class, 1);
			initId = tempOrg.getId();
			initname = tempOrg.getName();
			initvalue = "";
			initabbr = tempOrg.getFyBeAppType();
		}
		if (org.getFyLv() == 2) {
			Org tempOrg = (Org) orgService.getEntityObjectById(Org.class, org.getId());
			initId = tempOrg.getId();
			initname = tempOrg.getName();
			initvalue = "";
			initabbr = tempOrg.getFyBeAppType();
		}
		if (org.getFyLv() == 3) {
			Org tempOrg = (Org) orgService.getEntityObjectById(Org.class, org.getParent().getId());
			initId = tempOrg.getId();
			initname = tempOrg.getName();
			initvalue = "";
			initabbr = tempOrg.getFyBeAppType();
		}
		if (org.getFyLv() == 4) {
			Org tempOrg = (Org) orgService.getEntityObjectById(Org.class, org.getId());
			initId = tempOrg.getId();
			initname = tempOrg.getName();
			initvalue = "";
			initabbr = tempOrg.getFyBeAppType();
		}	
		return SUCCESS;
	}

	// 获取子树信息
	public String beAppDeptTreeServer() throws Exception {
		User user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		user = (User) this.coreService.loadEntityObjectById(User.class, user
				.getId());
		Org org = (Org) this.coreService.loadEntityObjectById(Org.class, user
				.getOrg().getId());
		if (org.getFyLv() == 1) {
			dictItemList = this.coreService
					.find("from Org o where  o.fyParent=" + parentId
							+ " order by o.id");
		}
		if (org.getFyLv() == 2) {
			dictItemList = this.coreService
					.find("from Org o where  o.fySup=" + parentId
							+ " order by o.id");
		}
		if (org.getFyLv() == 3) {
			dictItemList = this.coreService
					.find("from Org o where  o.fyParent=" + parentId
							+ " order by o.id");
		}
		if (org.getFyLv() == 4) {
			dictItemList = this.coreService
					.find("from Org o where  o.fySup=" + parentId
							+ " order by o.id");
		}
		return "success";
	}

	public String getInitvalue() {
		return initvalue;
	}

	public void setInitvalue(String initvalue) {
		this.initvalue = initvalue;
	}

	public int getInitabbr() {
		return initabbr;
	}

	public void setInitabbr(int initabbr) {
		this.initabbr = initabbr;
	}

	public List getDictItemList() {
		return dictItemList;
	}

	public void setDictItemList(List dictItemList) {
		this.dictItemList = dictItemList;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public Integer getOrgId() {
		return orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public String getOpName() {
		return opName;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getParentId() {
		return parentId;
	}

	public Class getPersistentClass() {
		return com.taiji.user.domain.Org.class;
	}

	static {
		log = LogFactory
				.getLog(com.taiji.system.webwork.action.DictItemAction.class);
	}

	public IOrgService getOrgService() {
		return orgService;
	}

	public void setOrgService(IOrgService orgService) {
		this.orgService = orgService;
	}

	public int getInitId() {
		return initId;
	}

	public void setInitId(int initId) {
		this.initId = initId;
	}

	public String getInitname() {
		return initname;
	}

	public void setInitname(String initname) {
		this.initname = initname;
	}

	public String getMultiSelect() {
		return multiSelect;
	}

	public void setMultiSelect(String multiSelect) {
		this.multiSelect = multiSelect;
	}

	public String getFieldId() {
		return fieldId;
	}

	public void setFieldId(String fieldId) {
		this.fieldId = fieldId;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
}
