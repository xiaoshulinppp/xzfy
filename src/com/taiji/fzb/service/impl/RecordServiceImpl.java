package com.taiji.fzb.service.impl;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork.ActionContext;
//import com.taiji.archive.domain.Archive;
import com.taiji.common.ContextUtil;
import com.taiji.core.dao.IHibernateDAO;
import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
//import com.taiji.fzb.domain.XzcjApp;
import com.taiji.fzb.domain.XzfyApp;
import com.taiji.fzb.domain.XzfyCompany;
import com.taiji.fzb.domain.XzfyInfo;
//import com.taiji.fzb.domain.XzfyDftz;
//import com.taiji.fzb.domain.XzfyLog;
//import com.taiji.fzb.domain.XzfyShenpi;
//import com.taiji.fzb.service.BananService;
import com.taiji.fzb.service.RecordService;
import com.taiji.user.domain.Org;
import com.taiji.user.domain.User;
import com.util.HibernateSessionFactory;
import com.util.UserUtil;


@SuppressWarnings("unchecked")
public class RecordServiceImpl extends CoreServiceImpl implements RecordService {

	
	@Override
	public XzfyInfo getXzfyById(String entityId) {
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.id = '" + entityId+"'";
		List<XzfyInfo> dataList = super.find(HQL);
		XzfyInfo xzfyInfo = new XzfyInfo();
		if (dataList.isEmpty()) {
			xzfyInfo = new XzfyInfo();
		} else {
			xzfyInfo = dataList.get(0);
		}
		return xzfyInfo;
	}
	
	public List  getUserListById(String orgId){
		List list=super.find("from Org org where org.id="+orgId);		
		Org org=new Org();
		org=(Org)list.get(0);
		String hql="from Org org where org.locbm='"+org.getLocbm()+"' order by org.id desc";
		List<Org> orgList=super.find(hql);
		String whereSql="";
		for(int i=0;i<orgList.size();i++){
			Org orgTmp=(Org)orgList.get(i);
			if(i==0)
				whereSql=whereSql+"("+orgTmp.getId();
			else
				whereSql=whereSql+","+orgTmp.getId();
			if(i==orgList.size()-1)
				whereSql=whereSql+")";	
		}
		String getUserSql="from User u where 1=1 and u.id>1 and  u.org.id in"+whereSql+" order by u.userSeq";
		List<User> userList=super.find(getUserSql);
		return userList;
				
	}
	public List  getUserListById(String orgId, String nosencse){
		/*List list=super.find("from Org org where org.id="+orgId);		
		Org org=new Org();
		org=(Org)list.get(0);
		String hql="from Org org where org.locbm='"+org.getLocbm()+"' order by org.id desc";
		List<Org> orgList=super.find(hql);
		String whereSql="";
		for(int i=0;i<orgList.size();i++){
			Org orgTmp=(Org)orgList.get(i);
			if(i==0)
				whereSql=whereSql+"("+orgTmp.getId();
			else
				whereSql=whereSql+","+orgTmp.getId();
			if(i==orgList.size()-1)
				whereSql=whereSql+")";	
		}*/
		String getUserSql="from User u where 1=1 and u.id>1 and  u.org.id ="+orgId+" order by u.userSeq";
		List<User> userList=super.find(getUserSql);
		return userList;
				
	}
	
	public PaginationSupport getShenpiListById(int pageNumber, int pageSize,String user_id){
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.check_status=1 and xzfy.check_id="+user_id+"";
		return super.find(HQL, pageNumber, pageSize);
	}
	
	
	/*public void  save_log(String status,String caozuo,String xzfyId,Object objNew){
		
		//判断案件状态
		String stage ="";
		//log_info
		String info="";
		if(status.equals("1")) {
			stage="立案审查";
		}
		if(status.equals("2")) {
			stage="补正审批";
		} else if (status.equals("3")) {
			stage="立案审批";
		} else if (status.equals("4")) {
			stage="案件办理";
		} else if (status.equals("5")) {
			stage="延期审批";
		} else if (status.equals("6")) {
			stage="案件延期";
		} else if (status.equals("7")) {
			stage="中止审批";
		} else if (status.equals("8")) {
			stage="案件中止";
		} else if (status.equals("9")) {
			stage="恢复审理审批";
		} else if (status.equals("10")) {
			stage="恢复审理";
		} else if (status.equals("11")) {
			stage="结案审批";
		} else if (status.equals("12")) {
			stage="结案";
		}
		
		XzfyInfo objOld=this.getXzfyById(xzfyId);
		//update_name
		String user = UserUtil.getUserName();		
		//log_info
		info = user + "在" +stage + "阶段" + caozuo;
		//判断对象内容是否被修改
		
		try {
			info += " "  + this.objectCompare(objOld,objNew);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//log_time
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String logTime = df.format(new Date());
		
		XzfyLog log = new XzfyLog();
		log.setLog_info(info);
		log.setLog_time(logTime);
		log.setUpdate_name(user);

		//XzfyInfo xzfyInfo = (XzfyInfo) this.coreService.getEntityObjectById(XzfyInfo.class, xzfyId);
		log.setXzfyId(xzfyId);
		super.save(log);
	}*/
	
	private String objectCompare(Object ob1,Object ob2) throws IntrospectionException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		if(ob1==null&&ob2==null){
			return "";
		}
		Class clazz = ob1.getClass();
		String r = clazz.getName();
		Field[] fields = ob1.getClass().getDeclaredFields();
		for (Field field:fields){
		if(!field.getName().equals("tAppDeptId") && !field.getName().equals("tPoliceIsParade")){
			//System.out.println(field.getName());
			if (field.getType() !=null &&field.getType().getName().equals("java.lang.String")){
				PropertyDescriptor pd = new PropertyDescriptor(field
						.getName(), clazz);
				Method method = pd.getReadMethod();
				Object o1 = method.invoke(ob1);
				Object o2 = method.invoke(ob2);
				if(o1 !=null){
					if(o2 !=null){
						if (!o1.toString().equals(o2.toString()) || o1!=o2 || !o1.equals(o2)) {
							r+=field.getName() + "被更改(" + o1.toString() + "|" + o2.toString() + ");";
							//System.out.println(field.getName()+" has changed");
						}
					}else{
						r+=field.getName() + "被更改(" + o1.toString() + "|null);";
					}
				}else{
					if(o2 !=null){
						r+=field.getName() + "被更改(null|" + o2.toString() + ");";
					}
				}
			} 
		 }	
		}
		if (r.equals(clazz.getName())){
			r="";
		}
		return r;
	}
	
	public Org getOrg(){
		User user = (User) ActionContext.getContext().getSession()
				.get("_USER_LOGIN_");
		
		String hql="from Org org where org.id="+user.getOrg().getId();
		Org org=(Org)super.find(hql).get(0);
		return org;
	}
	
	
	public List getLogList(String xzfyId){
		String Hql="from XzfyLog log where log.xzfyId='"+xzfyId+"' order by log.id desc";
		List logList=super.find(Hql);
		return logList;
	}
	
	public PaginationSupport getCheckList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id){
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.check_status=1 and xzfy.check_id="+user_id+"";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		return super.find(HQL, pageNumber, pageSize);		
	}
	
	public PaginationSupport getUserShenChaList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id){
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.check_status=0 and xzfy.user1_id="+user_id+" and " +
				"(xzfy.status in (1,2,3) or (xzfy.stadardResult not in (1) and xzfy.status=11))";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		return super.find(HQL, pageNumber, pageSize);	
	}
	
	public PaginationSupport getUserBanLiList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,String user_id){
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.check_status=0 and xzfy.user2_id="+user_id+" and " +
				"((xzfy.status>3 and xzfy.status<11) or (xzfy.stadardResult=1 and xzfy.status=11))";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		return super.find(HQL, pageNumber, pageSize);	
	}
	
	

	public PaginationSupport getTotalList(int pageNumber, int pageSize,XzfyInfo xzfyInfo,User user){
		String orqSql="from Org org where org.id="+user.getOrg().getId();
		List orgList=super.find(orqSql);
		Org org=(Org)orgList.get(0);
		
		String HQL = "";
		HQL += " from XzfyInfo xzfy";
		HQL += " where 1 = 1";
		HQL += " and xzfy.status between 1 and 11   and xzfy.caseorg='"+org.getLocbm()+"'";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				HQL+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				HQL+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				HQL+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				HQL+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}

		return super.find(HQL, pageNumber, pageSize);	

		/*
		String sql="select * from (" +
				"select tjzfzh,receive_date,app_show,app_type,defendant_name,user1_name,user2_name,status," +
				"xzfy.id,t2.user_name " +
				"from xzfy_info xzfy join u_user t2 on t2.user_id=xzfy.check_id where 1=1";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				sql+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				sql+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				sql+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				sql+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		sql=sql+") where rownum between "+(pageNumber*pageSize+1-pageSize)+" and "+pageSize;
		
		return findBySQL(sql);	
		*/
		
	}
	
	public int getTotaCount(XzfyInfo xzfyInfo,User user){
		String sql="select count(1) count_id " +
				"from xzfy_info xzfy join u_user t2 on t2.user_id=xzfy.check_id where 1=1";
		if(xzfyInfo!=null){
			if(xzfyInfo.getTjzfzh()!=null && !xzfyInfo.getTjzfzh().equals(""))
				sql+=" and xzfy.tjzfzh like '%"+xzfyInfo.getTjzfzh()+"%'";
			if(xzfyInfo.getReceive_date()!=null && !xzfyInfo.getReceive_date().equals(""))
				sql+=" and xzfy.receive_date='"+xzfyInfo.getReceive_date()+"'";
			if(xzfyInfo.getDefendant_name()!=null && !xzfyInfo.getDefendant_name().equals(""))
				sql+=" and xzfy.defendant_name like '%"+xzfyInfo.getDefendant_name()+"%'";
			if(xzfyInfo.getApp_show()!=null && !xzfyInfo.getApp_show().equals(""))
				sql+=" and xzfy.app_show like '%"+xzfyInfo.getApp_show()+"%'";
		}
		return totalCount(sql);
		
	}
	
	public int getTotalPage(int count,int pageSize,int pageNumber){
		return totalPage(count,pageSize,pageNumber);
		
	}
	
	public static int totalPage(int count,int pageSize,int pageNumber){

		int totalCount=count;
		if(totalCount<pageSize)
			return 1;
		else{
			
			if(totalCount%pageSize==0)
				return totalCount/pageSize;
			else
				return totalCount/pageSize+1;
		}
		
	}
	
	public  int totalCount(String sql){
		List list=findBySQL(sql);
		String count=list.get(0).toString();
		int totalCount=Integer.parseInt(count);
		return totalCount;
		
	}
	
	public  List findListBySQL(String hql){
		return findBySQL(hql);
	}
	
	public  List findBySQL(String hql) {
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
	
	public User getUserById(String userId){
		String hql="from User u where u.id="+userId;
		List userList=super.find(hql);
		User user=(User)userList.get(0);
		return user;
	}
	
	public PaginationSupport getXzfyListByStatus(int pageNumber, int pageSize) {
		String hql = "from XzfyInfo where STATUS in (1,2,3,4,5,6,7,8,9,10,11) order by id desc";
		return super.find(hql, pageNumber, pageSize);
	}
	
	public List getCheckListByXzfyID(String xzfyId,String type){
		String hql="from XzfyShenpi shenpi where shenpi.check_type="+type
				+" and shenpi.xzfyInfo.id='"+xzfyId+"' and (shenpi.sqspren_id is null or shenpi.sqspren_id<1)" +
						"order by shenpi.id asc";
		List checkList=super.find(hql);
		return checkList;
	}
	
	public XzfyCompany getXzfyComById(String code,String name){
		XzfyCompany xzfyCom=null;
		String HQL="";
		HQL+=" from XzfyCompany xzfy";
	    HQL+=" where 1=1";
	    HQL+=" and xzfy.corpCode='"+code+"'";
	    List dataList=super.find(HQL);
	    if(dataList.isEmpty()){
	    	xzfyCom=new XzfyCompany();
	    	xzfyCom.setCorpCode(code);
//	    	xzfyCom.setAddress("null");
//	    	xzfyCom.setContact("null");
//	    	xzfyCom.setFax("null");
	    	xzfyCom.setWorkName(name);
//	    	
//	    	xzfyCom.setRepresentInLaw("null");
//	    	xzfyCom.setPosition_Repnt("null");
//	    	xzfyCom.setTelephone_Repnt("null");
//	    	xzfyCom.setName_LegalInstitude("null");
	    	xzfyCom.setProperty_LegalInstitude("0");
//	    	xzfyCom.setQuantity_Xzfy("null");
//	    	xzfyCom.setName_Xzfy("null");
//	    	xzfyCom.setStaffing_Xzfy("null");
//	    	xzfyCom.setRepresent_Xzfy("null");
//	    	xzfyCom.setPosition_Xzfy("null");
//	    	xzfyCom.setPhone_Xzfy("null");
//	    	xzfyCom.setMobile_Xzfy("null");
//	    	xzfyCom.setNumFull_XzfyStaff("null");
//	    	xzfyCom.setNumPart_XzfyStaff("null");
//	    	xzfyCom.setQuantity_Hearing("null");
//	    	xzfyCom.setQuantity_Reading("null");
//	    	xzfyCom.setQuantity_Receiving("null");
	    	xzfyCom.setCar_Casing("0");
//	    	xzfyCom.setQuantity_Casing("null");
	    	xzfyCom.setBudgetInclude("0");
	    	xzfyCom.setShenPiMode("0");
	    	xzfyCom.setPlaceSetUp("0");
//	    	xzfyCom.setFullNameRect("null");
//	    	xzfyCom.setDetailAddressRect("null");
//	    	xzfyCom.setForeignPhoneRect("null");	
	    	
	    	this.save(xzfyCom);
	    }
	    else{
	    	xzfyCom=(XzfyCompany)dataList.get(0);
	    }
	    return xzfyCom;
	}	
	
	public Org getRootOrg(String locBM){
		String hql="from Org org where org.locbm='"+locBM+"' order by org.id asc";
		List<Org> list1=super.find(hql);
		Org org=(Org)list1.get(0);
		return org;
	}
	
	public String getOutOfDate(String xzfyId){
		String sql="select t.receive_date, to_char(to_date(t.receive_date,'yyyy-mm-dd')+5,'yyyy-mm-dd') from xzfy_info t  where t.id='"+xzfyId+"'";
		List list=this.findBySQL(sql);
		Object[] o = (Object[]) list.get(0);
		String start=o[0].toString();
		String end=o[1].toString();
		String sql1="select * from xzfy_word_date where work_date>='"+start+"' and work_date<='"+end+"'";
		List list1=this.findBySQL(sql1);
		int count=list1.size();
		if(count>0){
			int dateCount=5+count;
			String sql2="select to_char(to_date(t.receive_date,'yyyy-mm-dd')+"+dateCount+",'yyyy-mm-dd') from xzfy_info t  where t.id='"+xzfyId+"'";
			List list2=this.findBySQL(sql2);
			end=list2.get(0).toString();
		}
		return end;
		
	}
	
	
	public List getCaseOrgList(){
		String sql="select * from ( " +
				"select distinct t.break_right,t.caseorg from xzfy_info t " +
				"where substr(t.caseorg,3,4)='00' and t.break_right is not null order by t.caseorg) " +
				"union all " +
				"select * from (" +
				"select distinct t1.break_right,t1.caseorg from xzfy_info t1 " +
				"where substr(t1.caseorg,3,4)>'00' and t1.break_right is not null  order by t1.caseorg)";
		return this.findBySQL(sql);
		
	}
	
	public String getOrgTree(){
		String treeDiv="<div id='menu'><h3>请选择复议机关</h3>\n";
		treeDiv=treeDiv+"<ul>\n" +
				"<li><em></em><a href='javascript:;'>市政府</a>\n";
		treeDiv=treeDiv+"<ul>\n<li><a href='javascript:setOrg(\""+"0000"+"\",\"北京市人民政府\");'>北京市人民政府</a></li>\n</ul>\n</li>\n";
		treeDiv=treeDiv+"<li><em></em><a href='javascript:;'>区县政府</a>\n<ul>\n";
		String sql="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)<'19' and substr(t.org_locbm,3,4)='00' and org_locbm>'0000' and t.org_parent=1 order by t.org_locbm";
		List orgList=this.findBySQL(sql);
		for(int i=0;i<orgList.size();i++){
			Object[] o = (Object[]) orgList.get(i);
			if(i==orgList.size()-1){
				
				String sqla="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)='"+o[1].toString().substring(0, 2)+"' " +
						"and substr(t.org_locbm,3,4)>'00' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li id='end'><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}else{
				
				String sqla="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)='"+o[1].toString().substring(0, 2)+"' " +
						"and substr(t.org_locbm,3,4)>'00' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}
		}
		treeDiv=treeDiv+"</ul>\n</li>\n";
		treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:;'>市政府部门</a>\n<ul>\n";
		String sql1="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)>'18' and substr(t.org_locbm,3,4)='00'  and t.org_parent=1 order by t.org_locbm";
		List orgList1=this.findBySQL(sql1);
		for(int i=0;i<orgList1.size();i++){
			Object[] o = (Object[]) orgList1.get(i);
			if(i==orgList1.size()-1){				
				String sqla="select t.org_name,t.org_locbm from u_org t where t.org_manage='"+o[1].toString()+"' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString().substring(0, 2)+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li id='end'><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}else{

				String sqla="select t.org_name,t.org_locbm from u_org t where t.org_manage='"+o[1].toString()+"' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}
		}
		
		treeDiv=treeDiv+"</ul>\n</li>\n</ul>\n</div>";
		return treeDiv;
	}
	public String getOrgTree1(){
		String treeDiv="<div id='menu'><h3>请选择复议机关</h3>\n";
		treeDiv=treeDiv+"<ul>\n<li><em></em><a href='javascript:;'>区县政府</a>\n<ul>\n";
		String sql="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)<'19' and substr(t.org_locbm,3,4)='00' and org_locbm>'0000' and t.org_parent=1 order by t.org_locbm";
		List orgList=this.findBySQL(sql);
		for(int i=0;i<orgList.size();i++){
			Object[] o = (Object[]) orgList.get(i);
			if(i==orgList.size()-1){
				
				String sqla="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)='"+o[1].toString().substring(0, 2)+"' " +
						"and substr(t.org_locbm,3,4)>'00' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li id='end'><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}else{
				
				String sqla="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)='"+o[1].toString().substring(0, 2)+"' " +
						"and substr(t.org_locbm,3,4)>'00' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}
		}
		treeDiv=treeDiv+"</ul>\n</li>\n";
		treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:;'>市政府部门</a>\n<ul>\n";
		String sql1="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)>'18' and substr(t.org_locbm,3,4)='00'  and t.org_parent=1 order by t.org_locbm";
		List orgList1=this.findBySQL(sql1);
		for(int i=0;i<orgList1.size();i++){
			Object[] o = (Object[]) orgList1.get(i);
			if(i==orgList1.size()-1){				
				String sqla="select t.org_name,t.org_locbm from u_org t where t.org_manage='"+o[1].toString()+"' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString().substring(0, 2)+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li id='end'><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}else{

				String sqla="select t.org_name,t.org_locbm from u_org t where t.org_manage='"+o[1].toString()+"' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}
		}
		
		treeDiv=treeDiv+"</ul>\n</li>\n</ul>\n</div>";
		return treeDiv;
	}
	public String getOrgTree2(){
		String treeDiv="<div id='menu'><h3>请选择复议机关</h3>\n";
		treeDiv=treeDiv+"<ul>\n" +
				"<li><em></em><a href='javascript:;'>市政府</a>\n";
		treeDiv=treeDiv+"<ul>\n<li><a href='javascript:setOrg(\""+"0000"+"\",\"北京市人民政府\");'>北京市人民政府</a></li>\n</ul>\n</li>\n";
		treeDiv=treeDiv+"<li><em></em><a href='javascript:;'>区县政府</a>\n<ul>\n";
		String sql="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)<'19' and substr(t.org_locbm,3,4)='00' and org_locbm>'0000' and t.org_parent=1 order by t.org_locbm";
		List orgList=this.findBySQL(sql);
		for(int i=0;i<orgList.size();i++){
			Object[] o = (Object[]) orgList.get(i);
			if(i==orgList.size()-1){
				
				String sqla="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)='"+o[1].toString().substring(0, 2)+"' " +
						"and substr(t.org_locbm,3,4)>'00' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li id='end'><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}else{
				
				String sqla="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)='"+o[1].toString().substring(0, 2)+"' " +
						"and substr(t.org_locbm,3,4)>'00' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}
		}
		treeDiv=treeDiv+"</ul>\n</li>\n";
		treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:;'>市政府部门</a>\n<ul>\n";
		String sql1="select t.org_name,t.org_locbm from u_org t where substr(t.org_locbm,0,2)>'18' and substr(t.org_locbm,3,4)='00'  and t.org_parent=1 order by t.org_locbm";
		List orgList1=this.findBySQL(sql1);
		for(int i=0;i<orgList1.size();i++){
			Object[] o = (Object[]) orgList1.get(i);
			if(i==orgList1.size()-1){				
				String sqla="select t.org_name,t.org_locbm from u_org t where t.org_manage='"+o[1].toString()+"' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li id='end'><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString().substring(0, 2)+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li id='end'><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}else{

				String sqla="select t.org_name,t.org_locbm from u_org t where t.org_manage='"+o[1].toString()+"' and t.org_fy=1  order by t.org_locbm";
				List orgLista=this.findBySQL(sqla);
				
				if(orgLista.size()>0){
					treeDiv=treeDiv+"<li><em></em><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"<ul>\n";
					for(int j=0;j<orgLista.size();j++){
						Object[] org = (Object[]) orgLista.get(j);
						treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+org[1].toString()+"\",\""+org[0].toString()+"\");'>"+org[0].toString()+"</a></li>\n";
					}
					treeDiv=treeDiv+"</ul>\n</li>\n";
				}else{
					treeDiv=treeDiv+"<li><a href='javascript:setOrg(\""+o[1].toString()+"\",\""+o[0].toString()+"\");'>"+o[0].toString()+"</a>\n";
					treeDiv=treeDiv+"</li>\n";
				}
			}
		}
		
		treeDiv=treeDiv+"</ul>\n</li>\n</ul>\n</div>";
		return treeDiv;
	}

	@Override
	public List getArchivesByXzfyId(String xzfyId) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	/*public Archive getArchiveById(String id){
		
		String HQL="";
		HQL="from Archive archive where archive.id='"+id+"'";
		List<Archive> dataList = super.find(HQL);
		Archive archive = new Archive();
		if(!dataList.isEmpty())
			archive = dataList.get(0);
		return archive;
		
	}
	
	public List<Archive> getArchivesByXzfyId(String xzfyId){
		String HQL="from Archive archive where archive.xzfyId='"+xzfyId+"'";
		return super.find(HQL);
	}*/
}
