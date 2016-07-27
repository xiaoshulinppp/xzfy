package com.taiji.fzb.service.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.sinosoft.sentdata.domain.dogs;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.fzb.domain.Beishenqingren;
import com.taiji.fzb.domain.XzfyAgent;
import com.taiji.fzb.domain.XzfyApp;
//import com.taiji.fzb.domain.XzfyBuwei;
import com.taiji.fzb.domain.XzfyInfo;
//import com.taiji.fzb.domain.XzfyRecieve;
//import com.taiji.fzb.domain.XzfyShenpi;
//import com.taiji.fzb.domain.XzssInfo;
import com.taiji.fzb.service.RecordService;
import com.taiji.fzb.service.XzfyService;
//import com.taiji.schedule.domain.ScheduleInfo;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.taiji.website.domain.ArticleInfo;
import com.util.HibernateSessionFactory;
import com.util.JdbcUtil;

@SuppressWarnings("unchecked")
public class XzfyServiceImpl extends  CoreServiceImpl implements XzfyService {

	/*
	 * 获取模板列表
	 * 
	 * @param pageNumber 页码
	 * 
	 * @param pageSize 每页显示条数
	 * 
	 * @return 分页的列表
	 */
	@Override
	public PaginationSupport getXzfyList(int pageNumber, int pageSize) {
		String HQL = "";
		HQL += " from  XzfyInfo xzfy";
		HQL += " where 1 = 1";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	
	
	public Org getRootOrg(String locBM){
		String hql="from Org org where org.locbm='"+locBM+"' order by org.id asc";
		List<Org> list1=super.find(hql);
		if(list1.size()>0){
			
			Org org=(Org)list1.get(0);
			return org;
		}else{
			 Org  org=new Org();
			return org;
		}
		
	}
	
	

	/*
	 * 通过ID获取模板对象
	 * 
	 * @param entityId 模板对象ID
	 * 
	 * @return 模板对象
	 */
	@Override
	public XzfyInfo getXzfyById(String entityId) {
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.id = '" + entityId+"'";
		//List<XzfyInfo> dataList = super.find(HQL);
		List<XzfyInfo> dataList = this.find(HQL);
		XzfyInfo xzfy = new XzfyInfo();
		if (dataList.isEmpty()) {
			xzfy = new XzfyInfo();
		} else {
			xzfy = dataList.get(0);
		}
		return xzfy;
	}


	
	public List getAgentListById(String entityId) {
		String HQL = "";
		HQL += " from XzfyAgent agent";
		HQL += " where 1 = 1";
		HQL += " and agent.xzfyInfo.id = '" + entityId + "'";
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}
	
	
	@Override
	public void saveXzfyInfo(XzfyInfo xzfyInfo) {
		super.save(xzfyInfo);
	}
	
	public List getAppListById(String entityId,String protype) {
		String HQL = "";
		HQL += " from XzfyApp app";
		HQL += " where 1 = 1";
		HQL += " and app.xzfyInfo.id = '" + entityId+"' and app.proxytype="+protype;
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}

	public List getAppListById(String entityId) {
		String HQL = "";
		HQL += " from XzfyApp app";
		HQL += " where 1 = 1";
		HQL += " and app.xzfyInfo.id = '" + entityId+"'";
		List<XzfyInfo> dataList = super.find(HQL);
		return dataList;
	}
	
	public void deleteAppById(int entityId){
		String hql="delete from  XzfyApp app where app.id="+entityId;
		super.deleteAll(hql);
	}

	public void deleteAppById(String xzfyId){
		String hql="delete from  xzfy_app  where xzfy_id='"+xzfyId+"'";
		super.deleteAllBySQL(hql);
	}
	
	public XzfyApp getAppById(int entityId) {
		String HQL = "";
		HQL += " from XzfyApp app";
		HQL += " where 1 = 1";
		HQL += " and app.id = " + entityId;
		List<XzfyApp> dataList = super.find(HQL);
		XzfyApp app = new XzfyApp();
		if (dataList.isEmpty()) {
			app = new XzfyApp();
		} else {
			app = dataList.get(0);
		}
		return app;
	}

	public XzfyAgent getAgentById(int entityId) {
		String HQL = "";
		HQL += " from XzfyAgent agent";
		HQL += " where 1 = 1";
		HQL += " and agent.id = " + entityId;
		List<XzfyAgent> dataList = super.find(HQL);
		XzfyAgent agent = new XzfyAgent();
		if (dataList.isEmpty()) {
			agent = new XzfyAgent();
		} else {
			agent = dataList.get(0);
		}
		return agent;
	}
	
	public void deleteAgentById(int entityId){
		String hql="delete from  XzfyAgent agent where agent.id="+entityId;
		super.deleteAll(hql);
	}
	
	public PaginationSupport getXzfyListByStatus(String status,int pageNumber, int pageSize) {
		String hql = "from XzfyInfo where STATUS = '" + status +"' order by receive_date desc";
		return super.find(hql, pageNumber, pageSize);
	}
	

   
	
	public PaginationSupport getTiquXzfyList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,User user) {
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);

		String HQL = "";
		HQL += " select xzfy.id,xzfy.receive_date,xzfy.app_show,xzfy.admit1,xzfy.defendant_name,xzfy.defendant_type,xzfy.receive_type,xzfy.jddetail,xzfy.admit2,xzfy.xzfy_requset_retail from XzfyInfo xzfy";
		HQL += " where 1 = 1 and xzfy.receive_date>'2013-12-22'";
		HQL += " and xzfy.status between 1 and 12   and xzfy.caseorg='"+org.getLocbm()+"'";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
			if(xzfyInfo.getAdmit1()!=null && !xzfyInfo.getAdmit1().equals(""))
				HQL+=" and (xzfy.admit1 like '%"+xzfyInfo.getAdmit1()+"%' or  xzfy.admit2 like '%"+xzfyInfo.getAdmit1()+"%')";
		}
		HQL +=" order by receive_date desc, id desc";
		return super.find(HQL, pageNumber, pageSize);	
	}
	
	public PaginationSupport getXzfyListNoEnd(int pageNumber, int pageSize) {
		String hql = "from XzfyInfo where STATUS < '" + 10 +"' order by receive_date desc";
		return super.find(hql, pageNumber, pageSize);
	}
	
	
	   public PaginationSupport getShenpiListById(int pageNumber, int pageSize,String entityId,String user_id){
			String HQL = "";
			HQL += " from XzfyInfo xzfy";
			HQL += " where 1 = 1";
			HQL += " and xzfy.check_status=1 ";
			return super.find(HQL, pageNumber, pageSize);
	    }
	   
	   
	   
	    public List<ArticleInfo> getArticleInfoList(int type) throws SQLException{
	    	String sql = "";
	    	if (type == 1){
	    		//sql="from ArticleInfo where isRelease ='1' and subColumn='11' order by isTop desc,RELEASEDATE desc and rownum<6";
	    		sql="select * from(select id,title,firstImage from articleinfo where isRelease ='1' and subColumn='11' order by isTop desc,RELEASEDATE desc) where rownum<6";
	    	}
	    	if (type == 3){
	    		//sql="from ArticleInfo where isRelease ='1' and subColumn='12' order by isTop desc,RELEASEDATE desc and rownum<9 ";
	    		sql="select * from(select id,title,firstImage from articleinfo where isRelease ='1' and subColumn='12' order by isTop desc,RELEASEDATE desc) where rownum<9";
	    	}
	    	if (type == 9){
	    		//sql="from ArticleInfo where isRelease ='1' and subColumn='21' order by isTop desc,RELEASEDATE desc and rownum<11";
	    		sql="select * from(select id,title,firstImage from articleinfo where isRelease ='1' and (subColumn='50' or subColumn='51' or subColumn='52') order by isTop desc,RELEASEDATE desc) where rownum<11";
	    	}
	    	if (type == 2){
	    		//sql="from ArticleInfo where isRelease ='1' and subColumn='21' order by isTop desc,RELEASEDATE desc and rownum<11";
	    		sql="select * from(select id,title,firstImage from articleinfo where isRelease ='1' and (subColumn='21') order by isTop desc,RELEASEDATE desc) where rownum<11";
	    	}
	    	if (type == 4){
	    		//sql="from ArticleInfo where isRelease ='1' and subColumn='31' order by isTop desc,RELEASEDATE desc and rownum<11";
	    		sql="select * from(select id,title,firstImage from articleinfo where isRelease ='1' and subColumn='31' order by isTop desc,RELEASEDATE desc) where rownum<7";
	    	}
	    	if (type == 5){
	    		//sql="from ArticleInfo where isRelease ='1' and subColumn='22' order by isTop desc,RELEASEDATE desc and rownum<8";
	    		sql="select * from(select id,title,firstImage from articleinfo where isRelease ='1' and (subColumn='53' or subColumn='54' or subColumn='55') order by isTop desc,RELEASEDATE desc) where rownum<8";
	    	}
	    	if (type == 6){
	    		//sql="from ArticleInfo where isRelease ='1' and columns='4' order by isTop desc,RELEASEDATE desc and rownum<8";
	    		sql="select * from(select id,title,firstImage from articleinfo where isRelease ='1' and columns='4' order by isTop desc,RELEASEDATE desc) where rownum<8";
	    	}
	    	Connection connection = JdbcUtil.getConnByHibernateConfig(); 
	    	Statement selectStatement = connection.createStatement();
	    	ResultSet resultSet = null;
	    	List<ArticleInfo> r = new ArrayList<ArticleInfo>();
	    	try{
	    		resultSet = selectStatement.executeQuery(sql);
	    		while(resultSet.next()){
	    			ArticleInfo articleInfo = new ArticleInfo();
	    			articleInfo.setId(resultSet.getInt(1));
	    			articleInfo.setTitle(resultSet.getString(2));
	    			articleInfo.setFirstImage(resultSet.getString(3));
	    			r.add(articleInfo);
	    		}
	    	}finally {
				try {
					if (selectStatement != null) {
						selectStatement.close();
						selectStatement = null;
					}
					if (connection != null) {
						connection.close();
						connection = null;
					}
				} catch (SQLException e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
			}
	    	
	    	return r;
	    }

		public List<XzfyInfo> getXzfyInfoListByUserid(String userid) {
			String sql = "from XzfyInfo where (user1_id = '" + userid + "' or user2_id = '" + userid + "') and status<12 order by receive_date";
			List<XzfyInfo> r = super.find(sql);
			List<XzfyInfo> xzfyInfo = new ArrayList<XzfyInfo>();
			for (XzfyInfo x:r){
				if (Integer.parseInt(x.getStatus()) < 4) {
					if (x.getUser1_id() != null && x.getUser1_id().equals(userid))
						xzfyInfo.add(x);
				} else if (Integer.parseInt(x.getStatus()) > 3 ) {
					if (x.getUser2_id() != null && x.getUser2_id().equals(userid))
						xzfyInfo.add(x);
				}
			}
			return xzfyInfo;
		}
		
		/*public List<ScheduleInfo> getScheduleInfoByUserId(String userId){
			String sql="from ScheduleInfo where recorderid = '"+userId+"' and scheduledate >= to_char(sysdate,'yyyy-mm-dd')";
			List<ScheduleInfo> si = super.find(sql);
			return si;
		}
		*/
		public static List findBySQL(String hql) {
			Session session;
			List list;
			Query query = null;
			session = null;
			list = null;
			try {
				session = HibernateSessionFactory.getSession();
				query = session.createSQLQuery(hql);
				list = query.list();
			} catch (Exception exception) {
				exception.printStackTrace();
			}finally{
				if (session != null && session.isOpen()) {
					session.close();
				}
			}
			return list;
		}
	
		public List<Beishenqingren> getBsqrName(String type,String locBm,List<Beishenqingren> blist){
			String hql="from Org org where org.locbm is not null order by org.locbm ";
			List<Org> orgAll=super.find(hql);

			//省级行政机关
			if("6".equals(type)){
				 Beishenqingren b = new Beishenqingren();
				 b.setType(type);
				 b.setName("北京市人民政府");
				 b.setValue("0000");
				 blist.add(b);
			}
			
			//区县政府
			if ("5".equals(type)){
				for(int i = 0;i<orgAll.size();i++){
					Org o =  orgAll.get(i);
					String bm = o.getLocbm();
					if(bm.length()==4){
						int a = Integer.parseInt(bm.substring(0, 2));
						if(bm.substring(2,4).equals("00") && a<19 && a!=0 && o.getParent().getId()==1){
							 Beishenqingren b = new Beishenqingren();
							 b.setType(type);
							 b.setName(o.getName());
							 b.setValue(o.getLocbm());
							 blist.add(b);
						}
					}
				}
			}
			
			//省级政府部门
			if ("7".equals(type)){
				for(int i = 0;i<orgAll.size();i++){
					Org o =  orgAll.get(i);
					String bm = o.getLocbm();
					if(bm.length()==4){
						int a = Integer.parseInt(bm.substring(0, 2));
						if(bm.substring(2,4).equals("00") && a>18){
							 Beishenqingren b = new Beishenqingren();
							 b.setType(type);
							 b.setName(o.getName());
							 b.setValue(o.getLocbm());
							 blist.add(b);
						}
					}
				}
			}
			
			//区县政府部门
			if ("4".equals(type)){
				int a = Integer.parseInt(locBm.substring(0,2));
				if(a<19){
					for(int i = 0;i<orgAll.size();i++){
						Org o =  orgAll.get(i);
						String bm = o.getLocbm();
						if(bm.length()==4){
							if(!bm.substring(2,4).equals("00") && bm.substring(0,2).equals(locBm.substring(0,2))){
								 Beishenqingren b = new Beishenqingren();
								 b.setType(type);
								 b.setName(o.getName());
								 b.setValue(o.getLocbm());
								 blist.add(b);
							}
						}
					}
				}
				if(a>18){
					for(int i = 0;i<orgAll.size();i++){
						Org o = orgAll.get(i);
						if (locBm.equals(o.getOrg_manage())){
							Beishenqingren b = new Beishenqingren();
							 b.setType(type);
							 b.setName(o.getName());
							 b.setValue(o.getLocbm());
							 blist.add(b);
						}
					}
				}
			}
			
			//县级政府
			if ("3".equals(type)){
				for(int i = 0;i<orgAll.size();i++){
					Org o =  orgAll.get(i);
					String bm = o.getLocbm();
					if(bm.length()==8){
						if(!bm.substring(6,8).equals("00") && bm.substring(0,2).equals(locBm.substring(0,2))){
							 Beishenqingren b = new Beishenqingren();
							 b.setType(type);
							 b.setName(o.getName());
							 b.setValue(o.getLocbm());
							 blist.add(b);
						}
					}
				}
			}

			//区县政府部门派出机构
			if ("9".equals(type)){
				for(int i = 0;i<orgAll.size();i++){
					Org o =  orgAll.get(i);
					String bm = o.getLocbm();
					if(bm.length()==6){
						if(!bm.substring(4,6).equals("00") && bm.substring(0,2).equals(locBm.substring(0,2))){
							 Beishenqingren b = new Beishenqingren();
							 b.setType(type);
							 b.setName(o.getName());
							 b.setValue(o.getLocbm());
							 blist.add(b);
						}
					}
				}
			}
		
			return blist;
		}
		

		public ArrayList getDiv51List(String startDate, String endDate, String userName) throws SQLException  {
			Connection connection = JdbcUtil.getConnByHibernateConfig();
			ArrayList arrayList = new ArrayList();
			try {
				String sql = "select " +
							"sum(case when t1.receive_date>='"+startDate+"' and t1.receive_date<='"+endDate+"' then 1 else 0 end) as zongshu1, " +
							"sum(case when t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) then 1 else 0 end) as zongshu2, " +
							"sum(case when t1.isstop!=1 and t1.isstop is not null and status<12 and t1.receive_date>='"+startDate+"' and t1.receive_date<='"+endDate+"' then 1 else 0 end) as banlizhong1, " +
							"sum(case when t1.isstop!=1 and t1.isstop is not null and status<12 and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) then 1 else 0 end) as banlizhong2, " +
							"sum(case when (t1.breakTo is null and t1.isstop=1) and status<12 and t1.receive_date>='"+startDate+"' and t1.receive_date<='"+endDate+"' then 1 else 0 end) as zhongzhi1, " +
							"sum(case when (t1.breakTo is null and t1.isstop=1) and status<12 and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) then 1 else 0 end) as zhongzhi2, " +
							"sum(case when t1.finish_type='2' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as weichi1, " +
							"sum(case when t1.finish_type='2' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as weichi2, " +
							"sum(case when t1.finish_type='1' and finishBreakType='5' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as yilvze1, " +
							"sum(case when t1.finish_type='1' and finishBreakType='5' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as yilvze2, " +
							"sum(case when t1.finish_type='1' and finishBreakType='6' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as bushouli1, " +
							"sum(case when t1.finish_type='1' and finishBreakType='6' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as bushouli2, " +
							"sum(case when t1.finish_type='1' and finishBreakType='7' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as bohuiqita1, " +
							"sum(case when t1.finish_type='1' and finishBreakType='7' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as bohuiqita2, " +
							"sum(case when t1.finish_type='4' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as chexiao1, " +
							"sum(case when t1.finish_type='4' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as chexiao2, " +
							"sum(case when t1.finish_type='5' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as biangeng1, " +
							"sum(case when t1.finish_type='5' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as biangeng2, " +
							"sum(case when t1.finish_type='3' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as queweifa1, " +
							"sum(case when t1.finish_type='3' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as queweifa2, " +
							"sum(case when t1.finish_type='6' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as zelinglvze1, " +
							"sum(case when t1.finish_type='6' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as zelinglvze2, " +
							"sum(case when t1.finish_type='8' and finishBreakType='1' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as hejiexieyi1, " +
							"sum(case when t1.finish_type='8' and finishBreakType='1' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as hejiexieyi2, " +
							"sum(case when t1.finish_type='8' and finishBreakType='2' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as ziyuanchehui1, " +
							"sum(case when t1.finish_type='8' and finishBreakType='2' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as ziyuanchehui2, " +
							"sum(case when t1.finish_type='8' and finishBreakType='3' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as gaibianchehui1, " +
							"sum(case when t1.finish_type='8' and finishBreakType='3' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as gaibianchehui2, " +
							"sum(case when t1.finish_type='8' and finishBreakType='4' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as zhongzhiqita1, " +
							"sum(case when t1.finish_type='8' and finishBreakType='4' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as zhongzhiqita2, " +
							"sum(case when t1.finish_type='7' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as tiaojie1, " +
							"sum(case when t1.finish_type='7' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as tiaojie2, " +
							"sum(case when t1.finish_type='9' and t1.receive_date>='"+startDate+"' and status=12 and t1.receive_date<='"+endDate+"' then 1 else 0 end) as qitachuli1, " +
							"sum(case when t1.finish_type='9' and t1.receive_date<='"+startDate+"' and (t1.finish_date>='"+startDate+"' or t1.finish_date is null) and status=12 then 1 else 0 end) as qitachuli2" +
							" from xzfy_info t1 ";
				
				if ("224".equals(userName) || "1613".equals(userName)){
					sql = sql + "where t1.user2_id in (select user_id from u_user where org_id='"+userName+"')";
				} else {
					sql = sql + " where t1.user2_id='"+userName+"' and t1.status>0";		
				}	
				arrayList = JdbcUtil.getSingleListBySql(connection,sql);
				
			} finally {
				try {
					if (connection != null) {
						connection.close();
						connection = null;
					}
				} catch (SQLException e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
			}
			return arrayList;
		}
		
		public ArrayList<XzfyInfo> getDiv52List(String startDate, String endDate, String users) {
			
			ArrayList<XzfyInfo> arrayList= new ArrayList<XzfyInfo> ();
			String HQL = "";
			HQL += " from XzfyInfo xzfyInfo";
			HQL += " where 1 = 1";
			HQL += " and xzfyInfo.receive_date <= '"+endDate+"'";
			HQL += " and xzfyInfo.receive_date >= '"+startDate+"'";
			//HQL += " and xzfyInfo.user2_name in ("+users+")";
			HQL += " and xzfyInfo.app_type2 = '"+users+"' and xzfyInfo.status>3";
			arrayList =  (ArrayList<XzfyInfo>) super.find(HQL);
			return arrayList;
		}
    

	
		public PaginationSupport getDiv52List_2(int pageNumber, int pageSize,
				String startDate, String endDate, String users) {
			
			
			//ArrayList<XzfyInfo> arrayList= new ArrayList<XzfyInfo> ();
			String HQL = "";
			 HQL +="select xzfy.id,xzfy.status,xzfy.check_status,xzfy.stadardResult,xzfy.tjzfzh,xzfy.break_right,xzfy.app_show,xzfy.xwname, xzfy.defendant_name,xzfy.receive_date,xzfy.user1_name,xzfy.user4_name,xzfy.user2_name,xzfy.user3_name  from XzfyInfo xzfy";
			//HQL += " from XzfyInfo xzfyInfo";
			HQL += " where 1 = 1";
			HQL += " and xzfy.receive_date <= '"+endDate+"'";
			HQL += " and xzfy.receive_date >= '"+startDate+"'";
			//HQL += " and xzfyInfo.user2_name in ("+users+")";
			HQL += " and xzfy.app_type2 = '"+users+"' and xzfy.status>3";
			
			
			
			
			return	 super.find(HQL, pageNumber, pageSize);
			// arrayList;
			
			
			
			//return super.find(HQL, pageNumber, pageSize);
			
			
			// TODO Auto-generated method stub
			
		}

		@Override
		public  List getXzfyByTB_flag(String TBflag) {
		//	String sql = "from XzfyInfo where (XzfyInfo.tbflag = '" + TBflag + "' ) ";
			String sql = "from XzfyInfo  xzfyInfo where  xzfyInfo.id ='"+TBflag+"' ";
		List<XzfyInfo> r = (List<XzfyInfo>) this.find(sql);
			
			return r;
		}
		public  List finddogs(String TBflag) {
			//	String sql = "from XzfyInfo where (XzfyInfo.tbflag = '" + TBflag + "' ) ";
				String sql = "from dogs  ";
				return this.find(sql);
				
				
			}
		
		
		 public List<List<String>> getXzfyInfoList(int type) throws SQLException{
		    	String sql = "";
		    
		    		//sql="from ArticleInfo where isRelease ='1' and subColumn='11' order by isTop desc,RELEASEDATE desc and rownum<6";
		    		sql="SELECT * FROM Xzfy_Info t WHERE t.id <>  '' ";
		    	
		    	
		    	Connection connection = JdbcUtil.getConnByHibernateConfig(); 
		    	Statement selectStatement = connection.createStatement();
		    	ResultSet resultSet = null;
		    	List<List<String>> r = new ArrayList<List<String>>();
		    	try{
		    		resultSet = selectStatement.executeQuery(sql);
		    		while(resultSet.next()){
		    			
		    			List<String> list=new ArrayList<String>();
		    			list.add(0, resultSet.getString(9));
		    			list.add(1, resultSet.getString(1));
		    			list.add(2, resultSet.getString(2));
		    			list.add(3, resultSet.getString(3));
		    			list.add(4, resultSet.getString(4));
		    			list.add(5, resultSet.getString(5));
		    			list.add(6, resultSet.getString(6));
		    			list.add(7, resultSet.getString(7));
		    			list.add(8, resultSet.getString(8));
		    			
		    			r.add(list);
		    		}
		    	}finally {
					try {
						if (selectStatement != null) {
							selectStatement.close();
							selectStatement = null;
						}
						if (connection != null) {
							connection.close();
							connection = null;
						}
					} catch (SQLException e) {
						System.out.println(e.getMessage());
						e.printStackTrace();
					}
				}
		    	
		    	return r;
		    }

		@Override
		public dogs findog() {
			// TODO Auto-generated method stub
			String HQL = "";
			HQL += " from dogs dog";
		
			List<dogs> doglist = this.find(HQL);
			dogs dog = new dogs();
			if (doglist.isEmpty()) {
				dog = new dogs();
			} else {
				dog =  doglist.get(0);
			}
			return dog;
			
			
			
		}
		
		
		
	
}
