package com.taiji.fzb.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sinosoft.sentdata.domain.dogs;
import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.Beishenqingren;
import com.taiji.fzb.domain.XzfyAgent;
import com.taiji.fzb.domain.XzfyApp;
//import com.taiji.fzb.domain.XzfyBuwei;
import com.taiji.fzb.domain.XzfyInfo;
import com.taiji.user.domain.Org;
//import com.taiji.fzb.domain.XzfyRecieve;
//import com.taiji.fzb.domain.XzfyShenpi;
//import com.taiji.fzb.domain.XzssInfo;
//import com.taiji.schedule.domain.ScheduleInfo;
import com.taiji.user.domain.User;
import com.taiji.website.domain.ArticleInfo;

public interface XzfyService extends ICoreService {

	/**
	 * 获取模板列表
	 * 
	 * @param pageNumber
	 *            页码
	 * @param pageSize
	 *            每页显示条数
	 * @return 分页的列表
	 */
	public Org getRootOrg(String locBM);
	
	public PaginationSupport getXzfyList(int pageNumber, int pageSize);

	/**
	 * 通过ID获取模板对象
	 * 
	 * @param entityId
	 *            模板对象ID
	 * @return 模板对象
	 * @throws SQLException 
	 */
	
	public List<List<String>> getXzfyInfoList(int type) throws SQLException; 
	
	public List<dogs> finddogs(String TBflag);
	
	
	public dogs findog();
	public XzfyInfo getXzfyById(String entityId);
	public List<XzfyInfo> getXzfyByTB_flag(String TBflag);
//	public XzfyBuwei getBuweiById(String xzfyId);
	
	//public XzfyRecieve getRecieveById(String entityId);
	
	public void saveXzfyInfo(XzfyInfo xzfyInfo);
	
	public List<XzfyApp> getAppListById(String entityId,String protype) ;

	public List<XzfyApp> getAppListById(String entityId) ;
	
	public List<XzfyAgent> getAgentListById(String entityId);
	
	public List<ArticleInfo> getArticleInfoList(int type) throws SQLException;

	public List<XzfyInfo> getXzfyInfoListByUserid(String userid);
	
	public PaginationSupport getXzfyListByStatus(String status,int pageNumber, int pageSize);

	public PaginationSupport getXzfyListNoEnd(int pageNumber, int pageSize);
	
	public XzfyApp getAppById(int entityId);
	
	public void deleteAppById(int entityId);
	public void deleteAppById(String entityId);

	public XzfyAgent getAgentById(int entityId);

	public void deleteAgentById(int entityId);
	
	//public List<XzfyShenpi> getShenpiById(String entityId,String status);
   // public XzfyShenpi getShenpiById(int entityId);

    public PaginationSupport getShenpiListById(int pageNumber, int pageSize,String entityId,String user_id);
    
   // public List<ScheduleInfo> getScheduleInfoByUserId(String userId);
    
    public PaginationSupport getTiquXzfyList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,User user);

   // public PaginationSupport getTiquBuweiList(int pageNumber, int pageSize,XzfyBuwei xzfyBuwei);
  //  public PaginationSupport getTiquBuweiListByName(int pageNumber, int pageSize,XzfyBuwei xzfyBuwei,String un);
    
   // public PaginationSupport getBuweiEndList(int pageNumber, int pageSize,XzfyBuwei xzfyBuwei);
    
    public List<Beishenqingren> getBsqrName(String type,String locBm,List<Beishenqingren> blist);
    
    public ArrayList getDiv51List(String startDate, String endDate, String userName) throws SQLException;
    public ArrayList getDiv52List(String startDate, String endDate, String userName);
    public PaginationSupport getDiv52List_2(int pageNumber, int pageSize,  String startDate, String endDate, String userName);
   // public XzssInfo getShen1XzssByXzfyId(String xzfyid);
   // public XzssInfo getShen2XzssByXzfyId(String xzfyid);
   // public XzssInfo getShen3XzssByXzfyId(String xzfyid);
}
