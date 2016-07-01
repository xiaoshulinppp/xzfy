package com.taiji.fzb.domain;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

public class XzfyInfo implements Serializable{

	// fields
	private String id;

	private java.lang.String receive_date;

	private java.lang.String receive_real_date;

	private java.lang.String receive_address;

	private java.lang.String admit1;

	private java.lang.String admit2;

	private java.lang.String admit1_id;

	private java.lang.String admit2_id;

	private String appdetail;

	private String hastingzheng;

	private String hasdiaocha;

	private String hasanshen;

	private String hastiaojie;

	private String jddetail;

	private java.lang.String issafe;

	private java.lang.String app_type;

	private java.lang.String agent;

	private java.lang.String agent_name;

	private java.lang.String proxy;

	private java.lang.String agent_date;

	private java.lang.String agent_address;

	private java.lang.String defendant_type;

	private java.lang.String defendant_name;

	private java.lang.String defendant_real_name;

	private java.lang.String ismanage;

	private java.lang.String manage_type;

	private java.lang.String matter_type;

	private java.lang.String matter_detail;

	private java.lang.String duty;

	private java.lang.String execute_date;

	private java.lang.String is_prof;

	private java.lang.String is_prof_detail;

	private java.lang.String require_fy;

	private java.lang.String break_right;

	private java.lang.String xzfy_requset;

	private java.lang.String xzfy_requset_retail;

	private java.lang.String istingzheng;

	private java.lang.String ismoney;

	private java.lang.String money_detail;

	private java.lang.String money_file;

	private java.lang.String isfront;

	private java.lang.String ischeck;

	private java.lang.String check_file;

	private java.lang.String istiaojie;

	private java.lang.String tiaojie_from;

	private java.lang.String tiaojie_to;

	private String tiaojie_count;

	private java.lang.String issame;

	private String issame_detail;

	private String agentDetail;

	private String isAnswer;
	private String sentAnswerDate;
	private String receiveAnswerDate;
	private String trailMode;
	private String otherTrailMode;
	private String secondSubmitResult;
	private String secondSubmitDate;
	private String delayReport;
	private String delayTo;
	private String delayAdvice;
	private String isBreak;
	private String breakReport;
	private String breakTo;
	private String breakAdvice;
	private String check_id;
	private String check_name;
	private String laixin_name;
	private String laixin_address;
	private String laixin_post;
	private String laixin_tel;
	private String zhize;
	private String xwname;
	private String xwnum;
	private String receive_type;
	private String app_show;
	private String time_show;
	private String jdbl_flag;
	private String shouju_flag;
	private String bztz_flag;
	private String tiaojie_result;
	private String firstSubmitResult;
	private String firstSubmitDate;
	private String tjzfzh;
	private String content_abstract;
	private String remark;
	private String finishBreakType;
	private String nationMoney;
	private String nationMoneyDetail;
	private String opinion;
	private String endFile;
	private String advise;
	private String opinionFile;
	private String adviseFile;

	private String pizhunren;
	private String pizhunriqi;
	private String pifuyijian;
	private String deputy_show;
	private String referother;
	private String pizhunren1;
	private String pizhunriqi1;
	private String pifuyijian1;
	private String pizhunren2;
	private String pizhunriqi2;
	private String pifuyijian2;
	private String tiaojiejilu;
	private String tiaojiejilu1;
	private String isBuzheng;
	private String buzhengContentType;
	private String isBuzhengshenpi;
	private String bzTongzhiriqi;
	private String bzBuqiriqi;
	private String bzTongzhifangshi;
	private String bzAdvice;
	private String laAdvice;
	private String jaAdvice;
	private String stadardResult;
	private String pizhunren3;
	private String pifuyijian3;
	private String bsqrSpecial;//答复通知被申请人为北京市人民政府特殊情况：
//					市国土局（3000）、市规划委（3100）、市政府办公厅信息公开一处（0000

	private java.lang.String condition_type;

	private java.lang.String receive_detail;

	private java.lang.String app_advice_type;

	private java.lang.String app_advice_detail;

	private java.lang.String jiedai_file;

	private java.lang.String third;

	private java.lang.String third_agent;

	private java.lang.String app_type1;

	private java.lang.String app_type2;

	private java.lang.String guanli1;

	private java.lang.String guanli2;

	private java.lang.String guanli3;

	private java.lang.String xzfy_org;

	private java.lang.String user1_id;

	private java.lang.String user1_name;

	private java.lang.String user2_id;

	private java.lang.String user2_name;

	private java.lang.String user3_id;

	private java.lang.String user3_name;

	

	private java.lang.String user4_id;

	private java.lang.String user4_name;

	
	private java.lang.String status;

	private java.lang.String lian_date;

	private java.lang.String finish_date;

	private java.lang.String buzheng_from;

	private java.lang.String buzheng_to;

	private String lian_real_date;

	private String finish_real_date;

	private java.lang.String fenpei_id;

	private java.lang.String fenpei_name;

	private java.lang.String isdelay;

	private java.lang.String isdelay_from;

	private java.lang.String isdelay_to;

	private java.lang.String isstop;

	private java.lang.String isstop_from;

	private java.lang.String isstop_to;

	private java.lang.String finish_type;

	private java.lang.String check_status;

	private java.lang.String has_tingzheng;

	private java.lang.String resarch;

	private String jdRenshu;

	private String isMany;

	private String safeContent;

	private String jdFileContent;

	private String jdGzContent;

	private String jdBzContent;

	private String tAppDeptId;

	private String tPoliceIsParade;
	private String keyword;
	private String menu;
	private String reception;
	private String reception2;
	private String casetype;
	private String casetype2;
	private String refer;
	private String refer2;
	private String keyword2;
	private String keyword3;
	private String renCount;
	private String jieanwenshu;
	private String yijian_file;
	private String jianyi_file;
	
	
	private String zhidaosj;
	private String fuyifs;
	private String shishiyuly;
	private String yanzhengsj;
	private String yuedusj;
	private String jiansuom;
	private String tb_flag;
	private String tb_time;
	
	private String  agentDetail_cang;
	private String appdetail_cang;
	private String  require_fy_cang;
	
	
	public String getAgentDetail_cang() {
		return agentDetail_cang;
	}

	public void setAgentDetail_cang(String agentDetail_cang) {
		this.agentDetail_cang = agentDetail_cang;
	}

	public String getAppdetail_cang() {
		return appdetail_cang;
	}

	public void setAppdetail_cang(String appdetail_cang) {
		this.appdetail_cang = appdetail_cang;
	}

	public String getRequire_fy_cang() {
		return require_fy_cang;
	}

	public void setRequire_fy_cang(String require_fy_cang) {
		this.require_fy_cang = require_fy_cang;
	}

	public String getTb_time() {
		return tb_time;
	}

	public void setTb_time(String tb_time) {
		this.tb_time = tb_time;
	}

	public String getTb_flag() {
		return tb_flag;
	}

	public void setTb_flag(String tb_flag) {
		this.tb_flag = tb_flag;
	}

	public String getHastingzheng() {
		return hastingzheng;
	}

	public void setHastingzheng(String hastingzheng) {
		this.hastingzheng = hastingzheng;
	}

	public String getHasdiaocha() {
		return hasdiaocha;
	}

	public void setHasdiaocha(String hasdiaocha) {
		this.hasdiaocha = hasdiaocha;
	}

	public String getHasanshen() {
		return hasanshen;
	}

	public void setHasanshen(String hasanshen) {
		this.hasanshen = hasanshen;
	}

	public String getHastiaojie() {
		return hastiaojie;
	}

	public void setHastiaojie(String hastiaojie) {
		this.hastiaojie = hastiaojie;
	}

	public String getAppdetail() {
		return appdetail;
	}

	public void setAppdetail(String appdetail) {
		this.appdetail = appdetail;
	}

	public String getJddetail() {
		return jddetail;
	}

	public void setJddetail(String jddetail) {
		this.jddetail = jddetail;
	}
	public String getBuzhengContentType() {
		return buzhengContentType;
	}

	public void setBuzhengContentType(String buzhengContentType) {
		this.buzhengContentType = buzhengContentType;
	}

	public String getIssame_detail() {
		return issame_detail;
	}

	public void setIssame_detail(String issameDetail) {
		issame_detail = issameDetail;
	}
	
	
	public java.lang.String getUser4_name() {
		return user4_name;
	}

	public void setUser4_name(java.lang.String user4_name) {
		this.user4_name = user4_name;
	}
	public java.lang.String getUser4_id() {
		return user4_id;
	}

	public void setUser4_id(java.lang.String user4_id) {
		this.user4_id = user4_id;
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

	public String getZhidaosj() {
		return zhidaosj;
	}

	public void setZhidaosj(String zhidaosj) {
		this.zhidaosj = zhidaosj;
	}

	public String getFuyifs() {
		return fuyifs;
	}

	public void setFuyifs(String fuyifs) {
		this.fuyifs = fuyifs;
	}

	public String getShishiyuly() {
		return shishiyuly;
	}

	public void setShishiyuly(String shishiyuly) {
		this.shishiyuly = shishiyuly;
	}

	public String getYanzhengsj() {
		return yanzhengsj;
	}

	public void setYanzhengsj(String yanzhengsj) {
		this.yanzhengsj = yanzhengsj;
	}

	public String getJieanwenshu() {
		return jieanwenshu;
	}

	public void setJieanwenshu(String jieanwenshu) {
		this.jieanwenshu = jieanwenshu;
	}

	public java.lang.String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public java.lang.String getReceive_date() {
		return receive_date;
	}

	public void setReceive_date(java.lang.String receiveDate) {
		receive_date = receiveDate;
	}

	public java.lang.String getReceive_address() {
		return receive_address;
	}

	public void setReceive_address(java.lang.String receiveAddress) {
		receive_address = receiveAddress;
	}

	public java.lang.String getAdmit1() {
		return admit1;
	}

	public void setAdmit1(java.lang.String admit1) {
		this.admit1 = admit1;
	}

	public java.lang.String getAdmit2() {
		return admit2;
	}

	public void setAdmit2(java.lang.String admit2) {
		this.admit2 = admit2;
	}

	public java.lang.String getAdmit1_id() {
		return admit1_id;
	}

	public void setAdmit1_id(java.lang.String admit1Id) {
		admit1_id = admit1Id;
	}

	public java.lang.String getAdmit2_id() {
		return admit2_id;
	}

	public void setAdmit2_id(java.lang.String admit2_id) {
		this.admit2_id = admit2_id;
	}

	public java.lang.String getIssafe() {
		return issafe;
	}

	public void setIssafe(java.lang.String issafe) {
		this.issafe = issafe;
	}

	public java.lang.String getAgent() {
		return agent;
	}

	public void setAgent(java.lang.String agent) {
		this.agent = agent;
	}

	public java.lang.String getAgent_name() {
		return agent_name;
	}

	public void setAgent_name(java.lang.String agentName) {
		agent_name = agentName;
	}

	public java.lang.String getProxy() {
		return proxy;
	}

	public void setProxy(java.lang.String proxy) {
		this.proxy = proxy;
	}

	public java.lang.String getAgent_date() {
		return agent_date;
	}

	public void setAgent_date(java.lang.String agentDate) {
		agent_date = agentDate;
	}

	public java.lang.String getAgent_address() {
		return agent_address;
	}

	public void setAgent_address(java.lang.String agentAddress) {
		agent_address = agentAddress;
	}

	public java.lang.String getDefendant_type() {
		return defendant_type;
	}

	public void setDefendant_type(java.lang.String defendantType) {
		defendant_type = defendantType;
	}

	public java.lang.String getDefendant_name() {
		return defendant_name;
	}

	public void setDefendant_name(java.lang.String defendantName) {
		defendant_name = defendantName;
	}

	public java.lang.String getDefendant_real_name() {
		return defendant_real_name;
	}

	public void setDefendant_real_name(java.lang.String defendantRealName) {
		defendant_real_name = defendantRealName;
	}

	public java.lang.String getIsmanage() {
		return ismanage;
	}

	public void setIsmanage(java.lang.String ismanage) {
		this.ismanage = ismanage;
	}

	public java.lang.String getManage_type() {
		return manage_type;
	}

	public void setManage_type(java.lang.String manageType) {
		manage_type = manageType;
	}

	public java.lang.String getMatter_type() {
		return matter_type;
	}

	public void setMatter_type(java.lang.String matterType) {
		matter_type = matterType;
	}

	public java.lang.String getMatter_detail() {
		return matter_detail;
	}

	public void setMatter_detail(java.lang.String matterDetail) {
		matter_detail = matterDetail;
	}

	public java.lang.String getDuty() {
		return duty;
	}

	public void setDuty(java.lang.String duty) {
		this.duty = duty;
	}

	public java.lang.String getExecute_date() {
		return execute_date;
	}

	public void setExecute_date(java.lang.String executeDate) {
		execute_date = executeDate;
	}

	public java.lang.String getIs_prof() {
		return is_prof;
	}

	public void setIs_prof(java.lang.String isProf) {
		is_prof = isProf;
	}

	public java.lang.String getIs_prof_detail() {
		return is_prof_detail;
	}

	public void setIs_prof_detail(java.lang.String isProfDetail) {
		is_prof_detail = isProfDetail;
	}

	public java.lang.String getRequire_fy() {
		return require_fy;
	}

	public void setRequire_fy(java.lang.String requireFy) {
		require_fy = requireFy;
	}

	public java.lang.String getBreak_right() {
		return break_right;
	}

	public void setBreak_right(java.lang.String breakRight) {
		break_right = breakRight;
	}

	public java.lang.String getXzfy_requset() {
		return xzfy_requset;
	}

	public void setXzfy_requset(java.lang.String xzfyRequset) {
		xzfy_requset = xzfyRequset;
	}

	public java.lang.String getXzfy_requset_retail() {
		return xzfy_requset_retail;
	}

	public void setXzfy_requset_retail(java.lang.String xzfyRequsetRetail) {
		xzfy_requset_retail = xzfyRequsetRetail;
	}

	public java.lang.String getIstingzheng() {
		return istingzheng;
	}

	public void setIstingzheng(java.lang.String istingzheng) {
		this.istingzheng = istingzheng;
	}

	public java.lang.String getIsmoney() {
		return ismoney;
	}

	public void setIsmoney(java.lang.String ismoney) {
		this.ismoney = ismoney;
	}

	public java.lang.String getMoney_file() {
		return money_file;
	}

	public java.lang.String getMoney_detail() {
		return money_detail;
	}

	public void setMoney_detail(java.lang.String moneyDetail) {
		money_detail = moneyDetail;
	}

	public void setMoney_file(java.lang.String moneyFile) {
		money_file = moneyFile;
	}

	public java.lang.String getIsfront() {
		return isfront;
	}

	public void setIsfront(java.lang.String isfront) {
		this.isfront = isfront;
	}

	public java.lang.String getIscheck() {
		return ischeck;
	}

	public void setIscheck(java.lang.String ischeck) {
		this.ischeck = ischeck;
	}

	public java.lang.String getCheck_file() {
		return check_file;
	}

	public void setCheck_file(java.lang.String checkFile) {
		check_file = checkFile;
	}

	public java.lang.String getIstiaojie() {
		return istiaojie;
	}

	public void setIstiaojie(java.lang.String istiaojie) {
		this.istiaojie = istiaojie;
	}

	public java.lang.String getTiaojie_from() {
		return tiaojie_from;
	}

	public void setTiaojie_from(java.lang.String tiaojieFrom) {
		tiaojie_from = tiaojieFrom;
	}

	public java.lang.String getTiaojie_to() {
		return tiaojie_to;
	}

	public void setTiaojie_to(java.lang.String tiaojieTo) {
		tiaojie_to = tiaojieTo;
	}

	

	public java.lang.String getIssame() {
		return issame;
	}

	public void setIssame(java.lang.String issame) {
		this.issame = issame;
	}

	public java.lang.String getCondition_type() {
		return condition_type;
	}

	public void setCondition_type(java.lang.String conditionType) {
		condition_type = conditionType;
	}

	public java.lang.String getReceive_detail() {
		return receive_detail;
	}

	public void setReceive_detail(java.lang.String receiveDetail) {
		receive_detail = receiveDetail;
	}

	public java.lang.String getApp_advice_type() {
		return app_advice_type;
	}

	public void setApp_advice_type(java.lang.String appAdviceType) {
		app_advice_type = appAdviceType;
	}

	public java.lang.String getApp_advice_detail() {
		return app_advice_detail;
	}

	public void setApp_advice_detail(java.lang.String appAdviceDetail) {
		app_advice_detail = appAdviceDetail;
	}

	public java.lang.String getJiedai_file() {
		return jiedai_file;
	}

	public void setJiedai_file(java.lang.String jiedaiFile) {
		jiedai_file = jiedaiFile;
	}

	public java.lang.String getThird() {
		return third;
	}

	public void setThird(java.lang.String third) {
		this.third = third;
	}

	public java.lang.String getThird_agent() {
		return third_agent;
	}

	public void setThird_agent(java.lang.String thirdAgent) {
		third_agent = thirdAgent;
	}

	public java.lang.String getGuanli1() {
		return guanli1;
	}

	public void setGuanli1(java.lang.String guanli1) {
		this.guanli1 = guanli1;
	}

	public java.lang.String getGuanli2() {
		return guanli2;
	}

	public void setGuanli2(java.lang.String guanli2) {
		this.guanli2 = guanli2;
	}

	public java.lang.String getGuanli3() {
		return guanli3;
	}

	public void setGuanli3(java.lang.String guanli3) {
		this.guanli3 = guanli3;
	}

	public java.lang.String getXzfy_org() {
		return xzfy_org;
	}

	public void setXzfy_org(java.lang.String xzfyOrg) {
		xzfy_org = xzfyOrg;
	}

	public java.lang.String getUser1_id() {
		return user1_id;
	}

	public void setUser1_id(java.lang.String user1Id) {
		user1_id = user1Id;
	}

	public java.lang.String getUser1_name() {
		return user1_name;
	}

	public void setUser1_name(java.lang.String user1Name) {
		user1_name = user1Name;
	}

	public java.lang.String getUser2_id() {
		return user2_id;
	}

	public void setUser2_id(java.lang.String user2Id) {
		user2_id = user2Id;
	}

	public java.lang.String getUser2_name() {
		return user2_name;
	}

	public void setUser2_name(java.lang.String user2Name) {
		user2_name = user2Name;
	}

	public java.lang.String getUser3_id() {
		return user3_id;
	}

	public void setUser3_id(java.lang.String user3Id) {
		user3_id = user3Id;
	}

	public java.lang.String getUser3_name() {
		return user3_name;
	}

	public void setUser3_name(java.lang.String user3Name) {
		user3_name = user3Name;
	}

	public java.lang.String getStatus() {
		return status;
	}

	public void setStatus(java.lang.String status) {
		this.status = status;
	}

	public java.lang.String getLian_date() {
		return lian_date;
	}

	public void setLian_date(java.lang.String lianDate) {
		lian_date = lianDate;
	}

	public java.lang.String getFinish_date() {
		return finish_date;
	}

	public void setFinish_date(java.lang.String finishDate) {
		finish_date = finishDate;
	}

	public java.lang.String getBuzheng_from() {
		return buzheng_from;
	}

	public void setBuzheng_from(java.lang.String buzhengFrom) {
		buzheng_from = buzhengFrom;
	}

	public java.lang.String getBuzheng_to() {
		return buzheng_to;
	}

	public void setBuzheng_to(java.lang.String buzhengTo) {
		buzheng_to = buzhengTo;
	}

	public String getLian_real_date() {
		return lian_real_date;
	}

	public void setLian_real_date(String lianRealDate) {
		lian_real_date = lianRealDate;
	}

	public String getFinish_real_date() {
		return finish_real_date;
	}

	public void setFinish_real_date(String finishRealDate) {
		finish_real_date = finishRealDate;
	}

	public java.lang.String getFenpei_id() {
		return fenpei_id;
	}

	public void setFenpei_id(java.lang.String fenpeiId) {
		fenpei_id = fenpeiId;
	}

	public java.lang.String getFenpei_name() {
		return fenpei_name;
	}

	public void setFenpei_name(java.lang.String fenpeiName) {
		fenpei_name = fenpeiName;
	}

	public java.lang.String getIsdelay() {
		return isdelay;
	}

	public void setIsdelay(java.lang.String isdelay) {
		this.isdelay = isdelay;
	}

	public java.lang.String getIsdelay_from() {
		return isdelay_from;
	}

	public void setIsdelay_from(java.lang.String isdelayFrom) {
		isdelay_from = isdelayFrom;
	}

	public java.lang.String getIsdelay_to() {
		return isdelay_to;
	}

	public void setIsdelay_to(java.lang.String isdelayTo) {
		isdelay_to = isdelayTo;
	}

	public java.lang.String getIsstop() {
		return isstop;
	}

	public void setIsstop(java.lang.String isstop) {
		this.isstop = isstop;
	}

	public java.lang.String getIsstop_from() {
		return isstop_from;
	}

	public void setIsstop_from(java.lang.String isstopFrom) {
		isstop_from = isstopFrom;
	}

	public java.lang.String getIsstop_to() {
		return isstop_to;
	}

	public void setIsstop_to(java.lang.String isstopTo) {
		isstop_to = isstopTo;
	}

	public java.lang.String getFinish_type() {
		return finish_type;
	}

	public void setFinish_type(java.lang.String finishType) {
		finish_type = finishType;
	}

	public java.lang.String getCheck_status() {
		return check_status;
	}

	public void setCheck_status(java.lang.String checkStatus) {
		check_status = checkStatus;
	}

	public java.lang.String getHas_tingzheng() {
		return has_tingzheng;
	}

	public void setHas_tingzheng(java.lang.String hasTingzheng) {
		has_tingzheng = hasTingzheng;
	}

	public java.lang.String getResarch() {
		return resarch;
	}

	public void setResarch(java.lang.String resarch) {
		this.resarch = resarch;
	}

	public java.lang.String getIs_commit() {
		return is_commit;
	}

	public void setIs_commit(java.lang.String isCommit) {
		is_commit = isCommit;
	}

	public java.lang.String getOther_commit() {
		return other_commit;
	}

	public void setOther_commit(java.lang.String otherCommit) {
		other_commit = otherCommit;
	}

	public java.lang.String getMid_tiaojie() {
		return mid_tiaojie;
	}

	public void setMid_tiaojie(java.lang.String midTiaojie) {
		mid_tiaojie = midTiaojie;
	}

	public java.lang.String getDelay_detail() {
		return delay_detail;
	}

	public void setDelay_detail(java.lang.String delayDetail) {
		delay_detail = delayDetail;
	}

	public java.lang.String getStop_detail() {
		return stop_detail;
	}

	public void setStop_detail(java.lang.String stopDetail) {
		stop_detail = stopDetail;
	}

	public java.lang.String getDelay_reason() {
		return delay_reason;
	}

	public void setDelay_reason(java.lang.String delayReason) {
		delay_reason = delayReason;
	}

	public java.lang.String getStop_reason() {
		return stop_reason;
	}

	public void setStop_reason(java.lang.String stopReason) {
		stop_reason = stopReason;
	}

	public java.lang.String getCasenum() {
		return casenum;
	}

	public void setCasenum(java.lang.String casenum) {
		this.casenum = casenum;
	}

	public java.lang.String getCaseyear() {
		return caseyear;
	}

	public void setCaseyear(java.lang.String caseyear) {
		this.caseyear = caseyear;
	}

	public java.lang.String getCaseindex() {
		return caseindex;
	}

	public void setCaseindex(java.lang.String caseindex) {
		this.caseindex = caseindex;
	}

	public java.lang.String getCaseorg() {
		return caseorg;
	}

	public void setCaseorg(java.lang.String caseorg) {
		this.caseorg = caseorg;
	}

	public java.lang.String getCasestatus() {
		return casestatus;
	}

	public void setCasestatus(java.lang.String casestatus) {
		this.casestatus = casestatus;
	}

	public java.lang.String getCurrentuser() {
		return currentuser;
	}

	public void setCurrentuser(java.lang.String currentuser) {
		this.currentuser = currentuser;
	}

	private java.lang.String is_commit;

	private java.lang.String other_commit;

	private java.lang.String mid_tiaojie;

	private java.lang.String delay_detail;

	private java.lang.String stop_detail;

	private java.lang.String delay_reason;

	private java.lang.String stop_reason;

	private java.lang.String casenum;

	private java.lang.String caseyear;

	private java.lang.String caseindex;

	private java.lang.String caseorg;

	private java.lang.String casestatus;

	private java.lang.String currentuser;

	private String songdaquerenFlag;

	private String dbrDetail;

	private String dftzstatus;

	private String lianspdate;
	private String buzhengspdate;
	private String yanqispdate;
	private String zhongzhispdate;
	private String huifuspdate;
	private String jieanspdate;
	private String handleReason;
	private String buzhengDelay;

	// relations

	public String getBuzhengDelay() {
		return buzhengDelay;
	}

	public void setBuzhengDelay(String buzhengDelay) {
		this.buzhengDelay = buzhengDelay;
	}

	public String getHandleReason() {
		return handleReason;
	}

	public void setHandleReason(String handleReason) {
		this.handleReason = handleReason;
	}

//	private Set xzfyApps = new LinkedHashSet();

	/*private Set<XzfyInfoFile> xzfyInfoFile = new LinkedHashSet<XzfyInfoFile>();
*/
	/*public Set getXzfyApps() {
		return xzfyApps;
	}

	public void setXzfyApps(Set xzfyApps) {
		this.xzfyApps = xzfyApps;
	}*/

//	private Set<XzfyAgent> xzfyAgents = new LinkedHashSet<XzfyAgent>();

	/*public Set<XzfyAgent> getXzfyAgents() {
		return xzfyAgents;
	}

	public void setXzfyAgents(Set<XzfyAgent> xzfyAgents) {
		this.xzfyAgents = xzfyAgents;
	}
*/
	public java.lang.String getApp_type() {
		return app_type;
	}

	public void setApp_type(java.lang.String appType) {
		app_type = appType;
	}

	public java.lang.String getApp_type1() {
		return app_type1;
	}

	public void setApp_type1(java.lang.String appType1) {
		app_type1 = appType1;
	}

	

	public String getTiaojie_count() {
		return tiaojie_count;
	}

	public void setTiaojie_count(String tiaojie_count) {
		this.tiaojie_count = tiaojie_count;
	}

	public java.lang.String getApp_type2() {
		return app_type2;
	}

	public void setApp_type2(java.lang.String app_type2) {
		this.app_type2 = app_type2;
	}

	public String getJdRenshu() {
		return jdRenshu;
	}

	public void setJdRenshu(String jdRenshu) {
		this.jdRenshu = jdRenshu;
	}

	public String getIsMany() {
		return isMany;
	}

	public void setIsMany(String isMany) {
		this.isMany = isMany;
	}

	public String getSafeContent() {
		return safeContent;
	}

	public void setSafeContent(String safeContent) {
		this.safeContent = safeContent;
	}

	public String getJdFileContent() {
		return jdFileContent;
	}

	public void setJdFileContent(String jdFileContent) {
		this.jdFileContent = jdFileContent;
	}

	public String getJdGzContent() {
		return jdGzContent;
	}

	public void setJdGzContent(String jdGzContent) {
		this.jdGzContent = jdGzContent;
	}

	public String getJdBzContent() {
		return jdBzContent;
	}

	public void setJdBzContent(String jdBzContent) {
		this.jdBzContent = jdBzContent;
	}

	public String gettAppDeptId() {
		return tAppDeptId;
	}

	public void settAppDeptId(String tAppDeptId) {
		this.tAppDeptId = tAppDeptId;
	}

	public String gettPoliceIsParade() {
		return tPoliceIsParade;
	}

	public void settPoliceIsParade(String tPoliceIsParade) {
		this.tPoliceIsParade = tPoliceIsParade;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getReception() {
		return reception;
	}

	public void setReception(String reception) {
		this.reception = reception;
	}

	public String getReception2() {
		return reception2;
	}

	public void setReception2(String reception2) {
		this.reception2 = reception2;
	}

	public String getRefer() {
		return refer;
	}

	public void setRefer(String refer) {
		this.refer = refer;
	}

	public String getRefer2() {
		return refer2;
	}

	public void setRefer2(String refer2) {
		this.refer2 = refer2;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	public String getKeyword3() {
		return keyword3;
	}

	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}

	public String getRenCount() {
		return renCount;
	}

	public void setRenCount(String renCount) {
		this.renCount = renCount;
	}

	public void setAgentDetail(String agentDetail) {
		this.agentDetail = agentDetail;
	}

	public String getAgentDetail() {
		return agentDetail;
	}

	public String getIsAnswer() {
		return isAnswer;
	}

	public void setIsAnswer(String isAnswer) {
		this.isAnswer = isAnswer;
	}

	public String getSentAnswerDate() {
		return sentAnswerDate;
	}

	public void setSentAnswerDate(String sentAnswerDate) {
		this.sentAnswerDate = sentAnswerDate;
	}

	public String getReceiveAnswerDate() {
		return receiveAnswerDate;
	}

	public void setReceiveAnswerDate(String receiveAnswerDate) {
		this.receiveAnswerDate = receiveAnswerDate;
	}

	public String getTrailMode() {
		return trailMode;
	}

	public void setTrailMode(String trailMode) {
		this.trailMode = trailMode;
	}

	public String getOtherTrailMode() {
		return otherTrailMode;
	}

	public void setOtherTrailMode(String otherTrailMode) {
		this.otherTrailMode = otherTrailMode;
	}

	public String getSecondSubmitResult() {
		return secondSubmitResult;
	}

	public void setSecondSubmitResult(String secondSubmitResult) {
		this.secondSubmitResult = secondSubmitResult;
	}

	public String getSecondSubmitDate() {
		return secondSubmitDate;
	}

	public void setSecondSubmitDate(String secondSubmitDate) {
		this.secondSubmitDate = secondSubmitDate;
	}

	public String getDelayReport() {
		return delayReport;
	}

	public void setDelayReport(String delayReport) {
		this.delayReport = delayReport;
	}

	public String getDelayTo() {
		return delayTo;
	}

	public void setDelayTo(String delayTo) {
		this.delayTo = delayTo;
	}

	public String getDelayAdvice() {
		return delayAdvice;
	}

	public void setDelayAdvice(String delayAdvice) {
		this.delayAdvice = delayAdvice;
	}

	public String getIsBreak() {
		return isBreak;
	}

	public void setIsBreak(String isBreak) {
		this.isBreak = isBreak;
	}

	public String getBreakReport() {
		return breakReport;
	}

	public void setBreakReport(String breakReport) {
		this.breakReport = breakReport;
	}

	public String getBreakTo() {
		return breakTo;
	}

	public void setBreakTo(String breakTo) {
		this.breakTo = breakTo;
	}

	public String getBreakAdvice() {
		return breakAdvice;
	}

	public void setBreakAdvice(String breakAdvice) {
		this.breakAdvice = breakAdvice;
	}

	public String getCheck_id() {
		return check_id;
	}

	public void setCheck_id(String checkId) {
		check_id = checkId;
	}

	public String getCheck_name() {
		return check_name;
	}

	public void setCheck_name(String checkName) {
		check_name = checkName;
	}

	public String getLaixin_name() {
		return laixin_name;
	}

	public void setLaixin_name(String laixinName) {
		laixin_name = laixinName;
	}

	public String getLaixin_address() {
		return laixin_address;
	}

	public void setLaixin_address(String laixinAddress) {
		laixin_address = laixinAddress;
	}

	public String getLaixin_post() {
		return laixin_post;
	}

	public void setLaixin_post(String laixinPost) {
		laixin_post = laixinPost;
	}

	public String getLaixin_tel() {
		return laixin_tel;
	}

	public void setLaixin_tel(String laixinTel) {
		laixin_tel = laixinTel;
	}

	public String getZhize() {
		return zhize;
	}

	public void setZhize(String zhize) {
		this.zhize = zhize;
	}

	public String getXwname() {
		return xwname;
	}

	public void setXwname(String xwname) {
		this.xwname = xwname;
	}

	public String getXwnum() {
		return xwnum;
	}

	public void setXwnum(String xwnum) {
		this.xwnum = xwnum;
	}

	/*
	 * private Set<XzfyDftz> xzfyDftzs = new LinkedHashSet<XzfyDftz>();
	 * 
	 * public Set<XzfyDftz> getXzfyDftzs() { return xzfyDftzs; } public void
	 * setXzfyDftzs(Set<XzfyDftz> xzfyDftzs) { this.xzfyDftzs = xzfyDftzs; }
	 */
	public String getReceive_type() {
		return receive_type;
	}

	public void setReceive_type(String receiveType) {
		receive_type = receiveType;
	}

	public String getApp_show() {
		return app_show;
	}

	public void setApp_show(String appShow) {
		app_show = appShow;
	}

	public String getTime_show() {
		return time_show;
	}

	public void setTime_show(String timeShow) {
		time_show = timeShow;
	}

	public String getJdbl_flag() {
		return jdbl_flag;
	}

	public void setJdbl_flag(String jdblFlag) {
		jdbl_flag = jdblFlag;
	}

	public String getShouju_flag() {
		return shouju_flag;
	}

	public void setShouju_flag(String shoujuFlag) {
		shouju_flag = shoujuFlag;
	}

	public String getBztz_flag() {
		return bztz_flag;
	}

	public void setBztz_flag(String bztzFlag) {
		bztz_flag = bztzFlag;
	}

	/*private Set<XzfyShenpi> xzfyShenpis = new LinkedHashSet<XzfyShenpi>();

	public Set<XzfyShenpi> getXzfyShenpis() {
		return xzfyShenpis;
	}

	public void setXzfyShenpis(Set<XzfyShenpi> xzfyShenpis) {
		this.xzfyShenpis = xzfyShenpis;
	}*/

	public String getTiaojie_result() {
		return tiaojie_result;
	}

	public void setTiaojie_result(String tiaojieResult) {
		tiaojie_result = tiaojieResult;
	}

	public String getFirstSubmitResult() {
		return firstSubmitResult;
	}

	public void setFirstSubmitResult(String firstSubmitResult) {
		this.firstSubmitResult = firstSubmitResult;
	}

	public String getFirstSubmitDate() {
		return firstSubmitDate;
	}

	public void setFirstSubmitDate(String firstSubmitDate) {
		this.firstSubmitDate = firstSubmitDate;
	}

	public String getTjzfzh() {
		return tjzfzh;
	}

	public void setTjzfzh(String tjzfzh) {
		this.tjzfzh = tjzfzh;
	}

	public String getContent_abstract() {
		return content_abstract;
	}

	public void setContent_abstract(String contentAbstract) {
		content_abstract = contentAbstract;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getFinishBreakType() {
		return finishBreakType;
	}

	public void setFinishBreakType(String finishBreakType) {
		this.finishBreakType = finishBreakType;
	}

	public String getNationMoney() {
		return nationMoney;
	}

	public void setNationMoney(String nationMoney) {
		this.nationMoney = nationMoney;
	}

	public String getNationMoneyDetail() {
		return nationMoneyDetail;
	}

	public void setNationMoneyDetail(String nationMoneyDetail) {
		this.nationMoneyDetail = nationMoneyDetail;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getEndFile() {
		return endFile;
	}

	public void setEndFile(String endFile) {
		this.endFile = endFile;
	}

	public String getAdvise() {
		return advise;
	}

	public void setAdvise(String advise) {
		this.advise = advise;
	}

	public String getOpinionFile() {
		return opinionFile;
	}

	public void setOpinionFile(String opinionFile) {
		this.opinionFile = opinionFile;
	}

	public String getAdviseFile() {
		return adviseFile;
	}

	public void setAdviseFile(String adviseFile) {
		this.adviseFile = adviseFile;
	}

	public String getPizhunren() {
		return pizhunren;
	}

	public void setPizhunren(String pizhunren) {
		this.pizhunren = pizhunren;
	}

	public String getPizhunriqi() {
		return pizhunriqi;
	}

	public void setPizhunriqi(String pizhunriqi) {
		this.pizhunriqi = pizhunriqi;
	}

	public void setDeputy_show(String deputy_show) {
		this.deputy_show = deputy_show;
	}

	public String getDeputy_show() {
		return deputy_show;
	}

	public String getPifuyijian() {
		return pifuyijian;
	}

	public void setPifuyijian(String pifuyijian) {
		this.pifuyijian = pifuyijian;
	}

	/*private Set<XzfyXcdc> xzfyXcdcs = new LinkedHashSet<XzfyXcdc>();

	public Set<XzfyXcdc> getXzfyXcdcs() {
		return xzfyXcdcs;
	}

	public void setXzfyXcdcs(Set<XzfyXcdc> xzfyXcdcs) {
		this.xzfyXcdcs = xzfyXcdcs;
	}
*/
	public String getCasetype2() {
		return casetype2;
	}

	public void setCasetype2(String casetype2) {
		this.casetype2 = casetype2;
	}

	public void setCasetype(String casetype) {
		this.casetype = casetype;
	}

	public String getCasetype() {
		return casetype;
	}

	public void setReferother(String referother) {
		this.referother = referother;
	}

	public String getReferother() {
		return referother;
	}

	public String getPizhunren1() {
		return pizhunren1;
	}

	public void setPizhunren1(String pizhunren1) {
		this.pizhunren1 = pizhunren1;
	}

	public String getPizhunriqi1() {
		return pizhunriqi1;
	}

	public void setPizhunriqi1(String pizhunriqi1) {
		this.pizhunriqi1 = pizhunriqi1;
	}

	public String getPifuyijian1() {
		return pifuyijian1;
	}

	public void setPifuyijian1(String pifuyijian1) {
		this.pifuyijian1 = pifuyijian1;
	}

	public String getPizhunren2() {
		return pizhunren2;
	}

	public void setPizhunren2(String pizhunren2) {
		this.pizhunren2 = pizhunren2;
	}

	public String getPizhunriqi2() {
		return pizhunriqi2;
	}

	public void setPizhunriqi2(String pizhunriqi2) {
		this.pizhunriqi2 = pizhunriqi2;
	}

	public String getPifuyijian2() {
		return pifuyijian2;
	}

	public void setPifuyijian2(String pifuyijian2) {
		this.pifuyijian2 = pifuyijian2;
	}

	public String getTiaojiejilu() {
		return tiaojiejilu;
	}

	public void setTiaojiejilu(String tiaojiejilu) {
		this.tiaojiejilu = tiaojiejilu;
	}

	public String getTiaojiejilu1() {
		return tiaojiejilu1;
	}

	public void setTiaojiejilu1(String tiaojiejilu1) {
		this.tiaojiejilu1 = tiaojiejilu1;
	}

	public String getIsBuzheng() {
		return isBuzheng;
	}

	public void setIsBuzheng(String isBuzheng) {
		this.isBuzheng = isBuzheng;
	}

	public String getIsBuzhengshenpi() {
		return isBuzhengshenpi;
	}

	public void setIsBuzhengshenpi(String isBuzhengshenpi) {
		this.isBuzhengshenpi = isBuzhengshenpi;
	}

	public String getBzTongzhiriqi() {
		return bzTongzhiriqi;
	}

	public void setBzTongzhiriqi(String bzTongzhiriqi) {
		this.bzTongzhiriqi = bzTongzhiriqi;
	}

	public String getBzBuqiriqi() {
		return bzBuqiriqi;
	}

	public void setBzBuqiriqi(String bzBuqiriqi) {
		this.bzBuqiriqi = bzBuqiriqi;
	}

	public String getBzTongzhifangshi() {
		return bzTongzhifangshi;
	}

	public void setBzTongzhifangshi(String bzTongzhifangshi) {
		this.bzTongzhifangshi = bzTongzhifangshi;
	}

	public void setReceive_real_date(java.lang.String receive_real_date) {
		this.receive_real_date = receive_real_date;
	}

	public java.lang.String getReceive_real_date() {
		return receive_real_date;
	}

	public String getBzAdvice() {
		return bzAdvice;
	}

	public void setBzAdvice(String bzAdvice) {
		this.bzAdvice = bzAdvice;
	}

	public String getLaAdvice() {
		return laAdvice;
	}

	public void setLaAdvice(String laAdvice) {
		this.laAdvice = laAdvice;
	}

	public String getJaAdvice() {
		return jaAdvice;
	}

	public void setJaAdvice(String jaAdvice) {
		this.jaAdvice = jaAdvice;
	}

	public void setStadardResult(String stadardResult) {
		this.stadardResult = stadardResult;
	}

	public String getStadardResult() {
		return stadardResult;
	}

	public void setSongdaquerenFlag(String songdaquerenFlag) {
		this.songdaquerenFlag = songdaquerenFlag;
	}

	public String getSongdaquerenFlag() {
		return songdaquerenFlag;
	}

	public void setDbrDetail(String dbrDetail) {
		this.dbrDetail = dbrDetail;
	}

	public String getDbrDetail() {
		return dbrDetail;
	}

	public String getPizhunren3() {
		return pizhunren3;
	}

	public void setPizhunren3(String pizhunren3) {
		this.pizhunren3 = pizhunren3;
	}

	public String getPifuyijian3() {
		return pifuyijian3;
	}

	public void setPifuyijian3(String pifuyijian3) {
		this.pifuyijian3 = pifuyijian3;
	}

	public String getDftzstatus() {
		return dftzstatus;
	}

	public void setDftzstatus(String dftzstatus) {
		this.dftzstatus = dftzstatus;
	}

	/*public Set<XzfyInfoFile> getXzfyInfoFile() {
		return xzfyInfoFile;
	}

	public void setXzfyInfoFile(Set<XzfyInfoFile> xzfyInfoFile) {
		this.xzfyInfoFile = xzfyInfoFile;
	}
*/
	public String getLianspdate() {
		return lianspdate;
	}

	public void setLianspdate(String lianspdate) {
		this.lianspdate = lianspdate;
	}

	public String getBuzhengspdate() {
		return buzhengspdate;
	}

	public void setBuzhengspdate(String buzhengspdate) {
		this.buzhengspdate = buzhengspdate;
	}

	public String getYanqispdate() {
		return yanqispdate;
	}

	public void setYanqispdate(String yanqispdate) {
		this.yanqispdate = yanqispdate;
	}

	public String getZhongzhispdate() {
		return zhongzhispdate;
	}

	public void setZhongzhispdate(String zhongzhispdate) {
		this.zhongzhispdate = zhongzhispdate;
	}

	public String getHuifuspdate() {
		return huifuspdate;
	}

	public void setHuifuspdate(String huifuspdate) {
		this.huifuspdate = huifuspdate;
	}

	public String getJieanspdate() {
		return jieanspdate;
	}

	public void setJieanspdate(String jieanspdate) {
		this.jieanspdate = jieanspdate;
	}

	public String getYijian_file() {
		return yijian_file;
	}

	public void setYijian_file(String yijianFile) {
		yijian_file = yijianFile;
	}

	public String getJianyi_file() {
		return jianyi_file;
	}

	public void setJianyi_file(String jianyiFile) {
		jianyi_file = jianyiFile;
	}

	public String getBsqrSpecial() {
		return bsqrSpecial;
	}

	public void setBsqrSpecial(String bsqrSpecial) {
		this.bsqrSpecial = bsqrSpecial;
	}

}
