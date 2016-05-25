package com.taiji.fzb.domain;

import com.taiji.core.domain.Entity;

public class XzfyCompany extends Entity{
	
	/**********行政复议机关**********/
	private Integer id;
	private String workName;//单位名称
    private String address;//单位地址
    private String contact;//联系人
    private String fax;//传真
    
    private String caseNum;//案号

    /**********法定代表人********/
    private String representInLaw;//姓名
    private String position_Repnt;//职务
    private String telephone_Repnt;//电话（可选）
    
    /***************法制机构************/
    private String name_LegalInstitude;//法制机构名称
    private String property_LegalInstitude;//法制机构性质，值：
    //A.单列
    //B.不单列，但有专门编制
    //C.加挂牌子，无专门编制
    
    /****行政复议机构*****/
    private String quantity_Xzfy;//数量
    private String name_Xzfy;//名称
    private String staffing_Xzfy;//人员编制
    
    /****行政复议机构法定代表人*****/
    private String represent_Xzfy;//姓名
    private String position_Xzfy;//职务
    private String phone_Xzfy;//办公电话（必）
    private String mobile_Xzfy;//手机（可选）
    
    /****行政复议人员人数*****/
    private String numFull_XzfyStaff;//专职
    private String numPart_XzfyStaff;//兼职
    
    private String quantity_Hearing;//听证室数量
    private String quantity_Reading;//阅览室数量
    private String quantity_Receiving;//接待室数量
    private String car_Casing;//是否配备车辆
    private String quantity_Casing;//配备台数
    
    private String budgetInclude;//复议经费是否列入部门预算
    private String shenPiMode;//审批模式，值：
    //A.全部由行政复议机关领导签发
    //B.部分委托行政复议机构领导签发
    
    private String placeSetUp;//是否设置接待场所
    private String fullNameRect;//接待室全称
    private String detailAddressRect;//接待室详细地址
    private String foreignPhoneRect;//接待室对外电话
    
    
    
    
    private String corpCode;//单位编号

    
    /****************2015新增属性***************/   
    private String yingSuNum;//应诉号
    
    private String countOfFyCertAll;//复议机关有行政复议资格人数
    private String countOfFyCertFull;//行政复议人员（专职）-复议资格人数
    private String countOfFyCertPart;//行政复议人员（兼职）-复议资格人数
    
    private String countOfAdminAided;//行政辅助人员人数
    
    private String ysFirmExistsOrNot;//是否有行政应诉机构
    private String ysFirmName;//应诉机构名称
    private String staffAuthorized;//人员编制
    private String ysCountFull;//行政应诉人员人数（专职）
    private String ysCountPart;//行政应诉人员人数（兼职）
    
    private String updateDateFlag;//单位更新日期标识

	public Integer getId() {
		return id;
	}




	public void setId(Integer id) {
		this.id = id;
	}




	public String getWorkName() {
		return workName;
	}




	public void setWorkName(String workName) {
		this.workName = workName;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getContact() {
		return contact;
	}




	public void setContact(String contact) {
		this.contact = contact;
	}




	public String getFax() {
		return fax;
	}




	public void setFax(String fax) {
		this.fax = fax;
	}




	public String getRepresentInLaw() {
		return representInLaw;
	}




	public void setRepresentInLaw(String representInLaw) {
		this.representInLaw = representInLaw;
	}




	public String getPosition_Repnt() {
		return position_Repnt;
	}




	public void setPosition_Repnt(String positionRepnt) {
		position_Repnt = positionRepnt;
	}




	public String getTelephone_Repnt() {
		return telephone_Repnt;
	}




	public void setTelephone_Repnt(String telephoneRepnt) {
		telephone_Repnt = telephoneRepnt;
	}




	public String getName_LegalInstitude() {
		return name_LegalInstitude;
	}




	public void setName_LegalInstitude(String nameLegalInstitude) {
		name_LegalInstitude = nameLegalInstitude;
	}




	public String getProperty_LegalInstitude() {
		return property_LegalInstitude;
	}




	public void setProperty_LegalInstitude(String propertyLegalInstitude) {
		property_LegalInstitude = propertyLegalInstitude;
	}




	public String getQuantity_Xzfy() {
		return quantity_Xzfy;
	}




	public void setQuantity_Xzfy(String quantityXzfy) {
		quantity_Xzfy = quantityXzfy;
	}




	public String getName_Xzfy() {
		return name_Xzfy;
	}




	public void setName_Xzfy(String nameXzfy) {
		name_Xzfy = nameXzfy;
	}




	public String getStaffing_Xzfy() {
		return staffing_Xzfy;
	}




	public void setStaffing_Xzfy(String staffingXzfy) {
		staffing_Xzfy = staffingXzfy;
	}




	public String getRepresent_Xzfy() {
		return represent_Xzfy;
	}




	public void setRepresent_Xzfy(String representXzfy) {
		represent_Xzfy = representXzfy;
	}




	public String getPosition_Xzfy() {
		return position_Xzfy;
	}




	public void setPosition_Xzfy(String positionXzfy) {
		position_Xzfy = positionXzfy;
	}




	public String getPhone_Xzfy() {
		return phone_Xzfy;
	}




	public void setPhone_Xzfy(String phoneXzfy) {
		phone_Xzfy = phoneXzfy;
	}




	public String getMobile_Xzfy() {
		return mobile_Xzfy;
	}




	public void setMobile_Xzfy(String mobileXzfy) {
		mobile_Xzfy = mobileXzfy;
	}




	public String getNumFull_XzfyStaff() {
		return numFull_XzfyStaff;
	}




	public void setNumFull_XzfyStaff(String numFullXzfyStaff) {
		numFull_XzfyStaff = numFullXzfyStaff;
	}




	public String getNumPart_XzfyStaff() {
		return numPart_XzfyStaff;
	}




	public void setNumPart_XzfyStaff(String numPartXzfyStaff) {
		numPart_XzfyStaff = numPartXzfyStaff;
	}




	public String getQuantity_Hearing() {
		return quantity_Hearing;
	}




	public void setQuantity_Hearing(String quantityHearing) {
		quantity_Hearing = quantityHearing;
	}




	public String getQuantity_Reading() {
		return quantity_Reading;
	}




	public void setQuantity_Reading(String quantityReading) {
		quantity_Reading = quantityReading;
	}




	public String getQuantity_Receiving() {
		return quantity_Receiving;
	}




	public void setQuantity_Receiving(String quantityReceiving) {
		quantity_Receiving = quantityReceiving;
	}




	public String getCar_Casing() {
		return car_Casing;
	}




	public void setCar_Casing(String carCasing) {
		car_Casing = carCasing;
	}




	public String getQuantity_Casing() {
		return quantity_Casing;
	}




	public void setQuantity_Casing(String quantityCasing) {
		quantity_Casing = quantityCasing;
	}




	public String getBudgetInclude() {
		return budgetInclude;
	}




	public void setBudgetInclude(String budgetInclude) {
		this.budgetInclude = budgetInclude;
	}




	public String getShenPiMode() {
		return shenPiMode;
	}




	public void setShenPiMode(String shenPiMode) {
		this.shenPiMode = shenPiMode;
	}




	public String getPlaceSetUp() {
		return placeSetUp;
	}




	public void setPlaceSetUp(String placeSetUp) {
		this.placeSetUp = placeSetUp;
	}




	public String getFullNameRect() {
		return fullNameRect;
	}




	public void setFullNameRect(String fullNameRect) {
		this.fullNameRect = fullNameRect;
	}




	public String getDetailAddressRect() {
		return detailAddressRect;
	}




	public void setDetailAddressRect(String detailAddressRect) {
		this.detailAddressRect = detailAddressRect;
	}




	public String getForeignPhoneRect() {
		return foreignPhoneRect;
	}




	public void setForeignPhoneRect(String foreignPhoneRect) {
		this.foreignPhoneRect = foreignPhoneRect;
	}




	public String getCorpCode() {
		return corpCode;
	}




	public void setCorpCode(String corpCode) {
		this.corpCode = corpCode;
	}




	public String getCaseNum() {
		return caseNum;
	}




	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}




	public String getYingSuNum() {
		return yingSuNum;
	}




	public void setYingSuNum(String yingSuNum) {
		this.yingSuNum = yingSuNum;
	}




	public String getCountOfFyCertAll() {
		return countOfFyCertAll;
	}




	public void setCountOfFyCertAll(String countOfFyCertAll) {
		this.countOfFyCertAll = countOfFyCertAll;
	}




	public String getCountOfFyCertFull() {
		return countOfFyCertFull;
	}




	public void setCountOfFyCertFull(String countOfFyCertFull) {
		this.countOfFyCertFull = countOfFyCertFull;
	}




	public String getCountOfFyCertPart() {
		return countOfFyCertPart;
	}




	public void setCountOfFyCertPart(String countOfFyCertPart) {
		this.countOfFyCertPart = countOfFyCertPart;
	}




	public String getCountOfAdminAided() {
		return countOfAdminAided;
	}




	public void setCountOfAdminAided(String countOfAdminAided) {
		this.countOfAdminAided = countOfAdminAided;
	}




	public String getYsFirmExistsOrNot() {
		return ysFirmExistsOrNot;
	}




	public void setYsFirmExistsOrNot(String ysFirmExistsOrNot) {
		this.ysFirmExistsOrNot = ysFirmExistsOrNot;
	}




	public String getYsFirmName() {
		return ysFirmName;
	}




	public void setYsFirmName(String ysFirmName) {
		this.ysFirmName = ysFirmName;
	}




	public String getStaffAuthorized() {
		return staffAuthorized;
	}




	public void setStaffAuthorized(String staffAuthorized) {
		this.staffAuthorized = staffAuthorized;
	}




	public String getYsCountFull() {
		return ysCountFull;
	}




	public void setYsCountFull(String ysCountFull) {
		this.ysCountFull = ysCountFull;
	}




	public String getYsCountPart() {
		return ysCountPart;
	}




	public void setYsCountPart(String ysCountPart) {
		this.ysCountPart = ysCountPart;
	}




	public String getUpdateDateFlag() {
		return updateDateFlag;
	}




	public void setUpdateDateFlag(String updateDateFlag) {
		this.updateDateFlag = updateDateFlag;
	}
    
	
}
