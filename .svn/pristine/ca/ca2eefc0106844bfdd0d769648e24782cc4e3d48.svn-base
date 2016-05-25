package com.taiji.webTemplate.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.taiji.common.ContextUtil;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.webTemplate.domain.WtClassify;
import com.taiji.webTemplate.domain.WtTemplate;
import com.taiji.webTemplate.service.WtClassifyService;

@SuppressWarnings("unchecked")
public class WtClassifyServiceImpl extends CoreServiceImpl implements WtClassifyService {

	/*
	 * 通过父栏目ID获取子栏目列表
	 * 
	 * @param pageNumber 页码
	 * 
	 * @param pageSize 每页显示条数
	 * 
	 * @return 分页后的栏目列表
	 */
	@Override
	public PaginationSupport getClassifyList(int pageNumber, int pageSize, int parentClassifyId) {
		String HQL = "";
		HQL += " from " + ContextUtil.WtClassifyName + " w";
		HQL += " where 1 = 1";
		HQL += " and w.parentClassify.id = " + parentClassifyId;
		HQL += " order by w.seq asc";
		return super.find(HQL, pageNumber, pageSize);
	}

	/*
	 * 获取所有栏目列表
	 * 
	 * @return 栏目列表
	 */
	@Override
	public List<WtClassify> getAllClassifyList() {
		String HQL = "";
		HQL += " from " + ContextUtil.WtClassifyName + " w";
		HQL += " where 1 = 1";
		HQL += " order by w.seq asc";
		List<WtClassify> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<WtClassify>();
		}
		return dataList;
	}

	/*
	 * 获取启动的栏目列表
	 */
	@Override
	public List<WtClassify> getClassifyList() {
		String HQL = "";
		HQL += " from " + ContextUtil.WtClassifyName + " w";
		HQL += " where 1 = 1";
		// HQL += " and w.state = '1'";
		HQL += " order by w.seq asc";
		List<WtClassify> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<WtClassify>();
		}
		return dataList;
	}

	/*
	 * 获取所有模板列表
	 * 
	 * @return 模板列表
	 */
	@Override
	public List<WtTemplate> getAllTemplateList() {
		String HQL = "";
		HQL += " from " + ContextUtil.WtTemplateName + " w";
		HQL += " where 1 = 1";
		HQL += " order by w.seq asc";
		List<WtTemplate> dataList = super.find(HQL);
		if (dataList.isEmpty()) {
			dataList = new ArrayList<WtTemplate>();
		}
		return dataList;
	}

	/*
	 * 获取栏目最大顺序号
	 * 
	 * @return 栏目最大顺序号
	 */
	@Override
	public int getBiggestClassifySeq() {
		String HQL = "";
		HQL += " from " + ContextUtil.WtClassifyName + " w";
		HQL += " where 1 = 1";
		HQL += " order by w.seq desc";
		List<WtClassify> dataList = super.find(HQL);
		if (!dataList.isEmpty()) {
			return dataList.get(0).getSeq();
		}
		return 0;
	}

}
