package com.taiji.webTemplate.webwork.action;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.slime.json.JsonBuilder;
import org.slime.json.JsonEntity;
import org.slime.json.JsonObject;

import slime.util.character.CharacterUtil;

import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedAction;
import com.taiji.user.domain.Role;
import com.taiji.user.domain.User;
import com.taiji.webTemplate.domain.WtClassify;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtClassifyService;

@SuppressWarnings("unchecked")
public class WtClassifyDataAction extends ProtectedAction {

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

	private String functionUrl = ""; // Webwork返回Url

	// 业务变量

	private WtClassifyService wtClassifyService = null; // 业务层对象

	private Integer classifyId = Integer.valueOf(0); // 栏目ID

	private String treeData = ""; // 栏目树数据字符串

	private WtClassify wtClassifyObject = new WtClassify(); // 栏目对象

//	private NewUserService newUserService = null; // 用户业务层方法

	// 公共方法

	/**
	 * 进入栏目数据框架
	 */
	public String gotoClassifyDataFrame() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入模板功能链接
	 */
	public String gotoTemplateFunction() {
		try {
			WtClassify wtClassify = (WtClassify) this.wtClassifyService.getEntityObjectById(WtClassify.class, this.classifyId);
			if (wtClassify.getTemplateId() == -1) {
				return "welcome";
			}
			boolean isEntitled = true;
//			User currentUser = this.newUserService.getCurrentUser();
//			Set<Role> roleSet = currentUser.getRoles();
//			Iterator<Role> iterator = roleSet.iterator();
//			while (iterator.hasNext()) {
//				Role role = iterator.next();
//				if (!wtClassify.getRoles().contains(role)) {
//					isEntitled = false;
//					break;
//				}
//			}
			if (!isEntitled) {
				this.messageContent = "您无此栏目操作权限！";
				return "fail";
			}
			WtTemplate wtTemplate = (WtTemplate) this.wtClassifyService.getEntityObjectById(WtTemplate.class, wtClassify
					.getTemplateId());
			this.functionUrl = wtTemplate.getFunction();
			this.functionUrl = this.functionUrl.replaceAll("&", "&amp;");
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 显示启动后的栏目树
	 */
	public String showClassifyDataTree() {
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

	public String getPageState() {
		return pageState;
	}

	public void setPageState(String pageState) {
		this.pageState = pageState;
	}

	public WtClassifyService getWtClassifyService() {
		return wtClassifyService;
	}

	public void setWtClassifyService(WtClassifyService wtClassifyService) {
		this.wtClassifyService = wtClassifyService;
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

	public WtClassify getWtClassifyObject() {
		return wtClassifyObject;
	}

	public void setWtClassifyObject(WtClassify wtClassifyObject) {
		this.wtClassifyObject = wtClassifyObject;
	}

	public String getFunctionUrl() {
		return functionUrl;
	}

	public void setFunctionUrl(String functionUrl) {
		this.functionUrl = functionUrl;
	}

}
