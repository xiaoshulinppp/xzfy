package com.taiji.zxfy.zxsq.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.taiji.core.service.ICoreService;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.Beishenqingren;
import com.taiji.zxfy.zxsq.domain.InfoModel;

public interface IZxsqService extends ICoreService {

	
	
	public void saveXzzw(String infoId, InfoModel infoModel);
	
	public String saveXzbzw(String infoId, InfoModel infoModel);
	
	public void saveSsly(String infoId, InfoModel infoModel);
	
	public void saveSqrSfzm(String clType, String infoId, String sqrID, File sfzm, String sfzmFileName) throws IOException;
	
	public void deleteSqrSfzmAll(String sqrID);
	
	public void deleteSqrSfzm(String sqrID, String clID);
	
	public void saveDlsx(String clType, String infoId, File dlsx, String dlsxFileName) throws IOException;
	
	public boolean isNotDlr(String infoId);
	
	public boolean isNotXzzw(String infoId);

	public void saveXzzwCl(String infoId, String clName, String clNum, File caiLiao, String caiLiaoFileName) throws IOException;

	public void saveXzbzwCl(String infoId, String xzbzwClName, String clTyepe, File caiLiao, String caiLiaoFileName) throws IOException;
	
	public void deleteXzbzwClAll(String infoId, String clType);
	
	public void saveOther(String infoId, String clName, String clNum, File caiLiao, String caiLiaoFileName) throws IOException;

	

	public String deleteXzzwCl(String infoId, String clID);
	
	public String deleteFile(String clID);
	
	public InfoModel findInfoModel(String infoId);
	
	public AppModel findAppModel(Integer appId);

	public void gotoGmSave(String infoId);

	public void gotoFrSave(String infoId);
	
	public String saveSqr(String infoId, AppModel app, File[] caiLiao, String[] caiLiaoFileName);
	
//	public void saveGmSqr(String infoId, AppModel app);
//	
//	public void saveFrSqr(String infoId, AppModel app, File[] caiLiao, String[] caiLiaoFileName);
	
	public String updateSqr(AppModel app);
	
	public String deleteSqr(String infoId, Integer appID);
	
//	public void updateGmSqr(AppModel app);
//	
//	public void updateFrSqr(AppModel app);
	
	public void saveDbr(String infoId, String[] dbrArr);
	
	public void saveDlr(String infoId, AppModel app);

	public void deleteDlr(String infoId);

	public void saveZylxr(String infoId, int appId);
	
	public List<Beishenqingren> getBsqrName(String type,String locBm,List<Beishenqingren> blist);
	
	public void saveBsqr(String infoId, InfoModel infoModel);
	
	public void saveIsNotZw(String infoId, InfoModel infoModel);
	
	
	public void createPdf(String infoId);
}
