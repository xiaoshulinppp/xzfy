package com.taiji.zxfy.zxyj.service;

import java.io.File;
import java.util.List;

import com.taiji.core.service.ICoreService;

public interface ZxyjService extends ICoreService{

	@SuppressWarnings("rawtypes")
	public List findByHQL(String hql);
	public void uploadFile(File upload, String uploadFileName, String userId,
			String userName, String XzfyId, String fileType,String Other) throws Exception;
}
