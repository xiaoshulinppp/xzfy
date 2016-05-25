package com.taiji.zxfy.zxbz.webwork.action;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.zxfy.zxbz.service.ZxbzService;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.InfoModel;

public class ZxbzDetail extends ProtectedDetailAction {

	private static final long serialVersionUID = 7395714102481709538L;

	private ZxbzService zxbzService;
	private String caseNum;// 案件申请码
	private String message;// 反馈到前台信息
	private File sfzmArchive;// 上传身份证明图片
	private String sfzmArchiveFileName;// 上传图片的原名字
	private List<AppModel> listApp;// 申请人
	private String userId;// 申请人ID
	private String select;// 身份证明类型：0-身份证，1-军官证，2-护照
	private String clmc;// 材料名称
	private String wjh;// 文件号
	private File xzcl;// 上传行政行为材料
	private String xzclFileName;// 上传行政行为材料名称
	private File other1;// 其它上传材料1
	private String other1FileName;// 其它上传材料1文件名字
	private List<ArchiveModel> xzclArchive;// 上传的行政作为文件列表
	private List<ArchiveModel> otherArchiveModels;// 上传的其它材料文件列表
	private String[] buzhengContentType;// 补证内容类型标识
	private File sqwt;// 上传授权委托书
	private String sqwtFileName;// 上传授权委托书材料名称
	private String sqwtArchive1;// 授权委托书材料路径
	private String sqwtArchive2;// 授权委托书材料路径
	private String imgPath;// 身份证明材料路径
	private List<String> xzclName;// 材料名称
	private AppModel sqdlApp;// 授权代理人
	private List<String> otherName;// 其它材料名称
	private String xzclImgId;// 行政行为材料某一材料下的文件ID
	private String otherImgId;// 其它材料某一材料下的文件ID
	public String isManage;// 是否行政不作为
	private File bzwclArchive;// 不作为案件的行政材料申请书
	private String bzwclArchiveFileName;// 不作为案件的行政材料申请书文件名称
	private String bzwclName;// 不作为案件的行政材料申请书材料名称
	private String bzwsqImgPath1;// 不作为案件的行政材料申请书材料路径
	private String bzwsqImgPath2;// 不作为案件的行政材料申请书材料路径
	private File bzwhzclArchive;// 不作为案件行政材料回执书
	private String bzwhzclArchiveFileName;// 不作为案件行政材料回执书文件名称
	private String bzwhzclName;// 不作为案件行政材料回执书名称
	private String bzwhzImgPath1;// 不作为案件的行政材料回执书材料路径
	private String bzwhzImgPath2;// 不作为案件的行政材料回执书材料路径

	/**
	 * 跳转到在线补证页面
	 */
	@SuppressWarnings("unchecked")
	public String loginBuzheng() {
		String hql = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> list = zxbzService.findBySql(hql);
		if (caseNum.equals("")) {
			message = "申请码不能为空！";
			return ERROR;
		} else {
			if (list.size() == 0) {
				message = "申请码不存在！";
				return ERROR;
			} else {
				if (list.get(0).getIsBuZheng().equals("1")) {
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					try {
						Date date1 = df.parse(df.format(new Date()));
						Date date2 = df.parse(list.get(0).getBuzhengTo());
						if (date1.getTime() >= date2.getTime()) {
							message = "您好！补证日期已过！";
							return ERROR;
						} else {
							String bzContentType = list.get(0)
									.getBuzhengContentType();
							String[] type = bzContentType.split("\\|");
							if (type.length == 1) {
								buzhengContentType = type[0].split("\\,");
								if (buzhengContentType[0].equals("2")) {
									return "sfcl";
								}
								if (buzhengContentType[0].equals("3")) {
									return "xzcl";
								}
								if (buzhengContentType[0].equals("4")) {
									return "othercl";
								}
							} else {
								return "sfcl";
							}
						}
					} catch (ParseException e) {
					}
				}
				if (list.get(0).getIsBuZheng().equals("0")) {
					message = "您好！该案件的补正开关处于关闭状态，请与案件承办人联系！";
					return ERROR;
				}
				if (list.get(0).getIsBuZheng().equals("2")
						|| list.get(0).getIsBuZheng().equals("3")) {
					message = "案件已补证！";
					return ERROR;
				}
			}
		}
		return ERROR;
	}

	/**
	 * 跳转到身份证明材料补正页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String sfclPage() {
		/*----------------------------------查找补证人员材料----------------------------------*/
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModel = zxbzService.findBySql(hqlInfo);
		String bzContentType = infoModel.get(0).getBuzhengContentType();
		String[] type = bzContentType.split("\\|");
		List<AppModel> list2 = new ArrayList<AppModel>();
		List<ArchiveModel> sfzmArchive = null;
		imgPath = "";
		if (type.length == 1) {
			buzhengContentType = type[0].split("\\,");
		} else {
			buzhengContentType = type[0].split("\\,");
			String[] app = type[1].split("\\,");
			String hqlAppBz = "from AppModel a where a.appId='";
			String hqlAppDl = "from AppModel a where a.proxyType='0' and a.infoModel.caseNum='"
					+ caseNum + "'";
			List<AppModel> listApp = new ArrayList<AppModel>();
			for (int i = 0; i < app.length; i++) {
				if (app[i].equals("0")) {
					listApp = zxbzService.findBySql(hqlAppDl);
				} else {
					listApp = zxbzService.findBySql(hqlAppBz + app[i]
							+ "' and a.infoModel.caseNum='" + caseNum + "'");
				}
				AppModel appModel = listApp.get(0);
				sfzmArchive = findByUserId(appModel.getId().toString());
				if (sfzmArchive.size() == 0) {
					imgPath += "0" + "," + "0" + ",";
				}
				if (sfzmArchive.size() == 1) {
					imgPath += sfzmArchive.get(0).getFileRelativePath() + ","
							+ "0" + ",";
				}
				if (sfzmArchive.size() == 2) {
					imgPath += sfzmArchive.get(0).getFileRelativePath() + ","
							+ sfzmArchive.get(1).getFileRelativePath() + ",";
				}
				list2.add(appModel);
			}
			setListApp(list2);
		}
		/*--------------------------------授权代理材料------------------------------------------*/
		String hqlApp = "select a from InfoModel i,AppModel a where i=a.infoModel and i.caseNum=?";
		List<AppModel> appModels = this.coreService.find(hqlApp, caseNum);
		for (int i = 0; i < appModels.size(); i++) {
			if (appModels.get(i).getProxyType().equals("0")) {
				sqdlApp = appModels.get(i);
				break;
			}
		}

		String hqlArchiveSqwt = "from ArchiveModel a where a.type='14' and a.fileName like '(补证)%' and a.xzfyId='"
				+ infoModel.get(0).getId() + "'";
		List<ArchiveModel> listArchiveSqwt = zxbzService
				.findBySql(hqlArchiveSqwt);
		if (listArchiveSqwt.size() == 0) {
			sqwtArchive1 = "";
			sqwtArchive2 = "";
		}
		if (listArchiveSqwt.size() == 1) {
			sqwtArchive1 = listArchiveSqwt.get(0).getFileRelativePath();
			sqwtArchive2 = "";
		}
		if (listArchiveSqwt.size() == 2) {
			sqwtArchive1 = listArchiveSqwt.get(0).getFileRelativePath();
			sqwtArchive2 = listArchiveSqwt.get(1).getFileRelativePath();
		}
		return SUCCESS;
	}

	/**
	 * 保存身份证明材料
	 */
	public String sfzmSavaRun() {
		AppModel appModel = (AppModel) this.coreService.loadEntityObjectById(
				AppModel.class, Integer.parseInt(userId));
		if (!(select.equals("")) && null != sfzmArchive
				&& null != sfzmArchiveFileName) {
			appModel.setSfzmType(select);
			this.coreService.update(appModel);
			try {
				if (appModel.getProxyType() != null
						&& appModel.getProxyType().equals("0")) {
					zxbzService.uploadFile(sfzmArchive, sfzmArchiveFileName,
							userId, appModel.getAppName(), appModel
									.getInfoModel().getId(), "15", null, null);
				} else {
					zxbzService.uploadFile(sfzmArchive, sfzmArchiveFileName,
							userId, appModel.getAppName(), appModel
									.getInfoModel().getId(), "17", null, null);
				}
			} catch (Exception e) {
			}
		}
		return SUCCESS;
	}

	/**
	 * 删除身份证明
	 * 
	 * @return
	 */
	public String sfzmDelete() {
		List<ArchiveModel> list = findByUserId(userId);
		for (int i = 0; i < list.size(); i++) {
			zxbzService.deleteFileOnDisk(list.get(i).getFileAbsolutePath());
			this.coreService.remove(list.get(i));
		}
		AppModel appModel = (AppModel) this.coreService.loadEntityObjectById(
				AppModel.class, Integer.parseInt(userId));
		appModel.setSfzmType("");
		this.coreService.update(appModel);
		return SUCCESS;
	}

	/**
	 * 通过申请人id查找对应的身份明材料
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ArchiveModel> findByUserId(String id) {
		String hqlArchive = "from ArchiveModel a where a.uploadUserId=" + id;
		List<ArchiveModel> listArchiveModels = zxbzService
				.findBySql(hqlArchive);
		for (int i = 0; i < listArchiveModels.size(); i++) {
			if (listArchiveModels.get(i).getFileName().startsWith("(补证)")) {
			} else {
				listArchiveModels.remove(i);
			}
		}
		return listArchiveModels;
	}

	/**
	 * 保存授权委托书材料
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String sqwtSave() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> listInfoModels = zxbzService.findBySql(hqlInfo);
		if (null != sqwt && null != sqwtFileName) {
			try {
				zxbzService.uploadFile(sqwt, sqwtFileName, null, null,
						listInfoModels.get(0).getId(), "14", null, null);
			} catch (Exception e) {
			}
		}
		return SUCCESS;
	}

	/**
	 * 删除授权委托书材料
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String sqclDelete() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModel = zxbzService.findBySql(hqlInfo);
		String hqlArchiveSqwt = "from ArchiveModel a where a.type='14' and a.fileName like '(补证)%' and a.xzfyId='"
				+ infoModel.get(0).getId() + "'";
		List<ArchiveModel> list = zxbzService.findBySql(hqlArchiveSqwt);
		for (int i = 0; i < list.size(); i++) {
			zxbzService.deleteFileOnDisk(list.get(i).getFileAbsolutePath());
			this.coreService.remove(list.get(i));
		}
		return SUCCESS;
	}

	/**
	 * 跳转到行政材料补正页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String xzclPage() {
		/*------------------------查找行政作为材料--------------------------------------*/
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModel = zxbzService.findBySql(hqlInfo);
		String bzContentType = infoModel.get(0).getBuzhengContentType();
		String[] type = bzContentType.split("\\|");
		buzhengContentType = type[0].split("\\,");
		String hqlArchive = "from ArchiveModel a where a.type='16' and a.fileName like '(补证)%' and a.xzfyId='"
				+ infoModel.get(0).getId() + "' order by a.id";
		xzclArchive = zxbzService.findBySql(hqlArchive);
		String hqlArch = "select a.clName from ArchiveModel a where a.type='16' and a.fileName like '(补证)%' and a.xzfyId='"
				+ infoModel.get(0).getId()
				+ "' group by a.clName order by a.clName";
		xzclName = zxbzService.findBySql(hqlArch);
		isManage = infoModel.get(0).getIsManage();
		/*-------------------------查找行政不作为申请材料-------------------------------------*/
		String hqlBzwSq = "from ArchiveModel a where a.type='18' and a.fileName like '(补证)%' and a.xzfyId='"
				+ infoModel.get(0).getId() + "'";
		List<ArchiveModel> bzwsqArchive = zxbzService.findBySql(hqlBzwSq);
		if (bzwsqArchive != null) {
			if (bzwsqArchive.size() == 0) {
				bzwsqImgPath1 = "";
				bzwsqImgPath2 = "";
			}
			if (bzwsqArchive.size() == 1) {
				bzwsqImgPath1 = bzwsqArchive.get(0).getFileRelativePath();
				bzwsqImgPath2 = "";
			}
			if (bzwsqArchive.size() == 2) {
				bzwsqImgPath1 = bzwsqArchive.get(0).getFileRelativePath();
				bzwsqImgPath2 = bzwsqArchive.get(1).getFileRelativePath();
			}
			if (bzwsqArchive.size() != 0) {
				bzwclName = bzwsqArchive.get(0).getClName();
			}
		}
		/*------------------------查找行政不作为回执书材料------------------------------------------------*/
		String hqlBzwHz = "from ArchiveModel a where a.type='19' and a.fileName like '(补证)%' and a.xzfyId='"
				+ infoModel.get(0).getId() + "'";
		List<ArchiveModel> bzwhzArchive = zxbzService.findBySql(hqlBzwHz);
		if (bzwhzArchive != null) {
			if (bzwhzArchive.size() == 0) {
				bzwhzImgPath1 = "";
				bzwhzImgPath2 = "";
			}
			if (bzwhzArchive.size() == 1) {
				bzwhzImgPath1 = bzwhzArchive.get(0).getFileRelativePath();
				bzwhzImgPath2 = "";
			}
			if (bzwhzArchive.size() == 2) {
				bzwhzImgPath1 = bzwhzArchive.get(0).getFileRelativePath();
				bzwhzImgPath2 = bzwhzArchive.get(1).getFileRelativePath();
			}
			if (bzwhzArchive.size() != 0) {
				bzwhzclName = bzwhzArchive.get(0).getClName();
			}
		}
		return SUCCESS;
	}

	/**
	 * 保存行政作为材料
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String xzclSave() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> list = zxbzService.findBySql(hqlInfo);
		if (null != xzcl && null != xzclFileName) {
			try {
				zxbzService.uploadFile(xzcl, xzclFileName, null, null, list
						.get(0).getId(), "16", wjh, clmc);
			} catch (Exception e) {
			}
		}
		return SUCCESS;
	}

	/**
	 * 删除行政行为材料中某一材料下的某一个文件
	 * 
	 * @return
	 */
	public String xzclImgDelete() {
		ArchiveModel archiveModel = (ArchiveModel) this.coreService
				.loadEntityObjectById(ArchiveModel.class, Integer.parseInt(xzclImgId));
		zxbzService.deleteFileOnDisk(archiveModel.getFileAbsolutePath());
		this.coreService.remove(archiveModel);
		return SUCCESS;
	}

	/**
	 * 删除行政材料中的某一材料
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String xzclDelete() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModels = zxbzService.findBySql(hqlInfo);
		String hqlArchive = "from ArchiveModel a where a.type='16' and a.fileName like '(补证)%' and a.clName='"
				+ clmc + "' and a.xzfyId='" + infoModels.get(0).getId() + "'";
		List<ArchiveModel> archiveModels = zxbzService.findBySql(hqlArchive);
		for (int i = 0; i < archiveModels.size(); i++) {
			zxbzService.deleteFileOnDisk(archiveModels.get(i)
					.getFileAbsolutePath());
			this.coreService.remove(archiveModels.get(i));
		}
		return SUCCESS;
	}

	/**
	 * 保存不作为行政材料申请书
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String bzwArchiveSave() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModels = zxbzService.findBySql(hqlInfo);
		if (null != bzwclArchive && null != bzwclArchiveFileName) {
			try {
				zxbzService.uploadFile(bzwclArchive, bzwclArchiveFileName,
						null, null, infoModels.get(0).getId(), "18", null,
						bzwclName);
			} catch (Exception e) {
			}
		}
		return SUCCESS;
	}

	/**
	 * 删除上传的行政不作为申请材料
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String bzwArchiveDelete() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModels = zxbzService.findBySql(hqlInfo);
		String hqlArchive = "from ArchiveModel a where a.type='18' and a.fileName like '(补证)%'  and a.xzfyId='"
				+ infoModels.get(0).getId() + "'";
		List<ArchiveModel> list = zxbzService.findBySql(hqlArchive);
		for (int i = 0; i < list.size(); i++) {
			zxbzService.deleteFileOnDisk(list.get(i).getFileAbsolutePath());
			this.coreService.remove(list.get(i));
		}
		return SUCCESS;
	}

	/**
	 * 行政不作为案件回执书材料保存
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String bzwhzArchiveSave() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModels = zxbzService.findBySql(hqlInfo);
		if (null != bzwhzclArchive && null != bzwhzclArchiveFileName) {
			try {
				zxbzService.uploadFile(bzwhzclArchive, bzwhzclArchiveFileName,
						null, null, infoModels.get(0).getId(), "19", null,
						bzwhzclName);
			} catch (Exception e) {
			}
		}
		return SUCCESS;
	}

	/**
	 * 删除不作为行政材料回执书
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String bzwhzArchiveDlete() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModels = zxbzService.findBySql(hqlInfo);
		String hqlArchive = "from ArchiveModel a where a.type='19' and a.fileName like '(补证)%'  and a.xzfyId='"
				+ infoModels.get(0).getId() + "'";
		List<ArchiveModel> list = zxbzService.findBySql(hqlArchive);
		for (int i = 0; i < list.size(); i++) {
			zxbzService.deleteFileOnDisk(list.get(i).getFileAbsolutePath());
			this.coreService.remove(list.get(i));
		}
		return SUCCESS;
	}

	/**
	 * 跳转到其它材料补正页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String otherclPage() {
		/*--------------------------------其它材料--------------------------------------------*/
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModel = zxbzService.findBySql(hqlInfo);
		String bzContentType = infoModel.get(0).getBuzhengContentType();
		String[] type = bzContentType.split("\\|");
		buzhengContentType = type[0].split("\\,");
		String hqlArchiveOther = "from ArchiveModel a where a.type='3' and a.fileName like '(补证)%' and a.xzfyId='"
				+ infoModel.get(0).getId() + "' order by a.id";
		otherArchiveModels = zxbzService.findBySql(hqlArchiveOther);
		String hqlOther = "select a.clName from ArchiveModel a where a.type='3' and a.fileName like '(补证)%' and a.xzfyId='"
				+ infoModel.get(0).getId()
				+ "' group by a.clName order by a.clName";
		otherName = zxbzService.findBySql(hqlOther);
		return SUCCESS;
	}

	/**
	 * 保存其它材料
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String otherSave() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> list = zxbzService.findBySql(hqlInfo);
		if (null != other1 && null != other1FileName) {
			try {
				zxbzService.uploadFile(other1, other1FileName, null, null, list
						.get(0).getId(), "3", wjh, clmc);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return SUCCESS;
	}

	/**
	 * 删除其它材料中某一材料下的某一文件
	 * 
	 * @return
	 */
	public String otherImgDelete() {
		ArchiveModel archiveModel = (ArchiveModel) this.coreService
				.loadEntityObjectById(ArchiveModel.class, Integer.parseInt(otherImgId));
		zxbzService.deleteFileOnDisk(archiveModel.getFileAbsolutePath());
		this.coreService.remove(archiveModel);
		return SUCCESS;
	}

	/**
	 * 删除其它材料中的某一材料
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String otherClDelete() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModels = zxbzService.findBySql(hqlInfo);
		String hqlArchive = "from ArchiveModel a where a.type='3' and a.fileName like '(补证)%' and a.clName='"
				+ clmc + "' and a.xzfyId='" + infoModels.get(0).getId() + "'";
		List<ArchiveModel> archiveModels = zxbzService.findBySql(hqlArchive);
		for (int i = 0; i < archiveModels.size(); i++) {
			zxbzService.deleteFileOnDisk(archiveModels.get(i)
					.getFileAbsolutePath());
			this.coreService.remove(archiveModels.get(i));
		}
		return SUCCESS;
	}

	/**
	 * 跳转到主页面
	 * 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String mainPage() {
		String hqlInfo = "from InfoModel i where i.caseNum='" + caseNum + "'";
		List<InfoModel> infoModels = zxbzService.findBySql(hqlInfo);
		InfoModel infoModel = infoModels.get(0);
		infoModel.setIsBuZheng("2");
		this.coreService.update(infoModel);
		return SUCCESS;
	}

	@SuppressWarnings("rawtypes")
	public Class getPersistentClass() {
		return null;
	}

	public String getCaseNum() {
		return caseNum;
	}

	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}

	public ZxbzService getZxbzService() {
		return zxbzService;
	}

	public void setZxbzService(ZxbzService zxbzService) {
		this.zxbzService = zxbzService;
	}

	public List<AppModel> getListApp() {
		return listApp;
	}

	public void setListApp(List<AppModel> listApp) {
		this.listApp = listApp;
	}

	public File getSfzmArchive() {
		return sfzmArchive;
	}

	public void setSfzmArchive(File sfzmArchive) {
		this.sfzmArchive = sfzmArchive;
	}

	public String getSfzmArchiveFileName() {
		return sfzmArchiveFileName;
	}

	public void setSfzmArchiveFileName(String sfzmArchiveFileName) {
		this.sfzmArchiveFileName = sfzmArchiveFileName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public String getClmc() {
		return clmc;
	}

	public void setClmc(String clmc) {
		this.clmc = clmc;
	}

	public String getWjh() {
		return wjh;
	}

	public void setWjh(String wjh) {
		this.wjh = wjh;
	}

	public File getXzcl() {
		return xzcl;
	}

	public void setXzcl(File xzcl) {
		this.xzcl = xzcl;
	}

	public String getXzclFileName() {
		return xzclFileName;
	}

	public void setXzclFileName(String xzclFileName) {
		this.xzclFileName = xzclFileName;
	}

	public File getOther1() {
		return other1;
	}

	public void setOther1(File other1) {
		this.other1 = other1;
	}

	public String getOther1FileName() {
		return other1FileName;
	}

	public void setOther1FileName(String other1FileName) {
		this.other1FileName = other1FileName;
	}

	public List<ArchiveModel> getXzclArchive() {
		return xzclArchive;
	}

	public void setXzclArchive(List<ArchiveModel> xzclArchive) {
		this.xzclArchive = xzclArchive;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<ArchiveModel> getOtherArchiveModels() {
		return otherArchiveModels;
	}

	public void setOtherArchiveModels(List<ArchiveModel> otherArchiveModels) {
		this.otherArchiveModels = otherArchiveModels;
	}

	public String[] getBuzhengContentType() {
		return buzhengContentType;
	}

	public void setBuzhengContentType(String[] buzhengContentType) {
		this.buzhengContentType = buzhengContentType;
	}

	public File getSqwt() {
		return sqwt;
	}

	public void setSqwt(File sqwt) {
		this.sqwt = sqwt;
	}

	public String getSqwtFileName() {
		return sqwtFileName;
	}

	public void setSqwtFileName(String sqwtFileName) {
		this.sqwtFileName = sqwtFileName;
	}

	public String getSqwtArchive1() {
		return sqwtArchive1;
	}

	public void setSqwtArchive1(String sqwtArchive1) {
		this.sqwtArchive1 = sqwtArchive1;
	}

	public String getSqwtArchive2() {
		return sqwtArchive2;
	}

	public void setSqwtArchive2(String sqwtArchive2) {
		this.sqwtArchive2 = sqwtArchive2;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public List<String> getXzclName() {
		return xzclName;
	}

	public void setXzclName(List<String> xzclName) {
		this.xzclName = xzclName;
	}

	public AppModel getSqdlApp() {
		return sqdlApp;
	}

	public void setSqdlApp(AppModel sqdlApp) {
		this.sqdlApp = sqdlApp;
	}

	public List<String> getOtherName() {
		return otherName;
	}

	public void setOtherName(List<String> otherName) {
		this.otherName = otherName;
	}

	public String getXzclImgId() {
		return xzclImgId;
	}

	public void setXzclImgId(String xzclImgId) {
		this.xzclImgId = xzclImgId;
	}

	public String getOtherImgId() {
		return otherImgId;
	}

	public void setOtherImgId(String otherImgId) {
		this.otherImgId = otherImgId;
	}

	public String getIsManage() {
		return isManage;
	}

	public void setIsManage(String isManage) {
		this.isManage = isManage;
	}

	public File getBzwclArchive() {
		return bzwclArchive;
	}

	public void setBzwclArchive(File bzwclArchive) {
		this.bzwclArchive = bzwclArchive;
	}

	public String getBzwclArchiveFileName() {
		return bzwclArchiveFileName;
	}

	public void setBzwclArchiveFileName(String bzwclArchiveFileName) {
		this.bzwclArchiveFileName = bzwclArchiveFileName;
	}

	public String getBzwclName() {
		return bzwclName;
	}

	public void setBzwclName(String bzwclName) {
		this.bzwclName = bzwclName;
	}

	public String getBzwsqImgPath1() {
		return bzwsqImgPath1;
	}

	public void setBzwsqImgPath1(String bzwsqImgPath1) {
		this.bzwsqImgPath1 = bzwsqImgPath1;
	}

	public String getBzwsqImgPath2() {
		return bzwsqImgPath2;
	}

	public void setBzwsqImgPath2(String bzwsqImgPath2) {
		this.bzwsqImgPath2 = bzwsqImgPath2;
	}

	public File getBzwhzclArchive() {
		return bzwhzclArchive;
	}

	public void setBzwhzclArchive(File bzwhzclArchive) {
		this.bzwhzclArchive = bzwhzclArchive;
	}

	public String getBzwhzclArchiveFileName() {
		return bzwhzclArchiveFileName;
	}

	public void setBzwhzclArchiveFileName(String bzwhzclArchiveFileName) {
		this.bzwhzclArchiveFileName = bzwhzclArchiveFileName;
	}

	public String getBzwhzclName() {
		return bzwhzclName;
	}

	public void setBzwhzclName(String bzwhzclName) {
		this.bzwhzclName = bzwhzclName;
	}

	public String getBzwhzImgPath1() {
		return bzwhzImgPath1;
	}

	public void setBzwhzImgPath1(String bzwhzImgPath1) {
		this.bzwhzImgPath1 = bzwhzImgPath1;
	}

	public String getBzwhzImgPath2() {
		return bzwhzImgPath2;
	}

	public void setBzwhzImgPath2(String bzwhzImgPath2) {
		this.bzwhzImgPath2 = bzwhzImgPath2;
	}
}
