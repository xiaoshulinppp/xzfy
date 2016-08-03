package com.taiji.zxfy.zxcx.webwork.action;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedListAction;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.zxfy.zxcx.service.ZxcxService;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.InfoModel;

public class ZxcxListAction extends ProtectedListAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6613036753385470659L;

	private ZxcxService zxcxService;
	private String caseIndex;// 案件代码
	private String message;// 反馈到前台的信息
	private InfoModel infoModel;// 案件信息
	private XzfyInfo xzfyInfo;// 案件信息
	private String appName;// 申请人名称
	private String appDeputyName;// 主要代表人名称
	private String appLinkName;// 主要联系人
	private String fyjg;

	/**
	 * 跳转到案件代码登陆页面
	 * 
	 * @return
	 */
	public String search() {
		return SUCCESS;
	}

	/**
	 * 跳转到在线查询案件信息页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String zxcxByCaseIndex() {
		String hqlInfo = "from XzfyInfo i where i.jiansuom='" + caseIndex+"'";
		List<XzfyInfo> infoModels = zxcxService.findBySql(hqlInfo);
		if(infoModels!=null&&infoModels.size()>0){
			xzfyInfo = infoModels.get(0);
			return SUCCESS;
		}else{
			message = "申请码不存在！";
			return ERROR;
		}
	}

	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}

	public PaginationSupport getInitResult() {
		return null;
	}

	@SuppressWarnings("rawtypes")
	public Class getPersistentClass() {
		return null;
	}

	public String getTableName() {
		return null;
	}

	public ZxcxService getZxcxService() {
		return zxcxService;
	}

	public void setZxcxService(ZxcxService zxcxService) {
		this.zxcxService = zxcxService;
	}

	public String getCaseIndex() {
		return caseIndex;
	}

	public void setCaseIndex(String caseIndex) {
		this.caseIndex = caseIndex;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public InfoModel getInfoModel() {
		return infoModel;
	}

	public void setInfoModel(InfoModel infoModel) {
		this.infoModel = infoModel;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getAppDeputyName() {
		return appDeputyName;
	}

	public void setAppDeputyName(String appDeputyName) {
		this.appDeputyName = appDeputyName;
	}

	public String getAppLinkName() {
		return appLinkName;
	}

	public void setAppLinkName(String appLinkName) {
		this.appLinkName = appLinkName;
	}

	public String getFyjg() {
		return fyjg;
	}

	public void setFyjg(String fyjg) {
		this.fyjg = fyjg;
	}
	
}
