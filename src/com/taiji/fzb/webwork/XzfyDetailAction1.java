package com.taiji.fzb.webwork;

import java.io.File;
import java.rmi.RemoteException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.poi.util.SystemOutLogger;

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

//<<<<<<< HEAD
import localhost.webIscp.services.dateTransfer_nei.DateTransfer_neiProxy;


//>>>>>>> branch 'master' of ssh://git@124.205.50.55:12589/liuqc/fzb_zaixianfuwu.git
import net.sf.json.JSONObject;


public class XzfyDetailAction1 extends ProtectedListAction{

	private String xzfyId;
	private RecordService recordService = null; // 模板业务层方法
	private String localBm = "";
	private String localName = "";
	private String upBm = "";
	private String admit_name;
	private XzfyService xzfyService = null; // 模板业务层方法
	private Number userid;
	private String upName = "";
	private String todate;
	private List<Beishenqingren> zlList = new ArrayList<Beishenqingren>();
	private List<Beishenqingren> bList = new ArrayList<Beishenqingren>();
	
	private String yuedusj;
	private List keywordList;
	
	private String fyjg;
	
	public String addSqrFR() {
		return "success" ;
	}
	
	public String gotoCreate1() {
		String sql=" from XzfyInfo";
	//	List <XzfyInfo > aa = xzfyService.("");
		XzfyInfo  aa = xzfyService.getXzfyById("20160513134807639437");
		
		List a=xzfyService.getXzfyByTB_flag("20160513134807639437");
		
		return "success" ;
		
		
	}
	public String gotoCreate() {
		
		try {
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			//点击阅读注意事项的阅读时间
			yuedusj = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			Random random = new Random();
			xzfyId = currentTime + random.nextInt(1000);
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Org org=this.recordService.getRootOrg(fyjg);
			
			localBm = org.getLocbm();//0000
			localName = org.getName();//北京市人民政府
			if (localBm.substring(2).equals("00")){
				upBm="0000";
			} else {
				upBm=localBm.substring(0,2)+"00";
			}
			Org rootOrg=this.recordService.getRootOrg(upBm);
			upName=rootOrg.getName();
			//传到前台页面receive_real_date
			todate = df.format(dt);
			
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
	

	public String saveFace(){


		// 取得localbm
		String locbm =fyjg;//受理机构“0000”北京市人民政府
		sljg = fyjg;
		// 取得最大流水号
		List<String> caseIndexList = this.coreService.find("select max(caseindex) as caseindex from XzfyInfo");
		// 设置流水号
		String caseIndex = caseIndexList!=null&&caseIndexList.size()>0?caseIndexList.get(0):"";
		if (caseIndex == null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			caseIndex = year + locbm + "0001";
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
		Org org=this.recordService.getRootOrg(sljg);//根据local部门获取组织对象。
		xzfyInfo.setBreak_right(org.getName());//组织name
		xzfyInfo.setReceive_real_date(getRealtime());//实际接收时间系统获取
		
		xzfyInfo.setStatus("1");
		xzfyInfo.setCheck_status("0");
		xzfyInfo.setCaseorg(sljg);
		
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

		String jiequ=xzfyInfo.getId().substring(8, 15);
		String shoujihao=xzfyInfo.getYanzhengsj();
		xzfyInfo.setJiansuom(shoujihao+jiequ);
		
		xzfyService.saveOrUpdate(xzfyInfo);//存储行政复议表
		//往成功页面传值
		jiansuom=shoujihao+jiequ;
		
		JSONObject json = JSONObject.fromObject(xzfyInfo);//将java对象转换为json对象
    	String str = json.toString();//将json对象转换为字符串
    	DateTransfer_neiProxy da =new DateTransfer_neiProxy();  
		try{			
			String ss= da.saveJSON(str);
			if(ss.equals("SUCCESS")){
				xzfyInfo.setTb_flag("1");//同步成功
			}else{
				xzfyInfo.setTb_flag("0");//同步失败
			}
		}catch (Exception e){
			System.out.println(e.getMessage());
			xzfyInfo.setTb_flag("0");//同步失败
		}			
		xzfyService.update(xzfyInfo);
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
	public String getFyjg() {
		return fyjg;
	}
	public void setFyjg(String fyjg) {
		this.fyjg = fyjg;
	}

	
	
	
	

}
