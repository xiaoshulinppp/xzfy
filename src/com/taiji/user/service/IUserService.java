package com.taiji.user.service;

import java.util.List;
import java.util.Map;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;

@SuppressWarnings("unchecked")
public interface IUserService extends ICoreService {

	public abstract PaginationSupport getAllUserByOrg(Integer paramInteger, int paramInt);

	public abstract PaginationSupport getAllUserByOrg(Integer paramInteger, int paramInt1, int paramInt2);

	public abstract Integer saveLogin(User paramUser, String paramString, Map paramMap);

	public abstract void saveFaultCount(User paramUser);

	public abstract User getUser(String paramString);

	public abstract User getUserByName(String paramString);

	public abstract List getAllUserByOrg(Org paramOrg);

	public abstract List getAllUserByAllSubOrg(Org paramOrg);

}
