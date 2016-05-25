package com.taiji.zxfy.zxsq.domain;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 案件信息实体
 * 
 * @author 武金磊
 * @Date 2014-10-28
 * 
 */
public class InfoModel {
	// yyyyMMddHHmmssSSS+3位随机,主键
	private String id;
	// 接收日期(申请时间)
	private String receiveDate;
	// 实际接收时间
	private String receiveRealDate;
	// 接待地点
	private String receiveAddress;
	// 申请人类别(1：公民 2：法人)
	private String appType;
	// 是否有代理人(0：无 1：有)
	private String agent;
	// 委托代理人姓名
	private String agentName;
	// 是否有委托授权书
	private String proxy;
	// 被申请人种类(数据字典)
	private String defendantType;
	// 被申请人名称字典项(数据字典,与Defendant_type联动)
	private String defendantName;
	// 被申请人名称(记录被申请人的真实名称，此处主要考虑选择其他时需要填写)
	private String defendantRealName;
	// 是否行政不作为(0：否2：是)
	private String isManage;
	// 行政管理类别（不作为）(数据字段，Ismanage=1时才会填写)
	private String manageType;
	// 不作为事项(数据字段，Ismanage=1时才会填写)
	private String matterType;
	// 不作为事项明细(数据字段，Ismanage=1时才会填写)
	private String matterDetail;
	// 申请人曾经要求被申请人履行何种法定职责(数据字段，Ismanage=1时才会填写)
	private String duty;
	// 要求被申请人履行日期(数据字段，Ismanage=1时才会填写)
	private String executeDate;
	// 是否有曾要求履责而未履行的证明材料(数据字段，Ismanage=1时才会填写,0：否 1：是)
	private String isProf;
	// 是否有曾要求履责而未履行的证明材料明细(数据字段，Ismanage=1时才会填写)
	private String isProfDetail;
	// 要求复议的具体行政行为情况(Ismanage=0时，需要填写子表)
	private String requireFy;
	// 该具体行政行为侵害申请人何种合法权益
	private String breakRight;
	// 行政复议请求(数据字典)
	private String xzfyRequset;
	// 行政复议请求明细
	private String xzfyRequsetRetail;
	// 接待情况(1：接收 2：告知 3：补正)
	private String conditionType;
	// 接收情况
	private String receiveDetail;
	// 被接待人意见(申请人意见)
	private String appAdviceType;
	// 被接待人意见明细(事实理由)
	private String appAdviceDetail;
	// 申请复议事项大类
	private String appType1;
	// 申请复议事项小类
	private BigDecimal appType2;
	// 行政管理类别大类
	private String guanli1;
	// 行政管理类别小类
	private String guanli2;
	// 行政管理类别其他描述
	private String guanli3;
	// 复议机关
	private String xzfyOrg;
	// 立案审查人id
	private String user1Id;
	// 立案审查人姓名
	private String user1Name;
	// 承办人id
	private String user2Id;
	// 承办人姓名
	private String user2Name;
	// 第二承办人id
	private String user3Id;
	// 第二承办人姓名
	private String user3Name;
	/**
	 * 案件状态 Status—0 接待阶段 1 立案（立案审查人接收，如果未接收，一直是接待阶段） 2 补正审批 3 立案审批 4 案件办理 5
	 * 延期审批 6、案件延期 7、中止审批 8、案件中止 9、恢复审理审批 10、恢复审理 11、结案审批 12、结案
	 */
	private String status;
	// 立案日期
	private String lianDate;
	// 结案日期
	private String finishDate;
	// 补正开始日期
	private String buzhengFrom;
	// 补正截止日期
	private String buzhengTo;
	// 实际立案日期
	private String lianRealDate;
	// 实际结案日期
	private String finishRealDate;
	// 是否延期(0：否 1：是)
	private String isDelay;
	// 延期开始日期
	private String isDelayFrom;
	// 延期结束日期
	private String isDelayTo;
	// 是否中止(0：否 1：是)
	private String isStop;
	// 中止开始日期
	private String isStopFrom;
	// 中止结束日期
	private String isStopTo;
	// 结案方式
	private String finishType;
	// 审批状态(0：未审批 1：审批中，无法继续办理)
	private String checkStatus;
	// 延期事由
	private String delayDetail;
	// 恢复审理事由延期
	private String delayReason;
	// 恢复审理事由中止
	private String stop_reason;
	// 案件编号(申请码)
	private String caseNum;
	// 案件年号
	private String caseYear;
	// 案件序号(案件代码)
	private String caseIndex;
	// 案件受理单位
	private String caseOrg;
	// 申请人明细
	private String appDetail;
	// 接待人数
	private String jdRenShu;
	// 被申请人localBM
	private String tApplicationDeptId;
	// 统计关键词(1: 属于复议范围 2: 不属于复议范围 3: 复议案件审理)
	private String keyWord;
	// 案件类型
	private String caseType;
	// 案件类型2
	private String caseType2;
	// 行政复议管理类别1
	private String refer;
	// 行政复议管理类别2
	private String refer2;
	// 申请人人数
	private String renCount;
	// 法人申请人明细
	private String agentDetail;
	// 被复议的具体行为-名称
	private String xwName;
	// 被复议的具体行为-案号
	private String xwNum;
	// 接受方式(1.当面 2.信件 3.邮件 4.在线)
	private String receiveType;
	// 申请人页面显示
	private String appShow;
	// 审查人意见
	private String firstSubmitResult;
	// 京政复字号
	private String tJzfzh;
	// 结案方式2
	private String finishBreakType;
	// 结案文书
	private String endFile;
	// 是否补正
	private String isBuZheng;
	// 补证内容类型标识
	private String buzhengContentType;
	// 是否补正审批
	private String isBuZhengShenPi;
	// 通知补正日期
	private String bzTongZhiRiQi;
	// 补齐材料日期
	private String bzBuQiRiQi;
	// 通知补正方式
	private String bzTongZhiFanShi;
	//申请进度
	private String jinDu;
	//同步标识
	private String flag;

	private Set AppModels = new LinkedHashSet();

	public Set getAppModels() {
		return AppModels;
	}

	public void setAppModels(Set appModels) {
		AppModels = appModels;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getReceiveRealDate() {
		return receiveRealDate;
	}

	public void setReceiveRealDate(String receiveRealDate) {
		this.receiveRealDate = receiveRealDate;
	}

	public String getReceiveAddress() {
		return receiveAddress;
	}

	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}

	public String getAppType() {
		return appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getAgentName() {
		return agentName;
	}

	public void setAgentName(String agentName) {
		this.agentName = agentName;
	}

	public String getProxy() {
		return proxy;
	}

	public void setProxy(String proxy) {
		this.proxy = proxy;
	}

	public String getDefendantType() {
		return defendantType;
	}

	public void setDefendantType(String defendantType) {
		this.defendantType = defendantType;
	}

	public String getDefendantName() {
		return defendantName;
	}

	public void setDefendantName(String defendantName) {
		this.defendantName = defendantName;
	}

	public String getDefendantRealName() {
		return defendantRealName;
	}

	public void setDefendantRealName(String defendantRealName) {
		this.defendantRealName = defendantRealName;
	}

	public String getIsManage() {
		return isManage;
	}

	public void setIsManage(String isManage) {
		this.isManage = isManage;
	}

	public String getManageType() {
		return manageType;
	}

	public void setManageType(String manageType) {
		this.manageType = manageType;
	}

	public String getMatterType() {
		return matterType;
	}

	public void setMatterType(String matterType) {
		this.matterType = matterType;
	}

	public String getMatterDetail() {
		return matterDetail;
	}

	public void setMatterDetail(String matterDetail) {
		this.matterDetail = matterDetail;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getExecuteDate() {
		return executeDate;
	}

	public void setExecuteDate(String executeDate) {
		this.executeDate = executeDate;
	}

	public String getIsProf() {
		return isProf;
	}

	public void setIsProf(String isProf) {
		this.isProf = isProf;
	}

	public String getIsProfDetail() {
		return isProfDetail;
	}

	public void setIsProfDetail(String isProfDetail) {
		this.isProfDetail = isProfDetail;
	}

	public String getRequireFy() {
		return requireFy;
	}

	public void setRequireFy(String requireFy) {
		this.requireFy = requireFy;
	}

	public String getBreakRight() {
		return breakRight;
	}

	public void setBreakRight(String breakRight) {
		this.breakRight = breakRight;
	}

	public String getXzfyRequset() {
		return xzfyRequset;
	}

	public void setXzfyRequset(String xzfyRequset) {
		this.xzfyRequset = xzfyRequset;
	}

	public String getXzfyRequsetRetail() {
		return xzfyRequsetRetail;
	}

	public void setXzfyRequsetRetail(String xzfyRequsetRetail) {
		this.xzfyRequsetRetail = xzfyRequsetRetail;
	}

	public String getConditionType() {
		return conditionType;
	}

	public void setConditionType(String conditionType) {
		this.conditionType = conditionType;
	}

	public String getReceiveDetail() {
		return receiveDetail;
	}

	public void setReceiveDetail(String receiveDetail) {
		this.receiveDetail = receiveDetail;
	}

	public String getAppAdviceType() {
		return appAdviceType;
	}

	public void setAppAdviceType(String appAdviceType) {
		this.appAdviceType = appAdviceType;
	}

	public String getAppAdviceDetail() {
		return appAdviceDetail;
	}

	public void setAppAdviceDetail(String appAdviceDetail) {
		this.appAdviceDetail = appAdviceDetail;
	}

	public String getAppType1() {
		return appType1;
	}

	public void setAppType1(String appType1) {
		this.appType1 = appType1;
	}

	public BigDecimal getAppType2() {
		return appType2;
	}

	public void setAppType2(BigDecimal appType2) {
		this.appType2 = appType2;
	}

	public String getGuanli1() {
		return guanli1;
	}

	public void setGuanli1(String guanli1) {
		this.guanli1 = guanli1;
	}

	public String getGuanli2() {
		return guanli2;
	}

	public void setGuanli2(String guanli2) {
		this.guanli2 = guanli2;
	}

	public String getGuanli3() {
		return guanli3;
	}

	public void setGuanli3(String guanli3) {
		this.guanli3 = guanli3;
	}

	public String getXzfyOrg() {
		return xzfyOrg;
	}

	public void setXzfyOrg(String xzfyOrg) {
		this.xzfyOrg = xzfyOrg;
	}

	public String getUser1Id() {
		return user1Id;
	}

	public void setUser1Id(String user1Id) {
		this.user1Id = user1Id;
	}

	public String getUser1Name() {
		return user1Name;
	}

	public void setUser1Name(String user1Name) {
		this.user1Name = user1Name;
	}

	public String getUser2Id() {
		return user2Id;
	}

	public void setUser2Id(String user2Id) {
		this.user2Id = user2Id;
	}

	public String getUser2Name() {
		return user2Name;
	}

	public void setUser2Name(String user2Name) {
		this.user2Name = user2Name;
	}

	public String getUser3Id() {
		return user3Id;
	}

	public void setUser3Id(String user3Id) {
		this.user3Id = user3Id;
	}

	public String getUser3Name() {
		return user3Name;
	}

	public void setUser3Name(String user3Name) {
		this.user3Name = user3Name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLianDate() {
		return lianDate;
	}

	public void setLianDate(String lianDate) {
		this.lianDate = lianDate;
	}

	public String getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	public String getBuzhengFrom() {
		return buzhengFrom;
	}

	public void setBuzhengFrom(String buzhengFrom) {
		this.buzhengFrom = buzhengFrom;
	}

	public String getBuzhengTo() {
		return buzhengTo;
	}

	public void setBuzhengTo(String buzhengTo) {
		this.buzhengTo = buzhengTo;
	}

	public String getLianRealDate() {
		return lianRealDate;
	}

	public void setLianRealDate(String lianRealDate) {
		this.lianRealDate = lianRealDate;
	}

	public String getFinishRealDate() {
		return finishRealDate;
	}

	public void setFinishRealDate(String finishRealDate) {
		this.finishRealDate = finishRealDate;
	}

	public String getIsDelay() {
		return isDelay;
	}

	public void setIsDelay(String isDelay) {
		this.isDelay = isDelay;
	}

	public String getIsDelayFrom() {
		return isDelayFrom;
	}

	public void setIsDelayFrom(String isDelayFrom) {
		this.isDelayFrom = isDelayFrom;
	}

	public String getIsDelayTo() {
		return isDelayTo;
	}

	public void setIsDelayTo(String isDelayTo) {
		this.isDelayTo = isDelayTo;
	}

	public String getIsStop() {
		return isStop;
	}

	public void setIsStop(String isStop) {
		this.isStop = isStop;
	}

	public String getIsStopFrom() {
		return isStopFrom;
	}

	public void setIsStopFrom(String isStopFrom) {
		this.isStopFrom = isStopFrom;
	}

	public String getIsStopTo() {
		return isStopTo;
	}

	public void setIsStopTo(String isStopTo) {
		this.isStopTo = isStopTo;
	}

	public String getFinishType() {
		return finishType;
	}

	public void setFinishType(String finishType) {
		this.finishType = finishType;
	}

	public String getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(String checkStatus) {
		this.checkStatus = checkStatus;
	}

	public String getDelayDetail() {
		return delayDetail;
	}

	public void setDelayDetail(String delayDetail) {
		this.delayDetail = delayDetail;
	}

	public String getDelayReason() {
		return delayReason;
	}

	public void setDelayReason(String delayReason) {
		this.delayReason = delayReason;
	}

	public String getStop_reason() {
		return stop_reason;
	}

	public void setStop_reason(String stop_reason) {
		this.stop_reason = stop_reason;
	}

	public String getCaseNum() {
		return caseNum;
	}

	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}

	public String getCaseYear() {
		return caseYear;
	}

	public void setCaseYear(String caseYear) {
		this.caseYear = caseYear;
	}

	public String getCaseIndex() {
		return caseIndex;
	}

	public void setCaseIndex(String caseIndex) {
		this.caseIndex = caseIndex;
	}

	public String getCaseOrg() {
		return caseOrg;
	}

	public void setCaseOrg(String caseOrg) {
		this.caseOrg = caseOrg;
	}

	public String getAppDetail() {
		return appDetail;
	}

	public void setAppDetail(String appDetail) {
		this.appDetail = appDetail;
	}

	public String getJdRenShu() {
		return jdRenShu;
	}

	public void setJdRenShu(String jdRenShu) {
		this.jdRenShu = jdRenShu;
	}

	public String gettApplicationDeptId() {
		return tApplicationDeptId;
	}

	public void settApplicationDeptId(String tApplicationDeptId) {
		this.tApplicationDeptId = tApplicationDeptId;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getCaseType() {
		return caseType;
	}

	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}

	public String getCaseType2() {
		return caseType2;
	}

	public void setCaseType2(String caseType2) {
		this.caseType2 = caseType2;
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

	public String getRenCount() {
		return renCount;
	}

	public void setRenCount(String renCount) {
		this.renCount = renCount;
	}

	public String getAgentDetail() {
		return agentDetail;
	}

	public void setAgentDetail(String agentDetail) {
		this.agentDetail = agentDetail;
	}

	public String getXwName() {
		return xwName;
	}

	public void setXwName(String xwName) {
		this.xwName = xwName;
	}

	public String getXwNum() {
		return xwNum;
	}

	public void setXwNum(String xwNum) {
		this.xwNum = xwNum;
	}

	public String getReceiveType() {
		return receiveType;
	}

	public void setReceiveType(String receiveType) {
		this.receiveType = receiveType;
	}

	public String getAppShow() {
		return appShow;
	}

	public void setAppShow(String appShow) {
		this.appShow = appShow;
	}

	public String getFirstSubmitResult() {
		return firstSubmitResult;
	}

	public void setFirstSubmitResult(String firstSubmitResult) {
		this.firstSubmitResult = firstSubmitResult;
	}

	public String gettJzfzh() {
		return tJzfzh;
	}

	public void settJzfzh(String tJzfzh) {
		this.tJzfzh = tJzfzh;
	}

	public String getFinishBreakType() {
		return finishBreakType;
	}

	public void setFinishBreakType(String finishBreakType) {
		this.finishBreakType = finishBreakType;
	}

	public String getEndFile() {
		return endFile;
	}

	public void setEndFile(String endFile) {
		this.endFile = endFile;
	}

	public String getIsBuZheng() {
		return isBuZheng;
	}

	public void setIsBuZheng(String isBuZheng) {
		this.isBuZheng = isBuZheng;
	}

	public String getBuzhengContentType() {
		return buzhengContentType;
	}

	public void setBuzhengContentType(String buzhengContentType) {
		this.buzhengContentType = buzhengContentType;
	}

	public String getIsBuZhengShenPi() {
		return isBuZhengShenPi;
	}

	public void setIsBuZhengShenPi(String isBuZhengShenPi) {
		this.isBuZhengShenPi = isBuZhengShenPi;
	}

	public String getBzTongZhiRiQi() {
		return bzTongZhiRiQi;
	}

	public void setBzTongZhiRiQi(String bzTongZhiRiQi) {
		this.bzTongZhiRiQi = bzTongZhiRiQi;
	}

	public String getBzBuQiRiQi() {
		return bzBuQiRiQi;
	}

	public void setBzBuQiRiQi(String bzBuQiRiQi) {
		this.bzBuQiRiQi = bzBuQiRiQi;
	}

	public String getBzTongZhiFanShi() {
		return bzTongZhiFanShi;
	}

	public void setBzTongZhiFanShi(String bzTongZhiFanShi) {
		this.bzTongZhiFanShi = bzTongZhiFanShi;
	}

	public String getJinDu() {
		return jinDu;
	}

	public void setJinDu(String jinDu) {
		this.jinDu = jinDu;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
