package com.taiji.zxfy.zxbz.webwork.action;

import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedListAction;

public class ZxbzListAction extends ProtectedListAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1068219101425712650L;

	/**
	 * 跳转到通过案件代码查询页面
	 * 
	 * @return
	 */
	public String search() {
		return SUCCESS;
	}

	public PaginationSupport getInitResult() {
		return null;
	}

	@SuppressWarnings("rawtypes")
	public Class getPersistentClass() {
		return null;
	}

	public String getTableName() {
		return null;
	}

}
