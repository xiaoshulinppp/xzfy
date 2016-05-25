package com.taiji.zxfy.zxyj.webwork.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.taiji.core.webwork.action.ProtectedDetailAction;
import com.taiji.zxfy.zxsq.domain.AppLogModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.InfoModel;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxyj.service.ZxyjService;

/**
 * 
 * @author zy
 * 
 */
public class ZxyjDetail extends ProtectedDetailAction {

	private static final long serialVersionUID = 1772413921890881786L;
	private String contentDisposition;
	private String downloadName;
	private InputStream docStream;
	private InfoModel infoModel;
	private AppModel appModel;
	private String appAdviceType;
	private String id; // 行政复议id
	private String caseNum;
	private Integer entityId;
	private File other1;// 意见证据材料1
	private String other1FileName;
	private File other2;// 意见证据材料2
	private String other2FileName;
	private File other3;// 意见证据材料3
	private String other3FileName;
	private File other4;// 意见证据材料4
	private String other4FileName;
	private File other5;// 意见证据材料5
	private String other5FileName;
	private ZxyjService zxyjService;

	/**
	 * 文件下载
	 * 
	 * @return
	 */
	public String downloadFile() throws Exception {
		Integer eid = this.getEntityId();
		ArchiveModel appFile = (ArchiveModel) this.coreService
				.loadEntityObjectById(ArchiveModel.class, eid);
		contentDisposition = "filename="
				+ new String(appFile.getFileName().getBytes(), "ISO-8859-1");
		downloadName = appFile.getFileAnotherName();

		/** **********文件同步************* */
		/*
		 * String pathAndFile =
		 * ApplicationPath.getRootPath().replace("\\",File.separator) +
		 * appFile.getFileRelativePath() + File.separator
		 * +appFile.getFileAnotherName(); String path =
		 * ApplicationPath.getRootPath().replace("\\", File.separator)
		 * +appFile.getFileRelativePath();
		 * FileUtil.copyFile(pathAndFile,path);// 两台服务器之间同步文件
		 */
		/** **********文件同步************* */

		docStream = new FileInputStream(
		/* ApplicationPath.getRootPath().replace("\\", File.separator) + */
		appFile.getFileAbsolutePath().replace("\\", File.separator)
		/* + File.separator + appFile.getFileAnotherName() */
		);
		// 记录文件下载信息
		Date nowdate = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String hql = "from AppLogModel a where a.archiveId='" + appFile.getId()+"'";
		List<AppLogModel> appLogModels = coreService.find(hql);
		if (appLogModels.size() == 0) {
			AppLogModel appLogModel = new AppLogModel();
			appLogModel.setArchiveId(appFile.getId().toString());
			appLogModel.setArchiveType(getValues(appFile.getType()));
			appLogModel.setArchiveFileName(appFile.getFileName());
			appLogModel.setDownloadTime(df.format(nowdate));
			appLogModel.setXzfyId(appFile.getXzfyId());
			this.coreService.save(appLogModel);
		} else {
			appLogModels.get(0).setDownloadTime(df.format(nowdate));
			this.coreService.update(appLogModels.get(0));
		}

		return SUCCESS;
	}

	public String getValues(String keys) {
		String name = "";
		int a = 0;
		try {
			a = Integer.parseInt(keys);
		} catch (Exception e) {

		}
		switch (a) {
		case 1:
			name = "申请书";
			break;
		case 2:
			name = "收件登记材料";
			break;
		case 3:
			name = "申请人提交的其他材料";
			break;
		case 4:
			name = "申请人补正材料";
			break;
		case 5:
			name = "阅卷笔录、阅卷意见及材料";
			break;
		case 6:
			name = "被申请人答复书";
			break;
		case 7:
			name = "被申请人证据材料";
			break;
		case 8:
			name = "被申请人补充材料";
			break;
		case 9:
			name = "第三人有关材料";
			break;
		case 10:
			name = "复议机构制作获取的材料";
			break;
		case 11:
			name = "正卷其他材料";
			break;
		case 12:
			name = "副卷材料";
			break;
		case 13:
			name = "结案文书";
			break;
		case 14:
			name = "授权委托书";
			break;
		case 15:
			name = "代理人身份证明材料";
			break;
		case 16:
			name = "证明具体行政行为存在的材料";
			break;
		case 17:
			name = "申请人身份证明材料";
			break;
		case 18:
			name = "申请材料";
			break;
		case 19:
			name = "回执书";
			break;
		default:
			name = "未知类别的材料";
			break;
		}
		return name;
	}

	/**
	 * 提交意见和材料
	 * 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String addSug() throws Exception {
		String hql = null;
		hql = "from InfoModel i where i.id='" + id + "'";
		List<InfoModel> infoModel2 = coreService.find(hql);
		infoModel = infoModel2.get(0);
		if (null != other1) {
			zxyjService.uploadFile(other1, other1FileName, null, null, id, "3",
					"0");
		}
		if (null != other2) {
			zxyjService.uploadFile(other2, other2FileName, null, null, id, "3",
					"0");
		}
		if (null != other3) {
			zxyjService.uploadFile(other3, other3FileName, null, null, id, "3",
					"0");
		}
		if (null != other4) {
			zxyjService.uploadFile(other4, other4FileName, null, null, id, "3",
					"0");
		}
		if (null != other5) {
			zxyjService.uploadFile(other5, other5FileName, null, null, id, "3",
					"0");
		}
		if (appAdviceType.length() < 1000) {
			infoModel.setAppAdviceType(appAdviceType);
		} else {
			infoModel.setAppAdviceType(appAdviceType.substring(0, 999));
		}
		this.coreService.update(infoModel);
		return SUCCESS;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Class getPersistentClass() {
		return ArchiveModel.class;
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public String getDownloadName() {
		return downloadName;
	}

	public void setDownloadName(String downloadName) {
		this.downloadName = downloadName;
	}

	public InputStream getDocStream() {
		return docStream;
	}

	public void setDocStream(InputStream docStream) {
		this.docStream = docStream;
	}

	public InfoModel getInfoModel() {
		return infoModel;
	}

	public void setInfoModel(InfoModel infoModel) {
		this.infoModel = infoModel;
	}

	public String getAppAdviceType() {
		return appAdviceType;
	}

	public void setAppAdviceType(String appAdviceType) {
		this.appAdviceType = appAdviceType;
	}

	public Integer getEntityId() {
		return entityId;
	}

	public void setEntityId(Integer entityId) {
		this.entityId = entityId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public AppModel getAppModel() {
		return appModel;
	}

	public void setAppModel(AppModel appModel) {
		this.appModel = appModel;
	}

	public String getCaseNum() {
		return caseNum;
	}

	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}

	public File getOther1() {
		return other1;
	}

	public void setOther1(File other1) {
		this.other1 = other1;
	}

	public File getOther2() {
		return other2;
	}

	public void setOther2(File other2) {
		this.other2 = other2;
	}

	public File getOther3() {
		return other3;
	}

	public void setOther3(File other3) {
		this.other3 = other3;
	}

	public File getOther4() {
		return other4;
	}

	public void setOther4(File other4) {
		this.other4 = other4;
	}

	public File getOther5() {
		return other5;
	}

	public void setOther5(File other5) {
		this.other5 = other5;
	}

	public String getOther1FileName() {
		return other1FileName;
	}

	public void setOther1FileName(String other1FileName) {
		this.other1FileName = other1FileName;
	}

	public String getOther2FileName() {
		return other2FileName;
	}

	public void setOther2FileName(String other2FileName) {
		this.other2FileName = other2FileName;
	}

	public String getOther3FileName() {
		return other3FileName;
	}

	public void setOther3FileName(String other3FileName) {
		this.other3FileName = other3FileName;
	}

	public String getOther4FileName() {
		return other4FileName;
	}

	public void setOther4FileName(String other4FileName) {
		this.other4FileName = other4FileName;
	}

	public String getOther5FileName() {
		return other5FileName;
	}

	public void setOther5FileName(String other5FileName) {
		this.other5FileName = other5FileName;
	}

	public ZxyjService getZxyjService() {
		return zxyjService;
	}

	public void setZxyjService(ZxyjService zxyjService) {
		this.zxyjService = zxyjService;
	}

}
