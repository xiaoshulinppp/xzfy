package com.taiji.zxfy.zxsq.webwork.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;


import com.opensymphony.webwork.ServletActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedListAction;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.Beishenqingren;
import com.taiji.zxfy.zxsq.domain.InfoModel;
import com.taiji.zxfy.zxsq.service.IZxsqService;
import common.Logger;

public class ZxsqListAction extends ProtectedListAction{
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(InfoModel.class);
	private static final String TABLE_NAME = "APP_ZXFY_INFO";
	
	private IZxsqService zxsqService;
	
	private int origin = 1; // 标识 申请过程状态 // 只提供get()   不提供set() // 0:新的申请   1:申请人列表  2:代理人
	private InfoModel infoModel; // 案件对象
	private String infoId; // 案件ID
	private AppModel app; // 申请人
	private Set appS; // 案件对应的 申请人
	private int queryType = 1; // 查询的类型  0:  1:申请人  2:代理人
	private int renCount = 0; // 人数
	private List dbrOrDlr;
	private String fyjg;
	private ArchiveModel archive;
	private List archiveList;
	private String tuJing;
	private List otherList;
	private String appAddOrUpdate = "0"; // 0 : add     1 : update
	private String caseNum;
	private String actionName;
	private int clSize;
	private String otherValue = "0";
	private String caseIndex = "0";
	
	private List<Beishenqingren> zlList = new ArrayList<Beishenqingren>();
	private List<Beishenqingren> bList = new ArrayList<Beishenqingren>();

	
	private boolean checkSq(String infoId, int jinDu)
	{
		List<InfoModel> infoList = coreService.find("from InfoModel t where ID = ?", (Object)infoId);
		if(infoList.isEmpty())
		{ // 先根据id 判断id是否存在
			return false;
		}
		infoModel = infoList.get(0);
		if(!"13".equals(infoModel.getStatus()))
		{ // 判断  案件状态
			return false;
		}
		if(jinDu <= Integer.parseInt(infoModel.getJinDu()))
		{ // 判断 进度
			return true;
		}
		return false;
	}
	
	public boolean checkIndex()
	{
		infoModel = zxsqService.findInfoModel(infoId);
		if(infoModel.getCaseIndex().equals(caseIndex))
		{
			return true;
		}
		this.actionName = "pageOldError";
		return false;
	}
	
	public String pageOldError()
	{
		return SUCCESS;
	}
	
	
	public String zxsq()
	{ // 在线申请 
		return SUCCESS;
	}
	
	public String sqrList()
	{ // 查询 申请人列表
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		this.findInfoModel();
		appS = infoModel.getAppModels();
		Iterator<AppModel> it = appS.iterator();
		app = new AppModel();
		for(;it.hasNext();)
		{
			app = it.next();
			if("0".equals(app.getProxyType()))
			{ // 代理人不显示
//				appS.remove(app);
				it.remove();
			}
		}
		app = new AppModel();
		renCount = appS.size();
		
		return SUCCESS;
	}
	
	public void checkSqrAppID()
	{
		String json = "error";
		otherList = coreService.find("from AppModel t where XZFY_ID = ? and APP_ID = ?", new String[]{infoId, app.getAppId()});
		
		if(otherList.isEmpty())
		{
			json = "success";
		}else if(app.getId() != null && app.getId() != 0 && otherList.size() == 1)
		{
			otherList = coreService.find("from AppModel t where ID = ? and APP_ID = ?", new String[]{app.getId().toString(), app.getAppId()});
			if(otherList != null && !otherList.isEmpty() && otherList.size() == 1)
			{
				json = "success";
			}
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public void sqrUpdate()
	{ // 修改 申请人信息时, 异步查询
		String json;
		if(!this.checkSq(infoId, 0))
		{
			json = ERROR;
		}else if(!checkIndex())
		{
			json = ERROR;
		}else
		{
			AppModel a = this.getApp(); //(AppModel) (coreService.find("from AppModel t where ID = '" + app.getId() + "'").get(0));
			this.app = zxsqService.findAppModel(a.getId());
			app.setInfoModel(null);
			json=new JSONArray().fromObject(app).toString();
			if("2".equals(app.getProxyType()))
			{
				archiveList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE ='17' and UPLOADUSERID = ? and OTHER in('4','5')", new String[]{infoId, app.getId().toString()});
				String zmcl = ",\"zmcl4\":\"" + ((ArchiveModel)archiveList.get(0)).getFileName() + "\",\"zmcl5\":\"" + ((ArchiveModel)archiveList.get(1)).getFileName() + "\"}]";
				json = json.substring(0, json.length() - 2) + zmcl;
			}
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String proceedList()
	{ // 继续申请
		
		
		// 正确  获取 进度
		
		return SUCCESS;
	}

	
	
	
	
	
//	public String sqrAdd()
//	{// 判断   添加公民还是法人
//		this.findInfoModel();
//		if("2".equals(infoModel.getAppType()))
//		{
//			return "fr";
//		}
//		
//		return "gm";
//	}
//	
//	public String sqrGmSave()
//	{
//		app = new AppModel();
//		return SUCCESS;
//	}
//	
//	public String sqrFrSave()
//	{
//		app = new AppModel();
//		return SUCCESS;
//	}
	
	
	
	public String sqrNext()
	{// 判断   申请人个数, 添加代表人

		if(!checkIndex())
		{
			return "pageOldError";
		}
		// 如果超过五人, 则跳转到  代表人选择页面
		this.sqrList();
		if(renCount > 5)
		{
			this.actionName = "SqrDbrSave";
		}else
		{
			this.actionName = "dlrSave";
		}
		
		return SUCCESS;
	}
	
	// 跳转  代理人
	public String dlrSave()
	{
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		List list = coreService.find("from AppModel t where PROXYTYPE = '0' and XZFY_ID = '" + infoId + "'");
		if(list != null && list.size() == 1)
		{
			app = (AppModel) list.get(0);
		}
		else
		{
			app = new AppModel();
		}
		
		return SUCCESS;
	}
	
	// 跳转 主要联系人
	public String zylxrSave()
	{
		if(!this.checkSq(infoId, 2))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		// 查询 出 代表人 和 代理人  从中间选择 主要联系人  或法人
		dbrOrDlr = coreService.find("from AppModel t where XZFY_ID = '" + infoId + "' and (ISDEPUTY='1' or PROXYTYPE='0')");
		return SUCCESS;
	}
	
	// 跳转到 被申请人
	public String bsqrSave()
	{
		if(!this.checkSq(infoId, 3))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		this.findInfoModel();
		String localBm = infoModel.getCaseOrg();  //infoModel.getXzfyOrg();
		//设置被申请人种类与被申请人名称
		//北京市法制办
		if(localBm.equals("0000")){
			//被申请人种类
			for (int i=0;i<3;i++){
				Beishenqingren b = new Beishenqingren();
				if(i==0){
					b.setName("区县政府");
					b.setValue("5");
				} else if(i==1){
					b.setName("省级政府部门");
					b.setValue("7");
				} else if(i==2){
					b.setName("省级行政机关");
					b.setValue("6");
//				} else if(i==3){
//					b.setName("其他");
//					b.setValue("8");
				}
				zlList.add(b);
			}
			//被申请人名称
			bList = zxsqService.getBsqrName("5", localBm,bList);
			bList = zxsqService.getBsqrName("7", localBm,bList);
			bList = zxsqService.getBsqrName("6", localBm,bList);
		}
		
		//区县政府
		int lb = Integer.parseInt(localBm.substring(0, 2));
		if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb<19 && lb!=0){
			//被申请人种类
			for (int i=0;i<3;i++){
				Beishenqingren b = new Beishenqingren();
				if(i==0){
					b.setName("区县政府部门");
					b.setValue("4");
				} else if(i==1){
					b.setName("区县政府部门派出机构");
					b.setValue("9");
				} else if(i==2){
					b.setName("乡镇街道");
					b.setValue("3");
//				} else if(i==3){
//					b.setName("其他");
//					b.setValue("8");
				}
				zlList.add(b);
			}
			//被申请人名称
			bList = zxsqService.getBsqrName("4", localBm,bList);
			bList = zxsqService.getBsqrName("3", localBm,bList);
			bList = zxsqService.getBsqrName("9", localBm,bList);
		}
		//区县政府部门
		if(localBm.length()==4 && !"00".equals(localBm.substring(2, 4))){
			//被申请人种类
//			for (int i=0;i<2;i++){
				Beishenqingren b = new Beishenqingren();
//				if(i==0){
					b.setName("区县政府部门派出机构");
					b.setValue("9");
//				} else if(i==1){
//					b.setName("其他");
//					b.setValue("8");
//				}
				zlList.add(b);
//			}
			//被申请人名称
			bList = zxsqService.getBsqrName("9", localBm,bList);
		}
		//省部级政府部门
		if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb>18){
			//被申请人种类
//			for (int i=0;i<2;i++){
				Beishenqingren b = new Beishenqingren();
//				if(i==0){
					b.setName("区县政府部门");
					b.setValue("4");
//				} else if(i==1){
//					b.setName("其他");
//					b.setValue("8");
//				}
				zlList.add(b);
//			}
			//被申请人名称
			bList = zxsqService.getBsqrName("4", localBm,bList);
		}
		return SUCCESS;
	}
	
	public String isNotXzzwSave()
	{ // 跳转  选择行政是否作为
		if(!this.checkSq(infoId, 4))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		this.findInfoModel();
		
		
		return SUCCESS;
	}
	
	public String xzzwSave()
	{
		if(!this.checkSq(infoId, 5))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		this.findInfoModel();
		// ++ 把 知道方式   截取出来, 再次回到这个页面   默认显示出已经填写的知道方式
		String str = this.infoModel.getRequireFy();
		if(str != null && !"".equals(str))
		{
			int i = str.lastIndexOf('（');
			this.tuJing =str.substring(i + 1, str.length()-2);
		}
		return SUCCESS;
	}
	
	public String xzbzwSave()
	{
		if(!this.checkSq(infoId, 5))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		this.findInfoModel();
		// +++ 需要显示 已经填写的内容
		
		String str = this.infoModel.getRequireFy();
		if(str != null && !"".equals(str))
		{
			int i = str.lastIndexOf('（');
			this.tuJing =str.substring(i + 1, str.length()-2);
		}
		
		return SUCCESS;
	}
	
	// 跳转 事实理由
	public String sslySave()
	{
		if(!this.checkSq(infoId, 6))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		this.findInfoModel();
		
		return SUCCESS;
	}
	
	// 事实理由上一步
	public String sslyBefore()
	{
		if(!"13".equals(this.findSturts()))
		{
			return ERROR;
		}
		if(zxsqService.isNotXzzw(infoId))
		{
			this.actionName = "xzzwSave";
		}else{
			this.actionName = "xzbzwSave";
		}
		
		return SUCCESS;
	}
	
	// 申请人身份证明
	public String sqrSfzmSave()
	{
		if(!this.checkSq(infoId, 7))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		sqrList();
		// 查询材料表
		archiveList = coreService.find("from ArchiveModel t where XZFYID = '" + infoId + "' and TYPE ='17' and OTHER in('1','2','3')");
		
		return SUCCESS;
	}
	//
	public void checkSfzmNum()
	{
		String json = "error";
		// 申请人的 sfzm_type 不为空  表示   有上传材料
		otherList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE = '17' and UPLOADUSERID = ?", new String[]{infoId, app.getId().toString()});
		
		if(otherList == null || otherList.isEmpty() || otherList.size() < 2)
		{
			json = "success";
		}
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 申请人身份证明下一步  校验
	public void checkSqrSfzmNext()
	{
		
		String json = "error";
		// 申请人的 sfzm_type 不为空  表示   有上传材料
		otherList = coreService.find("from AppModel t where XZFY_ID = ? and PROXYTYPE != '0' and (SFZM_TYPE is null or SFZM_TYPE = '')", infoId);
		if(otherList.isEmpty())
		{
			json = "success";
		}
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 跳转   代理人 委托手续证明
	public String dlsxSave()
	{
		if(!this.checkSq(infoId, 8))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		//
		archiveList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE in('14','15')", (Object)infoId);
		return SUCCESS;
	}
	
	// 代理手续下一步校验
	public void checkDlsxNext()
	{
		String json = "error";
		// 申请人的 sfzm_type 不为空  表示   有上传材料
		otherList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE = '14'", infoId);
		if(!otherList.isEmpty())
		{
			otherList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE = '15'", infoId);
			if(!otherList.isEmpty())
			{
				json = "success";
				InfoModel infoModel = zxsqService.findInfoModel(infoId);
				infoModel.setJinDu("9");
				zxsqService.update(infoModel);
				zxsqService.evict(infoModel);
			}
		}
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 行政不做为材料 下一步校验
	public void checkXzbzwClNext()
	{
		String json = "error";
		// 申请人的 sfzm_type 不为空  表示   有上传材料
		otherList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE = '18'", infoId);
		if(!otherList.isEmpty())
		{
			otherList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE = '19'", infoId);
			if(!otherList.isEmpty())
			{
				json = "success";
				InfoModel infoModel = zxsqService.findInfoModel(infoId);
				infoModel.setJinDu("10");
				zxsqService.update(infoModel);
				zxsqService.evict(infoModel);
			}
		}
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 行政作为下一步校验
	public void checkXzzwClNext()
	{
		String json = "error";
		// 申请人的 sfzm_type 不为空  表示   有上传材料
		otherList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE ='16'", infoId);
		if(!otherList.isEmpty())
		{
			json = "success";
			InfoModel infoModel = zxsqService.findInfoModel(infoId);
			infoModel.setJinDu("10");
			zxsqService.update(infoModel);
			zxsqService.evict(infoModel);
		}
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 跳转  作为案件材料添加
	public String xzzwClSave()
	{
		if(!this.checkSq(infoId, 9))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		
		archiveList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE ='16'", infoId);
		
		return SUCCESS;
	}
	
	// 跳转   不作为案件材料添加
	public String xzbzwClSave()
	{
		if(!this.checkSq(infoId, 9))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		
		archiveList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE in('18','19')", infoId);
		return SUCCESS;
	}
	
	public String ajclBefore()
	{
		if(zxsqService.isNotDlr(infoId))
		{
			this.actionName = "dlsxSave";
		}else{
			this.actionName = "sqrSfzmSave";
		}
		
		return SUCCESS;
	}
	
	public String otherSave()
	{
		if(!this.checkSq(infoId, 10))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		
//		List<ArchiveModel> listClName = coreService.find("from ArchiveModel t where t.xzfyId = '" + infoId + "' and t.type = '3'");
		
		List<ArchiveModel> listClName = coreService.find("from ArchiveModel t where t.xzfyId = '" + infoId + "' and t.type = '3' group by t.clName, t.other");
		List list = null;
		archiveList = new ArrayList();
		if(!listClName.isEmpty())
		{
//			this.clSize = listClName.size();
			this.clSize = 0;
			for(int i = 0; i < listClName.size(); i++)
			{
//				System.out.println(listClName.get(i).getClName() + "......" + listClName.get(i).getOther());
				
				list = coreService.find("from ArchiveModel t where XZFYID = '" + infoId + "' and TYPE = '3' and CLNAME = '" + listClName.get(i).getClName() + "' and other = '" + listClName.get(i).getOther() + "'");
				archiveList.add(list);
				this.clSize += list.size();
			}
			System.out.println("clSize...." + clSize);
		}
		
	//	otherList = coreService.find("from ArchiveModel t where XZFYID = '" + infoId + "' and TYPE ='3'");
		
		return SUCCESS;
	}
	
	// 
	public String ajView()
	{
//		if(!"13".equals(this.findSturts()))
//		{
//			return ERROR;
//		}

//		this.sqrList();
		
		this.findInfoModel();
		appS = infoModel.getAppModels();
		Iterator<AppModel> it = appS.iterator();
		app = new AppModel();
		for(;it.hasNext();)
		{
			app = it.next();
			if("0".equals(app.getProxyType()))
			{ // 代理人不显示
//				appS.remove(app);
				it.remove();
			}
		}
		
		this.zylxrSave(); // 获取  到 代表人
		return SUCCESS;
	}

	private String findSturts()
	{// 获取案件状态, 判断是否 可以填写申请信息
		this.findInfoModel();
		return infoModel.getStatus();
	}
	
	private void findInfoModel()
	{
		infoId = this.getInfoId();
		this.infoModel = zxsqService.findInfoModel(infoId);
	}
	
	
	
	
	
	
	

	public InfoModel getInfoModel() {
		return infoModel;
	}

	public void setInfoModel(InfoModel infoModel) {
		this.infoModel = infoModel;
	}

	public String getInfoId() {
		return infoId;
	}

	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}

	public AppModel getApp() {
		return app;
	}

	public void setApp(AppModel app) {
		this.app = app;
	}

	public int getQueryType() {
		return queryType;
	}

	public void setQueryType(int queryType) {
		this.queryType = queryType;
	}

	public int getRenCount() {
		return renCount;
	}

	public void setRenCount(int renCount) {
		this.renCount = renCount;
	}
	
	public Set getAppS() {
		return appS;
	}

	public void setAppS(Set appS) {
		this.appS = appS;
	}

	public List getDbrOrDlr() {
		return dbrOrDlr;
	}

	public void setDbrOrDlr(List dbrOrDlr) {
		this.dbrOrDlr = dbrOrDlr;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getOrigin() {
		return origin;
	}
	
	public String getFyjg() {
		return fyjg;
	}
	public void setFyjg(String fyjg) {
		this.fyjg = fyjg;
	}
	
	public ArchiveModel getArchive() {
		return archive;
	}
	public void setArchive(ArchiveModel archive) {
		this.archive = archive;
	}
	
	public List getArchiveList() {
		return archiveList;
	}

	public void setArchiveList(List archiveList) {
		this.archiveList = archiveList;
	}

	public List getOtherList() {
		return otherList;
	}

	public void setOtherList(List otherList) {
		this.otherList = otherList;
	}

	@Override
	public PaginationSupport getInitResult() {
		return null;
	}

	@Override
	public Class getPersistentClass() {
		return AppModel.class;
	}

	@Override
	public String getTableName() {
		return TABLE_NAME;
	}

	public static Logger getLogger() {
		return logger;
	}

	public static void setLogger(Logger logger) {
		ZxsqListAction.logger = logger;
	}
	

	public String getTuJing() {
		return tuJing;
	}
	public void setTuJing(String tuJing) {
		this.tuJing = tuJing;
	}

	public IZxsqService getZxsqService() {
		return zxsqService;
	}
	public void setZxsqService(IZxsqService zxsqService) {
		this.zxsqService = zxsqService;
	}

	public List<Beishenqingren> getZlList() {
		return zlList;
	}

	public void setZlList(List<Beishenqingren> zlList) {
		this.zlList = zlList;
	}

	public List<Beishenqingren> getbList() {
		return bList;
	}

	public void setbList(List<Beishenqingren> bList) {
		this.bList = bList;
	}

	public String getAppAddOrUpdate() {
		return appAddOrUpdate;
	}

	public void setAppAddOrUpdate(String appAddOrUpdate) {
		this.appAddOrUpdate = appAddOrUpdate;
	}

	public String getCaseNum() {
		return caseNum;
	}

	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}

	public String getActionName() {
		return actionName;
	}

	public int getClSize() {
		return clSize;
	}

	public String getOtherValue() {
		return otherValue;
	}

	public void setOtherValue(String otherValue) {
		this.otherValue = otherValue;
	}

	public String getCaseIndex() {
		return caseIndex;
	}

	public void setCaseIndex(String caseIndex) {
		this.caseIndex = caseIndex;
	}
	
	
	
}
