// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   ProtectedAction.java

package com.taiji.core.webwork.action;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.security.SecurityService;
import com.taiji.user.domain.User;
import java.util.Map;

// Referenced classes of package com.taiji.core.webwork.action:
//			BaseAction, Protected

public class ProtectedAction extends BaseAction
	implements Protected
{

	private SecurityService securityService;

	public ProtectedAction()
	{
	}

	public boolean hasPermission(Integer func_code)
	{
		User currentUser = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
		return securityService.hasPermission(currentUser, func_code);
	}

	public boolean hasPermission(Integer func_code, String op)
	{
		User currentUser = (User)ActionContext.getContext().getSession().get("_USER_LOGIN_");
		return securityService.hasPermission(currentUser, func_code, op);
	}

	public void setSecurityService(SecurityService service)
	{
		securityService = service;
	}

	public SecurityService getSecurityService()
	{
		return securityService;
	}
}
