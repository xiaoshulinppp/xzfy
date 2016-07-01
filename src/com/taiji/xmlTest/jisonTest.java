package com.taiji.xmlTest;

import com.google.gson.Gson;
import com.sinosoft.sentdata.domain.dogs;

public class jisonTest {

	public static void main(String[] args) {
		dogs dog1=new dogs(); 
		dog1.setAdmit1("小明");
		dog1.setAdmit1_id("小红");
		Gson gson=new Gson(); 
		String json=gson.toJson(dog1);  

		System.out.println(json);
		dogs dog2=new dogs(); 
		//dog2=  JSONOject.formOject(json);
		
	dogs dog21=	gson.fromJson(json, dogs.class); 
	
	dog21.setId("123");
	String json22=gson.toJson(dog21); 
	System.out.println(json22);
		
		//String json =[{"name":"abc","id":"123"},{"name":"def","id":"456"},{"name":"zzz","id":"789"}];

	//	Gson gson2 = new Gson();
	//	Object obj =gson2.fromJson(json, Object.class);

		//你也可以自己定义个实体类：
	//	class user{
	//	private String name;

	//	private String id;

		// getter setter 略

	//	}
		//那么 就可以这么转化：

	//	User user=gson.fromJson(json, User.class); 
		
		

	}

}
