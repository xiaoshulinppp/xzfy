package com.taiji.zxfy.zxbz.service;

import java.io.File;
import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.zxfy.zxsq.domain.AppModel;

public interface ZxbzService extends ICoreService {
	@SuppressWarnings("rawtypes")
	public List findBySql(String hql);

	public void uploadFile(File upload, String uploadFileName, String userId,
			String userName, String XzfyId, String fileType,String Other,String clName) throws Exception;
	public void deleteFileOnDisk(String filePath);
}
