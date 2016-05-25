package com.taiji.webTemplate.service.impl;

import java.util.List;

import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtTemplateService;

@SuppressWarnings("unchecked")
public class WtTemplateServiceImpl extends CoreServiceImpl implements WtTemplateService {

	/*
	 * 获取模板列表
	 * 
	 * @param pageNumber 页码
	 * 
	 * @param pageSize 每页显示条数
	 * 
	 * @return 分页的列表
	 */
	@Override
	public PaginationSupport getTemplateList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from " + ContextUtil.WtTemplateName + " w";
		HQL += " where 1 = 1";
		HQL += " order by w.seq asc";
		return super.find(HQL, pageNumber, pageSize);
	}

	/*
	 * 通过ID获取模板对象
	 * 
	 * @param entityId 模板对象ID
	 * 
	 * @return 模板对象
	 */
	@Override
	public WtTemplate getWtTemplateById(int entityId) {
		String HQL = "";
		HQL += " from " + ContextUtil.WtTemplateName + " w";
		HQL += " where 1 = 1";
		HQL += " and w.id = " + entityId;
		List<WtTemplate> dataList = super.find(HQL);
		WtTemplate wtTemplate = new WtTemplate();
		if (dataList.isEmpty()) {
			wtTemplate = new WtTemplate();
		} else {
			wtTemplate = dataList.get(0);
		}
		return wtTemplate;
	}

	/*
	 * 获取最大的模板顺序号
	 * 
	 * @return 模板顺序号
	 */
	@Override
	public int getBiggestTemplateSeq() {
		String HQL = "";
		HQL += " from " + ContextUtil.WtTemplateName + " w";
		HQL += " where 1 = 1";
		HQL += " order by w.seq desc";
		List<WtTemplate> dataList = super.find(HQL);
		int biggestSeq = 0;
		if (!dataList.isEmpty()) {
			biggestSeq = dataList.get(0).getSeq();
		}
		return biggestSeq;
	}

}
