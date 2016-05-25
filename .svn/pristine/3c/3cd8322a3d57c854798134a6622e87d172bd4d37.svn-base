package com.taiji.webTemplate.webwork.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.slime.json.JsonBuilder;
import org.slime.json.JsonEntity;
import org.slime.json.JsonObject;

import slime.util.character.CharacterUtil;
import slime.util.collection.ListPageUtil;

import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.user.domain.Role;
import com.taiji.webTemplate.domain.WtClassify;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtClassifyService;

@SuppressWarnings("unchecked")
public class WtClassifyAction extends ProtectedDetailAction {

	private static final long serialVersionUID = 1L;

	// 类成员

	// 公共功能变量

	private String messageContent = ""; // 信息页面内容

	private String messageAction = ""; // 信息页面跳转路径

	private String onloadCode = ""; // 信息页面默认载入后执行的JS代码

	private PaginationSupport pageList = new PaginationSupport(); // 分页列表

	private Integer pageSize = 15; // 分页列表每页显示个数

	private Integer totalPage = 0; // 分页列表页面总数

	private File upFile = new File("upFile"); // 附件对象

	private String upFileFileName = ""; // 附件对象名称

	private String pageState = ""; // 页面状态

	// 业务变量

	private List<WtClassify> classifyList = new ArrayList<WtClassify>(); // 栏目列表

	private WtClassifyService wtClassifyService = null; // 业务层对象

	private Integer classifySeq = Integer.valueOf(0); // 栏目顺序

	private Integer classifyId = Integer.valueOf(0); // 栏目ID

	private String treeData = ""; // 栏目树数据字符串

	private List<WtTemplate> templateList = new ArrayList<WtTemplate>(); // 栏目模板列表

	private WtClassify wtClassifyObject = new WtClassify(); // 栏目对象

	private List<Role> classifyRoleList = new ArrayList<Role>(); // 栏目授权角色列表

//	private NewUserService newUserService = null; // 用户业务层方法

	private Integer roleId = Integer.valueOf(0); // 角色ID

	// 公共方法

	/**
	 * 进入栏目树框架
	 */
	public String gotoClassifyTreeFrame() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 显示栏目树
	 */
	public String showClassifyTree() {
		try {
			List<WtClassify> classifyList = this.wtClassifyService.getAllClassifyList();
			JsonObject jsonObject = new JsonObject();
			for (int i = 0; i < classifyList.size(); i++) {
				JsonEntity jsonEntity = new JsonEntity();
				jsonEntity.setAttribute("id", CharacterUtil.convertObjectToString(classifyList.get(i).getId()));
				if (null != classifyList.get(i).getParentClassify()) {
					jsonEntity.setAttribute("pId", CharacterUtil.convertObjectToString(classifyList.get(i).getParentClassify()
							.getId()));
				} else {
					jsonEntity.setAttribute("pId", "-1");
				}
				jsonEntity.setAttribute("name", classifyList.get(i).getName());
				jsonEntity.setAttribute("classifySeq", CharacterUtil.convertObjectToString(classifyList.get(i).getSeq()));
				jsonObject.appendJsonEntity(jsonEntity);
			}
			JsonBuilder builder = new JsonBuilder();
			builder.isLineFeed(true);
			builder.isSimpleNameType(false);
			builder.isSimpleValueType(true);
			jsonObject.sortJsonByAttribute("classifySeq", "Integer");
			this.treeData = builder.buildJsonObject(jsonObject);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 显示栏目信息
	 */
	public String showClassifyInfo() {
		try {
			this.templateList = this.wtClassifyService.getAllTemplateList();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 显示子栏目列表
	 */
	public String showChildClassifyList() {
		try {
			this.pageList = this.wtClassifyService.getClassifyList(super.getPageNum(), this.pageSize, this.getWtClassify()
					.getId());
			this.totalPage = this.pageList.getTotalPage();
			this.classifyList = this.pageList.getItems();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入新增栏目页面
	 */
	public String gotoCreateClassify() {
		try {
			this.classifySeq = this.wtClassifyService.getBiggestClassifySeq() + 1;
			this.templateList = this.wtClassifyService.getAllTemplateList();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 新增栏目
	 */
	public String createClassify() {
		try {
			int level = this.getWtClassify().getLevel();
			this.wtClassifyObject.setLevel(level + 1);
			this.wtClassifyObject.setParentClassify(this.getWtClassify());
			this.wtClassifyService.save(this.wtClassifyObject);
			this.messageContent = "新增栏目成功！";
			this.messageAction = "../webTemplate/showChildClassifyList.action?funcCode=" + super.getFuncCode() + "&entityId="
					+ this.getWtClassify().getId();
			this.onloadCode = "window.parent.refreshTree(" + this.getWtClassify().getId() + ");";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 删除栏目
	 */
	public String deleteClassify() {
		try {
			this.wtClassifyObject = (WtClassify) this.wtClassifyService.getEntityObjectById(WtClassify.class, this.classifyId);
			if (!this.wtClassifyObject.getRoles().isEmpty()) {
				this.messageContent = "该栏目存在授权角色，请先移除授权角色后再删除该栏目！";
				return "fail";
			}
			if (!this.wtClassifyObject.getClassifyChilds().isEmpty()) {
				this.messageContent = "该栏目下有子栏目，无法删除，请先删除子栏目！";
				return "fail";
			}
			this.wtClassifyService.remove(this.wtClassifyObject);
			this.messageContent = "删除栏目成功！";
			this.messageAction = "../webTemplate/showChildClassifyList.action?funcCode=" + super.getFuncCode() + "&entityId="
					+ this.getWtClassify().getId();
			this.onloadCode = "window.parent.refreshTree(" + this.getWtClassify().getId() + ");";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 修改栏目
	 */
	public String updateClassify() {
		try {
			this.wtClassifyService.update(this.getWtClassify());
			this.messageContent = "修改栏目成功！";
			this.messageAction = "../webTemplate/showClassifyInfo.action?funcCode=" + super.getFuncCode() + "&entityId="
					+ this.getWtClassify().getId();
			this.onloadCode = "window.parent.refreshTree(" + this.getWtClassify().getId() + ");";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入栏目授权用户框架
	 */
	public String gotoClassifyRoleFrame() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 显示栏目已授权用户列表
	 */
	public String showClassifyRoleList() {
		try {
			if (this.getWtClassify().getLevel() == 0) {
				return "welcome";
			}
			Set<Role> roleSet = this.getWtClassify().getRoles();
			Iterator<Role> iterator = roleSet.iterator();
			while (iterator.hasNext()) {
				this.classifyRoleList.add(iterator.next());
			}
			ListPageUtil listPageUtil = new ListPageUtil(this.pageSize, super.getPageNum(), this.classifyRoleList);
			this.classifyRoleList = (List<Role>) listPageUtil.getListItems();
			this.totalPage = listPageUtil.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 显示栏目未授权的用户列表
	 */
	public String showClassifyNoneRoleList() {
		try {
//			List<Role> allRoleList = this.newUserService.getRoleListAll();
			Set<Role> roleSet = this.getWtClassify().getRoles();
//			for (int i = 0; i < allRoleList.size(); i++) {
//				if (!roleSet.contains(allRoleList.get(i))) {
//					this.classifyRoleList.add(allRoleList.get(i));
//				}
//			}
			ListPageUtil listPageUtil = new ListPageUtil(this.pageSize, super.getPageNum(), this.classifyRoleList);
			this.classifyRoleList = (List<Role>) listPageUtil.getListItems();
			this.totalPage = listPageUtil.getTotalPage();
			this.pageState = "none";
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 授权栏目用户
	 */
	public String entitledClassifyRole() {
		try {
//			Role role = this.newUserService.getRoleById(this.roleId);
//			this.getWtClassify().getRoles().add(role);
			this.wtClassifyService.update(this.getWtClassify());
			this.messageContent = "授权成功！";
			this.messageAction = "../webTemplate/showClassifyNoneRoleList.action?funcCode=" + super.getFuncCode() + "&entityId="
					+ this.getWtClassify().getId();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 解除授权栏目用户
	 */
	public String relieveClassifyRole() {
		try {
//			Role role = this.newUserService.getRoleById(this.roleId);
//			this.getWtClassify().getRoles().remove(role);
			this.wtClassifyService.update(this.getWtClassify());
			this.messageContent = "解除授权成功！";
			this.messageAction = "../webTemplate/showClassifyRoleList.action?funcCode=" + super.getFuncCode() + "&entityId="
					+ this.getWtClassify().getId();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	// 继承方法

	@Override
	public Class<WtClassify> getPersistentClass() {
		return WtClassify.class;
	}

	// 自定义Set和Get方法

	public WtClassify getWtClassify() {
		return (WtClassify) super.getEntity();
	}

	public void setWtClassify(WtClassify wtClassify) {
		super.setEntity(wtClassify);
	}

	// Set和Get方法

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageAction() {
		return messageAction;
	}

	public void setMessageAction(String messageAction) {
		this.messageAction = messageAction;
	}

	public String getOnloadCode() {
		return onloadCode;
	}

	public void setOnloadCode(String onloadCode) {
		this.onloadCode = onloadCode;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public File getUpFile() {
		return upFile;
	}

	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}

	public String getUpFileFileName() {
		return upFileFileName;
	}

	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}

	public List<WtClassify> getClassifyList() {
		return classifyList;
	}

	public void setClassifyList(List<WtClassify> classifyList) {
		this.classifyList = classifyList;
	}

	public WtClassifyService getWtClassifyService() {
		return wtClassifyService;
	}

	public void setWtClassifyService(WtClassifyService wtClassifyService) {
		this.wtClassifyService = wtClassifyService;
	}

	public Integer getClassifySeq() {
		return classifySeq;
	}

	public void setClassifySeq(Integer classifySeq) {
		this.classifySeq = classifySeq;
	}

	public Integer getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}

	public String getTreeData() {
		return treeData;
	}

	public void setTreeData(String treeData) {
		this.treeData = treeData;
	}

	public List<WtTemplate> getTemplateList() {
		return templateList;
	}

	public void setTemplateList(List<WtTemplate> templateList) {
		this.templateList = templateList;
	}

	public WtClassify getWtClassifyObject() {
		return wtClassifyObject;
	}

	public void setWtClassifyObject(WtClassify wtClassifyObject) {
		this.wtClassifyObject = wtClassifyObject;
	}


	public String getPageState() {
		return pageState;
	}

	public void setPageState(String pageState) {
		this.pageState = pageState;
	}

	public List<Role> getClassifyRoleList() {
		return classifyRoleList;
	}

	public void setClassifyRoleList(List<Role> classifyRoleList) {
		this.classifyRoleList = classifyRoleList;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

}
