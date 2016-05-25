package com.dataSync.service;

import javax.jws.WebMethod;
import javax.jws.WebService;

import com.dataSync.model.ArchiveDto;
import com.dataSync.model.InfoAppArchiveDto;
import com.dataSync.model.InfoDto;

@WebService
public interface Services {
	// 同步需要补正的内容
	@WebMethod
	public void sendIsBuzheng(InfoDto infoDto);

	// 同步案件及其相关资料
	@WebMethod
	public InfoAppArchiveDto anJianTongbu();

	// 判断案件保存成功
	@WebMethod
	public void flagInfo(int flag, String id);

	// 判断补正材料保存成功
	@WebMethod
	public void flag2Info(int flag, String id);

	// 判断意见证据材料保存成功
	@WebMethod
	public void flag3Info(int flag, String id);

	// 判断案件意见证据是否更新成功
	@WebMethod
	public void flag4Info(int flag, String id);

	// 改变在线案卷材料的查看状态
	@WebMethod
	public int updateStatus(String id, String status);

	// 改变行政复议推送过来的材料的查看状态
	@WebMethod
	public int updateXzfyStatus(String xzfyId, String status);

	// 从行政复议同步案卷信息到在线复议
	@WebMethod
	public int archiveSync(ArchiveDto archiveDto);

	// 删除行政复议同步过来的材料
	@WebMethod
	public int archiveDel(String id);

}
