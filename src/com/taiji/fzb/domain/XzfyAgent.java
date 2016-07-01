package com.taiji.fzb.domain;

import com.taiji.core.domain.Entity;

@SuppressWarnings("serial")
public class XzfyAgent extends Entity{	
/*
	代理人信息
*/	private String xzfy_id;
	private String agent_name;
	private String agent_id;
	private String mobile;
	private String email;
	private String mail_address;
	private String proxytype;
	private String telephone;
	private String postcode;
	private String work_address;
	private String cer_no;
	//private XzfyInfo xzfyInfo;
	
	public String getXzfy_id() {
		return xzfy_id;
	}
	public void setXzfy_id(String xzfyId) {
		xzfy_id = xzfyId;
	}
	public String getAgent_name() {
		return agent_name;
	}
	public void setAgent_name(String agentName) {
		agent_name = agentName;
	}
	public String getAgent_id() {
		return agent_id;
	}
	public void setAgent_id(String agentId) {
		agent_id = agentId;
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
	public String getMail_address() {
		return mail_address;
	}
	public void setMail_address(String mailAddress) {
		mail_address = mailAddress;
	}
	public String getProxytype() {
		return proxytype;
	}
	public void setProxytype(String proxytype) {
		this.proxytype = proxytype;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getWork_address() {
		return work_address;
	}
	public void setWork_address(String workAddress) {
		work_address = workAddress;
	}
	public String getCer_no() {
		return cer_no;
	}
	public void setCer_no(String cerNo) {
		cer_no = cerNo;
	}
	/*public XzfyInfo getXzfyInfo() {
		return xzfyInfo;
	}
	public void setXzfyInfo(XzfyInfo xzfyInfo) {
		this.xzfyInfo = xzfyInfo;
	}*/

}

