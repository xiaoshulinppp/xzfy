package com.taiji.zxfy.zxcx.service;

import java.util.List;

import com.taiji.core.service.ICoreService;

public interface ZxcxService extends ICoreService{
	@SuppressWarnings("rawtypes")
	public List findBySql(String hql);
}
