package com.taiji.website.service.impl;

import java.util.List;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.PaginationSupport;
import com.taiji.website.domain.ArticleInfo;
import com.taiji.website.domain.Comment;
import com.taiji.website.service.ArticleService;

public class ArticleServiceImpl extends CoreServiceImpl implements ArticleService {

	@Override
	public ArticleInfo getArticleInfoById(Integer id) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.id = "+id;
		List<ArticleInfo> list = super.find(HQL);
		ArticleInfo articleInfo;
		if(list.isEmpty()){
			articleInfo = new ArticleInfo();
		}else{
			articleInfo = list.get(0);
		}
		return articleInfo;
		
	}

	@Override
	public PaginationSupport getArticleInfoByPage(int pNum, int pageSize,
			String colunm) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.colunm = '"+colunm+"' order by articleInfo.id desc";
		return super.find(HQL,pNum,pageSize);	
	}

	@Override
	public void saveArticleInfo(ArticleInfo articleInfo) {
		super.saveOrUpdate(articleInfo);
		
	}

	@Override
	public List<ArticleInfo> getArticleInfoList(String colunm) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.colunm = '"+colunm+"' order by articleInfo.id desc";
		return super.find(HQL);
	}

	@Override
	public List<ArticleInfo> getAllList() {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where 1 = 1 order by articleInfo.id desc";
		return super.find(HQL);
	}

	@Override
	public PaginationSupport getAllListByPage(int pNum, int pageSize
			,String title,String author,String createdDate,String releaseDate,String column) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.isPass = '1' ";
		if(title!=null&&!title.equals("")){HQL+="and articleInfo.title = '"+title+"' ";}
		if(author!=null&&!author.equals("")){HQL+="and articleInfo.author = '"+author+"' ";}
		if(createdDate!=null&&!createdDate.equals("")){HQL+="and articleInfo.createdDate = '"+createdDate+"' ";}
		if(releaseDate!=null&&!releaseDate.equals("")){HQL+="and articleInfo.releaseDate = '"+releaseDate+"' ";}
		if(column!=null&&!column.equals("")){HQL+="and articleInfo.column = '"+column+"' ";}
		HQL+="order by articleInfo.id desc";
		return super.find(HQL,pNum,pageSize);
	}

	@Override
	public PaginationSupport getNotPassByPage(int pNum, int pageSize,
			String title, String author, String createdDate, String releaseDate,
			String column) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.isPass not in ('1','2') ";
		if(title!=null&&!title.equals("")){HQL+="and articleInfo.title like '%"+title+"%' ";}
		if(author!=null&&!author.equals("")){HQL+="and articleInfo.author = '"+author+"' ";}
		if(createdDate!=null&&!createdDate.equals("")){HQL+="and articleInfo.createdDate = '"+createdDate+"' ";}
		if(releaseDate!=null&&!releaseDate.equals("")){HQL+="and articleInfo.releaseDate = '"+releaseDate+"' ";}
		if(column!=null&&!column.equals("")){HQL+="and articleInfo.column = '"+column+"' ";}
		HQL+="order by articleInfo.id desc";
		return super.find(HQL,pNum,pageSize);
	}

	@Override
	public PaginationSupport getPassByPage(int pNum, int pageSize,
			String title, String author, String createdDate, String releaseDate,
			String column) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.isRelease = '0' ";
		if(title!=null&&!title.equals("")){HQL+="and articleInfo.title like '%"+title+"%' ";}
		if(author!=null&&!author.equals("")){HQL+="and articleInfo.author = '"+author+"' ";}
		if(createdDate!=null&&!createdDate.equals("")){HQL+="and articleInfo.createdDate = '"+createdDate+"' ";}
		if(releaseDate!=null&&!releaseDate.equals("")){HQL+="and articleInfo.releaseDate = '"+releaseDate+"' ";}
		if(column!=null&&!column.equals("")){HQL+="and articleInfo.column = '"+column+"' ";}
		HQL+="order by articleInfo.id desc";
		return super.find(HQL,pNum,pageSize);
	}
	public PaginationSupport getReleaseByPage(int pNum, int pageSize,
			String title, String author, String createdDate, String releaseDate,
			String column) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.isRelease = '1' ";
		if(title!=null&&!title.equals("")){HQL+="and articleInfo.title like '%"+title+"%' ";}
		if(author!=null&&!author.equals("")){HQL+="and articleInfo.author = '"+author+"' ";}
		if(createdDate!=null&&!createdDate.equals("")){HQL+="and articleInfo.createdDate = '"+createdDate+"' ";}
		if(releaseDate!=null&&!releaseDate.equals("")){HQL+="and articleInfo.releaseDate like '"+releaseDate+"%' ";}
		if(column!=null&&!column.equals("")){HQL+="and articleInfo.column = '"+column+"' ";}
		HQL+="order by articleInfo.isTop desc,to_date(articleInfo.releaseDate,'yyyy-MM-dd-hh24-MI-ss') desc";
		return super.find(HQL,pNum,pageSize);
	}

	@Override
	public PaginationSupport getMyListByPage(int pNum, int pageSize,
			String title, String author, String createdDate, String releaseDate,
			String column,int id) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.isPass in ('1','2') and articleInfo.isRelease not in ('1') and articleInfo.authorId = "+id+" ";
		if(title!=null&&!title.equals("")){HQL+="and articleInfo.title = '"+title+"' ";}
		if(author!=null&&!author.equals("")){HQL+="and articleInfo.author = '"+author+"' ";}
		if(createdDate!=null&&!createdDate.equals("")){HQL+="and articleInfo.createdDate = '"+createdDate+"' ";}
		if(releaseDate!=null&&!releaseDate.equals("")){HQL+="and articleInfo.releaseDate = '"+releaseDate+"' ";}
		if(column!=null&&!column.equals("")){HQL+="and articleInfo.column = '"+column+"' ";}
		HQL+="order by articleInfo.id desc";
		return super.find(HQL,pNum,pageSize);
	}

	@Override
	public PaginationSupport getMyReleaseByPage(int pNum, int pageSize,
			String title, String author, String createdDate, String releaseDate,
			String column,int id) {
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.isRelease = '1' and articleInfo.authorId = "+id+" ";
		if(title!=null&&!title.equals("")){HQL+="and articleInfo.title = '"+title+"' ";}
		if(author!=null&&!author.equals("")){HQL+="and articleInfo.author = '"+author+"' ";}
		if(createdDate!=null&&!createdDate.equals("")){HQL+="and articleInfo.createdDate = '"+createdDate+"' ";}
		if(releaseDate!=null&&!releaseDate.equals("")){HQL+="and articleInfo.releaseDate = '"+releaseDate+"' ";}
		if(column!=null&&!column.equals("")){HQL+="and articleInfo.column = '"+column+"' ";}
		HQL+="order by articleInfo.isTop desc,to_date(articleInfo.releaseDate,'yyyy-MM-dd-hh24-MI-ss') desc";
		return super.find(HQL,pNum,pageSize);
	}

	@Override
	public List<Comment> getComments(int id) {
		String HQL="";
		HQL+=" from Comment c where c.articleId = "+id;
		HQL+=" order by c.id desc";
		return super.find(HQL);
	}

	@Override
	public void saveComment(Comment comment) {
		super.save(comment);
		
	}

	@Override
	public void deleteArticle(int id) {
		String HQL="";
		HQL+="delete from ArticleInfo t where t.id = "+id;
		super.deleteAll(HQL);
	}

	@Override
	public List<String> getSubColumnByColumn(String column) {
		String HQL="";
		HQL+="select distinct subColumn from ArticleInfo a where a.column = '"+column+"' order by a.subColumn";
		return super.find(HQL);
	}

	@Override
	public List<ArticleInfo> getSubColumnList(String subColumn) {
		String HQL="";
		HQL+="from ArticleInfo a where a.subColumn = '"+subColumn+"' and a.isRelease = '1' and rownum<11";
		HQL+="order by a.isTop desc,to_date(a.releaseDate,'yyyy-MM-dd-hh24-MI-ss') desc";
		return super.find(HQL);
	}

	@Override
	public PaginationSupport getSubColumnListByPage(String subColumn, int pNum,
			int pageSize) {
		String HQL="";
		HQL+="from ArticleInfo a where a.subColumn = '"+subColumn+"' and a.isRelease = '1'";
		HQL+="order by a.isTop desc,to_date(a.releaseDate,'yyyy-MM-dd-hh24-MI-ss') desc";
		return super.find(HQL, pNum, pageSize);
	}
	
	
	@Override
	public PaginationSupport getSubColumnDxal(String subColumn, int pNum,
			int pageSize) {
		String HQL="";
		HQL+="from ArticleInfo a where a.column = '4' and a.isRelease = '1'";
		HQL+="order by a.isTop desc,to_date(a.releaseDate,'yyyy-MM-dd-hh24-MI-ss') desc";
		return super.find(HQL, pNum, pageSize);
	}	
	
	public PaginationSupport getUnreleasedListBySubColumn(int pNum, int pageSize,
			String title, String author, String createdDate,String columnType){
		String HQL="";
		HQL+="from ArticleInfo articleInfo where articleInfo.isRelease = '0' ";
		if(title!=null&&!title.equals("")){HQL+="and articleInfo.title = '"+title+"' ";}
		if(author!=null&&!author.equals("")){HQL+="and articleInfo.author = '"+author+"' ";}
		if(createdDate!=null&&!createdDate.equals("")){HQL+="and articleInfo.createdDate = '"+createdDate+"' ";}
		if(columnType!=null&&!columnType.equals("")){HQL+="and articleInfo.subColumn = '"+columnType+"' ";}
		HQL+="order by articleInfo.id desc";
		return super.find(HQL,pNum,pageSize);
		
	}

	@Override
	public PaginationSupport getBenDanWeiXinxi(int pNum, int pageSize,
			String locbm) {
		String HQL="";
		HQL+=" from ArticleInfo t where t.resource like '%"+locbm+"%' and t.column is null order by id desc";
		return super.find(HQL, pNum,pageSize);
	}

	@Override
	public PaginationSupport getXinxi(int pNum, int pageSize,String orgName,String todate,String title,String userName) {
		String HQL="";
		HQL+=" from ArticleInfo t where t.column is null";
		if(orgName!=null&&!orgName.equals("")){HQL+=" and t.resource like '%"+orgName+"%'";}
		if(todate!=null&&!todate.equals("")){HQL+=" and t.createdDate = '"+todate+"'";}
		if(title!=null&&!title.equals("")){HQL+=" and t.title like '%"+title+"%'";}
		if(userName!=null&&!userName.equals("")){HQL+=" and t.author like '%"+userName+"%'";}
		HQL+=" order by id desc";
		return super.find(HQL, pNum,pageSize);
	}

}
