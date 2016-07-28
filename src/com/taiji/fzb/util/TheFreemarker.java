package com.taiji.fzb.util;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.taiji.waf.cxproject.business.CreditRecord;
import com.taiji.waf.cxproject.business.Declare;
import com.taiji.waf.cxproject.business.Honour;
import com.taiji.waf.cxproject.business.License;
import com.taiji.waf.cxproject.business.ManageCertifi;
import com.taiji.waf.cxproject.business.ManagementInfo;
import com.taiji.waf.cxproject.business.Patent;
import com.taiji.waf.cxproject.business.QualifiInfo;
import com.taiji.waf.cxproject.business.Trademark;
import com.taiji.waf.cxproject.business.WelfareActivity;
import com.taiji.waf.cxproject.entity.HonourEntity;
import com.taiji.waf.cxproject.entity.LicenseEntity;
import com.taiji.waf.cxproject.entity.ManageCertifiEntity;
import com.taiji.waf.cxproject.entity.PatentEntity;
import com.taiji.waf.cxproject.entity.QualifiInfoEntity;
import com.taiji.waf.cxproject.entity.TrademarkEntity;
import com.taiji.waf.cxproject.entity.WelfareActivityEntity;
import com.taiji.waf.cxproject.proxy.CreditRecordProxy;
import com.taiji.waf.cxproject.proxy.DeclareProxy;
import com.taiji.waf.cxproject.proxy.HonourProxy;
import com.taiji.waf.cxproject.proxy.LicenseProxy;
import com.taiji.waf.cxproject.proxy.ManageCertifiProxy;
import com.taiji.waf.cxproject.proxy.ManagementInfoProxy;
import com.taiji.waf.cxproject.proxy.PatentProxy;
import com.taiji.waf.cxproject.proxy.QualifiInfoProxy;
import com.taiji.waf.cxproject.proxy.TrademarkProxy;
import com.taiji.waf.cxproject.proxy.WelfareActivityProxy;
import com.taiji.waf.db.WAFDBConnectionFactory;
import com.taiji.waf.sys.business.DataItem;
import com.taiji.waf.sys.business.WafUser;
import com.taiji.waf.sys.proxy.WafDataProxy;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

public class TheFreemarker  {
	private Configuration configuration = null;
	private String name="Error";//生成的文档的名称

	public TheFreemarker() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("UTF-8");
	}
			/**
 * 装载模板与数据
 * @author ChenGuocui
 * @param declareID  申报id
 * @exception
 */
	/**
	 * 装载模板与数据
	 * 
	 * @author ChenGuocui
	 * @param declareID
	 *            申报id
	 * @exception
	 */
	public void createDoc(String declareID) {
		// 要填入模本的数据文件
		Map dataMap = new HashMap();
		getData(dataMap, declareID);
		// 设置模本装置方法和路径
		// 这里我们的模板是放在WebRoot/WEB-INF/templates下面

		// configuration.setClassForTemplateLoading(this.getClass(),
		// "");//模板放在action包下面时
		configuration.setServletContextForTemplateLoading(ServletActionContext
				.getServletContext(), "WEB-INF/templates");
		Template t = null;
		try {
			t = configuration.getTemplate("template.xml"); // 装载的xml为word生成03版的xml
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 输出文档路径及名称
		// File outFile = new File("D:/" +name+ ".doc");

		Writer out = null;
		HttpServletResponse response = ServletActionContext.getResponse();// 用于非本地输出
		try {
			// out = new BufferedWriter(new OutputStreamWriter(new
			// FileOutputStream(outFile),"utf-8"));
			out = new BufferedWriter(new OutputStreamWriter(response
					.getOutputStream(), "utf-8"));// 用于非本地输出
			t.process(dataMap, out);
			out.flush();// 要不要加呢？
			out.close();// 要不要加呢？
			// response.setCharacterEncoding("UTF-8");//用于非本地输出
			// response.setContentType("application/x-msdownload");//用于非本地输出
			//SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");// 设置日期格式
			// System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			//name = name + "“诚信创建企业”首次申报表" + "（"+ df.format(new Date()).toString() + "）";// 下载的文档名称
			// String
			// str="attachment;filename="+java.net.URLEncoder.encode((name+".doc"),
			// "UTF-8"));
			//String str = name + ".doc";// 中文会有编码问题，下面进行了转码
			//System.out.println(str);
			// response.addHeader("Content-Disposition", "attachment; filename="
			// + java.net.URLEncoder.encode(str, "UTF-8"));//进行中文转码，用于非本地输出
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public static boolean saveDOC(String url,String path){
		boolean f=true;
		try {
			InputStream input = getInputStreamFromURL(url);
			File file = new File(path);
			OutputStream os = new FileOutputStream(file);
			byte buffer[] = new byte[4 * 1024];
			int len = 0;
			while ((len = input.read(buffer)) != -1) {
				os.write(buffer, 0, len);

			}
			os.flush();
			os.close();
			input.close();

		} catch (IOException e) {
			f=false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}
	private static InputStream getInputStreamFromURL(String url) throws IOException {
		// 执行请求
		InputStream in = getHttpURLConnectionFromURL(url).getInputStream();
		return in;
	}
	
	private static HttpURLConnection getHttpURLConnectionFromURL(String url)
			throws IOException {
		System.out.println("URL-------------------"+url);
		URL theUrl = new URL(url);
		HttpURLConnection url_con = (HttpURLConnection) theUrl.openConnection();
		url_con.setDoOutput(true);
		//url_con.setRequestMethod("POST");
		url_con.getOutputStream().flush();
		url_con.getOutputStream().close();
		return url_con;
	}
	public static File searchFile(String fileName) {
		
		File file = new File(fileName);
		
		if(file != null && file.exists())
			return file;
		else
			return null;
	}
	public static void returnFileOutStream(File targetFile,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if (targetFile != null) {
			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(
					targetFile));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(targetFile.getName().getBytes("utf-8"),
							"ISO-8859-1"));
			response.addHeader("Content-Length", "" + targetFile.length());
			OutputStream toClient = new BufferedOutputStream(response
					.getOutputStream());
			response.setContentType("application/octet-stream");
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		}
	}
	/**
	 * 注意dataMap里存放的数据Key值要与模板中的参数相对应
	 * 往文档中替换填充数据
	 * @author ChenGuocui
	 * @param dataMap
	 * @param declareID 申报id
	 */
	private void getData(Map dataMap,String declareID) {
		Connection conn=null;
		try {
		conn = WAFDBConnectionFactory.getInstance().getConnection();
   	  	String whereSql=" where declareid='"+declareID+"'";
   	  	Object[] paras = new Object[0];
   	  	//List declareList = DeclareProxy.findDeclare(DeclareProxy.searchSql+whereSql, paras,0,9999,conn);//查询申请表信息方法1
   	  	//Declare declare = (Declare)declareList.get(0);//查询申请表信息方法1
   	  	Declare declare = DeclareProxy.getDeclareById(declareID, conn);//查询申请表信息方法2
   	  	ManagementInfo managementInfo = ManagementInfoProxy.getManagementInfoByDeclareid(declareID, conn);
   	  	CreditRecord creditRecord=CreditRecordProxy.getCreditRecordByDeclareid(declareID, conn);
   	  	
   	  	name=declare.getCompanyname().toString();//下载的文档名称
   	  	dataMap.put("xh", ""+this.getGroup(declare.getInfo15()));//得到所属协会的名称
   	  	dataMap.put("bianhao", ""+declare.getInfo15());//编号
	   	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String audittimes=""; 
		String audityear="";
		String auditmonth="";
		String auditdate="";
		if(declare.getAudittime()!=null){
			audittimes=sdf.format(declare.getAudittime());
			audityear=audittimes.substring(0, 4);
			auditmonth=audittimes.substring(5,7);
			auditdate=audittimes.substring(8,10);
		} 
		dataMap.put("audityear", audityear);//年
		dataMap.put("auditmonth", auditmonth);//月
		dataMap.put("auditdate", auditdate);//日
   	  	dataMap.put("companyname", ""+(declare.getCompanyname()==null? "无" :declare.getCompanyname()));//企业名称 xml里的标记为${companyname}
		dataMap.put("registeredaddress", ""+(declare.getRegisteredaddress()==null? "无" :declare.getRegisteredaddress()));
		dataMap.put("legalperson", ""+(declare.getLegalperson()==null? "无" :declare.getLegalperson()));
		dataMap.put("businessregistrationno", ""+(declare.getBusinessregistrationno()==null? "无" :declare.getBusinessregistrationno()));
		dataMap.put("companytype", ""+(declare.getCompanytype()==null? "无" :declare.getCompanytype()));
		dataMap.put("registeredcapital", ""+(declare.getRegisteredcapital()==null? "无" :declare.getRegisteredcapital()));
		dataMap.put("paidincapital", ""+(declare.getPaidincapital()==null? "无" :declare.getPaidincapital()));
		//日期处理
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy年MM月dd日");
		dataMap.put("establishdate", ""+(declare.getEstablishdate().toString()==null? "无" :format1.format(declare.getEstablishdate())));
		dataMap.put("starttime", ""+(declare.getStarttime().toString()==null? "无" :format1.format(declare.getStarttime())));
		dataMap.put("endtime", ""+(declare.getEndtime()==null? "长期" :format1.format(declare.getEndtime())));
		dataMap.put("organizationcode", ""+(declare.getOrganizationcode()==null? "无" :declare.getOrganizationcode()));
		dataMap.put("taxregistrationno", ""+(declare.getTaxregistrationno()==null? "无" :declare.getTaxregistrationno()));
		dataMap.put("industry", ""+(declare.getIndustry()==null? "无" :declare.getIndustry()));
		dataMap.put("staffnumber", ""+(declare.getStaffnumber()==null? "无" :declare.getStaffnumber()));
		dataMap.put("businessscope", ""+(declare.getBusinessscope()==null? "无" :declare.getBusinessscope()));
		dataMap.put("info10", ""+(declare.getInfo10()==null? "无" :declare.getInfo10()));
		dataMap.put("creditmanagement", ""+(declare.getCreditmanagement()==null? "无" :declare.getCreditmanagement()));
		dataMap.put("financialmanagement", ""+(declare.getFinancialmanagement()==null? "无" :declare.getFinancialmanagement()));//时间 xml里的标记为${address}
		dataMap.put("qualitymanagement", ""+(declare.getQualitymanagement()==null? "无" :declare.getQualitymanagement()));
		dataMap.put("info1", ""+(declare.getInfo1()==null? "无" :declare.getInfo1()));//合同管理
		dataMap.put("labormanagement", ""+(declare.getLabormanagement()==null? "无" :declare.getLabormanagement()));
		dataMap.put("safetymanagement", ""+(declare.getSafetymanagement()==null? "无" :declare.getSafetymanagement()));
		dataMap.put("servicemanagement", ""+(declare.getServicemanagement()==null? "无" :declare.getServicemanagement()));
		dataMap.put("info14", ""+(declare.getInfo14()==null? "无" :declare.getInfo14()));
		dataMap.put("info6", ""+(declare.getInfo18()==null? "" :declare.getInfo18()));
		dataMap.put("info7", ""+(declare.getInfo7()==null? "" :declare.getInfo7()));
		dataMap.put("info8", ""+(declare.getInfo8()==null? "" :declare.getInfo8()));
		dataMap.put("info3", ""+(declare.getInfo3()==null? "" :declare.getInfo3()));
		dataMap.put("info4", ""+(declare.getInfo4()==null? "" :declare.getInfo4()));
		dataMap.put("info11", ""+(declare.getInfo11()==null? "" :declare.getInfo11()));
		dataMap.put("info12", ""+(declare.getInfo12()==null? "" :declare.getInfo12()));
		dataMap.put("info13", ""+(declare.getInfo13()==null? "" :declare.getInfo13()));
		dataMap.put("info19", ""+(declare.getInfo19()==null? "" :declare.getInfo19()));
		dataMap.put("info5", ""+(declare.getInfo5()==null? "不同意" :declare.getInfo5()));
		dataMap.put("chargename", ""+(declare.getChargename()==null? "无" :declare.getChargename()));
		dataMap.put("chargetelephone", ""+(declare.getChargetelephone()==null? "无" :declare.getChargetelephone()));
		dataMap.put("chargephone", ""+(declare.getChargephone()==null? "无" :declare.getChargephone()));
		dataMap.put("chargeemail", ""+(declare.getChargeemail()==null? "无" :declare.getChargeemail()));
		dataMap.put("chargepost", ""+(declare.getChargepost()==null? "无" :declare.getChargepost()));
		dataMap.put("contactname", ""+(declare.getContactname()==null? "无" :declare.getContactname()));
		dataMap.put("contacttelephone", ""+(declare.getContacttelephone()==null? "无" :declare.getContacttelephone()));
		dataMap.put("contactphone", ""+(declare.getContactphone()==null? "无" :declare.getContactphone()));
		dataMap.put("contactemail", ""+(declare.getContactemail()==null? "无" :declare.getContactemail()));
		dataMap.put("contactpost", ""+(declare.getContactpost()==null? "无" :declare.getContactpost()));
		dataMap.put("contactaddress", ""+(declare.getContactaddress()==null? "无" :declare.getContactaddress()));
		dataMap.put("contactzipcode", ""+(declare.getContactzipcode()==null? "无" :declare.getContactzipcode()));
		dataMap.put("companywebsite", ""+(declare.getCompanywebsite()==null? "无" :declare.getCompanywebsite()));
		dataMap.put("commerceinspection", ""+declare.getCommerceinspection());
		dataMap.put("industryinspection", ""+declare.getIndustryinspection());
		dataMap.put("totalassets", ""+declare.getTotalassets());
		dataMap.put("businessincome", ""+declare.getBusinessincome());
		dataMap.put("totalprofit", ""+declare.getTotalprofit());
		dataMap.put("creditoverview", "详见附件");
		//dataMap.put("commitment", ""+declare.getCommitment().trim());
		//dataMap.put("suggestion", ""+declare.getSuggestion());
//		String suggestion = declare.getSuggestion().replaceAll("\n","<w:p wsp:rsidR='001A10B3' wsp:rsidRDefault='001A10B3' wsp:rsidP='00F668AD'>"+
//				"<w:pPr>"+
//					"<w:widowControl /><w:ind w:firstLineChars='200' w:firstLine='420'/>"+
//					"<w:rPr>"+
//						"<w:rFonts w:h-ansi='宋体' w:hint='fareast' />"+
//						"<w:kern w:val='0' />"+
//						"<w:sz-cs w:val='21' />"+
//					"</w:rPr>"+
//				"</w:pPr>"+
//			"</w:p>");
//
//		dataMap.put("suggestion",suggestion);	
		
		dataMap.put("agreedate", ""+format1.format(declare.getAgreedate()));
		
		List qualifiInfoList = QualifiInfoProxy.findQualifiInfo(QualifiInfoProxy.searchSql + whereSql+" order by qualifiid", paras,0,20,conn);//查询资格资质信息
		List licenseList = LicenseProxy.findLicense(LicenseProxy.searchSql + whereSql+" order by licenseId", paras,0,20,conn);//查询生产许可证信息
		List trademarkList = TrademarkProxy.findTrademark(TrademarkProxy.searchSql + whereSql+" order by trademarkId", paras,0,20,conn);//查询注册商标信息
		List patentList = PatentProxy.findPatent(PatentProxy.searchSql + whereSql+" order by patentid", paras,0,30,conn);//查询专利信息
		List manageCertifiList = ManageCertifiProxy.findManageCertifi(ManageCertifiProxy.searchSql + whereSql+" order by certifiid", paras,0,20,conn);//查询管理体系认证
		List honourList = HonourProxy.findHonour(HonourProxy.searchSql + whereSql+" order by honourid", paras,0,20,conn);//查询荣誉奖励
		List welfareActivityList = WelfareActivityProxy.findWelfareActivity(WelfareActivityProxy.searchSql + whereSql+" order by activityId", paras,0,20,conn);//查询社会公益活动
		
		//表格中的数据填充
		List table1 = new ArrayList();
		for (int i = 0; i < qualifiInfoList.size(); i++) {
			QualifiInfo quali =(QualifiInfo) qualifiInfoList.get(i);
			QualifiInfoEntity q = new QualifiInfoEntity();
//			q.setQualifinname(""+quali.getQualifinname());
//			q.setIssunit(""+quali.getIssunit());
			if(quali.getQualifinname()!=null){
				q.setQualifinname(""+quali.getQualifinname());
			}else{
				q.setQualifinname("");
			}
			if(quali.getIssunit()!=null){
				q.setIssunit(""+quali.getIssunit());
			}else{
				q.setIssunit("");
			}
			String s = "";
			if(quali.getInfo1()!=null){
				s = format1.format(quali.getInfo1());
			}
			q.setInfo2(""+s);
			table1.add(q);
		}
		if(qualifiInfoList!=null&&qualifiInfoList.size()<3){
			for(int i=0;i<3-qualifiInfoList.size();i++){
				QualifiInfoEntity q = new QualifiInfoEntity();
				q.setQualifinname(" ");
				q.setIssunit(" ");
				q.setInfo2(" ");
				table1.add(q);
			}
		}
		dataMap.put("table1", table1);
		List table2 = new ArrayList();
		for (int i = 0; i < licenseList.size(); i++) {
			License licen =(License) licenseList.get(i);
			LicenseEntity l = new LicenseEntity();
//			l.setLicenseName(""+licen.getLicenseName());
//			l.setApprovedOffice(""+licen.getApprovedOffice());
			if(licen.getLicenseName()!=null){
				l.setLicenseName(""+licen.getLicenseName());
			}else{
				l.setLicenseName("");
			}
			if(licen.getApprovedOffice()!=null){
				l.setApprovedOffice(""+licen.getApprovedOffice());
			}else{
				l.setApprovedOffice("");
			}
			String s = "";
			if(licen.getInfo1()!=null){
				s = format1.format(licen.getInfo1());
			}
			l.setInfo2(""+s);
			table2.add(l);
		}
		if(licenseList!=null&&licenseList.size()<3){
			for(int i=0;i<3-licenseList.size();i++){
				LicenseEntity l = new LicenseEntity();
				l.setLicenseName(" ");
				l.setApprovedOffice(" ");
				l.setInfo2(" ");
				table2.add(l);
			}
		}
		dataMap.put("table2", table2);
		
		List table3 = new ArrayList();
		for (int i = 0; i < trademarkList.size(); i++) {
			Trademark trade =(Trademark) trademarkList.get(i);
			TrademarkEntity t = new TrademarkEntity();
//			t.setTrademarkName(""+trade.getTrademarkName());
//			t.setApprovedOffice(""+trade.getApprovedOffice());
			if(trade.getTrademarkName()!=null){
				t.setTrademarkName(""+trade.getTrademarkName());
			}else{
				t.setTrademarkName("");
			}
			if(trade.getApprovedOffice()!=null){
				t.setApprovedOffice(""+trade.getApprovedOffice());
			}else{
				t.setApprovedOffice("");
			}
			table3.add(t);
		}
		if(trademarkList!=null&&trademarkList.size()<3){
			for(int i=0;i<3-trademarkList.size();i++){
				TrademarkEntity t = new TrademarkEntity();
				t.setTrademarkName(" ");
				t.setApprovedOffice(" ");
				table3.add(t);
			}
		}
		dataMap.put("table3", table3);
		
		List table4 = new ArrayList();
		for (int i = 0; i < patentList.size(); i++) {
			Patent paten =(Patent) patentList.get(i);
			PatentEntity p = new PatentEntity();
//			p.setPatentname(""+paten.getPatentname());
//			p.setInvestigatedepartment(""+paten.getInvestigatedepartment());
			if(paten.getPatentname()!=null){
				p.setPatentname(""+paten.getPatentname());
			}else{
				p.setPatentname("");
			}
			if(paten.getInvestigatedepartment()!=null){
				p.setInvestigatedepartment(""+paten.getInvestigatedepartment());
			}else{
				p.setInvestigatedepartment("");
			}
			String s = "";
			if(paten.getInfo1()!=null){
				s = format1.format(paten.getInfo1());
			}
			p.setInfo2(""+s);
			table4.add(p);
		}
		if(patentList!=null&&patentList.size()<3){
			for(int i=0;i<3-patentList.size();i++){
				PatentEntity p = new PatentEntity();
				p.setPatentname(" ");
				p.setInvestigatedepartment(" ");
				p.setInfo2(" ");
				table4.add(p);
			}
		}
		dataMap.put("table4", table4);
		
		List table5 = new ArrayList();
		for (int i = 0; i < manageCertifiList.size(); i++) {
			ManageCertifi manag =(ManageCertifi) manageCertifiList.get(i);
			ManageCertifiEntity m = new ManageCertifiEntity();
//			m.setCertifiname(""+manag.getCertifiname());
//			m.setCertifidept(""+manag.getCertifidept());
			if(manag.getCertifiname()!=null){
				m.setCertifiname(""+manag.getCertifiname());
			}else{
				m.setCertifiname("");
			}
			if(manag.getCertifidept()!=null){
				m.setCertifidept(""+manag.getCertifidept());
			}else{
				m.setCertifidept("");
			}
			String s = "";
			if(manag.getInfo1()!=null){
				s = format1.format(manag.getInfo1());
			}
			m.setInfo2(""+s);
			table5.add(m);
		}
		if(manageCertifiList!=null&&manageCertifiList.size()<3){
			for(int i=0;i<3-manageCertifiList.size();i++){
				ManageCertifiEntity m = new ManageCertifiEntity();
				m.setCertifiname(" ");
				m.setCertifidept(" ");
				m.setInfo2(" ");
				table5.add(m);
			}
		}
		dataMap.put("table5", table5);
		
		List table6 = new ArrayList();
		for (int i = 0; i < honourList.size(); i++) {
			Honour honou =(Honour) honourList.get(i);
			HonourEntity h = new HonourEntity();
//			h.setHonourname(""+honou.getHonourname());
//			h.setIssunit(""+honou.getIssunit()==null?"":honou.getIssunit());
			if(honou.getHonourname()!=null){
				h.setHonourname(""+honou.getHonourname());
			}else{
				h.setHonourname("");
			}
			if(honou.getIssunit()!=null){
				h.setIssunit(""+honou.getIssunit());
			}else{
				h.setIssunit("");
			}
			String s="";
			if(honou.getInfo10()!=null){
				s=honou.getInfo10();
			}
			h.setInfo10(""+s);
			table6.add(h);
		}
		if(honourList!=null&&honourList.size()<3){
			for(int i=0;i<3-honourList.size();i++){
				HonourEntity h = new HonourEntity();
				h.setHonourname(" ");
				h.setIssunit(" ");
				h.setInfo10(" ");
				table6.add(h);
			}
		}
		dataMap.put("table6", table6);
		
		List table7 = new ArrayList();
		for (int i = 0; i < welfareActivityList.size(); i++) {
			WelfareActivity welfa =(WelfareActivity) welfareActivityList.get(i);
			WelfareActivityEntity w = new WelfareActivityEntity();
			w.setInfo6(welfa.getInfo1());
			//w.setInfo6(""+(welfa.getParticipateYear().getYear()+1900));
			//w.setContribution(""+welfa.getContribution());
			if(welfa.getContribution()!=null){
				w.setContribution(""+welfa.getContribution());
			}else{
				w.setContribution("");
			}
			table7.add(w);
		}
		if(welfareActivityList!=null&&welfareActivityList.size()<3){
			for(int i=0;i<3-welfareActivityList.size();i++){
				WelfareActivityEntity w = new WelfareActivityEntity();
				w.setInfo6(" ");
				w.setContribution(" ");
				table7.add(w);
			}
		}
		dataMap.put("table7", table7);
		
   	  	dataMap.put("miqualityproportion", ""+(managementInfo.getMiQualityProportion()==null?"":managementInfo.getMiQualityProportion()));
   	  	dataMap.put("miqualityyears", ""+(managementInfo.getMiQualityYears()==null?"":managementInfo.getMiQualityYears()));
   	  	dataMap.put("miqualitymanagement", ""+(managementInfo.getMiQualityManagement().equals("2")? "有" : "没有"));
   	  	
/*   	  	String misafe="";
   	  	if(managementInfo.getInfo1().equals("checkbox1"))
   	  		misafe="评价期内未发生过安全生产事故";
   	  	else{
   	  		if(managementInfo.getInfo2().equals("checkbox2"))
   	  			misafe="评价期内因发生安全生产事故，被有关部门处以警告、罚款、责令改正、责令限期改正、责令停止违法行为、没收违法所得处罚（一项或多项）"+managementInfo.getInfo6()+"次";
   	  		if(managementInfo.getInfo3().equals("checkbox3"))
   	  			misafe+="评价期内因发生安全生产事故，被有关部门处以责令停产停业整顿、责令停产停业、责令停止建设、责令停止施工处罚（一项或多项）"+managementInfo.getInfo7()+"次";
   	  		if(managementInfo.getInfo4().equals("checkbox4"))
   	  			misafe+="评价期内因发生安全生产事故，被有关部门处以暂扣或者吊销有关许可证，暂停或者撤销有关执业资格、岗位证书、关闭、拘留处罚（一项或多项）";
   	  		if(managementInfo.getInfo5().equals("checkbox5"))
   	  			misafe+="评价期内安全生产方面发生过亡人事故";
   	  	}*/
  // 	  	dataMap.put("misafe","12222");

   	  	dataMap.put("miinfo1",(managementInfo.getInfo1()==null?"":"评价期内是否发生过安全生产事故：未发生"));
   	  	dataMap.put("miinfo2",(managementInfo.getInfo2()==null?"":"评价期内是否发生过安全生产事故：发生过"+managementInfo.getInfo6()+"次，但无人员伤亡" ));
   	    dataMap.put("miinfo3",(managementInfo.getInfo3()==null?"":"评价期内因发生安全生产事故，被有关部门处以责令停产停业整顿、责令停产停业、责令停止建设、责令停止施工处罚（一项或多项）"+managementInfo.getInfo7()+"次"));
   	    dataMap.put("miinfo4",(managementInfo.getInfo4()==null?"":"评价期内因发生安全生产事故，被有关部门处以暂扣或者吊销有关许可证，暂停或者撤销有关执业资格、岗位证书、关闭、拘留处罚（一项或多项）"));
   	    dataMap.put("miinfo5",(managementInfo.getInfo5()==null?"":"评价期内是否发生过安全生产事故：发生过有人身伤亡的事故")); 
//  		dataMap.put("miinfo1","评价期内未发生过安全生产事故");
//  	    dataMap.put("miinfo2","评价期内因发生安全生产事故，被有关部门处以警告、罚款、责令改正、责令限期改正、责令停止违法行为、没收违法所得处罚（一项或多项）");
//  	    dataMap.put("miinfo3","评价期内因发生安全生产事故，被有关部门处以责令停产停业整顿、责令停产停业、责令停止建设、责令停止施工处罚（一项或多项）");
//   	    dataMap.put("miinfo4","评价期内因发生安全生产事故，被有关部门处以暂扣或者吊销有关许可证，暂停或者撤销有关执业资格、岗位证书、关闭、拘留处罚（一项或多项）");
//   	    dataMap.put("miinfo5","评价期内安全生产方面发生过亡人事故");  
   	    dataMap.put("miriskmanagement",(managementInfo.getMiRiskManagement().equals("2") ? "未使用过" : "使用过"));
   	  	dataMap.put("publicinfo1", (creditRecord.getPublicinfo1().equals("2")?"有"+creditRecord.getInfo2()+"次":"无"));
   	    dataMap.put("publicinfo2", (creditRecord.getPublicinfo2().equals("2")?"有"+creditRecord.getInfo3()+"次":"无"));
   	  	//dataMap.put("financialinfo", (creditRecord.getFinancialinfo().equals("2")?"有拖欠，但不足90天（含展期后）":(creditRecord.getFinancialinfo().equals("3")?"拖欠达到90天（含展期后）":"无")));
		dataMap.put("consumercomplaints1", (creditRecord.getConsumerComplaints1().equals("2")?"有"+creditRecord.getInfo4()+"次":"无"));
		dataMap.put("consumercomplaints2", (creditRecord.getConsumerComplaints1().equals("2")?"有":"无"));
		dataMap.put("courtrecords", (creditRecord.getCourtRecords().equals("2")?"有"+creditRecord.getInfo5()+"次":"无"));
		dataMap.put("crinfo1", (creditRecord.getInfo1().equals("2")?"有"+creditRecord.getInfo6()+"次":"无"));
		dataMap.put("ratepayingcreditgrade", (creditRecord.getRatepayingCreditGrade().equals("1")?"A级":(creditRecord.getRatepayingCreditGrade().equals("2")?"B级":(creditRecord.getRatepayingCreditGrade().equals("3")?"C级":(creditRecord.getRatepayingCreditGrade().equals("4")?"D级":"未评定")))));
		
		 }
	      catch(Exception e){ 
	  		System.out.println(e); 
	  		
	  	} 
	  	finally {
	  			try {
	  				WAFDBConnectionFactory.getInstance().closeConnection(conn);
	  			} catch (SQLException e) {
	  				e.printStackTrace();
	  			}
	  	}
		
	}
	
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
	public String getGroup(String createuser){
    	 Connection conn = null;
    	 String xh="";
    	  HttpServletRequest request = ServletActionContext.getRequest ();
    	  try{
    	     conn = WAFDBConnectionFactory.getInstance().getConnection();

	    	 List list = WafDataProxy.getDataItemListByDataId("xhmc");
	    	 if(createuser.contains("-")){
	    		 String arr[] = createuser.split("-");
		    	 xh=arr[2];
	    		 
	    	 }else{
	    		 xh = createuser;
	    	 }
	    	 for( int i = 0;i < list.size();i++){
	    		    	DataItem dateItem = (DataItem)list.get(i);
	    		    	if(xh.equals(dateItem.getItemValue())){
	    		    		xh = dateItem.getItemName();	
	    		    	}
	    		    }
	    	 return xh;
    	  }
    	  catch(SQLException e){
    	      e.printStackTrace();
    	      return xh; 
    	    }
    	  finally{
    	      try{
    	        WAFDBConnectionFactory.getInstance().closeConnection(conn);
    	      }catch(SQLException e){
    	        e.printStackTrace();
    	      }
    	    }
    	  }

}