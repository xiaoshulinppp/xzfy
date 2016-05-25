package com.util;

import java.io.File;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.persister.entity.AbstractEntityPersister;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HibernateSessionFactory {

	private static String CONFIG_FILE_LOCATION = File.separator+"hibernate.cfg.xml";

	private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();

	private static Configuration configuration = new Configuration();

	private static org.hibernate.SessionFactory sessionFactory;

	private static String configFile = CONFIG_FILE_LOCATION;

	private HibernateSessionFactory() {
	}

	public static Session getSession() throws HibernateException {
		
		Session session = (Session) threadLocal.get();

		if (session == null || !session.isOpen()) {
			if (sessionFactory == null) {
				rebuildSessionFactory();
			}
			session = (sessionFactory != null) ? sessionFactory.openSession() : null;
			threadLocal.set(session);
		}
		return session;
	}
	

	public static void rebuildSessionFactory() {
		try {
			
			configuration.configure(configFile);
			sessionFactory = configuration.buildSessionFactory();
		} catch (Exception e) {
			System.err.println("%%%% Error Creating SessionFactory %%%%");
			e.printStackTrace();
		}
	}

	public static void closeSession() throws HibernateException {
		Session session = (Session) threadLocal.get();
		threadLocal.set(null);

		if (session != null) {
			session.close();
		}
	}

	public static org.hibernate.SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void setConfigFile(String configFile) {
		HibernateSessionFactory.configFile = configFile;
		sessionFactory = null;
	}

	public static Configuration getConfiguration() {
		return configuration;
	}

	public static String getConfigFile() {
		return configFile;
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String, String> getHibernateTableNameClassNameMap() {
		Map<String, String> hibernateEntityClassNameMap = new TreeMap<String, String>();

		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");

		Map<String, AbstractEntityPersister> metaMap = sessionFactory.getAllClassMetadata();
		for (String key : (Set<String>) metaMap.keySet()) {
			AbstractEntityPersister classMetadata = metaMap.get(key);
			String tableName = classMetadata.getTableName().toLowerCase();
			String className = classMetadata.getEntityMetamodel().getName();
			hibernateEntityClassNameMap.put(tableName, className.substring(className.lastIndexOf(".") + 1));
		}
		return hibernateEntityClassNameMap;
	}
	@SuppressWarnings("unchecked")
	public static Map<String, String> getHibernateClassNameTableNameMap() {
		Map<String, String> hibernateEntityClassNameMap = new TreeMap<String, String>();

		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");

		Map<String, AbstractEntityPersister> metaMap = sessionFactory.getAllClassMetadata();
		for (String key : (Set<String>) metaMap.keySet()) {
			AbstractEntityPersister classMetadata = metaMap.get(key);
			String tableName = classMetadata.getTableName().toLowerCase();
			String className = classMetadata.getEntityMetamodel().getName();
			hibernateEntityClassNameMap.put(className.substring(className.lastIndexOf(".") + 1),tableName);
		}
		return hibernateEntityClassNameMap;
	}

}