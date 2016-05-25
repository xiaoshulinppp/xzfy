package com.taiji.zxfy.zxyj.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.ApplicationPath;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxyj.service.ZxyjService;
import com.util.HibernateSessionFactory;
import com.util.RandomUtil;

public class ZxyjServiceImpl extends CoreServiceImpl implements
ZxyjService  {

	@SuppressWarnings("rawtypes")
	public List findByHQL(String hql) {
		//System.out.println(hql);
		Query query = null;
		Session session = null;
		List list = null;
		try {
			session = HibernateSessionFactory.getSession();
			query = session.createQuery(hql);
			list = query.list();
			//System.out.println(list+"list");
		} catch (Exception exception) {
		}
		if (session != null && session.isOpen()) {
			session.close();
		}
		return list;
	}

	// 上传材料文件
		public void uploadFile(File upload, String uploadFileName, String userId,
				String userName, String XzfyId, String fileType, String other)
				throws Exception {
			String filePath = this.createFilePath();
			File file = new File(filePath);
			file.mkdir();
			String fileName = this.createFileAnotherName(uploadFileName);
			ArchiveModel archiveFile = new ArchiveModel();
			archiveFile.setType(fileType);
			archiveFile.setFileName("（意见证据材料）"+uploadFileName);
			archiveFile.setFileAnotherName(fileName);
			archiveFile.setFileRelativePath("../uploadfiles/anjuan/"+fileName);
			archiveFile.setFileAbsolutePath(filePath+"/"+fileName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			archiveFile.setUploadTime(String.valueOf(sdf.format(Calendar.getInstance()
					.getTime())));
			archiveFile.setUploadUserId(userId);
			archiveFile.setUploadUserName(userName);
			archiveFile.setXzfyId(XzfyId);
			archiveFile.setStatus("0");
			if (other != null) {
				archiveFile.setOther(other);
			}
			FileInputStream fileInputStream = new FileInputStream(upload);
			FileOutputStream fileOutputStream = new FileOutputStream(filePath
					+ File.separator + fileName);
			int fileSize = fileInputStream.available();// 剩余字节数
			byte[] buffer = new byte[fileSize];
			int len;
			while ((len = fileInputStream.read(buffer)) > 0) {
				fileOutputStream.write(buffer, 0, len);
			}
			fileInputStream.close();
			fileOutputStream.close();
			this.save(archiveFile);
		}
		public String createFilePath() {
			// 获得服务器的绝对地址
			String rootPath = ApplicationPath.getRootPath().replace(File.separator,"\\\\");
			String filePath = rootPath + "uploadfiles/anjuan";
			return filePath;
		}

		// 生成材料的存储名字
		public String createFileAnotherName(String uploadFileName) {
			String prefix=uploadFileName.substring(uploadFileName.lastIndexOf(".")+1);
			String fileName = "";
			Calendar rigthNow = Calendar.getInstance();
			SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddhhmmss");
			fileName = fmt.format(rigthNow.getTime())
					+ RandomUtil.generateNumber(3)+"."+prefix;
			return fileName;
		}

}
