package com.sinosoft.sentdata;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.sinosoft.sentdata.domain.dogs;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.fzb.service.XzfyService;

public class Testdogs  extends  CoreServiceImpl {

	public static void main(String[] args) {
		
		List<dogs> listdog=new ArrayList<dogs>();
		
		//	String sql = "from XzfyInfo where (XzfyInfo.tbflag = '" + TBflag + "' ) ";
			String sql = "from dogs  ";
		 //   List<dogs> listdog1 =  this.find(sql);
		
			
			//listdog = xzfyService.finddogs("");
			System.out.println("返回LIst");
			List <String> list2=new ArrayList();
			Gson gson=new Gson(); 
			/*for( dogs dog:listdog1){
				String json=gson.toJson(dog);  
				System.out.println(json);
				
				list2.add(json);
			}*/
				
		
		
		
		
		
		
		
	}

}
