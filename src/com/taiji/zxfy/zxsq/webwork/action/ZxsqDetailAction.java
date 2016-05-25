package com.taiji.zxfy.zxsq.webwork.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.junit.Test;


import com.opensymphony.webwork.ServletActionContext;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.InfoModel;
import com.taiji.zxfy.zxsq.service.IZxsqService;
import com.taiji.zxfy.zxsq.service.impl.ZxsqServiceImpl;
import com.taiji.zxfy.zxsq.utils.HttpSend;

public class ZxsqDetailAction extends ProtectedDetailAction{

	private static final long serialVersionUID = 1L;
	private InfoModel infoModel;
	private AppModel app;
	private String infoId;
	private IZxsqService zxsqService;
	private ArchiveModel archive;
	private File[] caiLiao;
	private String[] caiLiaoFileName;
	private String sqrID;
	private String clID;
	private String clType;
	private String[] xzbzwClName;
	private String[] dbrArr;
	private String fyjg;
	private String uploadUserId;
	private String tuJing = "0";
	private String otherValue = "0";
	private String clName;
	private String clNum;
	private String actionName = "";
	private String caseIndex = "0";// 防止重复登录
	private InputStream docStream;
	private String contentDisposition;
	private String downloadName;
	private String sqm;
	
	public boolean checkIndex()
	{
		InfoModel infoTable = zxsqService.findInfoModel(infoId);
		if(infoTable.getCaseIndex().equals(caseIndex))
		{
			return true;
		}
		this.actionName = "pageOldError";
		return false;
	}
	
	public boolean checkSq(String infoId, int jinDu)
	{ // 判断案件
		List<InfoModel> infoList = coreService.find("from InfoModel t where ID = ?", (Object)infoId);
		if(infoList == null || infoList.isEmpty() || infoList.size() != 1)
		{ // 先根据id 判断id是否存在
			return false;
		}
		InfoModel infoTable = infoList.get(0);
		if(!"13".equals(infoTable.getStatus()))
		{ // 判断案件状态
			return false;
		}
		if(jinDu <= Integer.parseInt(infoTable.getJinDu()))
		{// 判断案件进度
			return true;
		}
		
		return false;
	}
	
	
	
	public String newsq()
	{// 新的申请, 创建案件
		Date date = new Date();
		infoModel = new InfoModel();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(date);
		Random random = new Random();
		infoId = currentTime + random.nextInt(1000);
		// 新建案件, 设置默认值
		infoModel.setId(infoId);
		currentTime = new SimpleDateFormat("yyyy-MM-dd").format(date);
		infoModel.setReceiveDate(currentTime); // 申请时间
		infoModel.setReceiveRealDate(currentTime); // 录入时间
		// 是否涉及安全    字段没有, xzfy 可以添加
		infoModel.setAppType("1"); // 申请人类别(1：公民 2：法人)  默认 公民申请
		infoModel.setBreakRight("北京市人民政府"); // 暂定
		infoModel.setXzfyOrg("省部级行政复议机关"); // 暂定
		infoModel.setStatus("13"); // 案件状态   (填写中)
		infoModel.setCheckStatus("0"); // 审批状态
		infoModel.setCaseNum(new SimpleDateFormat("yyMMddHHmmssSSS").format(date) + new Random().nextInt(1000)); // 案件申请码
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		infoModel.setCaseOrg(fyjg); // 案件受理单位
		infoModel.setReceiveType("4"); // 设置案件申请方式        4:在线
		infoModel.setIsBuZheng("0"); // 是否补正
		infoModel.setJinDu("0"); // 在线申请进度
		infoModel.setFlag("0");//同步意见证据标识
		coreService.save(infoModel); // 新建案件
		this.actionName = "gotoGmSave";
		this.infoId = infoModel.getId();
		this.caseIndex = infoModel.getCaseIndex();
		
		return SUCCESS;
	}
	
	public String gotoGmSave()
	{ // 切换为 公民申请
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		infoId = this.getInfoId();
		zxsqService.gotoGmSave(infoId);
		this.actionName = "sqrList";
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		this.caseIndex = infoModel.getCaseIndex();
		return SUCCESS;
	}
	
	public String gotoFrSave()
	{ // 切换为 法人申请
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		infoId = this.getInfoId();
		zxsqService.gotoFrSave(infoId);
		this.actionName = "sqrList";
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		this.caseIndex = infoModel.getCaseIndex();
		return SUCCESS;
	}
	
	public String runSqrSave()
	{ // 保存 申请人信息
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("0");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		coreService.update(infoModel);
		coreService.evict(infoModel);
		app = this.getApp();
		String str = zxsqService.saveSqr(infoId, app , caiLiao, caiLiaoFileName);
		this.actionName = "sqrList";
		return SUCCESS;
	}
	
	public String runSqrUpdate()
	{
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("0");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		coreService.update(infoModel);
		coreService.evict(infoModel);
		app = this.getApp();
		app.setId(Integer.parseInt(sqrID));
		String str = zxsqService.updateSqr(app);
		this.actionName = "sqrList";
		return str;
	}
	
	
	public String runSqrDel()
	{// 删除申请人
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		
		
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("0");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		coreService.update(infoModel);
		coreService.evict(infoModel);
		app = this.getApp();
		// ... 删除申请人 时   应该删除相关资料
		zxsqService.deleteSqr(infoId, app.getId());
		coreService.remove(app);
		
		this.actionName = "sqrList";
		return SUCCESS;
	}
	
	
	
	
	// 添加代表人
	public String runSqrDbrSave()
	{
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		if(dbrArr.length > 5)
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("0");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		coreService.update(infoModel);
		coreService.evict(infoModel);
		zxsqService.saveDbr(infoId, dbrArr);
		
		this.actionName = "dlrSave";
		return SUCCESS;
	}
	
	
	
	// 添加 代理人
	public String runDlrSave()
	{
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		app = this.getApp();

		// 给 info 表赋默认值    // 可以把 这段放到service中
		infoId = this.getInfoId();
		infoModel = zxsqService.findInfoModel(infoId);
		Set<AppModel> appS = infoModel.getAppModels();
		Iterator<AppModel> it = appS.iterator();
		AppModel a = new AppModel();
		for(;it.hasNext();)
		{
			a = it.next();
			if("0".equals(a.getProxyType()))
			{
				it.remove();
			}
		}
		infoModel.setRenCount(appS.size() + "");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		infoModel.setJinDu("2");
		this.caseIndex = infoModel.getCaseIndex();
		String appDetail = "";
		String appShow = "";
		
		
		it = appS.iterator();
		for(;it.hasNext();)
		{
			a = it.next();
			if("1".equals(a.getSexy()))
			{
				appDetail += a.getAppName() + "，男，";
			}
			else
			{
				appDetail += a.getAppName() + "，女，";
			}
			
//				申请人0，男，身份证号36042819999999999，送达地址送达地址0，邮编000000，电话5398077；申请人1，男，身份证号360428198888888888，送达地址送达地址1，邮编11111111，电话5391077；
			
			appDetail += "身份证号" + a.getAppId() + "，送达地址" + a.getMailAddress();
			//+ "，邮编" + app.getPostCode() + "，电话" + app.getTelephone() + "；";
			if(a.getPostCode() != null && "".equals(a.getPostCode()))
			{
				appDetail += "，邮编" + a.getPostCode();
			}
			appDetail += "，电话" + a.getTelephone() + "；";
			
			
			appShow += a.getAppName() + ",";
			
		}
		
		appShow = appShow.substring(0, appShow.length()-1);
		
		if("1".equals(infoModel.getAppType()))
		{
			infoModel.setAppDetail(appDetail);
		}
		infoModel.setAppShow(appShow);
		
		coreService.update(infoModel);
//		coreService.evict(infoModel);
		if(app != null && app.getAppName() != null && !"".equals(app.getAppName()) && app.getTelephone() != null && !"".equals(app.getTelephone()))
		{
			zxsqService.saveDlr(infoId, app);
		}
		else
		{
			zxsqService.deleteDlr(infoId);
		}
		
		this.actionName = "zylxrSave";
		return SUCCESS;
	}
	
	public void sendSqm()
	{
		app = this.getApp();
		infoId = this.getInfoId();
		String json = ERROR;
		if(app == null || app.getId() == null || "".equals(app.getId()) )
		{
			json = ERROR;
		}else{
			String sqm = zxsqService.findInfoModel(infoId).getCaseNum();
			System.out.println(">>>..." + sqm);
			app = zxsqService.findAppModel(app.getId());
			// ... 这里发送申请码
			zxsqService.saveZylxr(infoId, app.getId());
			try
			{
				String strSmsUrl = "http://www.stongnet.com/sdkhttp/sendsms.aspx";
				
				
				String strReg = ""; // 账号
				String strPwd = ""; // 密码
				String strSourceAdd = "";
				String strPhone = app.getTelephone(); // 手机号码，多个手机号用半角逗号分开，最多1000个
				String strContent = HttpSend.paraTo16("您好，您的申请代码是" + sqm + "，请您于3日内完成案件信息填写。逾期系统将不再保留，如您想申请行政复议，需要重新填写。");
				
				String strSmsParam = "reg=" + strReg + "&pwd=" + strPwd + "&sourceadd=" + strSourceAdd + "&phone=" + strPhone + "&content=" + strContent;
				String strRes = HttpSend.postSend(strSmsUrl, strSmsParam);
				
				System.out.println("短信接口 返回的值..." + strRes);
				
				if (strRes.contains("result=0")) {
					json = SUCCESS;
				} else {
					json = ERROR;
				}
			}
			catch(Exception e)
			{
				json = ERROR;
				e.printStackTrace();
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
	
	public void checkSqm()
	{ // 异步校验 案件申请码
		String json = "error";
		infoModel = zxsqService.findInfoModel(infoId);
		if(infoModel.getCaseNum().equals(otherValue))
		{
			json = "success";
			zxsqService.saveZylxr(infoId, app.getId());
			InfoModel infoModel = zxsqService.findInfoModel(infoId);
			infoModel.setJinDu("3");
			coreService.update(infoModel);
			coreService.evict(infoModel);
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
	
	
	
	
	public String runBsqrSave()
	{ // 保存   被申请人
		if(!this.checkSq(infoId, 0))
		{
			return ERROR;
		}
		infoModel = this.getInfoModel();
		
		
		zxsqService.saveBsqr(infoId, infoModel);
		
		this.actionName = "isNotXzzwSave";
		return SUCCESS;
	}
	
	
	public String runIsNotXzzwSave()
	{ //  是否作为
		if(!this.checkSq(infoId, 4))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		infoModel = this.getInfoModel();
		
		zxsqService.saveIsNotZw(infoId, infoModel);
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		this.caseIndex = infoModel.getCaseIndex();
		
		if("0".equals(infoModel.getIsManage()))
		{
			this.actionName = "xzzwSave";
		}
		else if("2".equals(infoModel.getIsManage()))
		{
			this.actionName = "xzbzwSave";
		}
		else{
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	public String runXzzwSave()
	{ // 如果是作为案件, 保存的作为案件信息
		if(!this.checkSq(infoId, 5))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		infoModel = this.getInfoModel();
		String str = infoModel.getXwName() + "（" + infoModel.getXwNum() + "）；知道时间：" + infoModel.getExecuteDate() + "（" + tuJing + "）；";
		infoModel.setRequireFy(str);
		infoModel.setBuzhengFrom(infoModel.getExecuteDate() + "（" + tuJing + "）");
		
		zxsqService.saveXzzw(infoId, infoModel);
		
		this.actionName = "sslySave";
		return SUCCESS;
	}

	
	public String runXzbzwSave()
	{ // 保存不作为案件
		if(!this.checkSq(infoId, 5))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		infoModel = this.getInfoModel();
		zxsqService.saveXzbzw(infoId, infoModel);
		
		this.actionName = "sslySave";
		return SUCCESS;
	}
	
	
	public String runSslySave()
	{ // 保存  事实理由
		if(!this.checkSq(infoId, 6))
		{
			return ERROR;
		}
		infoModel = this.getInfoModel();
		if(infoModel.getAppAdviceDetail().length() > 5000)
		{// 超过了字数
			return ERROR;
		}
		zxsqService.saveSsly(infoId, infoModel);
		
		this.actionName = "sqrSfzmSave";
		return SUCCESS;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	private long getDays(String now,String deadline) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date d1 = (Date) format.parse(now);
            Date d2 = (Date) format.parse(deadline);
            long day = d2.getTime() - d1.getTime();
            return day / 1000 / 60 / 60 / 24;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
	
	
	
	public String proceedSq()
	{
		// 先判断  申请码  是否存在
		List<InfoModel> list = coreService.find("from InfoModel t where caseNum = ?", sqm);
		if(list == null || list.isEmpty() || list.size() != 1)
		{
			otherValue = "1";
			return "sqmError";
		}
		// 判断  案件状态
		infoModel = list.get(0);
		if(!"13".equals(infoModel.getStatus()))
		{
			otherValue = "2";
			return "sqmError";
		}
		
		// 比较   案件时间   判断是否过期
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String toDay = df.format(new Date());
		long day = this.getDays(infoModel.getReceiveRealDate(), toDay);
		System.out.println(day);
		if(day < 0 || day > 3)
		{
			otherValue = "3";
			return "sqmError";
		}
		
		
		// 判断案件进度
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		this.infoId = infoModel.getId();
		coreService.update(infoModel);
		if("0".equals(infoModel.getJinDu()))
		{
			actionName = "sqrList";
		}else if("1".equals(infoModel.getJinDu()))
		{
			actionName = "dlrSave";
		}else if("2".equals(infoModel.getJinDu()))
		{
			actionName = "zylxrSave";
		}else if("3".equals(infoModel.getJinDu()))
		{
			actionName = "bsqrSave";
		}else if("4".equals(infoModel.getJinDu()))
		{
			actionName = "isNotXzzwSave";
		}else if("5".equals(infoModel.getJinDu()))
		{
			actionName = "sslyBefore";
		}else if("6".equals(infoModel.getJinDu()))
		{
			actionName = "sslySave";
		}else if("7".equals(infoModel.getJinDu()))
		{
			actionName = "sqrSfzmSave";
		}else if("8".equals(infoModel.getJinDu()))
		{
			actionName = "sqrSfzmNext";
		}else if("9".equals(infoModel.getJinDu()))
		{
			actionName = "runDlsxNext";
		}else if("10".equals(infoModel.getJinDu()))
		{
			actionName = "otherSave";
		}else
		{
			otherValue = "4";
			this.caseIndex = "0000000000000";
			this.infoId = "0000000000";
			return "sqmError";
		}
		
		return SUCCESS;
	}
	
	
	

	
	
	
	
	
	
	
	
	
	

	

	
	
	
	
	
	
	
	
	public String runUploadSqrSfzmSave()
	{
		this.actionName = "sqrSfzmSave";
		if(!this.checkSq(infoId, 7))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		if(caiLiao[0].length() / 1024 > 300)
		{
			this.otherValue = "1";
			return SUCCESS;
		}
		
		// ... 暂未支持
		try {
			zxsqService.saveSqrSfzm(clType, infoId, sqrID, caiLiao[0], caiLiaoFileName[0]);
		} catch (IOException e) {
			System.out.println("请重新上传文件...");
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		this.caseIndex = infoModel.getCaseIndex();
		return SUCCESS;
	}
	
	public String runSqrSfzmDelAll()
	{
		if(!this.checkSq(infoId, 7))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("7");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		coreService.update(infoModel);
		coreService.evict(infoModel);
		
		sqrID = this.sqrID;
		zxsqService.deleteSqrSfzmAll(sqrID);
		
		this.actionName = "sqrSfzmSave";
		return SUCCESS;
	}
	
	public String runSqrSfzmDel()
	{
		if(!this.checkSq(infoId, 7))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("7");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		coreService.update(infoModel);
		coreService.evict(infoModel);
		
		zxsqService.deleteSqrSfzm(this.sqrID, this.clID);
		
		this.actionName = "sqrSfzmSave";
		return SUCCESS;
	}
	
	public String sqrSfzmNext()
	{
		
		if(zxsqService.isNotDlr(infoId))
		{
			this.actionName = "dlsxSave";
		}else if(zxsqService.isNotXzzw(infoId))
		{
			this.actionName = "xzzwClSave";
		}else
		{
			this.actionName = "xzbzwClSave";
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		if("dlsxSave".equals(actionName))
		{
			infoModel.setJinDu("8");
		}else
		{
			infoModel.setJinDu("9");
		}
		coreService.update(infoModel);
		coreService.evict(infoModel);
		
		return SUCCESS;
	}
	
	public String runDlsxSave()
	{
		this.actionName = "dlsxSave";
		if(!this.checkSq(infoId, 8))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		if(caiLiao[0].length() / 1024 > 300)
		{
			this.otherValue = "1";
			return SUCCESS;
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("8");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		try {
			zxsqService.saveDlsx(clType, infoId, caiLiao[0], caiLiaoFileName[0]);
		} catch (IOException e) {
			System.out.println("请重新上传文件...");
		}
		
		
		return SUCCESS;
	}
	
	public String runDlsxDel()
	{
		if(!this.checkSq(infoId, 8))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("8");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		clID = this.getClID();
		zxsqService.deleteFile(clID);
		
		this.actionName = "dlsxSave";
		return SUCCESS;
	}
	
	// 保存  代理手续证明材料
	public String runDlsxNext()
	{
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("9");
		coreService.update(infoModel);
		coreService.evict(infoModel);
		if(zxsqService.isNotXzzw(infoId))
		{
			this.actionName = "xzzwClSave";
		}else
		{
			this.actionName = "xzbzwClSave";
		}
		
		return SUCCESS;
	}
	
	//  添加   作为案件材料
	public String runXzzwClSave()
	{
		this.actionName = "otherSave";
		if(!this.checkSq(infoId, 9))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		if(caiLiao[0].length() / 1024 > 300)
		{
			this.otherValue = "1";
			return SUCCESS;
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("9");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		// ++
		try {
			zxsqService.saveXzzwCl(infoId, clName, clNum, caiLiao[0], caiLiaoFileName[0]);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("文件上传失败, 请重新上传...");
		}
		
		return SUCCESS;
	}
	
	public String runUploadXzzwClSave()
	{
		this.actionName = "xzzwClSave";
		if(!this.checkSq(infoId, 9))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		if(caiLiao[0].length() / 1024 > 300)
		{
			this.otherValue = "1";
			return SUCCESS;
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("9");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		try {
			zxsqService.saveXzzwCl(infoId, clName, clNum, caiLiao[0], caiLiaoFileName[0]);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("文件上传失败, 请重新上传...");
		}
		
		return SUCCESS;
	}
	
	public String runXzzwClDel()
	{
		if(!this.checkSq(infoId, 9))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		clID = this.getClID();
		
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("9");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		
		zxsqService.deleteFile(clID);
		
		this.actionName = "xzzwClSave";
		return SUCCESS;
	}
	
	public String runXzbzwClSave()
	{
		this.actionName = "xzbzwClSave";
		if(!this.checkSq(infoId, 9))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		if(caiLiao[0].length() / 1024 > 300)
		{
			this.otherValue = "1";
			return SUCCESS;
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("9");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		// ++
		try {
			zxsqService.saveXzbzwCl(infoId, xzbzwClName[0], clType, caiLiao[0], caiLiaoFileName[0]);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("文件上传失败, 请重新上传...");
		}
		
		return SUCCESS;
	}
	
	public String xzbzwClDel()
	{
		if(!this.checkSq(infoId, 9))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("9");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		clID = this.getClID();
		zxsqService.deleteFile(clID);
		return SUCCESS;
	}
	
	public String xzbzwClAllDel()
	{
		if(!this.checkSq(infoId, 9))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("9");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		zxsqService.deleteXzbzwClAll(infoId, clType);
		
		this.actionName = "xzbzwClSave";
		return SUCCESS;
	}
	
	public String runOtherSave()
	{
		this.actionName = "otherSave";
		if(!this.checkSq(infoId, 10))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		if(caiLiao[0].length() / 1024 > 300)
		{
			this.otherValue = "1";
			return SUCCESS;
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("10");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		try {
			zxsqService.saveOther(infoId, clName, clNum, caiLiao[0], caiLiaoFileName[0]);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("文件上传失败, 请重新上传...");
		}
		
		return SUCCESS;
	}
	
	public String runQtclDel()
	{
		if(!this.checkSq(infoId, 10))
		{
			return ERROR;
		}
		if(!checkIndex())
		{
			return "pageOldError";
		}
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("10");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		clID = this.getClID();
		zxsqService.deleteFile(clID);
		
		this.actionName = "otherSave";
		return SUCCESS;
	}
	
	public String tiJiaoShenQing()
	{
		InfoModel infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setJinDu("-1");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.caseIndex = infoModel.getCaseIndex();
		zxsqService.update(infoModel);
		zxsqService.evict(infoModel);
		infoId = this.getInfoId();
		infoModel = zxsqService.findInfoModel(infoId);
		infoModel.setStatus("0");
		
		infoModel.setBuzhengTo(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		
		coreService.update(infoModel);
		
		zxsqService.createPdf(infoId);
		
		this.actionName = "ajView";
		return SUCCESS;
	}
	
	public String downloadSqsAndQrd() throws Exception {
		String[] strArr = {infoId, this.otherValue};
		List<ArchiveModel> fileList = coreService.find("from ArchiveModel t where XZFYID = ? and TYPE = ?", strArr);
		if(fileList.isEmpty() || fileList.size() < 1)
		{
			return ERROR;
		}
		ArchiveModel appFile = (ArchiveModel) this.coreService
				.loadEntityObjectById(ArchiveModel.class, fileList.get(0).getId());
		contentDisposition = "filename="
				+ new String(appFile.getFileName().getBytes(), "ISO-8859-1");
		downloadName = appFile.getFileAnotherName();
		String pathAndFile = ApplicationPath.getRootPath().replace("\\",
				File.separator)
				+ appFile.getFileRelativePath() // 相对路径.getFile_path()
				+ File.separator
				+ appFile.getFileAnotherName(); //.getFile_name();
		docStream = new FileInputStream(pathAndFile);
		return SUCCESS;
	}
	
	
	
	
	public InfoModel getInfoModel() {
		return infoModel;
	}

	public void setInfoModel(InfoModel infoModel) {
		this.infoModel = infoModel;
	}

	public AppModel getApp() {
		return app;
	}

	public void setApp(AppModel app) {
		this.app = app;
	}

	public String getInfoId() {
		return infoId;
	}

	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public ArchiveModel getArchive() {
		return archive;
	}

	public void setArchive(ArchiveModel archive) {
		this.archive = archive;
	}

	public File[] getCaiLiao() {
		return caiLiao;
	}

	public void setCaiLiao(File[] caiLiao) {
		this.caiLiao = caiLiao;
	}

	public String[] getCaiLiaoFileName() {
		return caiLiaoFileName;
	}

	public void setCaiLiaoFileName(String[] caiLiaoFileName) {
		this.caiLiaoFileName = caiLiaoFileName;
	}

	public String getSqrID() {
		return sqrID;
	}

	public void setSqrID(String sqrID) {
		this.sqrID = sqrID;
	}
	
	public String getClType() {
		return clType;
	}

	public void setClType(String clType) {
		this.clType = clType;
	}

	public String[] getXzbzwClName() {
		return xzbzwClName;
	}

	public void setXzbzwClName(String[] xzbzwClName) {
		this.xzbzwClName = xzbzwClName;
	}

	public String[] getDbrArr() {
		return dbrArr;
	}

	public void setDbrArr(String[] dbrArr) {
		this.dbrArr = dbrArr;
	}

	public String getFyjg() {
		return fyjg;
	}

	public void setFyjg(String fyjg) {
		this.fyjg = fyjg;
	}

	public String getUploadUserId() {
		return uploadUserId;
	}

	public void setUploadUserId(String uploadUserId) {
		this.uploadUserId = uploadUserId;
	}

	public String getTuJing() {
		return tuJing;
	}

	public void setTuJing(String tuJing) {
		this.tuJing = tuJing;
	}

	public String getOtherValue() {
		return otherValue;
	}

	public void setOtherValue(String otherValue) {
		this.otherValue = otherValue;
	}

	public String getClID() {
		return clID;
	}

	public void setClID(String clID) {
		this.clID = clID;
	}

	@Override
	public Class getPersistentClass() {
		return AppModel.class;
	}

	public IZxsqService getZxsqService() {
		return zxsqService;
	}

	public void setZxsqService(IZxsqService zxsqService) {
		this.zxsqService = zxsqService;
	}

	public String getClName() {
		return clName;
	}

	public void setClName(String clName) {
		this.clName = clName;
	}

	public String getClNum() {
		return clNum;
	}

	public void setClNum(String clNum) {
		this.clNum = clNum;
	}


	public String getActionName() {
		return actionName;
	}

	public String getCaseIndex() {
		return caseIndex;
	}

	public void setCaseIndex(String caseIndex) {
		this.caseIndex = caseIndex;
	}
	
	public InputStream getDocStream() {
		return docStream;
	}

	public void setDocStream(InputStream docStream) {
		this.docStream = docStream;
	}
	
	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}
	
	public String getDownloadName() {
		return downloadName;
	}

	public void setDownloadName(String downloadName) {
		this.downloadName = downloadName;
	}

	public String getSqm() {
		return sqm;
	}

	public void setSqm(String sqm) {
		this.sqm = sqm;
	}
	
}