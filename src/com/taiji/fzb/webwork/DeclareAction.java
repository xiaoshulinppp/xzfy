package com.taiji.fzb.webwork;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.awt.Color;
import java.io.ByteArrayOutputStream;//
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.patterns.Declare;

import javax.servlet.http.HttpServletRequest;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;



import com.lowagie.text.Cell;
import com.lowagie.text.Document;//
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.Paragraph;//
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.Table;
import com.lowagie.text.rtf.RtfWriter2;//
import com.opensymphony.webwork.ServletActionContext;
import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.fzb.util.TheFreemarker;
import com.taiji.fzb.util.Word2Pdf;


/**
 * 此类由 WAFDAOBuilder2.2 生成
 * 类描述:企业申报信息 控制类
 * 生成时间:2013/10/23 03:55:40
 * 版权所有:太极计算机股份有限公司
 */ 
public class DeclareAction extends ProtectedDetailAction{
   private static final long serialVersionUID = 1L;
  // private Declare declare;
  // private LegalLibrary legalLibrary;
   //public LegalLibrary getLegalLibrary() {
	//return legalLibrary;
//}
//public void setLegalLibrary(LegalLibrary legalLibrary) {
//	this.legalLibrary = legalLibrary;
//}
private String patentname;//专利名称
   private String investigatedepartment;//专利审查信息
   private String qualifinname;//资质名称
   private String issunit;//资格资质批发单位
   private String licenseName;//生产许可证名称
   private String approvedOffice;//生产许可证批准机关
   private String trademarkName;//注册商标名称
   private String approvedOffice1;//注册商标批准机关
   private String certifiname;//管理体系认证名称
   private String certifidept;//管理体系认证机构
   private String honourname;//近三年获得的荣誉奖励信息荣誉名称
   private String issunit1;//荣誉颁发单位
   private String participateYear;//公益活动年度
   private String contribution;//公益活动贡献
   private String examinestate;//审核状态
   private String sexaminestate;
   private String did;
   private Date expdate;
   private String zgzzyxq;
   private String scxk;
   private String zlxxsj;
   private String gltxsj;
   private String ryjb;
   private String dname;
   private String dcodeing;
   
   public String getDname() {
	return dname;
}
public void setDname(String dname) {
	this.dname = dname;
}
public String getDcodeing() {
	return dcodeing;
}
public void setDcodeing(String dcodeing) {
	this.dcodeing = dcodeing;
}
public String getGltxsj() {
	return gltxsj;
}
public void setGltxsj(String gltxsj) {
	this.gltxsj = gltxsj;
}
public String getZlxxsj() {
	return zlxxsj;
}
public void setZlxxsj(String zlxxsj) {
	this.zlxxsj = zlxxsj;
}
public String getScxk() {
	return scxk;
}
public void setScxk(String scxk) {
	this.scxk = scxk;
}
public String getZgzzyxq() {
	return zgzzyxq;
}
public void setZgzzyxq(String zgzzyxq) {
	this.zgzzyxq = zgzzyxq;
}
public String getDid() {
	return did;
}
public void setDid(String did) {
	this.did = did;
}
public String getSexaminestate() {
	return sexaminestate;
}
public void setSexaminestate(String sexaminestate) {
	this.sexaminestate = sexaminestate;
}
public String getExaminestate() {
	return examinestate;
}
public void setExaminestate(String examinestate) {
	this.examinestate = examinestate;
}
private String content;//审核意见
   private String suggester;//审核人
  // private ManagementInfo managementInfo;//管理信息
  // private Filecoding filecoding;//
 //  public ManagementInfo getManagementInfo() {
 //      return managementInfo;
 //  }
 //  public void setManagementInfo(ManagementInfo managementInfo) {
 //      this.managementInfo= managementInfo;
 //  }
 //  private CreditRecord creditRecord;//诚信记录
 //  public CreditRecord getCreditRecord() {
 //      return creditRecord;
 //  }
  // public void setCreditRecord(CreditRecord creditRecord) {
  //     this.creditRecord= creditRecord;
 //  }
   
public String getContent() {
	   return content;
   }
   public void setContent(String content) {
	   this.content = content;
   }
   List honourList;//荣誉信息
   List qualifiInfoList;//资格资质信息
   List licenseList;//生产许可证信息
   List manageCertifiList;//管理体系认证
   List patentList;//专利信息
   List trademarkList;//注册商标信息
   List welfareActivityList;//社会公益活动信息
   List xhmclist;//协会商会的数据字典
   List suggestionList;//审核意见过程存储
   
   HashMap nowyearList = new LinkedHashMap(); //近三年的年份
   HashMap ryjbList = new LinkedHashMap(); //年三年获得荣誉级别
   
   
public List getSuggestionList() {
	   return suggestionList;
   }
   public void setSuggestionList(List suggestionList) {
	   this.suggestionList = suggestionList;
   }
   public List getWelfareActivityList() {
		return welfareActivityList;
	}
	public void setWelfareActivityList(List welfareActivityList) {
		this.welfareActivityList = welfareActivityList;
	}
	public List getTrademarkList() {
		return trademarkList;
	}
	public void setTrademarkList(List trademarkList) {
		this.trademarkList = trademarkList;
	}
	public List getManageCertifiList() {
		return manageCertifiList;
	}
	public void setManageCertifiList(List manageCertifiList) {
		this.manageCertifiList = manageCertifiList;
	}
	public List getPatentList() {
		return patentList;
	}
	public void setPatentList(List patentList) {
		this.patentList = patentList;
	}
	public List getLicenseList() {
		return licenseList;
	}
	public void setLicenseList(List licenseList) {
		this.licenseList = licenseList;
	}
	public List getQualifiInfoList() {
		return qualifiInfoList;
	}
	public void setQualifiInfoList(List qualifiInfoList) {
		this.qualifiInfoList = qualifiInfoList;
	}
	public List getHonourList() {
		return honourList;
	}
	public void setHonourList(List honourList) {
		this.honourList = honourList;
	}
	List declareList ;
	   public List getDeclareList() {
		return declareList;
	}
	public void setDeclareList(List declareList) {
		this.declareList = declareList;
	}
	

	
   public List getXhmclist() {
		return xhmclist;
	}
	public void setXhmclist(List xhmclist) {
		this.xhmclist = xhmclist;
	}

	public String getPatentname() {
		return patentname;
	}
	public void setPatentname(String patentname) {
		this.patentname = patentname;
	}
	public String getInvestigatedepartment() {
		return investigatedepartment;
	}
	public void setInvestigatedepartment(String investigatedepartment) {
		this.investigatedepartment = investigatedepartment;
	}

   
	
	private String sgroup;//协会名称拼音简写
	public String getSgroup(){
       return sgroup;
	}   
	public void setSgroup(String sgroup) {
       this.sgroup= sgroup.toUpperCase();
	}
   
	public String execute(){
		

         return  SUCCESS;
	}
    public boolean isRole(String [] roleList,String rid){
    	boolean v = false;
    	if(roleList!=null&&roleList.length>0){
	    	 for (int i=0;i<roleList.length;i++){
	    		 if(rid.equals(roleList[i])){
	    			 v=true;
	    			 break;
	    		 }
	    	 }
	     }
    	return v;
    }
    
    
    
	  /*public String zancunTempDeclare(){
	  	  
		    Connection conn = null;
		    try{
			 conn = WAFDBConnectionFactory.getInstance().getConnection();
			 String cruser=this.getCurrentUser().getUserId();
		     int count= DeclareProxy.getDeclareEntityCountByCreateuser(cruser,conn);//当前用户申报的的个数
		     String id = declare.getDeclareid();
		     String[] roleList = WafUserProxy.getWafUserRoleIds(cruser, conn);
		     String sysadmin = WAFConfigure.getProperty("sysadmin");
		     if(count==0||isRole(roleList,sysadmin)){
		     
		      if(id==null||id.equals("")){
		        id = IdGenerator.getId(Declare.class);
		        declare.setDeclareid(id);
		        declare.setExaminestate("暂存");
		      }
		      String testRole = WAFConfigure.getProperty("testRole");
		      if(isRole(roleList,testRole)){
		    	  WafUser u = this.getCurrentUser();
		    	  if(u!=null){
		    		  u.setLoginName(declare.getOrganizationcode());
		    		  WafUserProxy.updateWafUser(u, conn);
		    	  }
		      }
		      QualifiInfoProxy.deleteQualifiInfoByDId(id, conn);
		      DeclareProxy.insertDeclare(declare,conn);
			  //插入filecoing开始
//			  WafUser user=this.getCurrentUser();
//			  String coding=user.getUserName();
//			  filecoding=FilecodingProxy.getFilecodingByCoding(coding, conn);
//			  filecoding.setInfo1(user.getUserId());//info1存当前用户的id
//			  filecoding.setInfo2(id);//info2存申报id
//			  filecoding.setInfo3(declare.getCompanyname());//info3存公司名称，info4存储登录名称了
//			  filecoding.setInfo5("未提交");//info5存储审核状态,未提交状态
//			  FilecodingProxy.updateFilecoding(filecoding, conn);
			  //插入filecoing结束
		      //插入专利信息开始
		      String patentnam[]=this.getPatentname().split(",");
			  String investigate[]=this.getInvestigatedepartment().split(",");
			  String zlxxsj[]=this.getZlxxsj().split(",");
			  for(int i=0;i<patentnam.length;i++){
				  String patentnams=patentnam[i];
				  if(patentnams!=null) patentnams=patentnams.trim();
				  if(patentnams!=null && !"".equals(patentnams)){
				  Patent patent = new Patent();
				  patent.setPatentid(IdGenerator.getId(Patent.class));
				  patent.setDeclareid(id);
				  patent.setPatentname(patentnams);
				  patent.setInvestigatedepartment(investigate[i].trim());
				  patent.setInfo10(zlxxsj[i].trim());
				  PatentProxy.insertPatent(patent,conn);
				  }
			  }  
			//插入专利信息结束
		      //插入生产许可证信息开始
		      String licenseName[]=this.getLicenseName().split(",");
			  String approvedOffice[]=this.getApprovedOffice().split(",");
			  String scxk[]=this.getScxk().split(",");
			  for(int i=0;i<licenseName.length;i++){
				  String licenseNames=licenseName[i];
				  if(licenseNames!=null) licenseNames=licenseNames.trim();
				  if(licenseNames!=null && !"".equals(licenseNames)){
				  License license =new License();
				  license.setLicenseId(IdGenerator.getId(License.class));
				  license.setLicenseName(licenseNames);
				  license.setDeclareid(id);
				  license.setApprovedOffice(approvedOffice[i].trim());
				  license.setInfo10(scxk[i].trim());
				  LicenseProxy.insertLicense(license, conn);
				  }
			  }  
			//插入生产许可证信息结束
			  
		      //插入注册商标信息开始
			  String trademarkName[]=this.getTrademarkName().split(",");
			  String approvedOffice1[]=this.getApprovedOffice1().split(",");
			  for(int i=0;i<trademarkName.length;i++){
				  String trademarkNames=trademarkName[i];
				  if(trademarkNames!=null) trademarkNames=trademarkNames.trim();
				  if(trademarkNames!=null && !"".equals(trademarkNames)){
				  Trademark trademark=new Trademark();
				  trademark.setTrademarkId(IdGenerator.getId(Trademark.class));
				  trademark.setDeclareid(id);//cgc
				  trademark.setTrademarkName(trademarkNames);
				  trademark.setApprovedOffice(approvedOffice1[i].trim());
				  TrademarkProxy.insertTrademark(trademark, conn);
				  }
			  }  
			//插入注册商标信息结束
		      //插入管理体系认证信息开始
			  String certifiname[]=this.getCertifiname().split(",");
			  String certifidept[]=this.getCertifidept().split(",");
			  String gltxsj[]=this.getGltxsj().split(",");
			  for(int i=0;i<certifiname.length;i++){
				  String certifinames=certifiname[i];
				  if(certifinames!=null) certifinames=certifinames.trim();
				  if(certifinames!=null && !"".equals(certifinames)){
				  ManageCertifi manageCertifi=new ManageCertifi();
				  manageCertifi.setCertifiid(IdGenerator.getId(ManageCertifi.class));
				  manageCertifi.setDeclareid(id);//cgc
				  manageCertifi.setCertifiname(certifinames);
				  manageCertifi.setCertifidept(certifidept[i].trim());
				  manageCertifi.setInfo10(gltxsj[i].trim());
				  ManageCertifiProxy.insertManageCertifi(manageCertifi, conn);
				  }
			  }  
			//插入管理体系认证信息结束
			  //插入资格资质信息
			  String qualifinname[]=this.getQualifinname().split(",");
			  String issunit[]=this.getIssunit().split(",");
			  String zgzz[]=this.getZgzzyxq().split(",");
			  for(int i=0;i<qualifinname.length;i++){
				  String qulifinames = qualifinname[i];
				  if(qulifinames!=null)qulifinames=qulifinames.trim();
				  if(qulifinames!=null && !"".equals(qulifinames)){
					  QualifiInfo qualifiInfo=new QualifiInfo();
					  qualifiInfo.setQualifiid(IdGenerator.getId(QualifiInfo.class));
					  qualifiInfo.setDeclareid(id);
					  qualifiInfo.setQualifinname(qulifinames);
					  qualifiInfo.setIssunit(issunit[i].trim());
					  qualifiInfo.setInfo10(zgzz[i].trim());
					  QualifiInfoProxy.insertQualifiInfo(qualifiInfo, conn);
				  }
			  }  
			//插入资格资质信息结束

			  //插入管理信息开始
			  String miid = managementInfo.getManagementId();
		      if(miid==null||miid.equals("")){
		    	  miid = IdGenerator.getId(ManagementInfo.class);
		        managementInfo.setManagementId (miid);
		        managementInfo.setDeclareid(id);
		      }
		      ManagementInfoProxy.insertManagementInfo(managementInfo,conn);
			  
			  //插入管理信息结束
			  //插入诚信记录开始
			  String crid =creditRecord.getCreditRecordId();
		      if(crid==null||crid.equals("")){
		    	  crid = IdGenerator.getId(CreditRecord.class);
		    	  creditRecord.setCreditRecordId(crid);
		    	  creditRecord.setDeclareid(id);
		      }
		      CreditRecordProxy.insertCreditRecord(creditRecord, conn);
			  //插入诚信记录结束
			  //插入荣誉奖励信息
			  String honourname[]=this.getHonourname().split(",");
			  String issunit1[]=this.getIssunit1().split(",");
			  String ryjb[]=this.getRyjb().split(",");
			  for(int i=0;i<honourname.length;i++){
				  String honournames = honourname[i];
				  if(honournames!=null)honournames=honournames.trim();
				  if(honournames!=null && !"".equals(honournames)){
					  Honour honour=new Honour();
					  honour.setHonourid(IdGenerator.getId(Honour.class));
					  honour.setDeclareid(id);
					  honour.setHonourname(honournames);
					  honour.setIssunit(issunit1[i]);
					  honour.setInfo10(ryjb[i].trim());
					  HonourProxy.insertHonour(honour, conn);
				  }
			  }  
			//插入荣誉奖励结束
			  //社会公益活动开始
			  String participateYear[]=this.getParticipateYear().split(",");
			  String contribution[]=this.getContribution().split(",");
			  for(int i=0;i<contribution.length;i++){
				  String contributions=contribution[i];
				  if(contributions!=null)contributions=contributions.trim();
				  if(contributions!=null && !"".equals(contributions)){
					  WelfareActivity welfareActivity=new WelfareActivity();
					  welfareActivity.setActivityId(IdGenerator.getId(WelfareActivity.class));
					  welfareActivity.setDeclareid(id);
					  
					  String yearsr=yearss+"-10-10";
					  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					  Date ddd=null;
					  try {
						ddd=sdf.parse(yearsr);
						  //ddd=sdf.parse(participateYears);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					// welfareActivity.setInfo1(yearsr);
					//  welfareActivity.setParticipateYear(new java.sql.Timestamp(new Date(participateYears).getTime()));
					 welfareActivity.setParticipateYear(ddd);
					  welfareActivity.setInfo1(participateYear[i].trim());
					  welfareActivity.setContribution(contribution[i].trim());
					  WelfareActivityProxy.insertWelfareActivity(welfareActivity, conn);
				  }
			  } 
			  HttpSession session = this.getRequest().getSession();
			  session.setAttribute("declareid", id);
			//社会公益活动结束
		      this.saveLog("新建企业申报信息[" + id + "]成功");
		      did=declare.getDeclareid();
		      HttpServletResponse response = ServletActionContext.getResponse();
		      response.setContentType("text/html;charset=utf-8");
		      PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      out.println(did); 
		      out.close();
		      return "zancun";
		     }
		     else  {
		    	 HttpSession session = this.getRequest().getSession();
				  session.setAttribute("declareid", id); 
				  return ERROR;}
		    }catch(SQLException e){
		      e.printStackTrace();
		      this.saveLog("新建企业申报信息失败");
		      return ERROR;
		    }finally{
		      try{
		        WAFDBConnectionFactory.getInstance().closeConnection(conn);
		      }catch(SQLException e){
		        e.printStackTrace();
		      }
		    }
		  
	  }
	*/
	


	/*public String newDeclare() throws Exception {
		Connection conn = null;
		this.getGroup();
		try {
			conn = WAFDBConnectionFactory.getInstance().getConnection();
			int count = DeclareProxy.getDeclareEntityCountByCreateuser(cruserid, conn);// 当前用户申报的的个数
			String[] roleList = WafUserProxy.getWafUserRoleIds(this.getCurrentUser().getUserId(), conn);
			legalLibrary = LegalLibraryProxy.getLegalLibraryByCode(this.getCurrentUser().getLoginName(), conn);
			String sysadmin = WAFConfigure.getProperty("sysadmin");
			if (count == 0 || isRole(roleList, sysadmin)) {
				// if(count==0||cruser.contains("管理员")){
				return SUCCESS;
			} else
				return ERROR;
		} catch (SQLException e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				WAFDBConnectionFactory.getInstance().closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
    ///提交，包括所有的附件上传完后提交
    public String subDeclare() throws Exception  {
    	Connection conn = null;
        try{
	      String declareid=declare.getDeclareid();
//	      System.out.println(declareid);
	      conn = WAFDBConnectionFactory.getInstance().getConnection();
	      declare = DeclareProxy.getDeclareById(declareid, conn);
	      DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");
	      Date dates = fmt.parse("2199-12-31");
	      declare.setEndtime(dates);
	      declare.setExaminestate("待审核");
	      declare.setAgreedate(new Date());
	      DeclareProxy.updateDeclare(declare,conn);
//	      filecoding=FilecodingProxy.getFilecodingByCoding(declare.getCreateuser(), conn);
//		  filecoding.setInfo5("待审核");//info5存储审核状态
//		  FilecodingProxy.updateFilecoding(filecoding, conn);
          this.saveLog("提交成功");
          return SUCCESS;
        }catch(SQLException e){
          this.saveLog("提交失败");
          e.printStackTrace();
          return ERROR;
        }finally{
          try{
            WAFDBConnectionFactory.getInstance().closeConnection(conn);
          }catch(SQLException e){
            e.printStackTrace();
          }
        }
    }*/
    //得到用户所属的协会
    private String cruser="";
    private String cruserid="";
    private String groupname="";
    private String xh;
    public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	/*public void getGroup(){
    	 Connection conn = null;
    	  HttpServletRequest request = ServletActionContext.getRequest ();
    	  try{
    	      conn = WAFDBConnectionFactory.getInstance().getConnection();

    	      WafUser user1 = this.getCurrentUser();
    	      String ids="";
    	      if (user1!=null){
    	    	  ids=user1.getUserId();
    	    	  
    	      }
    	      
    	      
    	      String[] roleList = WafUserProxy.getWafUserRoleIds(this.getCurrentUser().getUserId(), conn);
			  String sysadmin = WAFConfigure.getProperty("sysadmin");
			  if(isRole(roleList,sysadmin)){
				  xh="GLY";
			  }else{
				  xh=user1.getUserType();
			  }
		    	String companyuser = user1.getUserName();
		    	cruserid=user1.getUserId();
		    	cruser=companyuser;
				groupname = user1.getUserType();
				//xh=user1.getUserType();
		    
		    	 request.setAttribute("xh", xh);
		    	 request.setAttribute("companyuser", cruserid);
		    	 request.setAttribute("companyuserName", cruser);
    	 
    	}catch(SQLException e){
    	      e.printStackTrace();
    	      this.saveLog("新建失败");
    	     
    	    }finally{
    	      try{
    	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
    	      }catch(SQLException e){
    	        e.printStackTrace();
    	      }
    	    }
    	  }*/

  //查询所有的申报信息
 /* public String listDeclare() {
    Connection conn = null;
    try{
      if (this.getListBean() == null){ 
        this.setListBean(new ListDataFormBean());
      }
      String whereSql = "";
      Object[] paras = new Object[0];      
      *//***************查询相关***************//*
      StringBuffer whereBuffer = new StringBuffer();
      List paraList = new ArrayList();
      boolean isFirst = true;
      whereSql = whereBuffer.toString();
      paras = paraList.toArray();
      *//***************查询条件生成结束***************//*
      conn = WAFDBConnectionFactory.getInstance().getConnection();
      int count = DeclareProxy.getDeclareCount(DeclareProxy.searchCountSql + whereSql, paras, conn);
      List declareList = DeclareProxy.findDeclare(DeclareProxy.searchSql + whereSql, paras,getListBean().getStart(),getListBean().getLength(),conn);
      getListBean().setCount(count);
      getListBean().setDataList(declareList);
      this.saveLog("进入企业申报信息列表页面成功");
      return SUCCESS;
    }catch(SQLException e){
      e.printStackTrace();
      this.saveLog("进入企业申报信息列表页面失败");
      return ERROR;
    }finally{
      try{
        WAFDBConnectionFactory.getInstance().closeConnection(conn);
      }catch(SQLException e){
        e.printStackTrace();
      }
    }
  }*/

  
  //查询待审核的申报信息
 /* public String listDeclareState1() {
	  	HttpServletRequest request = ServletActionContext.getRequest();
	    xhmclist = (List) WafDataProxy.getDataItemListByDataId("xhmc");//获取数据字典
	    request.setAttribute("xhmclist", xhmclist);
	    Connection conn = null;
	  //  HttpServletRequest request = ServletActionContext.getRequest();
	    try{
	      if (this.getListBean() == null){ 
	        this.setListBean(new ListDataFormBean());
	      }
	      String whereSql = "";
	      Object[] paras = new Object[0];      
	      String searchSql=" select t.* from Declare t,wafuser w where t.createuser=w.userid ";
	      String searchCount=" select count(t.declareid) from Declare t,wafuser w where t.createuser=w.userid ";
	      *//***************查询相关***************//*
	      conn = WAFDBConnectionFactory.getInstance().getConnection();
	      StringBuffer whereBuffer = new StringBuffer();
	      List paraList = new ArrayList();
	      boolean isFirst = true;
	      paraList.add("待审核");
	      
	      whereBuffer.append(" and t.examinestate=?");
	      
	      this.getGroup();
	      String[] roleList = WafUserProxy.getWafUserRoleIds(this.getCurrentUser().getUserId(), conn);
		  String sysadmin = WAFConfigure.getProperty("sysadmin");
		  if(!isRole(roleList,sysadmin)){
	      //if(!cruser.contains("管理员")){
		      paraList.add(groupname);
		      whereBuffer.append( " and w.usertype = ? ");
	      }else{
	    	  if(sgroup!=null && !sgroup.equals("")){
		          paraList.add(sgroup);
		          whereBuffer.append( " and w.usertype = ? ");
		      }
	      }
	      whereBuffer.append(" order by t.declareid desc");
	      whereSql = whereBuffer.toString();
	      paras = paraList.toArray();
	      *//***************查询条件生成结束***************//*
	     
	      int count = DeclareProxy.getDeclareCount(searchCount + whereSql, paras, conn);
	      List declareList = DeclareProxy.findDeclare(searchSql + whereSql, paras,getListBean().getStart(),getListBean().getLength(),conn);
	      getListBean().setCount(count);
	      getListBean().setDataList(declareList);
	    //  request.setAttribute("declareList", declareList);
	      this.saveLog("进入企业申报信息列表页面成功");
	      return SUCCESS;
	    }catch(SQLException e){
	      e.printStackTrace();
	      this.saveLog("进入企业申报信息列表页面失败");
	      return ERROR;
	    }finally{
	      try{
	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
	      }catch(SQLException e){
	        e.printStackTrace();
	      }
	    }
	  }*/
  //查询通过的申报信息
 /* public String listDeclareState2() {
	  	HttpServletRequest request = ServletActionContext.getRequest();
	    xhmclist = (List) WafDataProxy.getDataItemListByDataId("xhmc");//获取数据字典
	    request.setAttribute("xhmclist", xhmclist);
	    Connection conn = null;
	    try{
	      if (this.getListBean() == null){ 
	        this.setListBean(new ListDataFormBean());
	      }
	      String whereSql = "";
	      Object[] paras = new Object[0];      
	      String searchSql=" select t.* from Declare t,wafuser w where t.createuser=w.userid ";
	      String searchCount=" select count(t.declareid) from Declare t,wafuser w where t.createuser=w.userid ";
	      *//***************查询相关***************//*
	      conn = WAFDBConnectionFactory.getInstance().getConnection();
	      StringBuffer whereBuffer = new StringBuffer();
	      List paraList = new ArrayList();
	      boolean isFirst = true;
	      paraList.add("通过");
	     
	      whereBuffer.append(" and t.examinestate=?");
	      
	      this.getGroup();
	      String[] roleList = WafUserProxy.getWafUserRoleIds(this.getCurrentUser().getUserId(), conn);
		  String sysadmin = WAFConfigure.getProperty("sysadmin");
		  if(!isRole(roleList,sysadmin)){
	      //if(!cruser.contains("管理员")){
		      paraList.add(groupname);
		      whereBuffer.append( " and w.usertype = ? ");
	      }else{
	    	  if(sgroup!=null && !sgroup.equals("")){
		          paraList.add(sgroup);
		          whereBuffer.append( " and w.usertype = ? ");
		      }
	      }
	      whereBuffer.append(" order by t.declareid desc");
	      whereSql = whereBuffer.toString();
	      paras = paraList.toArray();
	      *//***************查询条件生成结束***************//*
	      
	      int count = DeclareProxy.getDeclareCount(searchCount + whereSql, paras, conn);
	      List declareList = DeclareProxy.findDeclare(searchSql + whereSql, paras,getListBean().getStart(),getListBean().getLength(),conn);
	      getListBean().setCount(count);
	      getListBean().setDataList(declareList);
	      this.saveLog("进入企业申报信息列表页面成功");
	      return SUCCESS;
	    }catch(SQLException e){
	      e.printStackTrace();
	      this.saveLog("进入企业申报信息列表页面失败");
	      return ERROR;
	    }finally{
	      try{
	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
	      }catch(SQLException e){
	        e.printStackTrace();
	      }
	    }
	  }*/
  //查询不通过的申报信息
 /* public String listDeclareState3() {
	  	HttpServletRequest request = ServletActionContext.getRequest();
	    xhmclist = (List) WafDataProxy.getDataItemListByDataId("xhmc");//获取数据字典
	    request.setAttribute("xhmclist", xhmclist);
	      
	      
	    Connection conn = null;
	    try{
	      if (this.getListBean() == null){ 
	        this.setListBean(new ListDataFormBean());
	      }
	      String whereSql = "";
	      Object[] paras = new Object[0];      
	      String searchSql=" select t.* from Declare t,wafuser w where t.createuser=w.userid ";
	      String searchCount=" select count(t.declareid) from Declare t,wafuser w where t.createuser=w.userid ";
	      *//***************查询相关***************//*
	      conn = WAFDBConnectionFactory.getInstance().getConnection();
	      StringBuffer whereBuffer = new StringBuffer();
	      List paraList = new ArrayList();
	      boolean isFirst = true;
	      
	      paraList.add("不通过");
		     
	      whereBuffer.append(" and t.examinestate=?");
	      
	      this.getGroup();
	      String[] roleList = WafUserProxy.getWafUserRoleIds(this.getCurrentUser().getUserId(), conn);
		  String sysadmin = WAFConfigure.getProperty("sysadmin");
		  if(!isRole(roleList,sysadmin)){
	      //if(!cruser.contains("管理员")){
		      paraList.add(groupname);
		      whereBuffer.append( " and w.usertype = ? ");
	      }else{
	    	  if(sgroup!=null && !sgroup.equals("")){
		          paraList.add(sgroup);
		          whereBuffer.append( " and w.usertype = ? ");
		      }
	      }
	      
	      whereBuffer.append(" order by t.declareid desc");
	      whereSql = whereBuffer.toString();
	      paras = paraList.toArray();
	      *//***************查询条件生成结束***************//*
	      
	      int count = DeclareProxy.getDeclareCount(searchCount + whereSql, paras, conn);
	      List declareList = DeclareProxy.findDeclare(searchSql + whereSql, paras,getListBean().getStart(),getListBean().getLength(),conn);
	      getListBean().setCount(count);
	      getListBean().setDataList(declareList);
	      this.saveLog("进入企业申报信息列表页面成功");
	      return SUCCESS;
	    }catch(SQLException e){
	      e.printStackTrace();
	      this.saveLog("进入企业申报信息列表页面失败");
	      return ERROR;
	    }finally{
	      try{
	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
	      }catch(SQLException e){
	        e.printStackTrace();
	      }
	    }
	  }
  */
  //查询自身的申报信息
  /*public String listSelfDeclareState() {
	  	HttpServletRequest request = ServletActionContext.getRequest();
	    xhmclist = (List) WafDataProxy.getDataItemListByDataId("xhmc");//获取数据字典
	    request.setAttribute("xhmclist", xhmclist);	  
	    Connection conn = null;
	    try{
	      if (this.getListBean() == null){ 
	        this.setListBean(new ListDataFormBean());
	      }
	      String whereSql = "";
	      Object[] paras = new Object[0];      
	      *//***************查询相关***************//*
	      conn = WAFDBConnectionFactory.getInstance().getConnection();
	      StringBuffer whereBuffer = new StringBuffer();
	      List paraList = new ArrayList();
	      String searchSql=" select t.* from Declare t,wafuser w where t.createuser=w.userid ";
	      String searchCount=" select count(t.declareid) from Declare t,wafuser w where t.createuser=w.userid ";
	      boolean isFirst = true; 
	      this.getGroup();
	      String[] roleList = WafUserProxy.getWafUserRoleIds(this.getCurrentUser().getUserId(), conn);
		  String sysadmin = WAFConfigure.getProperty("sysadmin");
		  if(!isRole(roleList,sysadmin)){
	      //if(!cruser.contains("管理员")){
	    	  paraList.add(cruserid);
	    	  whereBuffer.append(" and t.createuser=?");//不为管理员时，只能查看自己申请的
	      }
	      else{
	    	  if(sgroup!=null && !sgroup.equals("")){
		          paraList.add(sgroup);
		          whereBuffer.append( " and w.usertype = ? ");
		         
		        }
	    	  if(sexaminestate!=null && !sexaminestate.equals("")){
		          paraList.add(sexaminestate);
		          whereBuffer.append( " and t.examinestate=? ");
		        }
	    	  if(dname!=null&&!dname.equals("")){
	    		  paraList.add("%"+dname.trim()+"%");
		          whereBuffer.append( " and t.companyname like ? ");
	    	  }
	    	  if(dcodeing!=null&&!dcodeing.equals("")){
	    		  paraList.add("%"+dcodeing.trim()+"%");
		          whereBuffer.append( " and t.organizationcode like ? ");
	    	  }
	      }
	      whereBuffer.append(" order by t.declareid desc");
	      whereSql = whereBuffer.toString();
	      paras = paraList.toArray();
	      *//***************查询条件生成结束***************//*
	      
	      
	      int count = DeclareProxy.getDeclareCount(searchCount + whereSql, paras, conn);
	      List declareList = DeclareProxy.findDeclare(searchSql + whereSql, paras,getListBean().getStart(),getListBean().getLength(),conn);
	      
	      getListBean().setCount(count);
	      getListBean().setDataList(declareList);
	      this.saveLog("进入企业申报信息列表页面成功");
	      return SUCCESS;
	    }catch(SQLException e){
	      e.printStackTrace();
	      this.saveLog("进入企业申报信息列表页面失败");
	      return ERROR;
	    }finally{
	      try{
	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
	      }catch(SQLException e){
	        e.printStackTrace();
	      }
	    }
	  }*/

//查询协会的申报信息，没用到，用的是insertTempDeclare（）方法
 /* public String insertDeclare() {
    Connection conn = null;
    try{
 
      String id = declare.getDeclareid();
      if(id==null||id.equals("")){
        id = IdGenerator.getId(Declare.class);
        declare.setDeclareid(id);
        declare.setExaminestate("待审核");
      }
      conn = WAFDBConnectionFactory.getInstance().getConnection();
      DeclareProxy.insertDeclare(declare,conn);
      //插入专利信息开始
      String patentnam[]=this.getPatentname().split(",");
	  String investigate[]=this.getInvestigatedepartment().split(",");
	  for(int i=0;i<patentnam.length;i++){
		  String patentnams=patentnam[i];
		  if(patentnams!=null) patentnams=patentnams.trim();
		  if(patentnams!=null && !"".equals(patentnams)){
		  Patent patent = new Patent();
		  patent.setPatentid(IdGenerator.getId(Patent.class));
		  patent.setDeclareid(id);
		  patent.setPatentname(patentnams);
		  patent.setInvestigatedepartment(investigate[i]);
		  PatentProxy.insertPatent(patent,conn);
		  }
	  }  
	//插入专利信息结束
      //插入生产许可证信息开始
      String licenseName[]=this.getLicenseName().split(",");
	  String approvedOffice[]=this.getApprovedOffice().split(",");
	  for(int i=0;i<licenseName.length;i++){
		  String licenseNames=licenseName[i];
		  if(licenseNames!=null) licenseNames=licenseNames.trim();
		  if(licenseNames!=null && !"".equals(licenseNames)){
		  License license =new License();
		  license.setLicenseId(IdGenerator.getId(License.class));
		  license.setLicenseName(licenseNames);
		  license.setDeclareid(id);
		  license.setApprovedOffice(approvedOffice[i]);
		  LicenseProxy.insertLicense(license, conn);
		  }
	  }  
	//插入生产许可证信息结束
	  
      //插入注册商标信息开始
	  String trademarkName[]=this.getTrademarkName().split(",");
	  String approvedOffice1[]=this.getApprovedOffice1().split(",");
	  for(int i=0;i<trademarkName.length;i++){
		  String trademarkNames=trademarkName[i];
		  if(trademarkNames!=null) trademarkNames=trademarkNames.trim();
		  if(trademarkNames!=null && !"".equals(trademarkNames)){
		  Trademark trademark=new Trademark();
		  trademark.setTrademarkId(IdGenerator.getId(Trademark.class));
		  trademark.setDeclareid(id);//cgc
		  trademark.setTrademarkName(trademarkNames);
		  trademark.setApprovedOffice(approvedOffice1[i]);
		  TrademarkProxy.insertTrademark(trademark, conn);
		  }
	  }  
	//插入注册商标信息结束
      //插入管理体系认证信息开始
	  String certifiname[]=this.getCertifiname().split(",");
	  String certifidept[]=this.getCertifidept().split(",");
	  for(int i=0;i<certifiname.length;i++){
		  String certifinames=certifiname[i];
		  if(certifinames!=null) certifinames=certifinames.trim();
		  if(certifinames!=null && !"".equals(certifinames)){
		  ManageCertifi manageCertifi=new ManageCertifi();
		  manageCertifi.setCertifiid(IdGenerator.getId(ManageCertifi.class));
		  manageCertifi.setDeclareid(id);//cgc
		  manageCertifi.setCertifiname(certifinames);
		  manageCertifi.setCertifidept(certifidept[i]);
		  ManageCertifiProxy.insertManageCertifi(manageCertifi, conn);
		  }
	  }  
	//插入管理体系认证信息结束
	  //插入资格资质信息
	  String qualifinname[]=this.getQualifinname().split(",");
	  String issunit[]=this.getIssunit().split(",");
	  for(int i=0;i<qualifinname.length;i++){
		  String qulifinames = qualifinname[i];
		  if(qulifinames!=null)qulifinames=qulifinames.trim();
		  if(qulifinames!=null && !"".equals(qulifinames)){
			  QualifiInfo qualifiInfo=new QualifiInfo();
			  qualifiInfo.setQualifiid(IdGenerator.getId(QualifiInfo.class));
			  qualifiInfo.setDeclareid(id);
			  qualifiInfo.setQualifinname(qulifinames);
			  qualifiInfo.setIssunit(issunit[i]);
			  QualifiInfoProxy.insertQualifiInfo(qualifiInfo, conn);
		  }
	  }  
	//插入资格资质信息结束
	  //插入管理信息开始
	  String miid = managementInfo.getManagementId();
      if(miid==null||miid.equals("")){
    	  miid = IdGenerator.getId(ManagementInfo.class);
        managementInfo.setManagementId(miid);
        managementInfo.setDeclareid(id);
      }
      ManagementInfoProxy.insertManagementInfo(managementInfo,conn);
	  
	  //插入管理信息结束
	  //插入诚信记录开始
	  String crid =creditRecord.getCreditRecordId();
      if(crid==null||crid.equals("")){
    	  crid = IdGenerator.getId(CreditRecord.class);
    	  creditRecord.setCreditRecordId(crid);
    	  creditRecord.setDeclareid(id);
      }
      CreditRecordProxy.insertCreditRecord(creditRecord, conn);
	  //插入诚信记录结束
	  //插入荣誉奖励信息
	  String honourname[]=this.getHonourname().split(",");
	  String issunit1[]=this.getIssunit1().split(",");
	  for(int i=0;i<honourname.length;i++){
		  String honournames = honourname[i];
		  if(honournames!=null)honournames=honournames.trim();
		  if(honournames!=null && !"".equals(honournames)){
			  Honour honour=new Honour();
			  honour.setHonourid(IdGenerator.getId(Honour.class));
			  honour.setDeclareid(id);
			  honour.setHonourname(honournames);
			  honour.setIssunit(issunit1[i]);
			  HonourProxy.insertHonour(honour, conn);
		  }
	  }  
	//插入荣誉奖励结束
	  //社会公益活动开始
	  String participateYear[]=this.getParticipateYear().split(",");
	  String contribution[]=this.getContribution().split(",");
	  for(int i=0;i<contribution.length;i++){
		  String contributions=contribution[i];
		  if(contributions!=null)contributions=contributions.trim();
		  if(contributions!=null && !"".equals(contributions)){
			  WelfareActivity welfareActivity=new WelfareActivity();
			  welfareActivity.setActivityId(IdGenerator.getId(WelfareActivity.class));
			  welfareActivity.setDeclareid(id);

			  welfareActivity.setInfo1(participateYear[i].trim());
			  welfareActivity.setContribution(contribution[i].trim());
			  WelfareActivityProxy.insertWelfareActivity(welfareActivity, conn);
		  }
	  } 
	  HttpSession session = this.getRequest().getSession();
	  session.setAttribute("declareid", id);
	//社会公益活动结束
      this.saveLog("新建企业申报信息[" + id + "]成功");
      return SUCCESS;
    }catch(SQLException e){
      e.printStackTrace();
      this.saveLog("新建企业申报信息失败");
      return ERROR;
    }finally{
      try{
        WAFDBConnectionFactory.getInstance().closeConnection(conn);
      }catch(SQLException e){
        e.printStackTrace();
      }
    }
  }*/
  

  
 /* public String insertTempDeclare() {
	    Connection conn = null;
	    try{
		 conn = WAFDBConnectionFactory.getInstance().getConnection();
		 String cruser=this.getCurrentUser().getUserId();
	     int count= DeclareProxy.getDeclareEntityCountByCreateuser(cruser,conn);//当前用户申报的的个数
	     String id = declare.getDeclareid();
	     String[] roleList = WafUserProxy.getWafUserRoleIds(this.getCurrentUser().getUserId(), conn);
		  String sysadmin = WAFConfigure.getProperty("sysadmin");
		  if(count==0||isRole(roleList,sysadmin)){
	     //if(count==0||this.getCurrentUser().getUserName().contains("管理员")){
	     
	      if(id==null||id.equals("")){
	        id = IdGenerator.getId(Declare.class);
	        declare.setDeclareid(id);
	        declare.setExaminestate("暂存");
	      }
	      
	      String testRole = WAFConfigure.getProperty("testRole");
	      if(isRole(roleList,testRole)){
	    	  WafUser u = this.getCurrentUser();
	    	  if(u!=null){
	    		  u.setLoginName(declare.getOrganizationcode());
	    		  WafUserProxy.updateWafUser(u, conn);
	    	  }
	      }
	      DeclareProxy.insertDeclare(declare,conn);
		  //插入filecoing开始
//		  WafUser user=this.getCurrentUser();
//		  String coding=user.getUserName();
//		  filecoding=FilecodingProxy.getFilecodingByCoding(coding, conn);
//		  filecoding.setInfo1(user.getUserId());//info1存当前用户的id
//		  filecoding.setInfo2(id);//info2存申报id
//		  filecoding.setInfo3(declare.getCompanyname());//info3存公司名称，info4存储登录名称了
//		  filecoding.setInfo5("未提交");//info5存储审核状态,未提交状态
//		  FilecodingProxy.updateFilecoding(filecoding, conn);
		  //插入filecoing结束
	      //插入专利信息开始
	      String patentnam[]=this.getPatentname().split(",");
		  String investigate[]=this.getInvestigatedepartment().split(",");
		  String zlxxsj[]=this.getZlxxsj().split(",");
		  for(int i=0;i<patentnam.length;i++){
			  String patentnams=patentnam[i];
			  if(patentnams!=null) patentnams=patentnams.trim();
			  if(patentnams!=null && !"".equals(patentnams)){
			  Patent patent = new Patent();
			  patent.setPatentid(IdGenerator.getId(Patent.class));
			  patent.setDeclareid(id);
			  patent.setPatentname(patentnams);
			  patent.setInvestigatedepartment(investigate[i].trim());
			  patent.setInfo10(zlxxsj[i].trim());
			  PatentProxy.insertPatent(patent,conn);
			  }
		  }  
		//插入专利信息结束
	      //插入生产许可证信息开始
	      String licenseName[]=this.getLicenseName().split(",");
		  String approvedOffice[]=this.getApprovedOffice().split(",");
		  String scxk[]=this.getScxk().split(",");
		  for(int i=0;i<licenseName.length;i++){
			  String licenseNames=licenseName[i];
			  if(licenseNames!=null) licenseNames=licenseNames.trim();
			  if(licenseNames!=null && !"".equals(licenseNames)){
			  License license =new License();
			  license.setLicenseId(IdGenerator.getId(License.class));
			  license.setLicenseName(licenseNames);
			  license.setDeclareid(id);
			  license.setApprovedOffice(approvedOffice[i].trim());
			  license.setInfo10(scxk[i].trim());
			  LicenseProxy.insertLicense(license, conn);
			  }
		  }  
		//插入生产许可证信息结束
		  
	      //插入注册商标信息开始
		  String trademarkName[]=this.getTrademarkName().split(",");
		  String approvedOffice1[]=this.getApprovedOffice1().split(",");
		  for(int i=0;i<trademarkName.length;i++){
			  String trademarkNames=trademarkName[i];
			  if(trademarkNames!=null) trademarkNames=trademarkNames.trim();
			  if(trademarkNames!=null && !"".equals(trademarkNames)){
			  Trademark trademark=new Trademark();
			  trademark.setTrademarkId(IdGenerator.getId(Trademark.class));
			  trademark.setDeclareid(id);//cgc
			  trademark.setTrademarkName(trademarkNames);
			  trademark.setApprovedOffice(approvedOffice1[i].trim());
			  TrademarkProxy.insertTrademark(trademark, conn);
			  }
		  }  
		//插入注册商标信息结束
	      //插入管理体系认证信息开始
		  String certifiname[]=this.getCertifiname().split(",");
		  String certifidept[]=this.getCertifidept().split(",");
		  String gltxsj[]=this.getGltxsj().split(",");
		  for(int i=0;i<certifiname.length;i++){
			  String certifinames=certifiname[i];
			  if(certifinames!=null) certifinames=certifinames.trim();
			  if(certifinames!=null && !"".equals(certifinames)){
			  ManageCertifi manageCertifi=new ManageCertifi();
			  manageCertifi.setCertifiid(IdGenerator.getId(ManageCertifi.class));
			  manageCertifi.setDeclareid(id);//cgc
			  manageCertifi.setCertifiname(certifinames);
			  manageCertifi.setCertifidept(certifidept[i].trim());
			  manageCertifi.setInfo10(gltxsj[i].trim());
			  ManageCertifiProxy.insertManageCertifi(manageCertifi, conn);
			  }
		  }  
		//插入管理体系认证信息结束
		  //插入资格资质信息
		  String qualifinname[]=this.getQualifinname().split(",");
		  String issunit[]=this.getIssunit().split(",");
		  String zgzzyxq[]=this.getZgzzyxq().split(",");
		  for(int i=0;i<qualifinname.length;i++){
			  String qulifinames = qualifinname[i];
			  if(qulifinames!=null)qulifinames=qulifinames.trim();
			  if(qulifinames!=null && !"".equals(qulifinames)){
				  QualifiInfo qualifiInfo=new QualifiInfo();
				  qualifiInfo.setQualifiid(IdGenerator.getId(QualifiInfo.class));
				  qualifiInfo.setDeclareid(id);
				  qualifiInfo.setQualifinname(qulifinames);
				  qualifiInfo.setIssunit(issunit[i].trim());
				  qualifiInfo.setInfo10(zgzzyxq[i].trim());
				  QualifiInfoProxy.insertQualifiInfo(qualifiInfo, conn);
			  }
		  }  
		//插入资格资质信息结束

		  //插入管理信息开始
		  String miid = managementInfo.getManagementId();
	      if(miid==null||miid.equals("")){
	    	  miid = IdGenerator.getId(ManagementInfo.class);
	        managementInfo.setManagementId (miid);
	        managementInfo.setDeclareid(id);
	      }
	      ManagementInfoProxy.insertManagementInfo(managementInfo,conn);
		  
		  //插入管理信息结束
		  //插入诚信记录开始
		  String crid =creditRecord.getCreditRecordId();
	      if(crid==null||crid.equals("")){
	    	  crid = IdGenerator.getId(CreditRecord.class);
	    	  creditRecord.setCreditRecordId(crid);
	    	  creditRecord.setDeclareid(id);
	      }
	      CreditRecordProxy.insertCreditRecord(creditRecord, conn);
		  //插入诚信记录结束
		  //插入荣誉奖励信息
		  String honourname[]=this.getHonourname().split(",");
		  String issunit1[]=this.getIssunit1().split(",");
		  String ryjb[]=this.getRyjb().split(",");
		  for(int i=0;i<honourname.length;i++){
			  String honournames = honourname[i];
			  if(honournames!=null)honournames=honournames.trim();
			  if(honournames!=null && !"".equals(honournames)){
				  Honour honour=new Honour();
				  honour.setHonourid(IdGenerator.getId(Honour.class));
				  honour.setDeclareid(id);
				  honour.setHonourname(honournames);
				  honour.setIssunit(issunit1[i]);
				  honour.setInfo10(ryjb[i].trim());
				  HonourProxy.insertHonour(honour, conn);
			  }
		  }  
		//插入荣誉奖励结束
		  //社会公益活动开始
		  String participateYear[]=this.getParticipateYear().split(",");
		  String contribution[]=this.getContribution().split(",");
		  for(int i=0;i<contribution.length;i++){
			  String contributions=contribution[i];
			  if(contributions!=null)contributions=contributions.trim();
			  if(contributions!=null && !"".equals(contributions)){
				  WelfareActivity welfareActivity=new WelfareActivity();
				  welfareActivity.setActivityId(IdGenerator.getId(WelfareActivity.class));
				  welfareActivity.setDeclareid(id);
				  
				  String yearsr=yearss+"-10-10";
				  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				  Date ddd=null;
				  try {
					ddd=sdf.parse(yearsr);
					  //ddd=sdf.parse(participateYears);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// welfareActivity.setInfo1(yearsr);
				//  welfareActivity.setParticipateYear(new java.sql.Timestamp(new Date(participateYears).getTime()));
				 welfareActivity.setParticipateYear(ddd);
				  welfareActivity.setInfo1(participateYear[i].trim());
				  welfareActivity.setContribution(contribution[i].trim());
				  WelfareActivityProxy.insertWelfareActivity(welfareActivity, conn);
			  }
		  } 
		  HttpSession session = this.getRequest().getSession();
		  session.setAttribute("declareid", id);
		//社会公益活动结束
	      this.saveLog("新建企业申报信息[" + id + "]成功");
	      return SUCCESS;
	     }
	     else  {
	    	 HttpSession session = this.getRequest().getSession();
			  session.setAttribute("declareid", id); 
			  return ERROR;}
	    }catch(SQLException e){
	      e.printStackTrace();
	      this.saveLog("新建企业申报信息失败");
	      return ERROR;
	    }finally{
	      try{
	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
	      }catch(SQLException e){
	        e.printStackTrace();
	      }
	    }
	  }*/
//cgc 更新申报表,没用用到
 /* public String updateDeclare() {
    Connection conn = null;
    try{
    	
      conn = WAFDBConnectionFactory.getInstance().getConnection();
      declare.setExaminestate("待审核");//cgc修改
      DeclareProxy.updateDeclare(declare,conn);
      String id = declare.getDeclareid();
      ManagementInfoProxy.updateManagementInfo(managementInfo,conn);
      CreditRecordProxy.updateCreditRecord(creditRecord,conn);
     // HttpSession session = this.getRequest().getSession();//下面已经使用了
	 // session.setAttribute("declareid", declare.getDeclareid());
	  
//	  String declareid=declare.getDeclareid();//
//      this.listRelate(declareid);//
	  //System.out.println(this.getPatentname()+"~!@#$~~~~~~~~~~~~##~~~~~~~~~"); 
	  *//******************************//*
	 
      //插入专利信息开始
      String patentnam[]=this.getPatentname().split(",");
	  String investigate[]=this.getInvestigatedepartment().split(",");
	  for(int i=0;i<patentnam.length;i++){
		  String patentnams=patentnam[i];
		  if(patentnams!=null) patentnams=patentnams.trim();
		  if(patentnams!=null && !"".equals(patentnams)){
		  Patent patent = new Patent();
		  patent.setPatentid(IdGenerator.getId(Patent.class));
		  patent.setDeclareid(id);
		  patent.setPatentname(patentnams);
		  patent.setInvestigatedepartment(investigate[i]);
		  PatentProxy.insertPatent(patent,conn);
		  }
	  }  
	//插入专利信息结束
      //插入生产许可证信息开始
      String licenseName[]=this.getLicenseName().split(",");
	  String approvedOffice[]=this.getApprovedOffice().split(",");
	  for(int i=0;i<licenseName.length;i++){
		  String licenseNames=licenseName[i];
		  if(licenseNames!=null) licenseNames=licenseNames.trim();
		  if(licenseNames!=null && !"".equals(licenseNames)){
		  License license =new License();
		  license.setLicenseId(IdGenerator.getId(License.class));
		  license.setLicenseName(licenseNames);
		  license.setDeclareid(id);
		  license.setApprovedOffice(approvedOffice[i]);
		  LicenseProxy.insertLicense(license, conn);
		  }
	  }  
	//插入生产许可证信息结束
	  
      //插入注册商标信息开始
	  String trademarkName[]=this.getTrademarkName().split(",");
	  String approvedOffice1[]=this.getApprovedOffice1().split(",");
	  for(int i=0;i<trademarkName.length;i++){
		  String trademarkNames=trademarkName[i];
		  if(trademarkNames!=null) trademarkNames=trademarkNames.trim();
		  if(trademarkNames!=null && !"".equals(trademarkNames)){
		  Trademark trademark=new Trademark();
		  trademark.setTrademarkId(IdGenerator.getId(Trademark.class));
		  trademark.setDeclareid(id);//cgc
		  trademark.setTrademarkName(trademarkNames);
		  trademark.setApprovedOffice(approvedOffice1[i]);
		  TrademarkProxy.insertTrademark(trademark, conn);
		  }
	  }  
	//插入注册商标信息结束
      //插入管理体系认证信息开始
	  String certifiname[]=this.getCertifiname().split(",");
	  String certifidept[]=this.getCertifidept().split(",");
	  for(int i=0;i<certifiname.length;i++){
		  String certifinames=certifiname[i];
		  if(certifinames!=null) certifinames=certifinames.trim();
		  if(certifinames!=null && !"".equals(certifinames)){
		  ManageCertifi manageCertifi=new ManageCertifi();
		  manageCertifi.setCertifiid(IdGenerator.getId(ManageCertifi.class));
		  manageCertifi.setDeclareid(id);//cgc
		  manageCertifi.setCertifiname(certifinames);
		  manageCertifi.setCertifidept(certifidept[i]);
		  ManageCertifiProxy.insertManageCertifi(manageCertifi, conn);
		  }
	  }  
	//插入管理体系认证信息结束
	  //插入资格资质信息
	  String qualifinname[]=this.getQualifinname().split(",");
	  String issunit[]=this.getIssunit().split(",");
	  for(int i=0;i<qualifinname.length;i++){
		  String qulifinames = qualifinname[i];
		  if(qulifinames!=null)qulifinames=qulifinames.trim();
		  if(qulifinames!=null && !"".equals(qulifinames)){
			  QualifiInfo qualifiInfo=new QualifiInfo();
			  qualifiInfo.setQualifiid(IdGenerator.getId(QualifiInfo.class));
			  qualifiInfo.setDeclareid(id);
			  qualifiInfo.setQualifinname(qulifinames);
			  qualifiInfo.setIssunit(issunit[i]);
			  QualifiInfoProxy.insertQualifiInfo(qualifiInfo, conn);
		  }
	  }  
	//插入资格资质信息结束
	  
	  
	  //插入荣誉奖励信息
	  String honourname[]=this.getHonourname().split(",");
	  String issunit1[]=this.getIssunit1().split(",");
	  for(int i=0;i<honourname.length;i++){
		  String honournames = honourname[i];
		  if(honournames!=null)honournames=honournames.trim();
		  if(honournames!=null && !"".equals(honournames)){
			  Honour honour=new Honour();
			  honour.setHonourid(IdGenerator.getId(Honour.class));
			  honour.setDeclareid(id);
			  honour.setHonourname(honournames);
			  honour.setIssunit(issunit1[i]);
			  HonourProxy.insertHonour(honour, conn);
		  }
	  }  
	//插入荣誉奖励结束
	  //社会公益活动开始
	  String participateYear[]=this.getParticipateYear().split(",");
	  String contribution[]=this.getContribution().split(",");
	  for(int i=0;i<contribution.length;i++){
		  String contributions=contribution[i];
		  if(contributions!=null)contributions=contributions.trim();
		  if(contributions!=null && !"".equals(contributions)){
			  WelfareActivity welfareActivity=new WelfareActivity();
			  welfareActivity.setActivityId(IdGenerator.getId(WelfareActivity.class));
			  welfareActivity.setDeclareid(id);
			  
				  String yearsr=yearss+"-10-10";
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  Date ddd=null;
			  try {
				ddd=sdf.parse(yearsr);
				  //ddd=sdf.parse(participateYears);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// welfareActivity.setInfo1(yearsr);
			//  welfareActivity.setParticipateYear(new java.sql.Timestamp(new Date(participateYears).getTime()));
			 welfareActivity.setParticipateYear(ddd);
			  welfareActivity.setInfo1(participateYear[i].trim());
			  welfareActivity.setContribution(contribution[i].trim());
			  WelfareActivityProxy.insertWelfareActivity(welfareActivity, conn);
		  }
	  } 
	  HttpSession session = this.getRequest().getSession();
	  session.setAttribute("declareid", id);
	  
	  
	  
	//社会公益活动结束
	  *//*******************************//*
	 // 
      this.saveLog("更新企业申报信息[" + declare.getDeclareid() + "]成功");
      return SUCCESS;
    }catch(SQLException e){
      e.printStackTrace();
      this.saveLog("更新企业申报信息[" + declare.getDeclareid() + "]失败");
      return ERROR;
    }finally{
      try{
        WAFDBConnectionFactory.getInstance().closeConnection(conn);
      }catch(SQLException e){
        e.printStackTrace();
      }
    }
  }*/
 /* public String updateTempDeclare() throws Exception {
	    Connection conn = null;
	    String ret=SUCCESS;
	    try{

	      conn = WAFDBConnectionFactory.getInstance().getConnection();
	      declare.setExaminestate("暂存");//cgc修改
	      DeclareProxy.updateDeclare(declare,conn);//更新存于declare表的基础信息
	      String id = declare.getDeclareid();//得到与declare表关联的字段decalreid
	      String[] roleList = WafUserProxy.getWafUserRoleIds(this.getCurrentUser().getUserId(), conn);
	      String testRole = WAFConfigure.getProperty("testRole");
	      if(isRole(roleList,testRole)){
	    	  WafUser u = this.getCurrentUser();
	    	  if(u!=null){
	    		  u.setLoginName(declare.getOrganizationcode());
	    		  WafUserProxy.updateWafUser(u, conn);
	    	  }
	      }
	      
	      ManagementInfoProxy.updateManagementInfo(managementInfo,conn);//更新ManagementInfo信息
	      CreditRecordProxy.updateCreditRecord(creditRecord,conn);//更新CreditRecord信息
		  *//******************************//*
		  //插入修改filecoing开始
//		  WafUser user=this.getCurrentUser();
//		  String coding=user.getUserName();
//		  filecoding=FilecodingProxy.getFilecodingByCoding(coding, conn);
//		  filecoding.setInfo1(user.getUserId());//info1存当前用户的id
//		  filecoding.setInfo2(id);//info2存申报id
//		  filecoding.setInfo3(declare.getCompanyname());//info3存公司名称
//		  filecoding.setInfo5("未提交");//info5存储审核状态,未提交状态
//		  FilecodingProxy.updateFilecoding(filecoding, conn);
		  //插入filecoing结束 
		  
		  
		  
		     //资格资质信息
		     QualifiInfoProxy.deleteQualifiInfoByDId(id, conn);
		      // 生产/经营许可证信息     license
		      LicenseProxy.deleteLicenseByDId(id, conn);
		      //注册商标信息  trademark
		      TrademarkProxy.deleteTrademarkByDId(id, conn);
		      //专利信息  patent
		     PatentProxy.deletePatentByDId(id, conn);
		      //管理体系认证信息   manageCertifi
		      ManageCertifiProxy.deleteManageCertifiByDId(id, conn);
		      //近三年获得的荣誉奖励信息   honour
		      HonourProxy.deleteHonourByDId(id, conn);
		      //近三年参加社会公益活动情况welfareActivity
		     WelfareActivityProxy.deleteWelfareActivityByDId(id, conn);
		      
		  //插入资格资质信息
		  String qualifinname[]=this.getQualifinname().split(",");
		  String issunit[]=this.getIssunit().split(",");
		  String zgzzyxq[]=this.getZgzzyxq().split(",");
		  
		  for(int i=0;i<qualifinname.length;i++){
			  
			  String qulifinames = qualifinname[i];
			  if(qulifinames!=null)qulifinames=qulifinames.trim();
			  
			  if(qulifinames!=null && !"".equals(qulifinames)){
				  //String s = QualifiInfoProxy.findQualifinfo(qulifinames, issunits,id, conn);
				 // if("0".equals(s)){
					  QualifiInfo qualifiInfo=new QualifiInfo();
					  qualifiInfo.setQualifiid(IdGenerator.getId(QualifiInfo.class));
					  qualifiInfo.setDeclareid(id);
					  qualifiInfo.setQualifinname(qulifinames);
					  qualifiInfo.setIssunit(issunit[i].trim());
					  qualifiInfo.setInfo10(zgzzyxq[i].trim());
					  
					  QualifiInfoProxy.insertQualifiInfo(qualifiInfo, conn);
				//  }
			  }
		  }  
		  //插入资格资质信息结束
		  
		  //插入生产许可证信息开始
	      String licenseName[]=this.getLicenseName().split(",");
		  String approvedOffices[]=this.getApprovedOffice().split(",");
		  String scxk[]=this.getScxk().split(",");
		  for(int i=0;i<licenseName.length;i++){
			  
			  String licenseNames=licenseName[i];
			  if(licenseNames!=null) licenseNames=licenseNames.trim();
			  String appOffice = approvedOffices[i].trim();
			  
			  if(licenseNames!=null && !"".equals(licenseNames)){
				  //String s = LicenseProxy.findLicense(licenseNames, appOffice,id, conn);
				 // if("0".equals(s)){
					  License license =new License();
					  license.setLicenseId(IdGenerator.getId(License.class));
					  license.setLicenseName(licenseNames);
					  license.setDeclareid(id);
					  license.setApprovedOffice(approvedOffices[i].trim());
					  license.setInfo10(scxk[i].trim());
					  LicenseProxy.insertLicense(license, conn);
				 // }
			  }
		  }  
		 //插入生产许可证信息结束
		  
		  
		  //插入注册商标信息开始
		  String trademarkName[]=this.getTrademarkName().split(",");
		  String approvedOffice1[]=this.getApprovedOffice1().split(",");
		  
		  for(int i=0;i<trademarkName.length;i++){
			  
			  String trademarkNames=trademarkName[i];
			  String approvedOffice = approvedOffice1[i].trim();
			  if(trademarkNames!=null) trademarkNames=trademarkNames.trim();
			  
			  if(trademarkNames!=null && !"".equals(trademarkNames)){
				  //查询数据库是否有相同数据
				  //String s = TrademarkProxy.findTrademark(trademarkNames, approvedOffice,id, conn);
				 // if("0".equals(s)){
					  Trademark trademark=new Trademark();
					  trademark.setTrademarkId(IdGenerator.getId(Trademark.class));
					  trademark.setDeclareid(id);//cgc
					  trademark.setTrademarkName(trademarkNames);
					  trademark.setApprovedOffice(approvedOffice1[i].trim());
				  
				      TrademarkProxy.insertTrademark(trademark, conn);
				 // }
				  
			  }
		  }  
		 //插入注册商标信息结束
		  
		  
	      //插入专利信息开始
	      String patentnam[]=this.getPatentname().split(",");
		  String investigate[]=this.getInvestigatedepartment().split(",");
		  String zlxxsj[]=this.getZlxxsj().split(",");
		  for(int i=0;i<patentnam.length;i++){
			
			  String patentnams=patentnam[i];
			  if(patentnams!=null) patentnams=patentnams.trim();
			  String invgate = investigate[i].trim();
			  
			  if(patentnams!=null && !"".equals(patentnams)){
				  
				 // String s = PatentProxy.findPatent(patentnams, invgate,id, conn);
				 // if("0".equals(s)){
					  Patent patent = new Patent();
					  patent.setPatentid(IdGenerator.getId(Patent.class));
					  patent.setDeclareid(id);
					  patent.setPatentname(patentnams);
					  patent.setInvestigatedepartment(investigate[i].trim());
					  patent.setInfo10(zlxxsj[i].trim());
					  PatentProxy.insertPatent(patent,conn);
				 // }
				  
			  }
		  }  
		 //插入专利信息结束
	     
		  
	      
	      //插入管理体系认证信息开始
		  String certifiname[]=this.getCertifiname().split(",");
		  String certifidept[]=this.getCertifidept().split(",");
		  String gltxsj[]=this.getGltxsj().split(",");
		  for(int i=0;i<certifiname.length;i++){
			  
			  String certifinames=certifiname[i];
			  if(certifinames!=null) certifinames=certifinames.trim();
			  String cerdept = certifidept[i].trim();
			  
			  if(certifinames!=null && !"".equals(certifinames)){
				 // String s = ManageCertifiProxy.findManage(certifinames, cerdept,id, conn);
				 // if("0".equals(s)){
					  ManageCertifi manageCertifi=new ManageCertifi();
					  manageCertifi.setCertifiid(IdGenerator.getId(ManageCertifi.class));
					  manageCertifi.setDeclareid(id);//cgc
					  manageCertifi.setCertifiname(certifinames);
					  manageCertifi.setCertifidept(certifidept[i].trim());
					  manageCertifi.setInfo10(gltxsj[i].trim());
					  ManageCertifiProxy.insertManageCertifi(manageCertifi, conn);
				 // }
			  }
		  }  
		  //插入管理体系认证信息结束
		  
		  
		  
		  //插入荣誉奖励信息
		  String honourname[]=this.getHonourname().split(",");
		  String issunit1[]=this.getIssunit1().split(",");
		  String ryjb[]=this.getRyjb().split(",");
		  for(int i=0;i<honourname.length;i++){
			  String honournames = honourname[i];
			  if(honournames!=null)honournames=honournames.trim();
			  String isunit = issunit1[i].trim();
			  
			  if(honournames!=null && !"".equals(honournames)){
				  //String s = HonourProxy.findHonour(honournames, isunit,id, conn);
				  //if("0".equals(s)){
					  Honour honour=new Honour();
					  honour.setHonourid(IdGenerator.getId(Honour.class));
					  honour.setDeclareid(id);
					  honour.setHonourname(honournames);
					  honour.setIssunit(issunit1[i].trim());
					  honour.setInfo10(ryjb[i].trim());
					  HonourProxy.insertHonour(honour, conn);
				 // }
			  }
		  }  
		  //插入荣誉奖励结束
		  
		  //社会公益活动开始
		  String participateYear[]=this.getParticipateYear().split(",");
		  String contribution[]=this.getContribution().split(",");
		  for(int i=0;i<contribution.length;i++){
			  String contributions=contribution[i];
			  if(contributions!=null)contributions=contributions.trim();
			  if(contributions!=null && !"".equals(contributions)){
				  WelfareActivity welfareActivity=new WelfareActivity();
				  welfareActivity.setActivityId(IdGenerator.getId(WelfareActivity.class));
				  welfareActivity.setDeclareid(id);
				  
				  String yearsr=yearss+"-10-10";
				  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				  Date ddd=null;
				  try {
					ddd=sdf.parse(yearsr);
					  //ddd=sdf.parse(participateYears);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// welfareActivity.setInfo1(yearsr);
				//  welfareActivity.setParticipateYear(new java.sql.Timestamp(new Date(participateYears).getTime()));
				 welfareActivity.setParticipateYear(ddd);
				  welfareActivity.setInfo1(participateYear[i].trim());
				  welfareActivity.setContribution(contribution[i].trim());
				  WelfareActivityProxy.insertWelfareActivity(welfareActivity, conn);
			  }
		  } 
		  HttpSession session = this.getRequest().getSession();
		  session.setAttribute("declareid", id);
	
		//社会公益活动结束
		  *//*******************************//*
		 // 
	      this.saveLog("更新企业申报信息[" + declare.getDeclareid() + "]成功");
	    }catch(SQLException e){
	      e.printStackTrace();
	      this.saveLog("更新企业申报信息[" + declare.getDeclareid() + "]失败");
	      ret= ERROR;
	    }finally{
	      try{
	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
	        
	      }catch(SQLException e){
	        e.printStackTrace();
	      }
	      return ret;
	    }
	  }
*/
  /*  public String deleteDeclare() {
    Connection conn = null;
    try{
      conn = WAFDBConnectionFactory.getInstance().getConnection();
      for(int i=0;i< getIds().length; i++) {
         DeclareProxy.deleteDeclareById(getIds()[i],conn);
      }
      this.saveLog("删除企业申报信息成功");
      return SUCCESS;
    }catch(SQLException e){
      this.saveLog("删除企业申报信息失败");
      e.printStackTrace();
      return ERROR;
    }finally{
      try{
        WAFDBConnectionFactory.getInstance().closeConnection(conn);
      }catch(SQLException e){
        e.printStackTrace();
      }
    }
  }
*/
 /* public String editDeclare() {
    Connection conn = null;
    try{
      conn = WAFDBConnectionFactory.getInstance().getConnection();
      String declareid=declare.getDeclareid();//
      declare = DeclareProxy.getDeclareById(declareid, conn); 
      managementInfo = ManagementInfoProxy.getManagementInfoByDeclareid(declareid, conn);
      this.setManagementInfo(managementInfo);
      creditRecord=CreditRecordProxy.getCreditRecordByDeclareid(declareid, conn);
      this.setCreditRecord(creditRecord);
      this.getGroup();//cgc修改
      declare.setCreateuser(cruser);//cgc
 //     declare.setUpdateuser(cruser);//cgc  修改者    
      this.setDeclare(declare);
      this.listRelate(declareid);//   
      this.saveLog("进入企业申报信息编辑页面成功");
      return SUCCESS;
    }catch(SQLException e){
      this.saveLog("进入企业申报信息编辑页面失败");
      e.printStackTrace();
      return ERROR;
    }finally{
      try{
        WAFDBConnectionFactory.getInstance().closeConnection(conn);
      }catch(SQLException e){
        e.printStackTrace();
      }
    }
  }
*/
  /*public String viewDeclare() {
    Connection conn = null;
    try{
      conn = WAFDBConnectionFactory.getInstance().getConnection();
      String declareid=declare.getDeclareid();
      declare = DeclareProxy.getDeclareById(declareid, conn);
      this.setDeclare(declare);
      managementInfo = ManagementInfoProxy.getManagementInfoByDeclareid(declareid, conn);
      this.setManagementInfo(managementInfo);
      creditRecord=CreditRecordProxy.getCreditRecordByDeclareid(declareid, conn);
      this.setCreditRecord(creditRecord);
      this.saveLog("进入企业申报信息查看页面成功");
      return SUCCESS;
    }catch(SQLException e){
      this.saveLog("进入企业申报信息查看页面失败");
      e.printStackTrace();
      return ERROR;
    }finally{
      try{
        WAFDBConnectionFactory.getInstance().closeConnection(conn);
      }catch(SQLException e){
        e.printStackTrace();
      }
    }
  }
  */




	/*public String examineDeclare() {
		Connection conn = null;
		try {

			String declareid = declare.getDeclareid();
			conn = WAFDBConnectionFactory.getInstance().getConnection();
			declare = DeclareProxy.getDeclareById(declareid, conn);
			declare.setExaminestate(examinestate);
			declare.setAuditopinion(content);
			declare.setAuditor(suggester);
			declare.setAudittime(new Date());
			DeclareProxy.updateDeclare(declare, conn);
			// System.out.println(declare.getExaminestate()+"[11111][][][][]"+declare.getCreateuser());
			// WafUser user=this.getCurrentUser();
			// String coding=user.getUserName();
			if (examinestate != null && "通过".equals(examinestate)) {
				// 生成企业编码Filecoding数据----------------------------------
				WafUser user1 = this.getCurrentUser();
				Calendar cal = Calendar.getInstance();
				String yearNum = cal.get(Calendar.YEAR) + "";
				int maxNum = 0;
				maxNum = FilecodingProxy.getFilecodingByXh(user1.getUserId(),
						yearNum, conn) + 1;
				String maxStr = "";
				if (maxNum / 10 == 0) {
					maxStr = "0000" + maxNum;

				} else if (maxNum / 100 == 0) {
					maxStr = "000" + maxNum;
				} else if (maxNum / 1000 == 0) {
					maxStr = "00" + maxNum;
				}else if (maxNum / 10000 == 0) {
					maxStr = "0" + maxNum;
				}  else {
					maxStr = "" + maxNum;
				}
				WafUser u = WafUserProxy.getWafUserById(declare.getCreateuser());
				String codingno = "CXCJ" + "-" + yearNum + "-" + u.getUserType() + "-" + maxStr;// 创建的编码
				filecoding = new Filecoding();
				String id = IdGenerator.getId(Filecoding.class);
				filecoding.setCodingid(id);
				filecoding.setCreateruser(user1.getUserId());
				filecoding.setCretimeater(new Date());
				filecoding.setCodingdate(new Date());
				filecoding.setCoding(codingno);
				filecoding.setCodingno(maxNum);
				filecoding.setInfo1(u.getUserId());//info1存申报企业用户的id
				filecoding.setInfo2(declareid);//info2存申报id
				filecoding.setInfo3(declare.getCompanyname());//info3存公司名称，info4存储登录名称了
				filecoding.setInfo4(u.getLoginName());// info4存储登录编码
				filecoding.setInfo5(declare.getExaminestate());// info5存储审核状态
				filecoding.setInfo6(yearNum);
				FilecodingProxy.insertFilecoding(filecoding, conn);
				declare.setInfo15(codingno);
			}
			DeclareProxy.updateDeclare(declare, conn);
			// 审核意见过程存储
			if (content != null)
				content = content.trim();
			if (content != null && !"".equals(content)) {
				Suggestion suggestion = new Suggestion();
				suggestion.setSuggestionid(IdGenerator.getId(Suggestion.class));
				suggestion.setDeclareid(declare.getDeclareid());
				suggestion.setContent(content);
				suggestion.setSuggester(suggester);
				suggestion.setSuggestdate(new Date());
				SuggestionProxy.insertSuggestion(suggestion, conn);
			}
			// 审核意见过程存储
			this.saveLog("更新企业申报信息[" + declare.getDeclareid() + "]成功");
			return SUCCESS;
		} catch (SQLException e) {
			e.printStackTrace();
			this.saveLog("更新企业申报信息[" + declare.getDeclareid() + "]失败");
			return ERROR;
		} finally {
			try {
				WAFDBConnectionFactory.getInstance().closeConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
  */
 /* public String viewexamineDeclare() {
	    Connection conn = null;
	    try{
	      String declareid=declare.getDeclareid();
	      conn = WAFDBConnectionFactory.getInstance().getConnection();
	      declare = DeclareProxy.getDeclareById(declareid, conn);
	      managementInfo = ManagementInfoProxy.getManagementInfoByDeclareid(declareid, conn);
	      this.setManagementInfo(managementInfo);
	      creditRecord=CreditRecordProxy.getCreditRecordByDeclareid(declareid, conn);
	      this.setCreditRecord(creditRecord);
	      this.getGroup();//cui 得到当前用户组及用户
	      this.setDeclare(declare);
	      this.listRelate(declareid);
	    //  this.listQualifiInfo(declareid);
	      this.saveLog("进入企业申报信息审核页面成功");
	      return SUCCESS;
	    }catch(SQLException e){
	      this.saveLog("进入企业申报信息审核页面失败");
	      e.printStackTrace();
	      return ERROR;
	    }finally{
	      try{
	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
	      }catch(SQLException e){
	        e.printStackTrace();
	      }
	    }
	  }*/

 /* //根据申报id查询相关信息
  public String listRelate(String declareid) {
	 // HttpServletRequest request = ServletActionContext.getRequest();
	    Connection conn = null;
	    try{
	      if (this.getListBean() == null){ 
	        this.setListBean(new ListDataFormBean());
	      }
	      String whereSql = "";
	      Object[] paras = new Object[0];      
	      *//***************查询相关***************//*
	      StringBuffer whereBuffer = new StringBuffer();
	      List paraList = new ArrayList();
	      boolean isFirst = true;
	      paraList.add(declareid);
	      whereBuffer.append("where declareid=?");
	      whereSql = whereBuffer.toString();
	      paras = paraList.toArray();
	      *//***************查询条件生成结束***************//*
	      conn = WAFDBConnectionFactory.getInstance().getConnection();
	     // int count = HonourProxy.getHonourCount(HonourProxy.searchCountSql + whereSql, paras, conn);
	      honourList = HonourProxy.findHonour(HonourProxy.searchSql + whereSql+" order by honourid", paras,getListBean().getStart(),20,conn);
	      qualifiInfoList = QualifiInfoProxy.findQualifiInfo(QualifiInfoProxy.searchSql + whereSql+" order by qualifiid", paras,getListBean().getStart(),20,conn);
	      licenseList = LicenseProxy.findLicense(LicenseProxy.searchSql + whereSql+" order by licenseId", paras,getListBean().getStart(),20,conn);
	      manageCertifiList = ManageCertifiProxy.findManageCertifi(ManageCertifiProxy.searchSql + whereSql+" order by certifiid", paras,getListBean().getStart(),20,conn);
	      patentList = PatentProxy.findPatent(PatentProxy.searchSql + whereSql+" order by patentid", paras,getListBean().getStart(),30,conn);
	      trademarkList = TrademarkProxy.findTrademark(TrademarkProxy.searchSql + whereSql+" order by trademarkId", paras,getListBean().getStart(),20,conn);
	      welfareActivityList = WelfareActivityProxy.findWelfareActivity(WelfareActivityProxy.searchSql + whereSql+" order by activityId", paras,getListBean().getStart(),20,conn);
	      suggestionList = SuggestionProxy.findSuggestion(SuggestionProxy.searchSql + whereSql+"order by suggestdate", paras,getListBean().getStart(),20,conn);
//	      managementInfoList = ManagementInfoProxy.findManagementInfo(ManagementInfoProxy.searchSql + whereSql, paras,getListBean().getStart(),getListBean().getLength(),conn);
//	      creditRecordList = CreditRecordProxy.findCreditRecord(CreditRecordProxy.searchSql + whereSql, paras,getListBean().getStart(),getListBean().getLength(),conn);
	      //request.setAttribute("manageCertifiList", manageCertifiList);
//	      request.setAttribute("patentList", patentList);
//	      request.setAttribute("trademarkList", trademarkList);
//	      request.setAttribute("welfareActivityList", welfareActivityList);
//	      request.setAttribute("qualifiInfoList", qualifiInfoList); 
//	      request.setAttribute("honourList", honourList);
//	      request.setAttribute("licenseList", licenseList);
	     // getListBean().setCount(count);
	    //  getListBean().setDataList(honourList);
	      this.saveLog("进入获得荣誉列表页面成功");
	      return SUCCESS;
	    }catch(SQLException e){
	      e.printStackTrace();
	      this.saveLog("进入获得荣誉列表页面失败");
	      return ERROR;
	    }finally{
	      try{
	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
	      }catch(SQLException e){
	        e.printStackTrace();
	      }
	    }
	  }*/
  
public String getQualifinname() {
	return qualifinname;
}
public void setQualifinname(String qualifinname) {
	this.qualifinname = qualifinname;
}
public String getIssunit() {
	return issunit;
}
public void setIssunit(String issunit) {
	this.issunit = issunit;
}
public String getLicenseName() {
	return licenseName;
}
public void setLicenseName(String licenseName) {
	this.licenseName = licenseName;
}
public String getApprovedOffice() {
	return approvedOffice;
}
public void setApprovedOffice(String approvedOffice) {
	this.approvedOffice = approvedOffice;
}
public String getApprovedOffice1() {
	return approvedOffice1;
}
public void setApprovedOffice1(String approvedOffice1) {
	this.approvedOffice1 = approvedOffice1;
}
public String getTrademarkName() {
	return trademarkName;
}
public void setTrademarkName(String trademarkName) {
	this.trademarkName = trademarkName;
}
public String getCertifiname() {
	return certifiname;
}
public void setCertifiname(String certifiname) {
	this.certifiname = certifiname;
}
public String getCertifidept() {
	return certifidept;
}
public void setCertifidept(String certifidept) {
	this.certifidept = certifidept;
}
public String getHonourname() {
	return honourname;
}
public void setHonourname(String honourname) {
	this.honourname = honourname;
}
public String getIssunit1() {
	return issunit1;
}
public void setIssunit1(String issunit1) {
	this.issunit1 = issunit1;
}

public String getContribution() {
	return contribution;
}
public void setContribution(String contribution) {
	this.contribution = contribution;
}
public String getParticipateYear() {
	return participateYear;
}
public void setParticipateYear(String participateYear) {
	this.participateYear = participateYear;
}
public String getSuggester() {
	return suggester;
}
public void setSuggester(String suggester) {
	this.suggester = suggester;
}

//生成excel
/**
 * freemarker生成word，使用了xml模板
 * @author ChenGuocui
 */
public void exportWord() {

	String docName = "pdfxiazai" + ".";
	//String path = WAFConfigure.getProperty("UploadFile_Path") + "temp/";
	String path = "temp/";
	//String WAFWeb_URL = WAFConfigure.getProperty("URLWeb_URL");
	String WAFWeb_URL =("URLWeb_URL");
	String url = WAFWeb_URL
			+ "wafplatform/downLoadWord2.action?declare.declareid=";
		
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	boolean isSaveDoc = TheFreemarker.saveDOC(url, path + docName + "doc");
	String name = new Date().getYear()+1900+"";// 下载的文档名称
	if (isSaveDoc) {
		boolean f = Word2Pdf.word2PDF(path + docName + "doc", path + docName + "pdf","诚信创建");
		if(f){
			try {
				Word2Pdf.writePdfMark(path+ docName + "pdf", path+ name + docName + "pdf", "诚 信 创 建", "");
				File targetFile = TheFreemarker.searchFile(path+ name + docName + "pdf");
				TheFreemarker.returnFileOutStream(targetFile,request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
/**
 * freemarker生成word，使用了xml模板
 * @author ChenGuocui
 */
public void exportWord2() {

	String docName = "pdfxiazai" + ".";
	//String path = WAFConfigure.getProperty("UploadFile_Path") + "temp/";
	String path = "temp/";
	//String WAFWeb_URL = WAFConfigure.getProperty("URLWeb_URL");
	String WAFWeb_URL =("URLWeb_URL");
	String url = WAFWeb_URL
			+ "wafplatform/downLoadWord2.action?declare.declareid=";
			
	
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	boolean isSaveDoc = TheFreemarker.saveDOC(url, path + docName + "doc");
	String name = new Date().getYear()+1900+"";// 下载的文档名称
	if (isSaveDoc) {
		boolean f = Word2Pdf.word2PDF(path + docName + "doc", path + docName + "pdf","诚信创建");
		if(f){
			try {
				Word2Pdf.writePdfMark(path+ docName + "pdf", path+ name + docName + "pdf", "诚 信 创 建", "");
				File targetFile = TheFreemarker.searchFile(path+ name + docName + "pdf");
				TheFreemarker.returnFileOutStream(targetFile,request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
public void downLoadWord() {

	TheFreemarker tf = new TheFreemarker();
	tf.createDoc("");

}
public void downLoadWord2() {

	//TheFreemarker2 tf2 = new TheFreemarker2();
	//tf2.createDoc(declare.getDeclareid());

}

public Date getExpdate() {
	return expdate;
}
public void setExpdate(Date expdate) {
	this.expdate = expdate;
}


public HashMap getNowyearList() {
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
	String syear = formatter.format(new Date());;
	int year=Integer.parseInt(syear);
	nowyearList.put(year,year);
	nowyearList.put(year-1,year-1);
	nowyearList.put(year-2,year-2);
	return nowyearList;
}
public void setNowyearList(HashMap nowyearList){
	this.nowyearList = nowyearList;
}
public String getRyjb() {
	return ryjb;
}
public void setRyjb(String ryjb) {
	this.ryjb = ryjb;
}
public HashMap getRyjbList() {
	ryjbList.put("国际级","国际级");
	ryjbList.put("省部级","省部级");
	ryjbList.put("协会/商会级","协会/商会级");
	return ryjbList;
}
public void setRyjbList(HashMap ryjbList) {
	this.ryjbList = ryjbList;
}
@Override
public Class getPersistentClass() {
	// TODO Auto-generated method stub
	return null;
}

}
