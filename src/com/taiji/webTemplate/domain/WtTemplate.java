package com.taiji.webTemplate.domain;

import java.io.Serializable;

import com.taiji.core.domain.Entity;

/**
 * 模板Domain
 * 
 * @author Kerbol
 * 
 */
public class WtTemplate extends Entity implements Serializable {

	private static final long serialVersionUID = 1L;

	// 类成员

	private String name = ""; // 模板名称

	private String function = ""; // 模板功能链接

	private Integer seq = Integer.valueOf(0); // 模板排序字段

	private String introduction = ""; // 模板说明

	private String imagePath = ""; // 模板截图完整路径

	private String realImagePath = ""; // 模板截图绝对路径

	// Set和Get方法

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getRealImagePath() {
		return realImagePath;
	}

	public void setRealImagePath(String realImagePath) {
		this.realImagePath = realImagePath;
	}

}
