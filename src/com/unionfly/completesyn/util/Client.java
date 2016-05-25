package com.unionfly.completesyn.util;

import java.io.File;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.unionfly.completesyn.model.FileUploader;
import com.unionfly.completesyn.model.ListObject;
import com.unionfly.completesyn.services.ICaseInfoServices;

public class Client {
	public static void main(String[] args) {
		// invoke();
		// invokeBySpring();
		// fileUpload("d:" + File.separator + "client1.zip");
		// getCaseInfoList();
		getCaseInfo();
	}

	private static void getCaseInfo() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		System.out.println(123);
		ICaseInfoServices caseInfoServices = (ICaseInfoServices) context
				.getBean("caseClient", ICaseInfoServices.class);
//		caseInfoServices.getXzfyInfo("20130101");
		// System.out.println("client:" + xzfyInfo.getId());
	}

	private static void getCaseInfoList() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ICaseInfoServices caseInfoServices = (ICaseInfoServices) context
				.getBean("caseClient", ICaseInfoServices.class);
		ListObject list = new ListObject();
		list = caseInfoServices.getCaseInfoList();
	}

	/**
	 * 上传附件到server
	 */
	public static void fileUpload(String filePath) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ICaseInfoServices caseInfoServices = (ICaseInfoServices) context
				.getBean("caseClient", ICaseInfoServices.class);
		FileUploader fileUploader = new FileUploader(filePath);
		fileUploader.setFile(new DataHandler(new FileDataSource(new File(
				filePath))));
		boolean isSuccess = caseInfoServices.uploadFile(fileUploader);
	}
}