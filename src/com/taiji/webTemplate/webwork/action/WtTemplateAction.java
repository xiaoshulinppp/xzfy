package com.taiji.webTemplate.webwork.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import slime.util.IOStream.IOStream;
import slime.util.file.FileDelete;

import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtTemplateService;

@SuppressWarnings("unchecked")
public class WtTemplateAction extends ProtectedDetailAction {

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

	// 业务变量

	private List<WtTemplate> templateList = new ArrayList<WtTemplate>(); // 模板列表

	private WtTemplateService wtTemplateService = null; // 模板业务层方法

	private Integer templateSeq = Integer.valueOf(0); // 模板顺序

	// 公共方法

	/**
	 * 显示模板列表
	 */
	public String showTemplateList() {
		try {
			this.pageList = this.wtTemplateService.getTemplateList(super.getPageNum(), this.pageSize);
			this.templateList = this.pageList.getItems();
			this.totalPage = this.pageList.getTotalPage();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入创建新模板页面
	 */
	public String gotoCreateTemplate() {
		try {
			int biggestSeq = this.wtTemplateService.getBiggestTemplateSeq();
			this.templateSeq = biggestSeq + 1;
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 创建新模板
	 */
	public String createTemplate() {
		try {
			if (!"".equals(this.upFileFileName)) {
				String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
				String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
				String fileFlod = webRootPath + "uploadfiles/webTemplate/template/";
				File outFile = new File(fileFlod + fileName);
				this.getWtTemplate().setRealImagePath(fileFlod + fileName);
				this.getWtTemplate().setImagePath("../uploadfiles/webTemplate/template/" + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(this.upFile, outFile);
			}
			this.wtTemplateService.save(this.getWtTemplate());
			this.messageContent = "模板创建成功！";
			this.messageAction = "../webTemplate/showTemplateList.action?funcCode=" + super.getFuncCode();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 删除模板
	 */
	public String deleteTemplate() {
		try {
			if(null != this.getWtTemplate().getRealImagePath() && !"".equals(this.getWtTemplate().getRealImagePath())){
				FileDelete.deleteFile(this.getWtTemplate().getRealImagePath());
			}
			this.wtTemplateService.remove(this.getWtTemplate());
			this.messageContent = "删除模板成功！";
			this.messageAction = "../webTemplate/showTemplateList.action?funcCode=" + super.getFuncCode();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 进入修改模板页面
	 */
	public String gotoUpdateTemplate() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 修改模板
	 */
	public String updateTemplate() {
		try {
			WtTemplate wtTemplate = this.wtTemplateService.getWtTemplateById(super.getEntityId());
			if (!"".equals(this.upFileFileName)) {
				FileDelete.deleteFile(wtTemplate.getImagePath());
				String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
				String fileName = Calendar.getInstance().getTimeInMillis() + this.upFileFileName;
				String fileFlod = webRootPath + "uploadfiles/webTemplate/template/";
				File outFile = new File(fileFlod + fileName);
				this.getWtTemplate().setImagePath("../uploadfiles/webTemplate/template/" + fileName);
				IOStream stream = new IOStream();
				stream.writeFileStream(this.upFile, outFile);
			}
			this.getWtTemplate().setImagePath(wtTemplate.getImagePath());
			this.wtTemplateService.update(this.getWtTemplate());
			this.messageContent = "模板修改成功！";
			this.messageAction = "../webTemplate/showTemplateList.action?funcCode=" + super.getFuncCode();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 查看模板
	 */
	public String showTemplate() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 模板预览
	 */
	public String showTemplateImage() {
		try {
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	// 继承方法

	@Override
	public Class<WtTemplate> getPersistentClass() {
		return WtTemplate.class;
	}

	// 自定义Set和Get方法

	public WtTemplate getWtTemplate() {
		return (WtTemplate) super.getEntity();
	}

	public void setWtTemplate(WtTemplate wtTemplate) {
		super.setEntity(wtTemplate);
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

	public List<WtTemplate> getTemplateList() {
		return templateList;
	}

	public void setTemplateList(List<WtTemplate> templateList) {
		this.templateList = templateList;
	}

	public WtTemplateService getWtTemplateService() {
		return wtTemplateService;
	}

	public void setWtTemplateService(WtTemplateService wtTemplateService) {
		this.wtTemplateService = wtTemplateService;
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

	public Integer getTemplateSeq() {
		return templateSeq;
	}

	public void setTemplateSeq(Integer templateSeq) {
		this.templateSeq = templateSeq;
	}

}
