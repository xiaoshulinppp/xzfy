package com.taiji.zxfy.zxsq.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.junit.Test;

import com.taiji.core.service.impl.CoreServiceImpl;
import com.taiji.core.util.ApplicationPath;
import com.taiji.user.domain.Org;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.Beishenqingren;
import com.taiji.zxfy.zxsq.domain.InfoModel;
import com.taiji.zxfy.zxsq.service.IZxsqService;
import com.taiji.zxfy.zxsq.utils.PdfUtil;
import com.taiji.zxfy.zxsq.utils.RandomUtil;

public class ZxsqServiceImpl extends CoreServiceImpl implements IZxsqService{

	@Override
	public InfoModel findInfoModel(String infoId) {
	
		List<InfoModel> list = this.find("from InfoModel t where 1 = 1 and ID = ?", (Object)infoId);
		if(list.isEmpty())
		{
			return new InfoModel();
		}
		return list.get(0);
	}

	@Override
	public AppModel findAppModel(Integer appId) {
	
		List<AppModel> list = this.find("from AppModel t where 1 = 1 and ID = ?", (Object)appId);
		if(list.isEmpty())
		{
			return new AppModel();
		}
		return list.get(0);
	}
	
	
	
	
	
	
	
	@Override
	public void gotoGmSave(String infoId) {
	// 切换为   公民申请
		this.gotoGmOrFr(infoId, "1");
	}

	@Override
	public void gotoFrSave(String infoId) {
	// 切换为   法人申请
		this.gotoGmOrFr(infoId, "2");
	}
	
	private void gotoGmOrFr(String infoId, String appType)
	{// --------- 还有  法人 材料没删除(添加法人申请的时候添加的材料
		InfoModel infoModel = this.findInfoModel(infoId);
		Set<AppModel> appS = infoModel.getAppModels();
		infoModel.setAppType(appType);
		infoModel.setJinDu("0");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.update(infoModel);
		if(appS.isEmpty())
		{
			return;
		}
		infoModel = this.findInfoModel(infoId);
		this.evict(infoModel);//此处的意思是？和clear()区别？
		List<ArchiveModel> archList = this.find("from ArchiveModel where TYPE = '17' and XZFYID = ?", infoId);
		if(!archList.isEmpty())
		{// 删除 申请人身份证明材料
			int listSize = archList.size();
			for(int i = 0; i < listSize; i++)
			{
				this.deleteFileOnDisk(ApplicationPath.getRootPath().replace("\\",
						File.separator)
						+ archList.get(0).getFileRelativePath().replace("\\", File.separator),
						archList.get(0).getFileName());//删除服务器上保存的身份证明材料（这里面的0应该是变量i？）
				this.remove(archList.get(i));//删除材料表type=17（申请人身份证明材料）数据库记录
			}
		}
		Iterator<AppModel> it = appS.iterator();
		AppModel app = new AppModel();
		for(;it.hasNext();)
		{
			app = it.next();
			if(!"0".equals(app.getProxyType()))
			{// 如果是  申请人
				AppModel a = new AppModel();
				a.setId(app.getId());
				this.remove(a);//删除APP_ZXFY_APP里面对应的记录
			}
		}
	}

	

	

	

	

	

	

	
	
	
	
	
	
	
	
	
//	private AppModel findApp(Integer appId)
//	{
//		List list = this.find("from AppModel t where 1 = 1 and ID = ?", appId.toString());
//		if(list.isEmpty())
//		{
//			return new AppModel();
//		}
//		return (AppModel)list.get(0);
//	}
//	
//	private InfoModel findInfo(String infoId)
//	{
//		List list = this.find("from InfoModel t where 1 = 1 and ID = ?", infoId);
//		if(list.isEmpty())
//		{
//			return new InfoModel();
//		}
//		return (InfoModel) list.get(0);
//	}

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
	
	private String createFilePath() {
		// 获得绝对地址服务器的
		String rootPath = ApplicationPath.getRootPath().replace("\\", File.separator);
		String filePath = rootPath + "download" + File.separator + "zxfy";
		return filePath;
	}

	// 生成附件存储名字
	private String createFileName() {
		String appFileName = "";
		Calendar rightNow = Calendar.getInstance();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddhhmmss");
		appFileName = fmt.format(rightNow.getTime()) + RandomUtil.generateNumber(3) + ".jpg";
		return appFileName;
	}
	
	private void uploadFile(File file, String filePath, String fileName)
	{ // 上传文件
		FileInputStream fileInputStream = null;
		FileOutputStream fileOutputStream = null;
		try {
			fileInputStream = new FileInputStream(file);
		
			fileOutputStream = new FileOutputStream(filePath + File.separator + fileName);
			int fileSize = fileInputStream.available();// 剩余字节数。
			byte buffer[] = new byte[fileSize];
			int len;
			while ((len = fileInputStream.read(buffer)) > 0) {
				fileOutputStream.write(buffer, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileInputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				fileOutputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 删除硬盘上的文件
	public boolean deleteFileOnDisk(String filePath, String fileName) {
		File file = new File(filePath + File.separator + fileName);
		String pathAndFile = filePath + File.separator + fileName;
		// 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				System.out.println("删除单个文件" + fileName + "成功！");
				return true;
			} else {
				System.out.println("删除单个文件" + fileName + "失败！");
				return false;
			}
		} else {
			System.out.println("删除单个文件失败：" + fileName + "不存在！");
			return false;
		}
	}
	
	



	
	
	@Override
	public String deleteFile(String clID)
	{
		List<ArchiveModel> list = this.find("from ArchiveModel t where 1 = 1 and ID = ?", clID.toString());
		if(!list.isEmpty())
		{
			this.deleteFileOnDisk(ApplicationPath.getRootPath().replace("\\",
					File.separator)
					+ list.get(0).getFileRelativePath().replace("\\", File.separator),
					list.get(0).getFileName());
			this.remove(list.get(0));
		}
		
		return "success";
	}
	


	
	
	@Override
	public String saveSqr(String infoId, AppModel appModel, File[] caiLiao, String[] caiLiaoFileName) {
		
		InfoModel infoModel = this.findInfoModel(infoId);
		if("1".equals(infoModel.getAppType()))
		{
			this.saveGmSqr(infoModel, appModel);
		}else if("2".equals(infoModel.getAppType()))
		{
			this.saveFrSqr(infoModel, appModel, caiLiao, caiLiaoFileName);
		}else{
			return "error";
		}
		
		return "success";
	}
	
	private void saveGmSqr(InfoModel infoModel, AppModel appModel) {
	
		appModel.setInfoModel(infoModel);
		appModel.setProxyType("1"); // 申请人类别
		appModel.setIsDeputy("1"); // 新添加的申请人默认 为  代表人
		appModel.setIsLink("0"); // 是否为 主要联系人
		this.save(appModel);
	}
	
	private void saveFrSqr(InfoModel infoModel, AppModel appModel, File[] caiLiao, String[] caiLiaoFileName) {
	
		if(caiLiao[0] == null)
		{
			return;
		}
		appModel.setInfoModel(infoModel);
		appModel.setProxyType("2"); // 申请人类别
		appModel.setIsDeputy("1"); // 新添加的申请人默认 为  代表人
		appModel.setIsLink("0"); // 是否为 主要联系人
		this.save(appModel);
		
		String filePath = this.createFilePath();
		File f = new File(filePath);
		f.mkdir();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		// 保存材料
		for(int i = 0; i < caiLiao.length; i++)
		{
			ArchiveModel archiveModel = new ArchiveModel();
			
			archiveModel.setStatus("0");
			archiveModel.setType("17");
			archiveModel.setFileName(caiLiaoFileName[i]);
			archiveModel.setFileAnotherName(this.createFileName());
			archiveModel.setFileRelativePath("download" + File.separator + "zxfy");
			archiveModel.setFileAbsolutePath(filePath + File.separator + archiveModel.getFileAnotherName());
			archiveModel.setUploadTime(df.format(new Date()));
			archiveModel.setUploadUserId(appModel.getId().toString());
			archiveModel.setUploadUserName(appModel.getAppName());
			archiveModel.setXzfyId(infoModel.getId());
			archiveModel.setOther(i + 4 + "");
			
			this.uploadFile(caiLiao[i], filePath, archiveModel.getFileAnotherName());
			this.save(archiveModel);
		}
		
		
	}
	
	@Override
	public String updateSqr(AppModel app) {
		
		AppModel appModel = this.findAppModel(app.getId());
		if("1".equals(appModel.getProxyType()))
		{
			this.updateGmSqr(app, appModel);
		}else if("2".equals(appModel.getProxyType()))
		{
			this.updateFrSqr(app, appModel);
		}else{
			return "error";
		}
		return "success";
	}
	
	private void updateGmSqr(AppModel app, AppModel appModel)
	{
		appModel.setAppName(app.getAppName());
		appModel.setSexy(app.getSexy());
		appModel.setDateOfBirth(app.getDateOfBirth());
		appModel.setAppId(app.getAppId());
		appModel.setEmail(app.getEmail());
		appModel.setMobile(app.getMobile());
		appModel.setTelephone(app.getTelephone());
		appModel.setPostCode(app.getPostCode());
		appModel.setMailAddress(app.getMailAddress());
		appModel.setAddress(app.getAddress());
		this.update(appModel);
	}

	private void updateFrSqr(AppModel app, AppModel appModel)
	{
		
		appModel.setAppName(app.getAppName());
		appModel.setDeputyName(app.getDeputyName());
		appModel.setAppId(app.getAppId());
		appModel.setEmail(app.getEmail());
		appModel.setMobile(app.getMobile());
		appModel.setTelephone(app.getTelephone());
		appModel.setPostCode(app.getPostCode());
		appModel.setMailAddress(app.getMailAddress());
		appModel.setAddress(app.getAddress());
		// ... 两份材料没上传
		this.update(appModel);
	}
	
	@Override
	public String deleteSqr(String infoId, Integer appID)
	{ // 删除 申请人 信息
		//
		InfoModel infoModel = this.findInfoModel(infoId);
		infoModel.setJinDu("0");
		this.update(infoModel);
		this.evict(infoModel);
		AppModel app = this.findAppModel(appID);
		if(app.getSfzmType()  != null && !"".equals(app.getSfzmType()))
		{
			// 删除申请人的身份证明
			List<ArchiveModel> list = this.find("from ArchiveModel t where 1 = 1 and uploadUserId = ? and type = '17'", appID.toString());
			if(!list.isEmpty())
			{
				int listSize = list.size();
				for(int i = 0; i < listSize; i++)
				{
					this.deleteFileOnDisk(ApplicationPath.getRootPath().replace("\\",
							File.separator)
							+ list.get(0).getFileRelativePath().replace("\\", File.separator),
							list.get(0).getFileName());
					this.remove(list.get(i));
				}
			}
		}
		
		
		this.evict(app);
		return "success";
	}
	
	@Override
	public void saveDbr(String infoId, String[] dbrArr) {
	
		InfoModel info = this.findInfoModel(infoId);
		Set<AppModel> appS = info.getAppModels();
		for(AppModel app : appS)
		{// 先将所有人都设置成   非 代表人, 默认 都是代表人
			app.setIsDeputy("0");
			this.update(app);
		}
		// this.evict(..);
		for(int i = 0; i < dbrArr.length; i++)
		{// 设置选择 的代表人
			AppModel app = this.findAppModel(Integer.parseInt(dbrArr[i]));
			app.setIsDeputy("1");
			this.save(app);
		}
	}

	@Override
	public void saveDlr(String infoId, AppModel appModel) {
	
		InfoModel infoModel = this.findInfoModel(infoId);
		infoModel.setJinDu("2");
		if("1".equals(infoModel.getAgent()))
		{
			infoModel.setAgentName(appModel.getAppName());
			this.save(infoModel);
			List list = this.find("from AppModel t where XZFY_ID = ? and PROXYTYPE = '0'", infoId);
			if(!list.isEmpty())
			{
				AppModel app = (AppModel)list.get(0);
				app.setAppName(appModel.getAppName());
				app.setTelephone(appModel.getTelephone());
				this.update(app);
			}
		}
		else
		{
			// 更改案件信息
			infoModel.setAgent("1");
			infoModel.setAgentName(appModel.getAppName());
			infoModel.setProxy("4");
			this.update(infoModel);
			// 保存  代理人
			appModel.setProxyType("0");  //  申请人类别
			appModel.setIsDeputy("0"); // 代理人不是代表人
			appModel.setIsLink("0");
			appModel.setInfoModel(infoModel);
			this.save(appModel);
		}
	}

	@Override
	public void deleteDlr(String infoId) {
	
		InfoModel infoModel = this.findInfoModel(infoId);
		if("1".equals(infoModel.getAgent()))
		{
			infoModel.setJinDu("2");
			infoModel.setAgent("0");
			infoModel.setAgentName("");
			infoModel.setProxy("");
			this.update(infoModel);
			this.evict(infoModel);
			List<AppModel> list = this.find("from AppModel t where XZFY_ID = ? and PROXYTYPE = '0'", infoId);
			if(!list.isEmpty())
			{
				AppModel app = new AppModel();
				app.setId(list.get(0).getId());
				this.evict(list.get(0));
				this.remove(app);
			}
			// 删除代理手续
			List<ArchiveModel> archList = this.find("from ArchiveModel where (TYPE = '14' or TYPE = '15') and XZFYID = ?", infoId);
			if(!archList.isEmpty())
			{
				int listSize = archList.size();
				for(int i = 0; i < listSize; i++)
				{
					this.deleteFileOnDisk(ApplicationPath.getRootPath().replace("\\",
							File.separator)
							+ archList.get(i).getFileRelativePath().replace("\\", File.separator),
							archList.get(i).getFileName());
					this.remove(archList.get(i));
				}
			}
		}
	}

	@Override
	public void saveZylxr(String infoId, int appId) {
		
		// 判断是否已有 主要联系人
		AppModel app = new AppModel();
		List list = this.find("from AppModel t where XZFY_ID = ? and ISLINK = '1'", infoId);
		if(!list.isEmpty())
		{
			app = (AppModel)list.get(0);
			app.setIsLink("0");
			this.update(app);
		}
		app = this.findAppModel(appId);
		app.setIsLink("1");
		this.update(app);
		
	}
	
	@Override
	public void saveBsqr(String infoId, InfoModel infoModel) {
	
		InfoModel info = this.findInfoModel(infoId);
		info.setDefendantType(infoModel.getDefendantType());
		info.setDefendantName(infoModel.getDefendantName());
		System.out.println(infoModel.getDefendantType() + ">>>>>>>>>>>" + infoModel.getDefendantName());
		List<Org> orgList = this.find("from Org t where t.name = ?", infoModel.getDefendantName());
		info.settApplicationDeptId(orgList.get(0).getLocbm());
		info.setJinDu("4");
		this.update(info);
	}
	
	@Override
	public void saveIsNotZw(String infoId, InfoModel infoModel) {
	
		InfoModel info = this.findInfoModel(infoId);
		info.setJinDu("5");
		info.setCaseIndex("" + new Random().nextInt(1000000));
		
		if(info.getIsManage() == null || "".equals(info.getIsManage()))
		{ // 第一次选择
			info.setIsManage(infoModel.getIsManage());
			this.update(info);
			return;
		}
		if(info.getIsManage().equals(infoModel.getIsManage()))
		{ // 和原来一样
			return;
		}
		// 更换选择
		// 删除原来所有相关数据及材料
		
		info.setManageType("");
		info.setIsProf("");
		info.setRequireFy("");
		info.setXzfyRequset("");
		info.setXzfyRequsetRetail("");
		info.setBuzhengFrom("");
		info.setXwName("");
		info.setXwNum("");
		info.setMatterType("");
		info.setMatterDetail("");
		info.setExecuteDate("");
		info.setIsProfDetail("");
		
		info.setIsManage(infoModel.getIsManage());
		this.update(info);
		
		// ++ 如果已上传材料, 还需要删除磁盘上的文件
		List<ArchiveModel> archList = this.find("from ArchiveModel where (TYPE = '16' or TYPE = '18' or TYPE = '19') and XZFYID = ?", infoId);
		if(!archList.isEmpty())
		{// 删除案件材料
			int listSize = archList.size();
			for(int i = 0; i < listSize; i++)
			{
				this.deleteFileOnDisk(ApplicationPath.getRootPath().replace("\\",
						File.separator)
						+ archList.get(i).getFileRelativePath().replace("\\", File.separator),
						archList.get(i).getFileName());
				this.remove(archList.get(i));
			}
		}
	}
	
	@Override
	public boolean isNotXzzw(String infoId) {
		
		InfoModel infoModel = this.findInfoModel(infoId);
		if(infoModel.getIsManage() != null && "0".equals(infoModel.getIsManage()))
		{
			return true;
		}
		return false;
	}
	
	@Override
	public void saveXzzw(String infoId, InfoModel infoModel) {
	
		InfoModel info = this.findInfoModel(infoId);
		
		info.setManageType("0");
		info.setIsProf("0");
		info.setJinDu("6");
		
		info.setRequireFy(infoModel.getRequireFy());
		info.setXzfyRequset(infoModel.getXzfyRequset());
		if("1".equals(infoModel.getXzfyRequset()))
		{
			info.setXzfyRequsetRetail("撤销该具体行政行为");
		}else if("2".equals(infoModel.getXzfyRequset()))
		{
			info.setXzfyRequsetRetail("变更该具体行政行为");
		}else if("3".equals(infoModel.getXzfyRequset()))
		{
			info.setXzfyRequsetRetail("确认该具体行政行为违法");
		}
		info.setBuzhengFrom(infoModel.getBuzhengFrom());
		info.setXwName(infoModel.getXwName());
		info.setXwNum(infoModel.getXwNum());
		
		
		
		this.update(info);
	}
	
	@Override
	public String saveXzbzw(String infoId, InfoModel infoModel){
	
		InfoModel info = this.findInfoModel(infoId);
		

		info.setJinDu("6");
		info.setMatterType(infoModel.getMatterType());
		info.setMatterDetail(infoModel.getMatterType());
		info.setExecuteDate(infoModel.getExecuteDate());
		
		info.setIsProf("有");
		info.setIsProfDetail("有");
		
		info.setRequireFy("行政不作为事项：" + infoModel.getMatterType() + "；<br>履行日期："+ infoModel.getExecuteDate() +"；<br>证明材料：有");
		info.setXzfyRequset(infoModel.getXzfyRequset());
		if("4".equals(infoModel.getXzfyRequset()))
		{
			info.setXzfyRequsetRetail("责令被申请人履行法定职责");
		}else if("5".equals(infoModel.getXzfyRequset()))
		{
			info.setXzfyRequsetRetail("确认被申请人不履行法定职责违法");
		}
		info.setXwName("行政不作为(" + infoModel.getMatterType() + ")");
		
		
		
		this.update(info);
		return "success";
	}

	@Override
	public void saveSsly(String infoId, InfoModel infoModel) {
	
		InfoModel info = this.findInfoModel(infoId);
		info.setJinDu("7");
		info.setAppAdviceDetail(infoModel.getAppAdviceDetail());
		
		this.update(info);
	}
	
	@Override
	public void saveSqrSfzm(String sfzmType, String infoId, String sqrID, File sfzm, String sfzmFileName) throws IOException {
	
		InfoModel infoModel = this.findInfoModel(infoId);
		infoModel.setJinDu("7");
		infoModel.setCaseIndex("" + new Random().nextInt(1000000));
		this.update(infoModel);
		this.evict(infoModel);
		
		String filePath = this.createFilePath();
		File file = new File(filePath);
		file.mkdir();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//		for (int i = 0; i < sqrID.length; i++) {
			String file_name = this.createFileName();
			ArchiveModel archive = new ArchiveModel();
			AppModel app = this.findAppModel(Integer.parseInt(sqrID)); // [i]
			app.setSfzmType(sfzmType); // [i]
			this.save(app);
			
			archive.setStatus("0");
			archive.setType("17");
			archive.setFileName(sfzmFileName); // [i]
			archive.setFileAnotherName(file_name);
			archive.setFileRelativePath("download" + File.separator + "zxfy");
			archive.setFileAbsolutePath(filePath + File.separator + file_name);
			archive.setUploadTime(df.format(new Date()));
			archive.setUploadUserId(sqrID); // [i]
			archive.setUploadUserName(app.getAppName());
			archive.setXzfyId(infoId);
			archive.setOther(sfzmType); // [i]
			this.uploadFile(sfzm, filePath, file_name); // [i]
			this.save(archive);
//		}
	}
	
	@Override
	public void deleteSqrSfzmAll(String sqrID)
	{
		List<ArchiveModel> list = this.find("from ArchiveModel t where 1 = 1 and uploadUserId = ? and type = '17' and other in ('1','2','3')", (Object)sqrID);
		int listSize = list.size();
		for(int i = 0; i < listSize; i++)
		{
			this.deleteFileOnDisk(ApplicationPath.getRootPath().replace("\\",
					File.separator)
					+ list.get(i).getFileRelativePath().replace("\\", File.separator),
					list.get(i).getFileName());
			this.remove(list.get(i));
		}
		AppModel app = this.findAppModel(Integer.parseInt(sqrID));
		app.setSfzmType("");
		this.update(app);
	}
	
	@Override
	public void deleteSqrSfzm(String sqrID, String clID)
	{
		List<ArchiveModel> list = this.find("from ArchiveModel t where 1 = 1 and t.id = ?", (Object)Integer.parseInt(clID));
		
		this.deleteFileOnDisk(ApplicationPath.getRootPath().replace("\\",
				File.separator)
				+ list.get(0).getFileRelativePath().replace("\\", File.separator),
				list.get(0).getFileName());
		this.remove(list.get(0));
		
		list = this.find("from ArchiveModel t where 1 = 1 and uploadUserId = ? and type = '17' and other in ('1','2','3')", sqrID);
		if(list.isEmpty())
		{
			AppModel app = this.findAppModel(Integer.parseInt(sqrID));
			app.setSfzmType("");
			this.update(app);
		}
	}
	
	@Override
	public void saveDlsx(String clType, String infoId, File dlsx, String dlsxFileName) throws IOException
	{

		
		String filePath = this.createFilePath();
		File file = new File(filePath);
		file.mkdir();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String file_name = this.createFileName();
		ArchiveModel archive = new ArchiveModel();
		
		archive.setStatus("0");
		archive.setType(clType);
		archive.setFileName(dlsxFileName); // [i]
		archive.setFileAnotherName(file_name);
		archive.setFileRelativePath("download" + File.separator + "zxfy");
		archive.setFileAbsolutePath(filePath + File.separator + file_name);
		archive.setUploadTime(df.format(new Date()));
		archive.setXzfyId(infoId);
		this.uploadFile(dlsx, filePath, file_name); // [i]
		this.save(archive);
	}
	
	@Override
	public boolean isNotDlr(String infoId) {
	// 是否有代理人
		InfoModel infoModel = this.findInfoModel(infoId);
		if(infoModel.getAgent() != null && "1".equals(infoModel.getAgent()))
		{
			return true;
		}
		return false;
	}
	
	

	@Override
	public void saveXzzwCl(String infoId, String clName, String clNum, File caiLiao, String caiLiaoFileName) throws IOException {
	
		String filePath = this.createFilePath();
		File file = new File(filePath);
		file.mkdir();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		for (int i = 0; i < caiLiao.length; i++) {
			String file_name = this.createFileName();
			ArchiveModel archiveModel = new ArchiveModel();
			archiveModel.setStatus("0");
			archiveModel.setType("16");
			archiveModel.setFileName(caiLiaoFileName);
//			if(archive != null && archive.getFileName() != null && "".equals(archive.getFileName()))
//			{
//				archiveModel.setFileName(archive.getFileName());
//			}
//			else
//			{
				archiveModel.setFileName(caiLiaoFileName);
//			}
			archiveModel.setFileAnotherName(file_name);
			archiveModel.setFileRelativePath("download" + File.separator + "zxfy");
			archiveModel.setFileAbsolutePath(filePath + File.separator + file_name);
			archiveModel.setUploadTime(df.format(new Date()));
			archiveModel.setXzfyId(infoId);
			archiveModel.setClName(clName);
//			if(archive != null && archive.getOther() != null && "".equals(archive.getOther()))
//			{
				archiveModel.setOther(clNum);
//			}
			this.save(archiveModel);
			this.uploadFile(caiLiao, filePath, file_name);
//		}
	}
	
	@Override
	public String deleteXzzwCl(String infoId, String clID)
	{
		List<ArchiveModel> list1 = this.find("from ArchiveModel t where 1 = 1 and ID = ?", clID);
		
//		List<ArchiveModel> list2 = this.find("from ArchiveModel t where 1 = 1 and clName = '" + list1.get(0).getClName() + "' and type = '16'");
//		if(list2.size() > 1)
//		{
		this.deleteFile(clID);
			this.remove(list1.get(0));
//			return "success";
//		}
		
		
		return "success";
	}

	@Override
	public void saveXzbzwCl(String infoId, String xzbzwClName, String clType, File caiLiao, String caiLiaoFileName) throws IOException {
	
		String filePath = this.createFilePath();
		File file = new File(filePath);
		file.mkdir();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		for (int i = 0; i < caiLiao.length; i++) {
			String file_name = this.createFileName();
			ArchiveModel archiveModel = new ArchiveModel();
			archiveModel.setStatus("0");
			archiveModel.setType(clType);
			archiveModel.setFileName(caiLiaoFileName); //
			archiveModel.setFileAnotherName(file_name);
			archiveModel.setFileRelativePath("download" + File.separator + "zxfy");
			archiveModel.setFileAbsolutePath(filePath + File.separator + file_name);
			archiveModel.setUploadTime(df.format(new Date()));
			archiveModel.setXzfyId(infoId);
			archiveModel.setClName(xzbzwClName);
			this.save(archiveModel);
			this.uploadFile(caiLiao, filePath, file_name); //
//		}
	}
	
	@Override
	public void deleteXzbzwClAll(String infoId, String clType)
	{
		String[] strArr = {infoId, clType};
		List<ArchiveModel> list = this.find("from ArchiveModel t where 1 = 1 and xzfyId = ? and type = ?", strArr);
		int listSize = list.size();
		for(int i = 0; i < listSize; i++)
		{
			this.deleteFileOnDisk(ApplicationPath.getRootPath().replace("\\",
					File.separator)
					+ list.get(i).getFileRelativePath().replace("\\", File.separator),
					list.get(i).getFileName());
			this.remove(list.get(i));
		}
	}

	@Override
	public void saveOther(String infoId, String clName, String clNum, File caiLiao, String caiLiaoFileName) throws IOException
	{
		String filePath = this.createFilePath();
		File file = new File(filePath);
		file.mkdir();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String file_name = this.createFileName();
		ArchiveModel archiveModel = new ArchiveModel();
		archiveModel.setStatus("0");
		archiveModel.setType("3");
		archiveModel.setFileName(caiLiaoFileName); //
		archiveModel.setFileAnotherName(file_name);
		archiveModel.setFileRelativePath("download" + File.separator + "zxfy");
		archiveModel.setFileAbsolutePath(filePath + File.separator + file_name);
		archiveModel.setUploadTime(df.format(new Date()));
		archiveModel.setXzfyId(infoId);
		archiveModel.setClName(clName);
		archiveModel.setOther(clNum);
		this.save(archiveModel);
		this.uploadFile(caiLiao, filePath, file_name);
	}
	
	@Override
	public void createPdf(String infoId)
	{// 创建PDF
		List listSqs = new ArrayList();
		List listQrd = new ArrayList();
		String str = "";
		ArchiveModel archive = null;
	// 行政复议申请书
		InfoModel info = this.findInfoModel(infoId);
		Set<AppModel> appS = info.getAppModels();
		Iterator<AppModel> it = appS.iterator();
		AppModel app = new AppModel();
		AppModel appDlr = null;
		for(;it.hasNext();)
		{
			app = it.next();
			if("0".equals(app.getProxyType()))
			{ // 代理人不显示
				appDlr = app;
				it.remove();
			}
		}
		// 申请人
		listSqs.add(appS); // 0
		listQrd.add(info.getCaseNum());
		listQrd.add(appS.size());
		// 代表人
		if(appS.size() > 5)
		{
			for(;it.hasNext();)
			{
				app = it.next();
				if("0".equals(app.getIsDeputy()))
				{ // 去掉不是代表人的申请人
					it.remove();
				}
			}
		}
		listSqs.add(appS); // 1
		listQrd.add(appS);
		// 代理人
		listSqs.add(appDlr); // 2
		// 被申请人
		listSqs.add(info.getDefendantName()); // 3
		listQrd.add(info.getDefendantName());
		// 复议请求
		str = "";
			// 请求
		if("1".equals(info.getXzfyRequset()))
		{
			str = "撤销该具体行政行为";
		}else if("2".equals(info.getXzfyRequset()))
		{
			str = "变更该具体行政行为";
		}else if("3".equals(info.getXzfyRequset()))
		{
			str = "确认该具体行政行为违法";
		}else if("4".equals(info.getXzfyRequset()))
		{
			str = "责令被申请人履行法定职责";
		}else if("5".equals(info.getXzfyRequset()))
		{
			str = "确认被申请人不履行法定职责违法";
		}
		
		if(this.isNotXzzw(infoId))
		{
			str = "申请人不服" + info.getXwName() + "(" + info.getXwNum() + ")，请求("+ str +")。";
		}else
		{
			str = "申请人不服行政不作为(" + info.getMatterType() + ")，请求("+ str +")。";
		}
		listSqs.add(str); // 4
		listQrd.add(str);
		// 事实理由
		listSqs.add(info.getAppAdviceDetail()); // 5
		// 复议机关
		listSqs.add(info.getBreakRight()); // 6
		
		List ajList = new ArrayList();
		List<ArchiveModel> archiveList = null;
		// 案件材料的的 材料名、文号
		if(this.isNotXzzw(infoId))
		{
			archiveList = this.find("from ArchiveModel t where XZFYID = ? and TYPE ='16'", infoId);
			str = "证明具体行政行为存在的材料";
			ajList.add(str);
			str = "材料名称：" + archiveList.get(0).getClName() + "    文号：" + archiveList.get(0).getOther();
			ajList.add(str);
		}else{
			str = "证明曾经要求被申请人履行法定职责而被申请人未履行的材料";
			ajList.add(str);
			archiveList = this.find("from ArchiveModel t where XZFYID = ? and TYPE ='18'", infoId);
			str = "材料名称：" + archiveList.get(0).getClName() + "    文号：" + archiveList.get(0).getOther();
			ajList.add(str);
			str = "邮寄妥投证明 或 当面提交提交申请材料登记回执";
			ajList.add(str);
			archiveList = this.find("from ArchiveModel t where XZFYID = ? and TYPE ='19'", infoId);
			str = "材料名称：" + archiveList.get(0).getClName() + "    文号：" + archiveList.get(0).getOther();
			ajList.add(str);
		}
		listSqs.add(ajList); // 7
		// 其他材料
		archiveList = this.find("from ArchiveModel t where t.xzfyId = '" + infoId + "' and t.type = '3' group by t.clName, t.other");
		ajList = new ArrayList();
		if(!archiveList.isEmpty())
		{
//			this.clSize = listClName.size();
			for(int i = 0; i < archiveList.size(); i++)
			{
//				System.out.println(listClName.get(i).getClName() + "......" + listClName.get(i).getOther());
				ajList.add("材料" + ( i + 1) + "：" +archiveList.get(i).getClName() + "； " + archiveList.get(i).getOther());
			}
		}else{
			ajList = null;
		}
		listSqs.add(ajList); // 8
		
		PdfUtil.xzfysqs(listSqs, this.createFilePath() + File.separator + infoId + "行政复议申请书.pdf");
		PdfUtil.xzfysqqrd(listQrd, this.createFilePath() + File.separator + infoId + "行政复议申请确认单.pdf");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		archive = new ArchiveModel();
		archive.setStatus("0");
		archive.setType("20");
		archive.setFileName(infoId + "行政复议申请书.pdf"); // 文件名
		archive.setFileAnotherName(infoId + "行政复议申请书.pdf"); // 存储名
		archive.setFileRelativePath("download" + File.separator + "zxfy"); // 相对路径
		archive.setFileAbsolutePath(this.createFilePath() + File.separator + infoId + "行政复议申请书.pdf"); // 磁盘路径
		archive.setUploadTime(df.format(new Date())); //生成时间
		archive.setXzfyId(infoId);
		this.save(archive);
		
		archive = new ArchiveModel();
		archive.setStatus("0");
		archive.setType("21");
		archive.setFileName(infoId + "行政复议申请确认单.pdf"); // 文件名
		archive.setFileAnotherName(infoId + "行政复议申请确认单.pdf"); // 存储名
		archive.setFileRelativePath("download" + File.separator + "zxfy"); // 相对路径
		archive.setFileAbsolutePath(this.createFilePath() + File.separator + infoId + "行政复议申请确认单.pdf"); // 磁盘路径
		archive.setUploadTime(df.format(new Date())); //生成时间
		archive.setXzfyId(infoId);
		this.save(archive);
		
		
	// 确认单
		// 申请人(申请人详细信息,如申请人大于5人，显示：王五等18人，代表人：（详细信息））
		// 被申请人
		// 复议请求
		
	}
	
// 下面是将所有用户上传的材料生成两张PDF （其他材料以前的为一份，其他材料为一份）	
//	@Override
//	public void createPdf(String infoId)
//	{ // 图片路径   文字    生成路径
//		List<String> ljList = new ArrayList<String>();
//		List<String> strList = new ArrayList<String>();
//		// 根据 infoId 查出本案件所有相关的   材料
//		// 第一份 PDF
//		//  身份证明
//			// 根据infoId / type / 上传者
//		String sql = "from AppModel t where XZFY_ID=? and PROXYTYPE != '0'";
//		List<AppModel> appS = this.find(sql, infoId);
//		List<ArchiveModel> archList = new ArrayList<ArchiveModel>();
//		sql = "from ArchiveModel t where UPLOADUSERID=? and TYPE = '17'";
//		for(int i = 0; i < appS.size(); i++)
//		{
//			// appS.get(i).getId()   FILEABSOLUTEPATH
//			archList = this.find(sql, appS.get(i).getId());
//			for(int j = 0;j < archList.size(); j++)
//			{
//				ljList.add(archList.get(j).getFileAbsolutePath());
//				strList.add(archList.get(j).getUploadUserName() + "的身份证明材料" + (j+1));
//			}
//		}
//		
//		//  代理手续
//			// 根据infoId / type / 
//		InfoModel info = this.findInfoModel(infoId);
////		if("1".equals(info.getAgent()))
//		if(this.isNotDlr(infoId))
//		{ // 有代理则 获取代理人身份证明 及 代理委托书
//			AppModel app = (AppModel)this.find("from AppModel t where PROXYTYPE = '0' and XZFY_ID = ?", (Object)infoId).get(0);
//			// 代理人 身份证明
//			archList = this.find("from ArchiveModel t where XZFYID = ? and TYPE = '15'", (Object)infoId);
//			
//			for(int j = 0;j < archList.size(); j++)
//			{
//				ljList.add(archList.get(j).getFileAbsolutePath());
//				strList.add("代理人 " + app.getAppName() + " 的身份证明材料" + (j+1));
//			}
//			// 委托证明
//			archList = this.find("from ArchiveModel t where XZFYID = ? and TYPE = '14'", (Object)infoId);
//			for(int j = 0;j < archList.size(); j++)
//			{
//				ljList.add(archList.get(j).getFileAbsolutePath());
//				strList.add("委托代理证明" + (j+1));
//			}
//		}
//		
//		//  案件材料
//		// 根据infoId / type
//		if(this.isNotXzzw(infoId))
//		{// 作为
//			archList = this.find("from ArchiveModel t where XZFYID = ? and TYPE ='16'", (Object)infoId);
//			for(int j = 0;j < archList.size(); j++)
//			{
//				ljList.add(archList.get(j).getFileAbsolutePath());
//				strList.add("行政作为材料-" + archList.get(j).getClName() + "( " + archList.get(j).getOther() + ")" + (j+1));
//			}
//			
//		}else{
//			
//			archList = this.find("from ArchiveModel t where XZFYID = ? and TYPE ='18'", (Object)infoId);
//			for(int j = 0;j < archList.size(); j++)
//			{
//				ljList.add(archList.get(j).getFileAbsolutePath());
//				strList.add("行政不作为材料-申请证明材料-" + archList.get(j).getClName() + (j+1));
//			}
//			
//			archList = this.find("from ArchiveModel t where XZFYID = ? and TYPE ='19'", (Object)infoId);
//			for(int j = 0;j < archList.size(); j++)
//			{
//				ljList.add(archList.get(j).getFileAbsolutePath());
//				strList.add("行政不作为材料-申请回执证明材料-" + archList.get(j).getClName() + (j+1));
//			}
//		}
//		
//		PdfUtil.createPdf(ljList, strList, "E:\\pdf\\" + infoId + "0.pdf");
//		
//		// 第二份PDF
//		//  其他材料
//			// 根据infoId / type / clName
//		ljList.clear();
//		strList.clear();
//		
//		List<String> listClName = this.find("select t.clName from ArchiveModel t where t.xzfyId = ? and t.type = '3' group by t.clName", (Object)infoId);
//		
//		List otherList = new ArrayList();
//		if(!listClName.isEmpty())
//		{
//			for(int i = 0; i < listClName.size(); i++)
//			{
//				archList = this.find("from ArchiveModel t where XZFYID = ? and TYPE = '3' and CLNAME = '" + listClName.get(i) + "'", (Object)infoId);
//				otherList.add(archList);
//			}
//			
//			for(int i = 0; i < otherList.size(); i++)
//			{
//				archList = (List)otherList.get(i);
//				for(int j = 0;j < archList.size(); j++)
//				{
//					ljList.add(archList.get(j).getFileAbsolutePath());
//					strList.add("其他材料-" + archList.get(j).getClName() + "(" + archList.get(j).getOther() + ")" + (j+1));
//				}
//			}
//		}
//		PdfUtil.createPdf(ljList, strList, "E:\\pdf\\" + infoId + "1.pdf");
//		
//	}
}
