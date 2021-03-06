package com.dataSync.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;

import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.springframework.beans.BeanUtils;

import com.dataSync.model.AppDto;
import com.dataSync.model.ArchiveDto;
import com.dataSync.model.InfoAppArchiveDto;
import com.dataSync.model.InfoDto;
import com.dataSync.service.Services;
import com.taiji.zxfy.zxsq.domain.AppModel;
import com.taiji.zxfy.zxsq.domain.ArchiveModel;
import com.taiji.zxfy.zxsq.domain.InfoModel;
import com.util.HibernateSessionFactory;

@WebService
public class ServicesImpl implements Services {
	/**
	 * 打开补正开关并同步需要补正的内容
	 * 
	 * @param id
	 * @param bzContent
	 */
	@SuppressWarnings("unchecked")
	public void sendIsBuzheng(InfoDto infoDto) {
		String hqlInfo = "from InfoModel i where i.id='" + infoDto.getId()
				+ "'";
		List<InfoModel> list = findBySql(hqlInfo);
		if (list.get(0).getIsBuZheng().equals("0")) {
			list.get(0).setIsBuZheng("1");
		}
		list.get(0).setBuzhengContentType(infoDto.getBuzhengContentType());
		list.get(0).setBuzhengFrom(infoDto.getBuzhengFrom());
		list.get(0).setBuzhengTo(infoDto.getBuzhengTo());
		try {
			updateObject(list.get(0));
		} catch (Exception e) {
		}
	}

	/**
	 * 更新在线案卷材料可查看的状态
	 * 
	 * @param id
	 * @param status
	 */
	@SuppressWarnings("unchecked")
	public int updateStatus(String id, String status) {
		String hqlArchive = "from ArchiveModel t where t.id='" + id + "'";
		List<ArchiveModel> list = findBySql(hqlArchive);
		list.get(0).setStatus(status);
		try {
			updateObject(list.get(0));
		} catch (Exception e) {

			return 0;
		}
		return 1;
	}

	/**
	 * 更新行政复议推送过来的材料的可查看状态办案人员推送过来的材料，如结案文书等，（推送？）以及打开开关
	 * 
	 * @param xzfyId
	 * @param status
	 */
	@SuppressWarnings("unchecked")
	public int updateXzfyStatus(String xzfyId, String status) {
		String hqlArchive = "from ArchiveModel t where t.archiveOfXzfyId='"
				+ xzfyId + "'";
		List<ArchiveModel> list = findBySql(hqlArchive);
		list.get(0).setStatus(status);
		try {
			updateObject(list.get(0));
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}

	/**
	 * 从行政复议同步案卷信息到在线复议   办案人员推送到申请人的处理
	 * 
	 * @param archiveDto
	 */
	public int archiveSync(ArchiveDto archiveDto) {
		ArchiveModel archiveModel = new ArchiveModel();
		BeanUtils.copyProperties(archiveDto, archiveModel);
		try {
			saveModel(archiveModel);
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}

	/**
	 * 删除行政复议同步过来的材料   办案人员删除申请人推送过来的材料
	 * 
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public int archiveDel(String id) {
		String hqlArchive = "from ArchiveModel t where t.archiveOfXzfyId='"
				+ id + "'";
		List<ArchiveModel> list = findBySql(hqlArchive);
		try {
			deleteModel(list.get(0));
		} catch (Exception e) {
			return 0;
		}
		return 1;
	}

	/**
	 * 同步案件以及案件相关的材料及申请人
	 */
	@SuppressWarnings("unchecked")
	public InfoAppArchiveDto anJianTongbu() {
		InfoAppArchiveDto infoAppArchiveDto = new InfoAppArchiveDto();
		// 同步案件
		String hqlInfo = "from InfoModel i";
		List<InfoModel> infoList = findBySql(hqlInfo);
		List<InfoDto> listDto = new ArrayList<InfoDto>();

		List<AppDto> appList = new ArrayList<AppDto>();
		List<AppModel> appModels = new ArrayList<AppModel>();

		List<ArchiveDto> archiveList = new ArrayList<ArchiveDto>();
		List<ArchiveModel> archiveModels = new ArrayList<ArchiveModel>();

		String hqlApp = "select a from InfoModel i, AppModel a where i=a.infoModel and i.id='";
		String hqlArchive = "from ArchiveModel t where t.xzfyId='";
		/*--------------------------同步案件---------------------------------------- */
		for (int i = 0; i < infoList.size(); i++) {
			if (infoList.get(i).getStatus().equals("0")) {
				InfoDto infoDto = new InfoDto();
				InfoModel infoModel = infoList.get(i);
				System.out.println("Helo----------------------");
				BeanUtils.copyProperties(infoModel, infoDto);//************************************区别****************************************//
				infoDto.setStatus("1");
				listDto.add(infoDto);
			}
		}
		infoAppArchiveDto.setInfoDtos(listDto);
		/*--------------------------同步案件相关的人员与材料--------------------------------------*/
		if (listDto.size() != 0) {
			for (int i = 0; i < listDto.size(); i++) {
				// 同步案件相关的人员
				appModels = findBySql(hqlApp + listDto.get(i).getId() + "'");
				for (int j = 0; j < appModels.size(); j++) {
					AppDto appDto = new AppDto();
					BeanUtils.copyProperties(appModels.get(j), appDto);
					appDto.setXzfyId(listDto.get(i).getId());//为什么单独给该属性赋值？*****************************************************************/
					appList.add(appDto);
				}
				// 同步案件相关的材料
				archiveModels = findBySql(hqlArchive + listDto.get(i).getId()
						+ "'");
				for (int k = 0; k < archiveModels.size(); k++) {
					ArchiveDto archiveDto = new ArchiveDto();
					BeanUtils.copyProperties(archiveModels.get(k), archiveDto);
					archiveList.add(archiveDto);
				}
			}
			infoAppArchiveDto.setAppDtos(appList);
			infoAppArchiveDto.setArchiveDtos(archiveList);
		}
		/*----------------------------同步案件相关的补正材料------------------------------------------*/
		List<ArchiveDto> bzListArchiveDtos = new ArrayList<ArchiveDto>();
		List<ArchiveModel> bzArchiveModels = new ArrayList<ArchiveModel>();
		List<InfoModel> infoList1 = findBySql(hqlInfo);
		for (int i = 0; i < infoList1.size(); i++) {
			if (infoList1.get(i).getIsBuZheng().equals("2")) {
				bzArchiveModels = findBySql(hqlArchive
						+ infoList1.get(i).getId()
						+ "' and t.fileName like '(补证)%'");
				for (int j = 0; j < bzArchiveModels.size(); j++) {
					ArchiveDto archiveDto = new ArchiveDto();
					BeanUtils
							.copyProperties(bzArchiveModels.get(j), archiveDto);
					bzListArchiveDtos.add(archiveDto);
				}
			}
		}
		infoAppArchiveDto.setBzArchiveDtos(bzListArchiveDtos);
		/*-----------------------------同步案件相关的意见（阅卷）证据材料（5个）-----------------------------------------------*/
		List<ArchiveDto> yjArchiveDtos = new ArrayList<ArchiveDto>();
		List<ArchiveModel> yjArchiveModels = new ArrayList<ArchiveModel>();

		for (int i = 0; i < infoList.size(); i++) {
			yjArchiveModels = findBySql(hqlArchive
					+ infoList.get(i).getId()
					+ "' and t.type='3' and t.fileName like '（意见证据材料）%' and t.other='0'");
			for (int j = 0; j < yjArchiveModels.size(); j++) {
				ArchiveDto archiveDto = new ArchiveDto();
				BeanUtils.copyProperties(yjArchiveModels.get(j), archiveDto);
				yjArchiveDtos.add(archiveDto);
			}
		}
		infoAppArchiveDto.setYjArchiveDtos(yjArchiveDtos);
		/*-------------------------------------------更新案件的意见（阅卷）证据----------------------------------------------*/
		List<InfoDto> yjInfoDtos = new ArrayList<InfoDto>();
		List<InfoModel> infoList2 = findBySql(hqlInfo);
		for (int i = 0; i < infoList2.size(); i++) {
			if (infoList2.get(i).getFlag().equals("0")) {
				if (infoList2.get(i).getAppAdviceType() != null) {//仅仅同步该字段AppAdviceType
					InfoDto infoDto = new InfoDto();
					BeanUtils.copyProperties(infoList2.get(i), infoDto);
					yjInfoDtos.add(infoDto);
				}
			}
		}
		infoAppArchiveDto.setYjInfoDtos(yjInfoDtos);
		return infoAppArchiveDto;
	}

	// 案件保存成功
	@SuppressWarnings("unchecked")
	public void flagInfo(int flag, String id) {
		if (flag == 1) {
			String hqlInfo = "from InfoModel i where i.id='" + id + "'";
			List<InfoModel> list = findBySql(hqlInfo);
			list.get(0).setStatus("1");
			try {
				updateObject(list.get(0));
			} catch (Exception e) {
			}
		}
	}

	// 补正材料保存成功
	@SuppressWarnings("unchecked")
	public void flag2Info(int flag, String id) {
		if (flag == 1) {
			String hqlInfo = "from InfoModel i where i.id='" + id + "'";
			List<InfoModel> list = findBySql(hqlInfo);
			list.get(0).setIsBuZheng("3");
			try {
				updateObject(list.get(0));
			} catch (Exception e) {
			}
		}
	}

	// 判断意见证据材料保存成功
	@SuppressWarnings("unchecked")
	public void flag3Info(int flag, String id) {
		if (flag == 1) {
			String hqlInfo = "from ArchiveModel a where a.id='" + id + "'";
			List<ArchiveModel> list = findBySql(hqlInfo);
			list.get(0).setOther("1");
			try {
				updateObject(list.get(0));
			} catch (Exception e) {
			}
		}
	}

	// 判断案件意见证据是否更新成功
	@SuppressWarnings("unchecked")
	public void flag4Info(int flag, String id) {
		if (flag == 1) {
			String hqlInfo = "from InfoModel i where i.id='" + id + "'";
			List<InfoModel> list = findBySql(hqlInfo);
			list.get(0).setFlag("1");
			try {
				updateObject(list.get(0));
			} catch (Exception e) {
			}
		}
	}

	/**
	 * 查询实体
	 * 
	 * @param hql
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List findBySql(String hql) {
		Session session = null;
		List list = null;
		Query query = null;
		try {
			session = HibernateSessionFactory.getSession();
			query = session.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return list;
	}

	/**
	 * 更新数据库
	 * 
	 * @param infoDto
	 * @throws Exception
	 */
	public void updateObject(Object object) throws Exception {
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.update(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw new Exception(e);
		} finally {
			session.close();
		}
	}

	/**
	 * 保存实体
	 * 
	 * @param object
	 * @throws Exception
	 */
	public void saveModel(Object object) throws Exception {
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.save(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw new Exception(e);
		} finally {
			session.close();
		}
	}

	/**
	 * 删除实体
	 * 
	 * @param object
	 * @throws Exception
	 */
	public void deleteModel(Object object) throws Exception {
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			session.beginTransaction();
			session.delete(object);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			throw new Exception(e);
		} finally {
			session.close();
		}
	}

}
