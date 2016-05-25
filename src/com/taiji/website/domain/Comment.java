package com.taiji.website.domain;

public class Comment{
    
	private Integer id;
	private String comment;
	private Integer commenter_id;
	private String commenter_name;
	private String time;
	private Integer articleId;
	private Integer grade;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getCommenter_id() {
		return commenter_id;
	}
	public void setCommenter_id(Integer commenterId) {
		commenter_id = commenterId;
	}
	public String getCommenter_name() {
		return commenter_name;
	}
	public void setCommenter_name(String commenter_name) {
		this.commenter_name = commenter_name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	

}

