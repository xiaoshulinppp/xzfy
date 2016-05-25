package com.taiji.user.webwork.action;

import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.user.domain.Org;
import com.taiji.user.service.IOrgService;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@SuppressWarnings("unchecked")
public class OrgAction extends ProtectedDetailAction {
	private static final Log log = LogFactory.getLog(OrgAction.class);
	private IOrgService orgService;
	private Integer parentId = new Integer(0);
	private Integer orgId;
	private List orgList;
	private Integer[] hasLeaf;

	public Integer[] getHasLeaf() {
		return this.hasLeaf;
	}

	public void setHasLeaf(Integer[] hasLeaf) {
		this.hasLeaf = hasLeaf;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getOrgId() {
		return this.orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public Org getOrg() {
		return ((Org) getEntity());
	}

	public void setOrg(Org org) {
		setEntity(org);
	}

	public void setOrgList(List orgList) {
		this.orgList = orgList;
	}

	public List getOrgList() {
		return this.orgList;
	}

	@Override
	public String save() {
		Org parent;
		super.setOpName("create");

		String parentbm = "";
		try {
			if (this.parentId.equals(new Integer(0))) {
				parent = new Org();
				parent.setId(this.parentId);
			} else {
				parent = (Org) this.orgService
						.getEntityObjectById(this.parentId);
				parentbm = parent.getBm();
			}

			parent.addChildOrg(getOrg());
			this.orgService.saveOrg(getOrg());
			this.orgId = getOrg().getId();
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}

	@Override
	public String update() {
		super.setOpName("update");
		try {
			this.coreService.update(getOrg());
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "success";
	}

	@Override
	public String delete() {
		boolean result = true;
		super.setOpName("delete");
		try {
			if (getOrg() != null) {
				result = this.orgService.removeOrg(getOrg());

			}
			List deleteList = getDeleteObjectList();
			if (deleteList == null)

				result = this.orgService.batchRemoveOrg(deleteList);
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		if (result) {
			return "success";
		} else {
			return "input";
		}
	}

	public String list() throws Exception {
		this.orgList = this.orgService.getChildOrgList(this.parentId);
		this.hasLeaf = new Integer[this.orgList.size()];
		for (int i = 0; i < this.orgList.size(); ++i) {
			Org org = (Org) this.orgList.get(i);
			this.hasLeaf[i] = hasLeafOrg(org.getId());
		}
		return "success";
	}

	private Integer hasLeafOrg(Integer orgId) {
		String hql = "from Org org where org.parent.id=" + orgId;
		List childList = this.coreService.find(hql);
		if (childList.size() == 0)
			return Integer.valueOf(0);
		return Integer.valueOf(1);
	}

	public IOrgService getOrgService() {
		return this.orgService;
	}

	public void setOrgService(IOrgService service) {
		this.orgService = service;
	}

	@Override
	public Class getPersistentClass() {
		return Org.class;
	}
}