package com.taiji.zxfy.zxcx.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.zxfy.zxcx.service.ZxcxService;
import com.util.HibernateSessionFactory;

public class ZxcxServiceImpl extends CoreServiceImpl implements ZxcxService {

	public List findBySql(String hql) {
		Session session = null;
		List list = null;
		Query query = null;
		try {
			session = HibernateSessionFactory.getSession();
			query = session.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
			System.out.println(e);
		}
		if (session != null && session.isOpen()) {
			session.close();
		}
		return list;
	}

}
