package com.taiji.zxfy.zxyj.webwork.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedListAction;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.InfoModel;
import com.taiji.zxfy.zxyj.service.ZxyjService;
import com.taiji.zxfy.zxyj.util.ArchiveModelUtil;

/**
 * 
 * @author zy
 *
 */
public class ZxyjListAction extends ProtectedListAction {

	private static final long serialVersionUID = -2818133309120025889L;
	private static final String TABLE_NAME = "APP_ZXFY_ARCHIVE";
	private PaginationSupport list;
	private int pageSize = 100;
	@SuppressWarnings("rawtypes")
	private Map tableMap = new TreeMap();
	private String caseNum;	//申请码
	private String id;	//行政复议ID
	private int resultSize;	//list的文件数
	private String message;	//通过申请码查询返回信息
	private ZxyjService zxyjService;
	private InfoModel infoModel;
	private String appAdviceType;
	/**
	 * 通过申请码查询案件
	 * @return
	 */
	public String searchList() throws InvocationTargetException,
	IllegalAccessException, IOException {
		
		return SUCCESS;
	}
	/**
	 * 获取案卷信息
	 * @param hql
	 * @param util
	 * 
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void getList(String hql, List util)throws InvocationTargetException, IllegalAccessException,
	IOException {
		//通过hql语句查询出list
		list = coreService.find(hql, getPageNum(), pageSize);
		tableMap.put(ArchiveModel.class.getName(), util);
		getDisplayInfo().setShowMultiList(tableMap);
		this.wrapResult(getTableName(), list, ArchiveModel.class.getName());
		resultSize = list.getTotalCount();
	}
	/**
	 * 案卷列表
	 * @return
	 * 
	 */
	@SuppressWarnings("unchecked")
	public String fileList()throws InvocationTargetException,
	IllegalAccessException, IOException{
		if(caseNum.equals("")){	//未输入申请码
			message="  输入不能为空！";
			return ERROR;
		}
		else{
			String hql1 = "from InfoModel i where i.caseNum='"+caseNum+"'";
			
			//通过申请码查询对应行政复议案件
			//List<InfoModel> listInfoModel = coreService.find(hql1);
			List<InfoModel> listInfoModel = zxyjService.findByHQL(hql1);
			if (listInfoModel.size()==0) {	//查到的行政复议案件不存在
				message="  申请码不存在，请重输！";
				return ERROR;
			}else {
				if (("13").equals(listInfoModel.get(0).getStatus())) {	//查到的行政复议案件未完成申请
					message="  案件未完成申请，请申请完成后再查阅案卷！";
					return ERROR;
				}else {
					appAdviceType=listInfoModel.get(0).getAppAdviceType();
					id=listInfoModel.get(0).getId();	//获取行政复议id
					String hql2 = "from ArchiveModel a where a.xzfyId='" + id
							+ "' and a.status = 1" + " order by a.id asc";
					ActionContext.getContext().getSession().remove("hql");
					ActionContext.getContext().getSession().put("hql", hql2);
					getList(hql2, ArchiveModelUtil.getDisplay());
					infoModel = listInfoModel.get(0);
					return SUCCESS;
				}
			}
		}
	}

	/**
	 * 案卷类别前台转换为中文
	 * @param dictName
	 * @param keys
	 * @return
	 */
	public String getDictValue2(String dictName, String keys) {

		getDictMap(dictName);
		String name = "";
		int a = 0;
		try {
			a = Integer.parseInt(keys);
		} catch (Exception e) {
			
		}
		switch (a) {
		case 1: name = "申请书"; break;
		case 2: name = "收件登记材料"; break;
		case 3: name = "申请人提交的其他材料"; break;
		case 4: name = "申请人补正材料"; break;
		case 5: name = "阅卷笔录、阅卷意见及材料"; break;
		case 6: name = "被申请人答复书"; break;
		case 7: name = "被申请人证据材料"; break;
		case 8: name = "被申请人补充材料"; break;
		case 9: name = "第三人有关材料"; break;
		case 10: name = "复议机构制作获取的材料"; break;
		case 11: name = "正卷其他材料"; break;
		case 12: name = "副卷材料"; break;
		case 13: name = "结案文书"; break;
		case 14: name = "授权委托书"; break;
		case 15: name = "代理人身份证明材料"; break;
		case 16: name = "证明具体行政行为存在的材料"; break;
		case 17: name = "申请人身份证明材料"; break;
		default: name = "ERROR： 材料类别错误"; break;
		}
		return name;
	}
	@Override
	public PaginationSupport getInitResult() {
		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Class getPersistentClass() {
		return ArchiveModel.class;
	}

	@Override
	public String getTableName() {
		return TABLE_NAME;
	}

	public String getCaseNum() {
		return caseNum;
	}
	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}

	public PaginationSupport getList() {
		return list;
	}

	public void setList(PaginationSupport list) {
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getResultSize() {
		return resultSize;
	}

	public void setResultSize(int resultSize) {
		this.resultSize = resultSize;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	public ZxyjService getZxyjService() {
		return zxyjService;
	}
	public void setZxyjService(ZxyjService zxyjService) {
		this.zxyjService = zxyjService;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public InfoModel getInfoModel() {
		return infoModel;
	}
	public void setInfoModel(InfoModel infoModel) {
		this.infoModel = infoModel;
	}
	public String getAppAdviceType() {
		return appAdviceType;
	}
	public void setAppAdviceType(String appAdviceType) {
		this.appAdviceType = appAdviceType;
	}

}
