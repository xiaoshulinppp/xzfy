package com.taiji.fzb.webwork;

import java.rmi.RemoteException;

import com.taiji.fzb.domain.XzfyInfo;

import localhost.webIscp.services.dateTransfer_nei.DateTransfer_neiProxy;
import net.sf.json.JSONObject;

public class testJson {

	public static void main(String[] args) throws RemoteException {
		
		//撒旦法$2131$2013-1-18$撒旦法
		
		String fy[]={"撒旦法$2131$2013-1-18$撒旦法&撒旦法$2131$2013-1-18$撒旦法"};
		
		 String bb[]=fy[0].split("&");
        String bb4[]=bb[0].split("\\$");
		
        String aa[]={"刘全成$男$身份证号130627198912084613$送达地址盛大发售$邮编121212$电话12121212"};
         String bb2= aa[0].replaceAll("\\$", ",");
        //刘全成$男$身份证号130627198912084613$送达地址盛大发售$邮编121212$电话12121212
		
		
		
		
		
		DateTransfer_neiProxy da =new DateTransfer_neiProxy();  
	    	
		// String ss=da.saveTest("ssssssssss");
		// System.out.println(ss);
//String s1={"casenum":"","xzfy_requset":"1撤销该具体行政行为","secondSubmitDate":"","receive_address":"","delay_reason":"","refer":"","pizhunren3":"","jdGzContent":"","pizhunren1":"","pizhunren2":"","casetype2":"","jdbl_flag":"","app_advice_type":"","laixin_post":"","isBuzheng":"","breakReport":"","tiaojie_result":"","buzheng_from":"2013年9月16日（阿斯顿发）","isdelay_from":"","adviseFile":"","receive_real_date":"2016-07-18","songdaquerenFlag":"","user4_id":"","tiaojiejilu":"","tb_time":"","admit2":"","admit1":"","caseyear":"","nationMoneyDetail":"","app_show":"","resarch":"","finish_date":"","app_type":"1","advise":"","user3_id":"","user2_id":"","tiaojiejilu1":"","reception2":"","zhongzhispdate":"","jdFileContent":"","firstSubmitResult":"","zhidaosj":"","proxy":"","tiaojie_from":"2016-07-18","break_right":"北京市人民政府","check_name":"","tiaojie_count":"","keyword2":"","keyword3":"","endFile":"","tAppDeptId":"1500","ismoney":"否","istingzheng":"","dftzstatus":"","matter_type":"0","user1_name":"","jianyi_file":"","receive_type":"1","xwnum":"阿斯顿发","jddetail":"","laixin_tel":"","content_abstract":"申请人不服北京市平谷区人民政府阿斯顿发（阿斯顿发）","hasanshen":"","fuyifs":"","xzfy_requset_retail":"","issame_detail":"","issame":"","lian_date":"","execute_date":"","xwname":"阿斯顿发","tb_flag":"","agent_address":"","pizhunren":"","opinion":"","jiansuom":"122233331442492","renCount":"1","is_commit":"","shishiyuly":"按时发生","admit2_id":"","zhize":"","is_prof":"0","agent":"0","app_advice_detail":"","delayAdvice":"","admit1_id":"","pifuyijian3":"","isMany":"否","agent_name":"","pifuyijian2":"","pifuyijian1":"","buzhengDelay":"","trailMode":"","laixin_name":"","bzTongzhiriqi":"","defendant_type":"5","defendant_name":"北京市平谷区人民政府","jiedai_file":"","caseindex":"201600000037","bzAdvice":"","appdetail":"( 1 )刘全成，男，身份证号：130627198912084613，送达地址：松岛枫，邮编：444333，电话：22223333； 共计  1 人","shouju_flag":"","hastingzheng":"","bzBuqiriqi":"","user1_id":"","jaAdvice":"","yijian_file":"","tjzfzh":"","lian_real_date":"","jieanspdate":"","buzhengContentType":"","casestatus":"","money_detail":"","tPoliceIsParade":"0","isdelay":"","casetype":"","fenpei_name":"","defendant_real_name":"","agent_date":"","other_commit":"","user3_name":"","isstop":"","receiveAnswerDate":"","agentDetail_cang":"","guanli1":"","guanli3":"","guanli2":"","menu":"","require_fy":"阿斯顿发（阿斯顿发）；知道时间：2013年9月16日（阿斯顿发）；共1件","deputy_show":"","appdetail_cang":"刘全成$男$身份证号130627198912084613$送达地址松岛枫$邮编444333$电话22223333&","third":"","ismanage":"0","buzhengspdate":"","bzTongzhifangshi":"","bztz_flag":"","check_status":"0","issafe":"","jdBzContent":"","mid_tiaojie":"","jdRenshu":"","third_agent":"","yuedusj":"","opinionFile":"","xzfy_org":"省部级行政机关","user4_name":"","breakTo":"","app_type1":"","app_type2":"","isstop_from":"","buzheng_to":"","check_file":"","matter_detail":"","yanzhengsj":"12223333","laixin_address":"","user2_name":"","remark":"","delayTo":"","jieanwenshu":"","huifuspdate":"","checkMail":"1212@qq.com","isdelay_to":"","stadardResult":"","manage_type":"","caseorg":"0000","require_fy_cang":"阿斯顿发$阿斯顿发$2013-9-16$阿斯顿发&","dbrDetail":"","stop_reason":"","receive_date":"","isstop_to":"","stop_detail":"","isBreak":"","handleReason":"","status":"1","hasdiaocha":"","money_file":"暗示法士大夫","pifuyijian":"","referother":"","refer2":"","receive_detail":"","yanqispdate":"","breakAdvice":"","ischeck":"否","agentDetail":"","fenpei_id":"","isBuzhengshenpi":"","has_tingzheng":"","tiaojie_to":"","istiaojie":"","pizhunriqi":"","id":"20160718144249255790","firstSubmitDate":"","finish_type":"","duty":"","currentuser":"0000","isfront":"","bsqrSpecial":"","secondSubmitResult":"","finishBreakType":"","delayReport":"","zl_time":"","is_prof_detail":"","finish_real_date":"","pizhunriqi2":"","pizhunriqi1":"","safeContent":"","check_id":"","keyword":"","laAdvice":"","time_show":"","hastiaojie":"","delay_detail":"","reception":"","nationMoney":"","otherTrailMode":"","lianspdate":"","condition_type":"","sentAnswerDate":"","isAnswer":""};
		//{"casenum":"","xzfy_requset":"1撤销该具体行政行为","secondSubmitDate":"","receive_address":"","delay_reason":"","refer":"","pizhunren3":"","jdGzContent":"","pizhunren1":"","pizhunren2":"","casetype2":"","jdbl_flag":"","app_advice_type":"","laixin_post":"","isBuzheng":"","breakReport":"","tiaojie_result":"","buzheng_from":"2013年9月16日（阿斯顿发）","isdelay_from":"","adviseFile":"","receive_real_date":"2016-07-18","songdaquerenFlag":"","user4_id":"","tiaojiejilu":"","tb_time":"","admit2":"","admit1":"","caseyear":"","nationMoneyDetail":"","app_show":"","resarch":"","finish_date":"","app_type":"1","advise":"","user3_id":"","user2_id":"","tiaojiejilu1":"","reception2":"","zhongzhispdate":"","jdFileContent":"","firstSubmitResult":"","zhidaosj":"","proxy":"","tiaojie_from":"2016-07-18","break_right":"北京市人民政府","check_name":"","tiaojie_count":"","keyword2":"","keyword3":"","endFile":"","tAppDeptId":"1500","ismoney":"否","istingzheng":"","dftzstatus":"","matter_type":"0","user1_name":"","jianyi_file":"","receive_type":"1","xwnum":"阿斯顿发","jddetail":"","laixin_tel":"","content_abstract":"申请人不服北京市平谷区人民政府阿斯顿发（阿斯顿发）","hasanshen":"","fuyifs":"","xzfy_requset_retail":"","issame_detail":"","issame":"","lian_date":"","execute_date":"","xwname":"阿斯顿发","tb_flag":"","agent_address":"","pizhunren":"","opinion":"","jiansuom":"122233331442492","renCount":"1","is_commit":"","shishiyuly":"按时发生","admit2_id":"","zhize":"","is_prof":"0","agent":"0","app_advice_detail":"","delayAdvice":"","admit1_id":"","pifuyijian3":"","isMany":"否","agent_name":"","pifuyijian2":"","pifuyijian1":"","buzhengDelay":"","trailMode":"","laixin_name":"","bzTongzhiriqi":"","defendant_type":"5","defendant_name":"北京市平谷区人民政府","jiedai_file":"","caseindex":"201600000037","bzAdvice":"","appdetail":"( 1 )刘全成，男，身份证号：130627198912084613，送达地址：松岛枫，邮编：444333，电话：22223333； 共计  1 人","shouju_flag":"","hastingzheng":"","bzBuqiriqi":"","user1_id":"","jaAdvice":"","yijian_file":"","tjzfzh":"","lian_real_date":"","jieanspdate":"","buzhengContentType":"","casestatus":"","money_detail":"","tPoliceIsParade":"0","isdelay":"","casetype":"","fenpei_name":"","defendant_real_name":"","agent_date":"","other_commit":"","user3_name":"","isstop":"","receiveAnswerDate":"","agentDetail_cang":"","guanli1":"","guanli3":"","guanli2":"","menu":"","require_fy":"阿斯顿发（阿斯顿发）；知道时间：2013年9月16日（阿斯顿发）；共1件","deputy_show":"","appdetail_cang":"刘全成$男$身份证号130627198912084613$送达地址松岛枫$邮编444333$电话22223333&","third":"","ismanage":"0","buzhengspdate":"","bzTongzhifangshi":"","bztz_flag":"","check_status":"0","issafe":"","jdBzContent":"","mid_tiaojie":"","jdRenshu":"","third_agent":"","yuedusj":"","opinionFile":"","xzfy_org":"省部级行政机关","user4_name":"","breakTo":"","app_type1":"","app_type2":"","isstop_from":"","buzheng_to":"","check_file":"","matter_detail":"","yanzhengsj":"12223333","laixin_address":"","user2_name":"","remark":"","delayTo":"","jieanwenshu":"","huifuspdate":"","checkMail":"1212@qq.com","isdelay_to":"","stadardResult":"","manage_type":"","caseorg":"0000","require_fy_cang":"阿斯顿发$阿斯顿发$2013-9-16$阿斯顿发&","dbrDetail":"","stop_reason":"","receive_date":"","isstop_to":"","stop_detail":"","isBreak":"","handleReason":"","status":"1","hasdiaocha":"","money_file":"暗示法士大夫","pifuyijian":"","referother":"","refer2":"","receive_detail":"","yanqispdate":"","breakAdvice":"","ischeck":"否","agentDetail":"","fenpei_id":"","isBuzhengshenpi":"","has_tingzheng":"","tiaojie_to":"","istiaojie":"","pizhunriqi":"","id":"20160718144249255790","firstSubmitDate":"","finish_type":"","duty":"","currentuser":"0000","isfront":"","bsqrSpecial":"","secondSubmitResult":"","finishBreakType":"","delayReport":"","zl_time":"","is_prof_detail":"","finish_real_date":"","pizhunriqi2":"","pizhunriqi1":"","safeContent":"","check_id":"","keyword":"","laAdvice":"","time_show":"","hastiaojie":"","delay_detail":"","reception":"","nationMoney":"","otherTrailMode":"","lianspdate":"","condition_type":"","sentAnswerDate":"","isAnswer":""}
		 XzfyInfo info= new XzfyInfo();
		 info.setId("777777");
		 JSONObject json = JSONObject.fromObject(info);//将java对象转换为json对象
String str = json.toString();//将json对象转换为字符串
  
       String c2=da.saveJSON(str);
      System.out.println(c2);

JSONObject obj = ((JSONObject) new JSONObject()).fromObject(str);//将json字符串转换为json对象
//将json对象转换为java对象
XzfyInfo xzfyInfo2 = (XzfyInfo)JSONObject.toBean(obj,XzfyInfo.class);//将建json对象转换为Person对象
 
		 
	}

}
