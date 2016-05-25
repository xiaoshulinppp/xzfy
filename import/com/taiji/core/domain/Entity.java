// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Entity.java

package com.taiji.core.domain;

import java.io.Serializable;

public abstract class Entity
	implements Serializable
{

	private Integer id;

	public Entity()
	{
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public boolean equals(Object o)
	{
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (!(o instanceof Entity))
			return false;
		if (id == null || ((Entity)o).getId() == null)
			return false;
		else
			return id.equals(((Entity)o).getId());
	}

	public int hashCode()
	{
		return id != null ? id.hashCode() : System.identityHashCode(this);
	}
}
