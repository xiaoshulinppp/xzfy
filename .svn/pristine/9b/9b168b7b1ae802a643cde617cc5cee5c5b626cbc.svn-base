package com.taiji.website.service;

import java.util.List;

import com.taiji.core.service.ICoreService;
import com.taiji.core.util.PaginationSupport;
import com.taiji.website.domain.ArticleInfo;
import com.taiji.website.domain.Comment;

public interface ArticleService extends ICoreService {
	public void saveArticleInfo(ArticleInfo articleInfo);
	public ArticleInfo getArticleInfoById(Integer id);
	public PaginationSupport getAllListByPage(int pNum,int pageSize,String title,String author,String createdDate,String releaseDate,String column);
	public List<ArticleInfo> getAllList();
	public PaginationSupport getArticleInfoByPage(int pNum,int pageSize,String colunm);
	public List<ArticleInfo> getArticleInfoList(String colunm);
	public PaginationSupport getPassByPage(int pNum,int pageSize,String title,String author,String createdDate,String releaseDate,String column);
	public PaginationSupport getNotPassByPage(int pNum,int pageSize,String title,String author,String createdDate,String releaseDate,String column);
	public PaginationSupport getReleaseByPage(int pNum, int pageSize,
			String title, String author, String createdDate, String releaseDate,
			String column);
	public PaginationSupport getMyReleaseByPage(int pNum, int pageSize,    //根据当前登陆用户的id查询
			String title, String author, String createdDate, String releaseDate,
			String column,int id);
	public PaginationSupport getMyListByPage(int pNum, int pageSize,    //根据当前登陆用户的id查询
			String title, String author, String createdDate, String releaseDate,
			String column,int id);
	public List<Comment> getComments(int id);
	public void saveComment(Comment comment);
	public void deleteArticle(int id);
	public List<String> getSubColumnByColumn(String column);
	
	public List<ArticleInfo> getSubColumnList(String subColumn);
	public PaginationSupport getSubColumnListByPage(String subColumn,int pNum,int pageSize);
	public PaginationSupport getSubColumnDxal(String subColumn,int pNum,int pageSize);
	public PaginationSupport getUnreleasedListBySubColumn(int pNum, int pageSize,
			String title, String author, String createdDate,String columnType);
	public PaginationSupport getXinxi(int pNum,int pageSize,String orgName,String todate,String title,String userName);
	public PaginationSupport getBenDanWeiXinxi(int pNum,int pageSize,String locbm);
}
