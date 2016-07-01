package com.taiji.fzb.domain;

import com.taiji.core.domain.Entity;

public class XzfyApp extends Entity{	
/*
	申请人表
	*/
	private String xzfy_id;
	private String app_name;
	private String app_id;
	private String isdeputy;
	private String deputyName;
	private String deputyType;
	private String otherType;
	private String mobile;
	private String email;
	private String address;
	private String mail_address;
	private String sexy;
	private String proxytype;
	private String postcode;
	private String telephone;
	private String islink;
	//private XzfyInfo xzfyInfo;
	public String getDeputyName() {
		return deputyName;
	}

	public void setDeputyName(String deputyName) {
		this.deputyName = deputyName;
	}

	public String getDeputyType() {
		return deputyType;
	}

	public void setDeputyType(String deputyType) {
		this.deputyType = deputyType;
	}

	public String getOtherType() {
		return otherType;
	}

	public void setOtherType(String otherType) {
		this.otherType = otherType;
	}

	public String getXzfy_id() {
		return xzfy_id;
	}

	public void setXzfy_id(String xzfyId) {
		xzfy_id = xzfyId;
	}

	public String getApp_name() {
		return app_name;
	}

	public void setApp_name(String appName) {
		app_name = appName;
	}

	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String appId) {
		app_id = appId;
	}

	public String getIsdeputy() {
		return isdeputy;
	}

	public void setIsdeputy(String isdeputy) {
		this.isdeputy = isdeputy;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMail_address() {
		return mail_address;
	}

	public void setMail_address(String mailAddress) {
		mail_address = mailAddress;
	}

	public String getSexy() {
		return sexy;
	}

	public void setSexy(String sexy) {
		this.sexy = sexy;
	}

	public String getProxytype() {
		return proxytype;
	}

	public void setProxytype(String proxytype) {
		this.proxytype = proxytype;
	}

/*	public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}

	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}*/

	
	public String getIslink() {
		return islink;
	}

	public void setIslink(String islink) {
		this.islink = islink;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	

}

