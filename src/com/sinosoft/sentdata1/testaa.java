package com.sinosoft.sentdata1;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.fzb.service.XzfyService;
import com.taiji.user.domain.User;

public class testaa   extends CoreServiceImpl{

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		 XzfyService xzfyService = null; // 模板业务层方法
		 XzfyInfo infolist ;
		
		// 如果是个人用户，读取详细信息
	
			
		 String sql = "from XzfyInfo where XzfyInfo.id='20160513134807639437'";
			// 判断用户是否已经存在，存在取得该对象
		//	 infolist = xzfyService.getXzfyByTB_flag(sql);
		 
		
			
	}
	
	
	
	

}
