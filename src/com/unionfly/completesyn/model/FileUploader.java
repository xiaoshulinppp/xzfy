package com.unionfly.completesyn.model;

import javax.activation.DataHandler;

public class FileUploader {
	private String filePath;
	private DataHandler file;

	public FileUploader() {
	}

	public FileUploader(String filePath) {
		super();
		this.filePath = filePath;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public DataHandler getFile() {
		return file;
	}

	public void setFile(DataHandler file) {
		this.file = file;
	}

}
