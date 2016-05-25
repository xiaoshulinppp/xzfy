package com.taiji.webTemplate.service;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.webTemplate.domain.WtTemplate;

public interface WtTemplateService extends ICoreService {

	/**
	 * 获取模板列表
	 * 
	 * @param pageNumber
	 *            页码
	 * @param pageSize
	 *            每页显示条数
	 * @return 分页的列表
	 */
	public PaginationSupport getTemplateList(int pageNumber, int pageSize);

	/**
	 * 通过ID获取模板对象
	 * 
	 * @param entityId
	 *            模板对象ID
	 * @return 模板对象
	 */
	public WtTemplate getWtTemplateById(int entityId);

	/**
	 * 获取最大的模板顺序号
	 * 
	 * @return 模板顺序号
	 */
	public int getBiggestTemplateSeq();

}
