package com.unionfly.completesyn.services.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.activation.DataHandler;
import javax.jws.WebService;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.taiji.core.service.ICoreService;
import com.unionfly.completesyn.model.FileUploader;
import com.unionfly.completesyn.model.ListObject;
import com.unionfly.completesyn.services.ICaseInfoServices;
import com.util.HibernateSessionFactory;

@WebService(endpointInterface = "com.unionfly.completesyn.services.ICaseInfoServices")
public class CaseInfoServicesImpl implements ICaseInfoServices {


	public boolean uploadFile(FileUploader file) {
		DataHandler tempfile = file.getFile();
		try {
			InputStream is = tempfile.getInputStream();
			OutputStream os = new FileOutputStream(file.getFilePath());
			byte[] b = new byte[100000];
			int bytesRead = 0;
			while ((bytesRead = is.read(b)) != -1) {
				os.write(b, 0, bytesRead);
			}
			os.flush();
			os.close();
			is.close();

		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;

	}

	private List findBySQL(String hql) {
		Session session;
		List list;
		Query query = null;
		session = null;
		list = null;
		try {
			session = HibernateSessionFactory.getSession();
			query = session.createSQLQuery(hql);
			list = query.list();
		} catch (Exception exception) {
		}
		if (session != null && session.isOpen()) {
			session.close();
		}
		return list;
	}

	@Override
	public ListObject getCaseInfoList() {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateName(String name) {
		System.out.println(name);
	}
}