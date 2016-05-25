package com.taiji.zxfy.zxsq.domain;


public class ArchiveModel {

	private Integer id;
	private String status; // 是否可以在线查看
	private String type; // 材料类别
	private String fileName; // 文件原名称
	private String fileAnotherName; // 存储名
	private String fileRelativePath; // 文件项目相对路径
	private String fileAbsolutePath; // 文件磁盘绝对路径
	private String uploadTime; // 上传时间
	private String uploadUserId; // 上传人的ID
	private String uploadUserName; // 上传人的名字
	private String xzfyId; // 对应的案件ID
	private String other; // 其他信息, 不同的type对应不同的信息
	private String clName;// 材料名称
	private String archiveOfXzfyId;// 行政复议推送过来的材料的ID,唯一

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRelativePath() {
		return fileRelativePath;
	}

	public void setFileRelativePath(String fileRelativePath) {
		this.fileRelativePath = fileRelativePath;
	}

	public String getFileAbsolutePath() {
		return fileAbsolutePath;
	}

	public void setFileAbsolutePath(String fileAbsolutePath) {
		this.fileAbsolutePath = fileAbsolutePath;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getUploadUserId() {
		return uploadUserId;
	}

	public void setUploadUserId(String uploadUserId) {
		this.uploadUserId = uploadUserId;
	}

	public String getUploadUserName() {
		return uploadUserName;
	}

	public void setUploadUserName(String uploadUserName) {
		this.uploadUserName = uploadUserName;
	}

	public String getXzfyId() {
		return xzfyId;
	}

	public void setXzfyId(String xzfyId) {
		this.xzfyId = xzfyId;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getFileAnotherName() {
		return fileAnotherName;
	}

	public void setFileAnotherName(String fileAnotherName) {
		this.fileAnotherName = fileAnotherName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getClName() {
		return clName;
	}

	public void setClName(String clName) {
		this.clName = clName;
	}

	public String getArchiveOfXzfyId() {
		return archiveOfXzfyId;
	}

	public void setArchiveOfXzfyId(String archiveOfXzfyId) {
		this.archiveOfXzfyId = archiveOfXzfyId;
	}
}
