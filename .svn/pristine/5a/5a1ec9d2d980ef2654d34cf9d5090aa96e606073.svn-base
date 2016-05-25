package com.taiji.zxfy.zxbz.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.ApplicationPath;
import com.taiji.zxfy.zxbz.service.ZxbzService;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.util.HibernateSessionFactory;
import com.util.RandomUtil;

public class ZxbzServiceImpl extends CoreServiceImpl implements ZxbzService {
	/**
	 * 查询数据库
	 * 
	 * @param hql
	 * @return
	 */
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

	public String createFilePath() {
		// 获得服务器的绝对地址
		String rootPath = ApplicationPath.getRootPath().replace(File.separator,
				"\\\\");
		String filePath = rootPath + "uploadfiles/anjuan";
		return filePath;
	}

	// 生成材料的存储名字
	public String createFileAnotherName(String uploadFileName) {
		String prefix = uploadFileName.substring(uploadFileName
				.lastIndexOf(".") + 1);
		String fileName = "";
		Calendar rigthNow = Calendar.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddhhmmss");
		fileName = fmt.format(rigthNow.getTime())
				+ RandomUtil.generateNumber(3) + "." + prefix;
		return fileName;
	}

	// 上传材料文件
	public void uploadFile(File upload, String uploadFileName, String userId,
			String userName, String XzfyId, String fileType, String other,String clName)
			throws Exception {
		String filePath = this.createFilePath();
		File file = new File(filePath);
		file.mkdir();
		String fileName = this.createFileAnotherName(uploadFileName);
		ArchiveModel archiveFile = new ArchiveModel();
		archiveFile.setType(fileType);
		archiveFile.setFileName("(补证)" + uploadFileName);
		archiveFile.setFileAnotherName(fileName);
		archiveFile.setFileRelativePath("../uploadfiles/anjuan/" + fileName);
		archiveFile.setFileAbsolutePath(filePath + "/" + fileName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		archiveFile.setUploadTime(String.valueOf(sdf.format(Calendar
				.getInstance().getTime())));
		archiveFile.setUploadUserId(userId);
		archiveFile.setUploadUserName(userName);
		archiveFile.setXzfyId(XzfyId);
		archiveFile.setStatus("0");
		if (other != null) {
			archiveFile.setOther(other);
		}
		archiveFile.setClName(clName);
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

	// 删除硬盘上的文件
	public void deleteFileOnDisk(String filePath) {
		File file = new File(filePath.replace("\\\\", File.separator));
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				System.out.println("删除成功！");
			}
		} else {
			System.out.println("文件不存在！");
		}
	}
}
