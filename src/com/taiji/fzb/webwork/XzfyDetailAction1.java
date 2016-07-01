package com.taiji.fzb.webwork;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedListAction;
import com.taiji.fzb.domain.Beishenqingren;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;

import net.sf.json.JSONObject;


public class XzfyDetailAction1 extends ProtectedListAction{

	private String xzfyId;
	private RecordService recordService = null; // 模板业务层方法
	private XzfyCompany xzfyCom;
	private String localBm = "";
	private String localName = "";
	private String upBm = "";
	private String admit_name;
	private XzfyService xzfyService = null; // 模板业务层方法
	private Number userid;
	private String upName = "";
	private String todate;
	private User user;
	private List<Beishenqingren> zlList = new ArrayList<Beishenqingren>();
	private List<Beishenqingren> bList = new ArrayList<Beishenqingren>();
	
	private String yuedusj;
	private List keywordList;
	
	
	
	public String gotoCreate1() {
		String sql=" from XzfyInfo";
	//	List <XzfyInfo > aa = xzfyService.("");
		XzfyInfo  aa = xzfyService.getXzfyById("20160513134807639437");
		
		List a=xzfyService.getXzfyByTB_flag("20160513134807639437");
		
		return "success" ;
		
		
	}
	public String gotoCreate() {
		
		  /*      XzfyInfo infolist =null;
			// 如果是个人用户，读取详细信息201605161609013396
				// 判断用户是否已经存在，存在取得该对象
				 infolist = xzfyService.getXzfyById("20160607171149242845");
				 JSONObject json = JSONObject.fromObject(infolist);//将java对象转换为json对象
				 String str = json.toString();//将json对象转换为字符串
                  System.out.println(str);
				 
         */      //   {"casenum":"","xzfy_requset":"","secondSubmitDate":"","receive_address":"","delay_reason":"","refer":"","pizhunren3":"","jdGzContent":"","pizhunren1":"","pizhunren2":"","casetype2":"","jdbl_flag":"","app_advice_type":"","laixin_post":"","isBuzheng":"","breakReport":"","tiaojie_result":"","buzheng_from":"","isdelay_from":"","adviseFile":"","receive_real_date":"2016-06-06","songdaquerenFlag":"","user4_id":"","tiaojiejilu":"","admit2":"","admit1":"","caseyear":"","nationMoneyDetail":"","app_show":"","resarch":"","finish_date":"","app_type":"1","advise":"","user3_id":"","user2_id":"","tiaojiejilu1":"","reception2":"","zhongzhispdate":"","jdFileContent":"","firstSubmitResult":"","zhidaosj":"","proxy":"","tiaojie_from":"","break_right":"北京市人民政府","check_name":"","tiaojie_count":0,"keyword2":"","keyword3":"","endFile":"","tAppDeptId":"","ismoney":"","istingzheng":"","dftzstatus":"","matter_type":"","user1_name":"","jianyi_file":"","receive_type":"","xwnum":"","jddetail":"","laixin_tel":"","content_abstract":"","hasanshen":"","fuyifs":"","xzfy_requset_retail":"","issame_detail":"","issame":"","lian_date":"","execute_date":"","xwname":"","tb_flag":"0","agent_address":"","pizhunren":"","opinion":"","jiansuom":"","renCount":"","is_commit":"","shishiyuly":"","admit2_id":"","zhize":"","is_prof":"","agent":"1","app_advice_detail":"","delayAdvice":"","admit1_id":"","pifuyijian3":"","isMany":"","agent_name":"代理人","pifuyijian2":"","pifuyijian1":"","buzhengDelay":"","laixin_name":"","trailMode":"","bzTongzhiriqi":"","defendant_type":"","defendant_name":"北京市住房和城乡建设委员会","jiedai_file":"","caseindex":"","bzAdvice":"","appdetail":"","shouju_flag":"","hastingzheng":"","xzfyAgents":[],"bzBuqiriqi":"","user1_id":"","jaAdvice":"","yijian_file":"","tjzfzh":"","lian_real_date":"","jieanspdate":"","buzhengContentType":"","casestatus":"","money_detail":"","tPoliceIsParade":"","isdelay":"","casetype":"","fenpei_name":"","defendant_real_name":"","agent_date":"","other_commit":"","user3_name":"","isstop":"","receiveAnswerDate":"","guanli1":"","guanli3":"","xzfyApps":[],"guanli2":"","menu":"","require_fy":"23（23）；（23）；","deputy_show":"","third":"","ismanage":"2","buzhengspdate":"","bzTongzhifangshi":"","bztz_flag":"","issafe":"","check_status":"","jdBzContent":"","mid_tiaojie":"","jdRenshu":"","third_agent":"","yuedusj":"","opinionFile":"","xzfy_org":"","user4_name":"","breakTo":"","app_type1":"","app_type2":0,"isstop_from":"","buzheng_to":"","check_file":"","matter_detail":"","yanzhengsj":"","laixin_address":"","user2_name":"","remark":"","delayTo":"","jieanwenshu":"","huifuspdate":"","isdelay_to":"","stadardResult":"","manage_type":"","caseorg":"","dbrDetail":"","stop_reason":"","receive_date":"2016-06-06","isstop_to":"","stop_detail":"","isBreak":"","handleReason":"","status":"","hasdiaocha":"","money_file":"","pifuyijian":"","referother":"","refer2":"","receive_detail":"","yanqispdate":"","breakAdvice":"","ischeck":"","agentDetail":"","fenpei_id":"","isBuzhengshenpi":"","has_tingzheng":"","tiaojie_to":"","istiaojie":"","pizhunriqi":"","id":"201605161609013396","firstSubmitDate":"","finish_type":"","duty":"","currentuser":"","isfront":"","bsqrSpecial":"","secondSubmitResult":"","finishBreakType":"","delayReport":"","is_prof_detail":"曾要求被申请人履行何职责(50字以内)","finish_real_date":"","pizhunriqi2":"","pizhunriqi1":"","safeContent":"","check_id":"","keyword":"","laAdvice":"","time_show":"","hastiaojie":"","delay_detail":"","reception":"","nationMoney":"","otherTrailMode":"","lianspdate":"","condition_type":"","sentAnswerDate":"","isAnswer":""}
		
		 
		try {
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS")
					.format(new Date());
			 yuedusj = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date());
			Random random = new Random();
			xzfyId = currentTime + random.nextInt(1000);
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String bumen=recordService.getOrg().getLocbm();
			Org org=this.recordService.getRootOrg(bumen);
			
			xzfyCom=this.recordService.getXzfyComById(bumen,org.getName());
			localBm = org.getLocbm();//0000
			localName = org.getName();//北京市人民政府
			if (localBm.substring(2).equals("00")){
				upBm="0000";
			} else {
				upBm=localBm.substring(0,2)+"00";
			}
			Org rootOrg=this.recordService.getRootOrg(upBm);
			upName=rootOrg.getName();
			todate = df.format(dt);
			user = new User();
			user = (User) ActionContext.getContext().getSession()
					.get("_USER_LOGIN_");
			admit_name = user.getName();
			setUserid(user.getId());
			
			//设置被申请人种类与被申请人名称
			//北京市法制办
			if(localBm.equals("0000")){
				//被申请人种类
				for (int i=0;i<5;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区县政府");
						b.setValue("5");
					} else if(i==1){
						b.setName("省级政府部门");
						b.setValue("7");
					} else if(i==2){
						b.setName("省级政府");
						b.setValue("6");
					} else if(i==3){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==4){
						b.setName("其他");
						b.setValue("8");
					}
					
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("5", localBm,bList);
				bList = xzfyService.getBsqrName("7", localBm,bList);
				bList = xzfyService.getBsqrName("6", localBm,bList);
			}
			
			//区县政府
			int lb = Integer.parseInt(localBm.substring(0, 2));
			if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb<19 && lb!=0){
				//被申请人种类
				for (int i=0;i<5;i++){
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
					} else if(i==3){
						b.setName("国务院部门");
						b.setValue("11");
					}
					else if(i==4){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("4", localBm,bList);
				bList = xzfyService.getBsqrName("3", localBm,bList);
				bList = xzfyService.getBsqrName("9", localBm,bList);
			}
			//区县政府部门
			if(localBm.length()==4 && !"00".equals(localBm.substring(2, 4))){
				//被申请人种类
				for (int i=0;i<3;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区县政府部门派出机构");
						b.setValue("9");
					} else if(i==1){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==2){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("9", localBm,bList);
			}
			//省部级政府部门
			if(localBm.length()==4 && "00".equals(localBm.substring(2, 4)) && lb>18){
				//被申请人种类
				for (int i=0;i<3;i++){
					Beishenqingren b = new Beishenqingren();
					if(i==0){
						b.setName("区县政府部门");
						b.setValue("4");
					}else if(i==1){
						b.setName("国务院部门");
						b.setValue("11");
					}else if(i==2){
						b.setName("其他");
						b.setValue("8");
					}
					zlList.add(b);
				}
				//被申请人名称
				bList = xzfyService.getBsqrName("4", localBm,bList);
			}
			
			/*String HQL2="";
			HQL2 += " from XzfyKeyword xzfyKeyword ";
			HQL2 += " where xzfyKeyword.status = '0' and xzfyKeyword.locbm = '"+org.getLocbm()+"' ";
			setKeywordList(recordService.find(HQL2));*/
			
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	private String sljg="";
	private XzfyInfo xzfyInfo;
	String realtime="";
	String getRealtime(){
		realtime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		return realtime;
	}
	private String jiedaimudi="";
	
	private String shoudaoshijian="";

	private String shoudaofangshi="";
	private String jiansuom="";
	private String fasongsj="";
	
	public String saveFace() {
		// 取得localbm
		String locbm =sljg;//受理机构“0000”北京市人民政府
		// 取得最大流水号
		List<String> caseIndexList = this.coreService
				.find("select max(caseindex) as caseindex from XzfyInfo");
		// 设置流水号
		String caseIndex = null;
		for (int i = 0; i < caseIndexList.size(); i++) {
			caseIndex = caseIndexList.get(i);
		}

		if (caseIndex == null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			caseIndex = year + locbm + "0001";
			//System.out.println(caseIndex);
		} else {
			String y = caseIndex.substring(0, 4);
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			if (year > Integer.parseInt(y)) {//存在流水号，且是去年的流水号，则从今年开始从新排号
				caseIndex = year + locbm + "0001";
			} else {
				Long c = Long.parseLong(caseIndex) + 1;
				caseIndex = String.valueOf(c);
			}
		}
		xzfyInfo.setCaseindex(caseIndex);//设置流水号
		String receiveDate=xzfyInfo.getReceive_date();//接待日期第一个空
		if(receiveDate!=null){
			if(receiveDate.length()>10)
				xzfyInfo.setReceive_date(receiveDate.substring(0,10));
		}
		// 记录收案时间、24小时内删除用
		//xzfyInfo.setReceive_real_date(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		/*BeanCopier bc = BeanCopier.create(XzfyInfo.class, XzfyRecieve.class,
				false);*/
		Org org=this.recordService.getRootOrg(sljg);//根据local部门获取组织对象。
		//System.out.println(org.getName());
		xzfyInfo.setBreak_right(org.getName());//组织name
		xzfyInfo.setReceive_real_date(getRealtime());//实际接收时间系统获取
		//XzfyRecieve xr = new XzfyRecieve();
		xzfyInfo.setBuzheng_to(xzfyInfo.getReceive_date());//补正截止日期/接待日期
		
		if ("2".equals(xzfyInfo.getIsmanage())) {//Ismanage是否行政不作为
			xzfyInfo.setXwname("行政不作为");//被复议的具体行为-名称
			if(xzfyInfo.getMatter_detail()!=null && !xzfyInfo.getMatter_detail().equals("") )//Matter_detail不作为事项明细
				xzfyInfo.setXwname("行政不作为("+xzfyInfo.getMatter_detail()+")");
			xzfyInfo.setXwnum("");
		} else {
			xzfyInfo.setMatter_type("0");//不作为事项
			xzfyInfo.setMatter_detail("");//不作为事项明细
			xzfyInfo.setDuty("");//申请人曾经要求被申请人履行何种法定职责
			xzfyInfo.setExecute_date("");//要求被申请人履行日期
			xzfyInfo.setIs_prof("0");//是否有曾要求履责而未履行的证明材料
			xzfyInfo.setIs_prof_detail("");//是否有曾要求履责而未履行的证明材料明细
		}
		
		String content="";//defendant_name别申请人名称与defendant_type被申请人种类对应
		if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))//Defendant_name被申请人名称字典项数据字典,与Defendant_type联动
			content="申请人不服"+xzfyInfo.getDefendant_name();
		if(xzfyInfo.getXwname()!=null && !xzfyInfo.getXwname().equals(""))//Xwname被复议的具体行为-名称
			content=content+xzfyInfo.getXwname();
		if(xzfyInfo.getXwnum()!=null && !xzfyInfo.getXwnum().equals(""))//Xwnum被复议的具体行为-案号
			content=content+"（"+xzfyInfo.getXwnum()+"）";
		if(xzfyInfo.getXzfy_requset_retail()!=null && !xzfyInfo.getXzfy_requset_retail().equals(""))//Xzfy_requset_retail行政复议请求明细
			content=content+xzfyInfo.getXzfy_requset_retail();	
		xzfyInfo.setContent_abstract(content);//Content_abstract简要内容
		//bc.copy(xzfyInfo, xr, null);
		//xzfyService.saveOrUpdate(xr);

		xzfyInfo.setStatus("1");
		xzfyInfo.setCheck_status("0");
		xzfyService.saveOrUpdate(xzfyInfo);//存储行政复议表
		
		if ("1".equals(xzfyInfo.getIstiaojie())){//Istiaojie是否调解
			if(xzfyInfo.getTiaojie_to() != null && !"".equals(xzfyInfo.getTiaojie_to())) {
				xzfyInfo.setReceive_date(xzfyInfo.getTiaojie_to());//调解日期止,接受调解则将接受日期变为调解截止日期
			}
		}
		// 申请人拆分存储
		if (xzfyInfo.getId().length()>10) {
			xzfyInfo = this.setInfo(xzfyInfo);
			if (xzfyInfo.getDbrDetail() != null//DbrDetail代表人明细
					&& !xzfyInfo.getDbrDetail().equals("")) {//大于5人选择代表人
				this.saveDeputy(xzfyInfo.getDbrDetail());
			}
		}
		
		xzfyInfo.setCaseorg(sljg);
		
		xzfyInfo.setCurrentuser(this.recordService.getOrg().getLocbm()); //存储接收案件机关LOCALBM
		String sl1=sljg.substring(0,2);
		String sl2=sljg.substring(2);
		int sl1i = Integer.parseInt(sl1);
		int sl2i = Integer.parseInt(sl2);
		
		if(sljg.equals("0000")){
			xzfyInfo.setXzfy_org("省部级行政机关");//Xzfy_org复议机关
		} else if(sl2.equals("00") && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府");
		} else if(sl2.equals("00") && sl1i<99 && sl1i>18) {
			xzfyInfo.setXzfy_org("省部级政府部门");
		} else if(sl2i<100 && sl2i>0 && sl1i<19 && sl1i>0) {
			xzfyInfo.setXzfy_org("县级政府部门");
		} 
		
	//	xr.setApp_show(xzfyInfo.getApp_show());

		// 上传文件
		/*saveFile(xzfyInfo);
		xr.setStatus("1");
		xr.setApp_type1("1");
		//补正信息存入receive
		xr.setKeyword(jiedaimudi);
		xr.setMenu(shoudaoshijian);
		xr.setKeyword3(shoudaofangshi);*/
		String op="录入当面接待信息";
		//recordService.save_log(xzfyInfo.getStatus(),op,xzfyInfo.getId(),xzfyInfo);
		String jiequ=xzfyInfo.getId().substring(8, 15);
		String shoujihao=xzfyInfo.getYanzhengsj();
		xzfyInfo.setJiansuom(shoujihao+jiequ);
		 jiansuom=shoujihao+jiequ;
		xzfyService.update(xzfyInfo);
		//xzfyService.update(xr);
		return SUCCESS;
		
		
	}

	private XzfyInfo setInfo(XzfyInfo x) {
		
		this.xzfyService.deleteAppById(x.getId());
		String appShow = "";

		// 拆分appDetail
		if (x.getApp_type().equals("1")) {//App_type申请人类别，1，公民，2，法人
			String apps[] = x.getAppdetail().split("；");//Appdetail申请人信息
			for (String app : apps) {
				String info[] = app.split("，");
				XzfyApp xzfyApp = new XzfyApp();
				x = xzfyService.getXzfyById(x.getId());
				for (int i = 0; i < info.length; i++) {
					if (i == 0) {
						if (info[i].equals("") || info[i] == null) {
							break;
						}
						xzfyApp.setApp_name(info[i]);
						if (appShow.equals("")) {
							appShow = info[i];
						} else {
							appShow += "," + info[i];
						}
					} else if (i == 1) {
						xzfyApp.setSexy(info[i]);
					} else {
						xzfyApp = this.splitInfo(info[i], xzfyApp);
					}
				}
				xzfyApp.setProxytype(x.getApp_type());//申请人类别
			//	xzfyApp.setXzfyInfo(x);               //整个申请人申请信息
				xzfyService.save(xzfyApp);
			}
		}
		// 拆分agentDetail
		if (x.getApp_type().equals("2")) {//代表人为法人
			String agents[] = x.getAgentDetail().split("；");
			for (String agent : agents) {
				String info[] = agent.split("，");
				XzfyApp xzfyApp = new XzfyApp();
				x = xzfyService.getXzfyById(x.getId());
				for (int i = 0; i < info.length; i++) {
					if (i == 0) {
						if (info[i].equals("") || info[i] == null
								|| info[i].equals(", ")) {
							break;
						}
						if (info[i].indexOf("（") != -1) {
							String a[] = info[i].split("（");
							xzfyApp.setApp_name(a[0]);
							xzfyApp.setOtherType(a[1].replaceAll("）", ""));
							if (appShow.equals("")) {
								appShow = a[0];
							} else {
								appShow += "," + a[0];
							}
						} else {
							xzfyApp.setApp_name(info[i]);
							if (appShow.equals("")) {
								appShow = info[i];
							} else {
								appShow += "," + info[i];
							}
						}
					} else {
						xzfyApp = this.splitInfo(info[i], xzfyApp);
					}
				}
				xzfyApp.setProxytype(x.getApp_type());
			//	xzfyApp.setXzfyInfo(x);
				xzfyService.save(xzfyApp);
			}
		}
		// 设置列表显示申请人人名
		x.setApp_show(appShow);
		return x;
	}
		private void saveDeputy(String deputy) {
			String dpName[] = deputy.split("，");
			for (String name : dpName) {
				String sql = "update xzfy_app set ISDEPUTY = '1' where APP_NAME = '"
						+ name + "'";
				this.xzfyService.updateAllBySQL(sql);
			}
		}
		

		public void saveFile(XzfyInfo xzfyInfo) {
			/*String fnn = "";
			if (upFile1 != null) {
				try {
					fnn = FileUtil.fileSave(upFile1, upFile1FileName);
					XzfyInfoFile xif = new XzfyInfoFile();
					xif.setXzfyInfo(xzfyInfo);
					xif.setFileName(upFile1FileName);
					xif.setStoredName(fnn);
					xif.setStoredLocation(File.separator + File.separator
							+ "download" + File.separator + File.separator + "File"
							+ File.separator + File.separator);
					xif.setType("1");
					xzfyService.saveOrUpdate(xif);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("上传文件出错");
				}
			}

			if (upFile2 != null && upFile2.length != 0) {
				for (int i = 0; i < upFile2.length; i++) {
					try {
						fnn = FileUtil.fileSave(upFile2[i], upFile2FileName[i]);
						XzfyInfoFile xif = new XzfyInfoFile();
						xif.setXzfyInfo(xzfyInfo);
						xif.setFileName(upFile1FileName);
						xif.setStoredName(fnn);
						xif.setStoredLocation(File.separator + File.separator
								+ "download" + File.separator + File.separator
								+ "File" + File.separator + File.separator);
						xif.setType("2");
						xzfyService.saveOrUpdate(xif);
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("上传文件出错");
					}
				}

			}*/
		}
		
		public String saveFace1(){
		        
			return "success";
			
		}
		
		
	
		public XzfyApp splitInfo(String r, XzfyApp xzfyApp) {

			if (r.startsWith("身")) {
				r = r.substring(4);
				xzfyApp.setApp_id(r);
			} else if (r.startsWith("送")) {
				r = r.substring(4);
				xzfyApp.setMail_address(r);
			} else if (r.startsWith("邮")) {
				r = r.substring(2);
				xzfyApp.setPostcode(r);
			} else if (r.startsWith("电")) {
				r = r.substring(2);
				xzfyApp.setTelephone(r);
			} else {
				String a[] = r.split("：");
				xzfyApp.setDeputyType(a[0].replace("是", ""));
				xzfyApp.setDeputyName(a[1]);
			}
			return xzfyApp;
		}
	
	
	/*@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}*/

	public String getXzfyId() {
		return xzfyId;
	}

	public String getFasongsj() {
		return fasongsj;
	}

	public void setFasongsj(String fasongsj) {
		this.fasongsj = fasongsj;
	}

	public String getJiansuom() {
		return jiansuom;
	}

	public void setJiansuom(String jiansuom) {
		this.jiansuom = jiansuom;
	}

	public String getYuedusj() {
		return yuedusj;
	}

	public void setYuedusj(String yuedusj) {
		this.yuedusj = yuedusj;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

	public RecordService getRecordService() {
		return recordService;
	}

	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	public XzfyCompany getXzfyCom() {
		return xzfyCom;
	}

	public void setXzfyCom(XzfyCompany xzfyCom) {
		this.xzfyCom = xzfyCom;
	}

	public String getLocalBm() {
		return localBm;
	}

	public void setLocalBm(String localBm) {
		this.localBm = localBm;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	public String getUpBm() {
		return upBm;
	}

	public void setUpBm(String upBm) {
		this.upBm = upBm;
	}

	public String getAdmit_name() {
		return admit_name;
	}

	public void setAdmit_name(String admit_name) {
		this.admit_name = admit_name;
	}

	public XzfyService getXzfyService() {
		return xzfyService;
	}

	public void setXzfyService(XzfyService xzfyService) {
		this.xzfyService = xzfyService;
	}

	public Number getUserid() {
		return userid;
	}

	public void setUserid(Number userid) {
		this.userid = userid;
	}

	public String getUpName() {
		return upName;
	}

	public void setUpName(String upName) {
		this.upName = upName;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public List getKeywordList() {
		return keywordList;
	}

	public void setKeywordList(List keywordList) {
		this.keywordList = keywordList;
	}

	public String getSljg() {
		return sljg;
	}

	public void setSljg(String sljg) {
		this.sljg = sljg;
	}

	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}

	public String getJiedaimudi() {
		return jiedaimudi;
	}

	public void setJiedaimudi(String jiedaimudi) {
		this.jiedaimudi = jiedaimudi;
	}

	public String getShoudaoshijian() {
		return shoudaoshijian;
	}

	public void setShoudaoshijian(String shoudaoshijian) {
		this.shoudaoshijian = shoudaoshijian;
	}

	public String getShoudaofangshi() {
		return shoudaofangshi;
	}

	public void setShoudaofangshi(String shoudaofangshi) {
		this.shoudaofangshi = shoudaofangshi;
	}

	public void setRealtime(String realtime) {
		this.realtime = realtime;
	}

	@Override
	public PaginationSupport getInitResult() {
		// TODO Auto-generated method stub
		return null;
	}


	
	@Override
	public String getTableName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	

}
