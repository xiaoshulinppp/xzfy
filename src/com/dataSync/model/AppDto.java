package com.dataSync.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name = "Customer")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = { "id", "appName", "appId", "isDeputy", "mobile", "email",
		"address", "mailAddress", "sexy", "proxyType", "postCode", "telephone",
		"isLink", "deputyName", "deputyType", "otherType", "sfzmType","xzfyId" })
public class AppDto implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2796387212578114593L;
	private Integer id;
	private String appName; // 申请人名称
	private String appId; // 身份证号
	private String isDeputy; // 是否是代表人
	private String mobile; // 电话
	private String email; // 邮箱
	private String address; // 住址
	private String mailAddress; // 通邮地址
	private String sexy; // 性别
	private String proxyType; // 类别
	private String postCode; // 邮编
	private String telephone; // 固定电话
	private String isLink; // 是否是主要联系人
	private String deputyName; // 代表人名称(法人用)
	private String deputyType; // 代表人类别（法人用
	private String otherType; // 其他情形（法人用）
	private String sfzmType; // 身份证明的类别:身份证、军官证、护照
	private String xzfyId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getIsDeputy() {
		return isDeputy;
	}

	public void setIsDeputy(String isDeputy) {
		this.isDeputy = isDeputy;
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

	public String getMailAddress() {
		return mailAddress;
	}

	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}

	public String getSexy() {
		return sexy;
	}

	public void setSexy(String sexy) {
		this.sexy = sexy;
	}

	public String getProxyType() {
		return proxyType;
	}

	public void setProxyType(String proxyType) {
		this.proxyType = proxyType;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIsLink() {
		return isLink;
	}

	public void setIsLink(String isLink) {
		this.isLink = isLink;
	}

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

	public String getSfzmType() {
		return sfzmType;
	}

	public void setSfzmType(String sfzmType) {
		this.sfzmType = sfzmType;
	}

	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

}
