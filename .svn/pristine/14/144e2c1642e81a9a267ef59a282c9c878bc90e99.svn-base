package com.taiji.webTemplate.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.webTemplate.domain.WtClassify;
import com.taiji.webTemplate.domain.WtTemplate;

public interface WtClassifyService extends ICoreService {

	/**
	 * 通过父栏目ID获取子栏目列表
	 * 
	 * @param pageNumber
	 *            页码
	 * @param pageSize
	 *            每页显示条数
	 * @return 分页后的栏目列表
	 */
	public PaginationSupport getClassifyList(int pageNumber, int pageSize, int parentClassifyId);

	/**
	 * 获取所有栏目列表
	 * 
	 * @return 栏目列表
	 */
	public List<WtClassify> getAllClassifyList();
	
	/**
	 * 获取启动的栏目列表
	 */
	public List<WtClassify> getClassifyList();

	/**
	 * 获取所有模板列表
	 * 
	 * @return 模板列表
	 */
	public List<WtTemplate> getAllTemplateList();

	/**
	 * 获取栏目最大顺序号
	 * 
	 * @return 栏目最大顺序号
	 */
	public int getBiggestClassifySeq();
}
