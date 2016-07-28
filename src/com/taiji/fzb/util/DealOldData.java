package com.taiji.waf.cxproject.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.taiji.waf.cxproject.business.Declare;
import com.taiji.waf.cxproject.business.Filecoding;
import com.taiji.waf.cxproject.proxy.DeclareProxy;
import com.taiji.waf.cxproject.proxy.FilecodingProxy;
import com.taiji.waf.cxproject.proxy.HonourProxy;
import com.taiji.waf.cxproject.proxy.LicenseProxy;
import com.taiji.waf.cxproject.proxy.ManageCertifiProxy;
import com.taiji.waf.cxproject.proxy.PatentProxy;
import com.taiji.waf.cxproject.proxy.QualifiInfoProxy;
import com.taiji.waf.cxproject.proxy.TrademarkProxy;
import com.taiji.waf.cxproject.proxy.WelfareActivityProxy;
import com.taiji.waf.db.WAFDBConnectionFactory;
import com.taiji.waf.sys.business.WafUser;
import com.taiji.waf.sys.proxy.WafUserProxy;

public class DealOldData {

	public Filecoding filecodeing;

	public static List<Filecoding> getFilecodingList(Connection conn)
			throws SQLException {
		String sql = "select * from filecoding where info5='通过'";
		List list = FilecodingProxy.findFilecoding(sql, new Object[0], 0, 999,
				conn);
		return list;
	}

	public static List<Declare> getDeclareList(Connection conn)
			throws SQLException {
		String sql = "select * from declare where createuser like '%CXCJ%' or info15 like '%TEST%' or info15 is null";
		List list = DeclareProxy.findDeclare(sql, new Object[0], 0, 999, conn);
		return list;
	}

	public static void deleteEntityById(String sql, Connection conn)
			throws SQLException {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
	}

	// 步骤一：修改declare表的info15为企业编码、createuser为用户ID、info设置为不同意
	public static void updateDeclare(Connection conn, List<Filecoding> list)
			throws SQLException {
		for (int i = 0; i < list.size(); i++) {
			Filecoding fc = list.get(i);
			Declare declare = DeclareProxy.getDeclareById(fc.getInfo2(), conn);
			declare.setInfo15(fc.getCoding());
			declare.setInfo5("不同意");
			declare.setCreateuser(fc.getInfo1());
			System.out.println(i+"---:"+declare.getDeclareid());
			DeclareProxy.updateDeclare(declare, conn);
		}
	}

	// 步骤二：修改filecoding表info4为组织机构代码
	public static void updateFileCoding(Connection conn, List<Filecoding> list)
			throws SQLException {
		for (int i = 0; i < list.size(); i++) {
			Filecoding fc = list.get(i);
			Declare declare = DeclareProxy.getDeclareById(fc.getInfo2(), conn);
			fc.setInfo4(declare.getOrganizationcode());
			System.out.println(i+"---:"+fc.getCodingid());
			FilecodingProxy.updateFilecoding(fc, conn);
		}
	}

	// 步骤三：修改wafuser表数据
	public static void updateWafUser(Connection conn, List<Filecoding> list)
			throws SQLException {
		for (int i = 0; i < list.size(); i++) {
			Filecoding fc = list.get(i);
			WafUser user = WafUserProxy.getWafUserById(fc.getInfo1(), conn);
			user.setLoginName(fc.getInfo4());
			user.setUserName(fc.getInfo3());
			user.setNation("1");
			user.setUserType(fc.getCoding().split("-")[2]);
			System.out.println(i+"---:"+user.getUserId());
			WafUserProxy.updateWafUser(user, conn);
		}
	}

	// 步骤四：删除未提交、不通过的相关数据
	public static void deleteData(Connection conn) throws SQLException {
		String deluser = "delete from wafuser where username like '%CXCJ%' or username like '%TEST%' or usertype='TEST'";
		String delfilecoding = "delete from filecoding where info5!='通过' or coding like '%TEST%'";

		deleteEntityById(deluser, conn);
		deleteEntityById(delfilecoding, conn);

		List<Declare> list = getDeclareList(conn);
		for (int i = 0; i < list.size(); i++) {
			String id = list.get(i).getDeclareid();
			// 资格资质信息
			QualifiInfoProxy.deleteQualifiInfoByDId(id, conn);
			// 生产/经营许可证信息 license
			LicenseProxy.deleteLicenseByDId(id, conn);
			// 注册商标信息 trademark
			TrademarkProxy.deleteTrademarkByDId(id, conn);
			// 专利信息 patent
			PatentProxy.deletePatentByDId(id, conn);
			// 管理体系认证信息 manageCertifi
			ManageCertifiProxy.deleteManageCertifiByDId(id, conn);
			// 近三年获得的荣誉奖励信息 honour
			HonourProxy.deleteHonourByDId(id, conn);
			// 近三年参加社会公益活动情况welfareActivity
			WelfareActivityProxy.deleteWelfareActivityByDId(id, conn);

			System.out.println(i+"---:"+id);
			DeclareProxy.deleteDeclareById(id, conn);
		}

	}

	// 步骤五：手动修改协会用户usertype为对应的协会标示，username为协会名称；管理员的usertype为GLY;强制登陆标示
	/**
	 * @param args
	 */
	//修改declare表结构
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = WAFDBConnectionFactory.getInstance().getConnection();
			List<Filecoding> fList = getFilecodingList(conn);
			// ------------步骤一
			//updateDeclare(conn,fList);
			// ------------步骤二
			//updateFileCoding(conn,fList);
			// ------------步骤三
			//updateWafUser(conn,fList);
			// ------------步骤四
			deleteData(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
