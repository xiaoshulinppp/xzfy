package com.sinosoft.sentdata;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.sinosoft.sentdata.domain.dogs;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;

import localhost.webIscp.services.dateTransfer_nei.DateTransfer_neiProxy;
import net.sf.json.JSONObject;

public class datesent  extends  CoreServiceImpl{
	
	//private XzfyService xzfyService; // 模板业务层方法
	XzfyService xzfyService = (XzfyService) SpringUtil.getApplicationContext().getBean("xzfyService");
	public List sentObject(String operateCode) {
		List a = new ArrayList();
		List a1 = new ArrayList();a1.add("1");a1.add("2");
		List a2 = new ArrayList();a2.add("3");a2.add("4");
		a.add(a1);
		a.add(a2);
		User user = null;
		Org org = null;
		List <XzfyInfo> infolist =null;
			// 如果是个人用户，读取详细信息
			if (operateCode.equals("12345")) {
				
				// 判断用户是否已经存在，存在取得该对象
				 infolist = xzfyService.getXzfyByTB_flag("0");
				
				 return a;
			} else{
				return null;
				
			}
			// 调用插入数据库记录方法，将获得的用户信息以及用户的角色信息插入数据库中
			//this.userService.saveOrUpdate(user);
			
		
	}
	public List<String> sentdogs() {
		/*List<User1> list = new ArrayList<User1>();
		user.setName("我是改名字了的数据");
		user.setSex("我是改名字了的数据");
		list.add(user);
		
		User1 user1 = new User1();
		user1.setName("我是改名字了的数据");
		user1.setSex("我是改名字了的数据");
		
		list.add(user1);*/
		List<dogs> listdog=new ArrayList<dogs>();
		
	//	String sql = "from XzfyInfo where (XzfyInfo.tbflag = '" + TBflag + "' ) ";
		String sql = "from dogs  ";
	    List<dogs> listdog1 = (List<dogs>) this.find(sql);
	
		
		//listdog = xzfyService.finddogs("");
		System.out.println("返回LIst");
		List <String> list2=new ArrayList();
		Gson gson=new Gson(); 
		for( dogs dog:listdog1){
			String json=gson.toJson(dog);  
			System.out.println(json);
			
			list2.add(json);
		}
		
		return list2;
		
	}
	
	public String Stringdogs() {
		/*List<User1> list = new ArrayList<User1>();
		user.setName("我是改名字了的数据");
		user.setSex("我是改名字了的数据");
		list.add(user);
		
		User1 user1 = new User1();
		user1.setName("我是改名字了的数据");
		user1.setSex("我是改名字了的数据");
		
		list.add(user1);*/
		List<dogs> listdog=new ArrayList<dogs>();
		
	//	String sql = "from XzfyInfo where (XzfyInfo.tbflag = '" + TBflag + "' ) ";
		String sql = "from dogs  ";
	    List<dogs> listdog1 = (List<dogs>) this.find(sql);
	
		
		//listdog = xzfyService.finddogs("");
		System.out.println("返回LIst");
		List <String> list2=new ArrayList();
		dogs dog3=listdog1.get(0);
		Gson gson=new Gson(); 
		String json=gson.toJson(dog3);  
		
		return json;
		
	}
	
	public String updateStatus( String ID,String status) {
		
		
		XzfyInfo xzfy=null;
		xzfy=xzfyService.getXzfyById(ID);
		
		xzfy.setStatus(status);
		//String sql = " update XzfyInfo s set s.status='"+status+"' where s.id='"+ID+"');  ";
		xzfyService.update(xzfy);
		//this.find(sql);
		//this.updateAll(sql);
		return "SUCCESS";

	
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
	
	
	public List sendname( String id) {
		
	
		       dogs dog =null;
			// 如果是个人用户，读取详细信息20160513134807639437
			
				XzfyInfo xzfy=null;
				// 判断用户是否已经存在，存在取得该对象
				 dog = xzfyService.findog();
				 List <XzfyInfo> listxzfy=xzfyService.getXzfyByTB_flag("");
				 
				 List list =new ArrayList();
				 int i=1;
				 for(XzfyInfo xzfy1:listxzfy){
					 
					 JSONObject json = JSONObject.fromObject(xzfy1);//将java对象转换为json对象
					 String str = json.toString();//将json对象转换为字符串
					
					// 同样先将json字符串转换为json对象，再将json对象转换为java对象，如下所示。
				//	 JSONObject obj = new JSONObject().fromObject(str);//将json字符串转换为json对象
					// 将json对象转换为java对象
				//	 dogs jb = (dogs)JSONObject.toBean(obj,dogs.class);//将建json对象转换为Person对象
					 
					 list.add(str);
					 
				 }
				 
				 
				// System.out.println("服务端"+str);
				/* 
				 Gson gson=new Gson(); 
					String json=gson.toJson(infolist);  
				 System.out.println(json);
				String bbb=infolist.getBreak_right();*/
				 
				// list.add(str);
			//	 return "数据"+str;
				return list;
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
	
        public void check_tb_flag (  ) throws RemoteException {//定时检查修补同步遗漏
		
         List<XzfyInfo> xzfyInfo1=	xzfyService.getXzfyByTB_flag("0");
		
         DateTransfer_neiProxy da =new DateTransfer_neiProxy();  
	     for(XzfyInfo xzfyInfo :xzfyInfo1){

			 JSONObject json = JSONObject.fromObject(xzfyInfo);//将java对象转换为json对象
	    	 String str = json.toString();//将json对象转换为字符串
	    	
	    				String ss= da.saveJSON(str);
	    	            System.out.println(ss);
						if(ss.equals("SUCCESS")){
							xzfyInfo.setTb_flag("1");//同步成功
						}else{
							xzfyInfo.setTb_flag("0");//同步失败
						}
	    				
	    			xzfyService.update(xzfyInfo);
	    	 
	    	 
	     }
		
		
		
	}
	

}
