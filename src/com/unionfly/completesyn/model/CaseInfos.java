package com.unionfly.completesyn.model;

import javax.activation.DataHandler;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlMimeType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name = "CaseInfos")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(propOrder = { "acceptCaseNo", "noCaseNo", "caseNo", "fileData" })
public class CaseInfos {
	private String acceptCaseNo;
	private String noCaseNo;
	private String caseNo;

	public CaseInfos(String acceptCaseNo, String noCaseNo, String caseNo) {
		this.acceptCaseNo = acceptCaseNo;
		this.noCaseNo = noCaseNo;
		this.caseNo = caseNo;
	}

	public CaseInfos() {
	}

	public String getAcceptCaseNo() {
		return acceptCaseNo;
	}

	public void setAcceptCaseNo(String acceptCaseNo) {
		this.acceptCaseNo = acceptCaseNo;
	}

	public String getNoCaseNo() {
		return noCaseNo;
	}

	public void setNoCaseNo(String noCaseNo) {
		this.noCaseNo = noCaseNo;
	}

	public String getCaseNo() {
		return caseNo;
	}

	public void setCaseNo(String caseNo) {
		this.caseNo = caseNo;
	}

}