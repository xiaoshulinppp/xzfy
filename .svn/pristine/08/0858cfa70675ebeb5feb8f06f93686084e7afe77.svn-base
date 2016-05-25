package com.taiji.website.webwork;


import java.io.*;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import org.hibernate.Hibernate;

import slime.util.IOStream.IOStream;

import com.opensymphony.xwork.ActionContext;
//import com.taiji.ajgl.service.AjService;
import com.taiji.core.util.ApplicationPath;
import com.taiji.core.util.PaginationSupport;
import com.taiji.core.webwork.action.ProtectedDetailAction;
//import com.taiji.fzb.domain.XzfyInfo;
//import com.taiji.fzb.service.RecordService;
import com.taiji.user.domain.User;
import com.taiji.website.domain.ArticleInfo;
import com.taiji.website.domain.Comment;
import com.taiji.website.service.ArticleService;

public class ArticleDetailAction extends ProtectedDetailAction{

	private static final long serialVersionUID = 1L;
	private Integer pNum = 1;
	private Integer pageSize = 10;
	private Integer totalPage;
	private PaginationSupport pageList = new PaginationSupport();
	private List<ArticleInfo> articleList = new ArrayList<ArticleInfo>();
	private List<Comment> commentList = new ArrayList<Comment>();
	private ArticleInfo articleInfo;
	private Comment comment;
	private Integer articleId;
	private ArticleService articleService = null;
//	private AjService ajService = null;
	private User user;
//	private RecordService recordService = null; // 模板业务层方法
	private String title="";
	private String author="";
	private String createdDate="";
	private String releaseDate="";
	private String column="";
	private String subColumn="";
	private String content;
	private int[] releaseId;
	private List<String> list = new ArrayList<String>();
//	private List<XzfyInfo> list1 = new ArrayList<XzfyInfo>();
//	private List<XzfyInfo> list2 = new ArrayList<XzfyInfo>();
	private List<List<ArticleInfo>> allList = new ArrayList<List<ArticleInfo>>();
//	private List<List<XzfyInfo>> allList1 = new ArrayList<List<XzfyInfo>>();
	private int p;//主页案件管理
	private String liAnDate;
	private String appName;
	private String admit;
	private String defendant;
	private String columnType="";
	private List<String> permissionList = new ArrayList<String>();
	private List userList;
	
	
	public List getUserList() {
		return userList;
	}
	public void setUserList(List userList) {
		this.userList = userList;
	}
	public List<String> getPermissionList() {
		return permissionList;
	}
	public void setPermissionList(List<String> permissionList) {
		this.permissionList = permissionList;
	}
	public ArticleInfo getArticleInfo() {
		return articleInfo;
	}
	public void setArticleInfo(ArticleInfo articleInfo) {
		this.articleInfo = articleInfo;
	}
	public ArticleService getArticleService() {
		return articleService;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public Integer getpNum() {
		return pNum;
	}
	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public PaginationSupport getPageList() {
		return pageList;
	}
	public void setPageList(PaginationSupport pageList) {
		this.pageList = pageList;
	}
	public List<ArticleInfo> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<ArticleInfo> articleList) {
		this.articleList = articleList;
	}
	public List<Comment> getComments() {
		return commentList;
	}
	public void setComments(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getArticleId() {
		return articleId;
	}
	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int[] getReleaseId() {
		return releaseId;
	}
	public void setReleaseId(int[] releaseId) {
		this.releaseId = releaseId;
	}
	public List<List<ArticleInfo>> getAllList() {
		return allList;
	}
	public List<String> getList() {
		return list;
	}
	public void setList(List<String> list) {
		this.list = list;
	}
	public void setAllList(List<List<ArticleInfo>> allList) {
		this.allList = allList;
	}
	public String getSubColumn() {
		return subColumn;
	}
	public void setSubColumn(String subColumn) {
		this.subColumn = subColumn;
	}
	public int getP() {
		return p;
	}
	public void setP(int p) {
		this.p = p;
	}
	public String getLiAnDate() {
		return liAnDate;
	}
	public void setLiAnDate(String liAnDate) {
		this.liAnDate = liAnDate;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getAdmit() {
		return admit;
	}
	public void setAdmit(String admit) {
		this.admit = admit;
	}
	public String getDefendant() {
		return defendant;
	}
	public void setDefendant(String defendant) {
		this.defendant = defendant;
	}
	public String getColumnType() {
		return columnType;
	}
	public void setColumnType(String columnType) {
		this.columnType = columnType;
	}
	@Override
	public Class<ArticleInfo> getPersistentClass() {
		return ArticleInfo.class;
	}
	public String gotoCreate(){
		return SUCCESS;
	}
	public String saveArticleInfo(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(             
				"_USER_LOGIN_");
		String name = user.getName();
		this.getArticleInfo().setAuthor(name);
		this.getArticleInfo().setAuthorId(user.getId());
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(dt);
		this.getArticleInfo().setCreatedDate(date);          //创建时间
		this.getArticleInfo().setIsTop("0");		
		Blob b = null;
		byte[] byteArray = content.getBytes();
		b= Hibernate.createBlob(byteArray);
		articleInfo.setContent(b);
		this.getArticleInfo().setIsPass("1");
		this.getArticleInfo().setIsRelease("0");
		this.getArticleInfo().setViewCount(0);
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	public String showList(){
		pageList = articleService.getAllListByPage(pNum, pageSize,title,author,createdDate,releaseDate,column);
		articleList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	/* 查看新闻的方法1，每次点击查看，新闻查看次数+1 */
	public String showArticle() throws Exception, SQLException{          
		articleInfo = articleService.getArticleInfoById(articleId);
		Blob b = articleInfo.getContent();
		try {
			content = new String(b.getBytes((long)1, (int)b.length()));
			} catch (SQLException e){
				e.printStackTrace();
			 }
		int viewCount=articleInfo.getViewCount();
		articleInfo.setViewCount(viewCount+1);
		articleService.saveArticleInfo(articleInfo);
		commentList = articleService.getComments(articleId);
		return SUCCESS;
	}
	/* 查看新闻的方法2，新闻查看次数不会+1 */
	public String showArticle1() throws Exception, SQLException{          
		articleInfo = articleService.getArticleInfoById(articleId);
		Blob b = articleInfo.getContent();
		try {
			content = new String(b.getBytes((long)1, (int)b.length()));
			} catch (SQLException e){
				e.printStackTrace();
			 }
		commentList = articleService.getComments(articleId);
		return SUCCESS;
	}

	public List<ArticleInfo> sort(List<ArticleInfo> list){        //置顶的文章
		List<ArticleInfo> list1 = new ArrayList<ArticleInfo>();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getIsTop().equals("1")){
				list1.add(list.get(i));
				//list.remove(i);
			}
		}
		System.out.println(list.size());
		for(int i=0;i<list.size();i++){
			if(list.get(i).getIsTop().equals("0")){
			list1.add(list.get(i));
			}
		}
		return list1;
	}
	public String setTop(){
		articleInfo = articleService.getArticleInfoById(articleId);
		articleInfo.setIsTop("1");
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	public String unSetTop(){
		articleInfo = articleService.getArticleInfoById(articleId);
		articleInfo.setIsTop("0");
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	public String updateArticle() throws Exception, UnsupportedEncodingException, SQLException{
		Blob b = null;
		byte[] byteArray = content.getBytes();
		b= Hibernate.createBlob(byteArray);
		articleInfo.setContent(b);
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	
	public String showUnreleasedList(){
		if(columnType.equals("")){
			pageList = articleService.getPassByPage(pNum, pageSize,title,author,createdDate,"",column);
			articleList = pageList.getItems();
			totalPage = pageList.getTotalPage();
		}else{
			pageList = articleService.getUnreleasedListBySubColumn(pNum, pageSize, title, author, createdDate, columnType);
			articleList = pageList.getItems();
			totalPage = pageList.getTotalPage();
		}
		return SUCCESS;
	}
	public String release(){
		System.out.println(releaseId.length);
		for (int id : releaseId) {
			articleInfo = articleService.getArticleInfoById(id);
			articleInfo.setIsRelease("1");
			Date dt = new Date();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String date = df.format(dt);
			articleInfo.setReleaseDate(date);
			articleService.saveArticleInfo(articleInfo);
		}
		return SUCCESS;
	}
	public String setPass(){
		Blob b = null;
		byte[] byteArray = content.getBytes();
		b= Hibernate.createBlob(byteArray);
		this.getArticleInfo().setContent(b);
		this.getArticleInfo().setIsPass("2");
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	public String setNotPass(){
		Blob b = null;
		byte[] byteArray = content.getBytes();
		b= Hibernate.createBlob(byteArray);
		this.getArticleInfo().setContent(b);
		this.getArticleInfo().setIsPass("0");
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	public String showNotPassList(){
		pageList = articleService.getNotPassByPage(pNum, pageSize,title,author,createdDate,releaseDate,column);
		articleList = pageList.getItems();
		//articleList = sort(tmp);
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	public String showReleasedList(){
		pageList = articleService.getReleaseByPage(pNum, pageSize, title, author, createdDate, releaseDate, column);
		articleList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	public String resubmit(){
		Blob b = null;
		byte[] byteArray = content.getBytes();
		b= Hibernate.createBlob(byteArray);
		this.getArticleInfo().setContent(b);
		this.getArticleInfo().setIsPass("1");
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	public String myUnderReviewList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(             
				"_USER_LOGIN_");
		int id=user.getId();
		pageList = articleService.getMyListByPage(pNum, pageSize, title, author, createdDate, releaseDate, column,id);
		articleList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		return SUCCESS;	
	}
	public String myReleasedList(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(             
				"_USER_LOGIN_");
		int id=user.getId();
		pageList = articleService.getMyReleaseByPage(pNum, pageSize, title, author, createdDate, releaseDate, column,id);
		articleList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	public String revoke(){
		articleInfo = articleService.getArticleInfoById(articleId);
		articleInfo.setIsPass("3");
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	public String saveComment(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(             
				"_USER_LOGIN_");
		String name = user.getName();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(dt);
		this.getComment().setArticleId(articleId);
		this.getComment().setCommenter_id(user.getId());
		this.getComment().setCommenter_name(name);
		this.getComment().setTime(date);
		articleService.saveComment(comment);
		return SUCCESS;
	}
	public String deleteArticle(){
		articleService.deleteArticle(articleId);
		return SUCCESS;
	}
	public String showColumn(){
		list = articleService.getSubColumnByColumn(column);
		//System.out.println(list.size());
		for(int i=0;i<list.size();i++){
			//System.out.println(articleService.getSubColumnList(list.get(i)).size());
			allList.add(articleService.getSubColumnList(list.get(i)));
		}
		if(column.equals("5")){
			User user = new User();
			user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
//			userList=this.recordService.getUserListById(user.getOrg().getId().toString());
		}
		return SUCCESS;
	}
	public String showSubColumn(){
		//System.out.println("gdgdfgdfg:"+column);
		articleList = articleService.getSubColumnList(column);
		return SUCCESS;
	}
	public String subColumnMore(){
		list = articleService.getSubColumnByColumn(column);
		pageList = articleService.getSubColumnListByPage(subColumn, pNum, pageSize);
		articleList = pageList.getItems();
		totalPage = pageList.getTotalPage(); 
		return SUCCESS;
	}
	
	public String subColumnMoreDxal(){
		pageList = articleService.getSubColumnDxal("4", pNum, pageSize);
		articleList = pageList.getItems();
		totalPage = pageList.getTotalPage(); 
		return SUCCESS;
	}	
	
	public String showAjList(){
		return SUCCESS;
	}
	public String ajListIframe1(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
//		String locbm=this.recordService.getOrg().getLocbm();
//		//System.out.println("aaaaaaaaaaaaaaaaaa"+locbm);
//		list1 = ajService.getAllList1(locbm, liAnDate, appName, "", admit, defendant);
//		list2 = ajService.getAllList2(locbm, liAnDate, appName, "", admit, defendant);
//		allList1.add(list1);allList1.add(list2);
		return SUCCESS;
	}
	public String ajListMore(){
		System.out.println("ddddd:"+p);
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
//		String locbm=this.recordService.getOrg().getLocbm();
		if(p==1){
//			pageList = ajService.getList1ByPage(pNum, pageSize, locbm, liAnDate, appName, "", admit, defendant);
		}else{
//			pageList = ajService.getList2ByPage(pNum, pageSize, locbm, liAnDate, appName, "", admit, defendant);
		}
//		list1=pageList.getItems();
		totalPage=pageList.getTotalPage();
		return SUCCESS;
	}
	public String ajListIframe(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
//		String locbm=this.recordService.getOrg().getLocbm();
		System.out.println(locbm);
		if(p==1){
//			pageList = ajService.getList1ByPage(pNum, pageSize, locbm, liAnDate, appName, "", admit, defendant);
		}else{
//			pageList = ajService.getList2ByPage(pNum, pageSize, locbm, liAnDate, appName, "", admit, defendant);
		}
//		list1=pageList.getItems();
		totalPage=pageList.getTotalPage();
		return SUCCESS;
	}
	
	public String articleAreaOnFrontPage(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(
				"_USER_LOGIN_");
		if(user.getReleasePermission()!=null&&!user.getReleasePermission().equals("")){
			String[] str = user.getReleasePermission().split(",");
			for(int i=0;i<str.length;i++){
				if(str[i]!=null&&!str[i].equals(""))
					permissionList.add(str[i]);
			}
		}
		return SUCCESS;
	}
	private int key=0;
	private String isSoft="";
	public String getIsSoft() {
		return isSoft;
	}
	public void setIsSoft(String isSoft) {
		this.isSoft = isSoft;
	}
	public String zlk(){
		
		return SUCCESS;
	}
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	
	/*------------------------------------------------------------------------------*/
	//private List<String> link = new ArrayList<String>();
	private String path;
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String showXzfyTongXun(){   //行政复议通讯，假页面
		String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
		path=webRootPath+"uploadfiles/XzfyTongXun/";
		return SUCCESS;
	}
	public String showDanInfo(){
		return SUCCESS;
	}
	private String userName;
	private String orgName;
	private String locbm;
	private String todate;
	private File upFile = new File("upFile");
	private String isView="0";
	public String getIsView() {
		return isView;
	}
	public void setIsView(String isView) {
		this.isView = isView;
	}
	public File getUpFile() {
		return upFile;
	}
	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
	public String getUpFileFileName() {
		return upFileFileName;
	}
	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}
	private String upFileFileName;  
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getLocbm() {
		return locbm;
	}
	public void setLocbm(String locbm) {
		this.locbm = locbm;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String xinXiBaoSong(){
		user = new User();
		user = (User) ActionContext.getContext().getSession().get(             
				"_USER_LOGIN_");
		userName = user.getName();
//		orgName = this.recordService.getOrg().getName();
		Date dt = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		todate = df.format(dt);
		return SUCCESS;
	}
	public String xinXiBaoCun(){
		if(upFileFileName!=null&&!upFileFileName.equals("")){
			String webRootPath = ApplicationPath.getRootPath().replaceAll("\\\\", "\\\\\\\\");
			String extension = upFileFileName.substring(upFileFileName.lastIndexOf("."));
			String fileName = Calendar.getInstance().getTimeInMillis() + extension;
			String fileFlod = webRootPath + "uploadfiles/xinxibaosong/attachment/";
			File path = new File(fileFlod);
			if(!path.exists()){
				path.mkdirs();
			}
			File outFile = new File(fileFlod + fileName);
			this.articleInfo.setFirstImage("../uploadfiles/xinxibaosong/attachment/"+fileName);
			IOStream stream = new IOStream();
			stream.writeFileStream(upFile, outFile);
		
		}
		articleService.saveArticleInfo(articleInfo);
		return SUCCESS;
	}
	public String xinXiLieBiao(){
		pageList = articleService.getXinxi(pNum, pageSize,orgName,todate,title,userName);
		articleList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	public String benDanWeiLieBiao(){
//		orgName = this.recordService.getOrg().getName();
		pageList = articleService.getBenDanWeiXinxi(pNum, pageSize,orgName);
		articleList = pageList.getItems();
		totalPage = pageList.getTotalPage();
		return SUCCESS;
	}
	public String showXinXi(){
		articleInfo = articleService.getArticleInfoById(articleId);
		return SUCCESS;
	}
}
