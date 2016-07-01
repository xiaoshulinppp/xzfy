package com.sinosoft.sentdata1;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import com.bjca.uums.client.bean.DepartmentInformation;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;

public class datesent {
	
	//private XzfyService xzfyService; // 模板业务层方法
	XzfyService xzfyService = (XzfyService) SpringUtil.getApplicationContext().getBean("xzfyService");
	public List<XzfyInfo> sentObject(String operateCode) {
		
		User user = null;
		Org org = null;
		List <XzfyInfo> infolist =null;
			// 如果是个人用户，读取详细信息
			if (operateCode.equals("12345")) {
				
				// 判断用户是否已经存在，存在取得该对象
				 infolist = xzfyService.getXzfyByTB_flag("0");
				
				 return infolist;
			} else{
				return null;
				
			}
			// 调用插入数据库记录方法，将获得的用户信息以及用户的角色信息插入数据库中
			//this.userService.saveOrUpdate(user);
			
		
	}
	
	public String test( String name) {
		
		
	       XzfyInfo infolist =null;
		// 如果是个人用户，读取详细信息20160513134807639437
		
			
			// 判断用户是否已经存在，存在取得该对象
			// infolist = xzfyService.getXzfyById(id);
			//String bbb=infolist.getBreak_right();
			 return "返回数据 :"+name;
		
		// 调用插入数据库记录方法，将获得的用户信息以及用户的角色信息插入数据库中
		//this.userService.saveOrUpdate(user);
		
	
}
	
	
	public String sendname( String id) {
		
	
		       XzfyInfo infolist =null;
			// 如果是个人用户，读取详细信息20160513134807639437
			
				
				// 判断用户是否已经存在，存在取得该对象
				 infolist = xzfyService.getXzfyById(id);
				String bbb=infolist.getBreak_right();
				 return "sedname :nihao"+bbb;
			
			// 调用插入数据库记录方法，将获得的用户信息以及用户的角色信息插入数据库中
			//this.userService.saveOrUpdate(user);
			
		
	}
	public List<List<String>> sendList( int id) {
		
		List<List<String>> r = null;
		//XzfyInfo infolist =null;
			// 如果是个人用户，读取详细信息20160513134807639437
			
				
				// 判断用户是否已经存在，存在取得该对象
				 try {
					r = xzfyService.getXzfyInfoList(id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//String bbb=infolist.getBreak_right();
			
				 return r;
			// 调用插入数据库记录方法，将获得的用户信息以及用户的角色信息插入数据库中
			//this.userService.saveOrUpdate(user);
			
		
	}
	

}
