package com.unionfly.completesyn.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

@SuppressWarnings("serial")
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "listObject", propOrder = { "list" })
public class ListObject {
	// public void ListObject();
	@XmlElement(nillable = true)
	protected List list;

	public ListObject() {

	}

	public List getList() {
		if (list == null) {
			list = new ArrayList();
		}
		return this.list;
	}

	public void setList(List list) {
		this.list = list;
	}
}
