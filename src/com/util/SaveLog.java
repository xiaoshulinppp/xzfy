package com.util;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.taiji.core.webwork.action.ProtectedDetailAction;

@SuppressWarnings("serial")
public class SaveLog extends ProtectedDetailAction{
	
	public String  save_log(String status,String caozuo,String xzfyId,Object objOld,Object objNew){
		
		//判断案件状态
		String stage ="";
		//log_info
		String info="";
		if(status.equals("1")) {
			stage="立案审查";
		}
		if(status.equals("2")) {
			stage="补正审批";
		} else if (status.equals("3")) {
			stage="立案审批";
		} else if (status.equals("4")) {
			stage="案件办理";
		} else if (status.equals("5")) {
			stage="延期审批";
		} else if (status.equals("6")) {
			stage="案件延期";
		} else if (status.equals("7")) {
			stage="中止审批";
		} else if (status.equals("8")) {
			stage="案件中止";
		} else if (status.equals("9")) {
			stage="恢复审理审批";
		} else if (status.equals("10")) {
			stage="恢复审理";
		} else if (status.equals("11")) {
			stage="结案审批";
		} else if (status.equals("12")) {
			stage="结案";
		}
		
		
		//update_name
		String user = UserUtil.getUserName();		
		//log_info
		info = user + "在" +stage + "阶段" + caozuo;
		//判断对象内容是否被修改
		try {
			info += " 在" +stage + "阶段 " + this.objectCompare(objOld,objNew);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//log_time
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String logTime = df.format(new Date());
		
//		XzfyLog log = new XzfyLog();
//		log.setLog_info(info);
//		log.setLog_time(logTime);
//		log.setUpdate_name(user);
//
//		//XzfyInfo xzfyInfo = (XzfyInfo) this.coreService.getEntityObjectById(XzfyInfo.class, xzfyId);
//		log.setXzfyId(xzfyId);
//		this.coreService.save(log);
		
		return SUCCESS;
	}
	
	private String objectCompare(Object ob1,Object ob2) throws IntrospectionException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		if(ob1==null&&ob2==null){
			return "";
		}
		Class clazz = ob1.getClass();
		String r = clazz.getName();
		Field[] fields = ob1.getClass().getDeclaredFields();
		for (Field field:fields){
			System.out.println(field.getType().getName());
			if (field.getType() !=null &&field.getType().getName().equals("java.lang.String")){
				PropertyDescriptor pd = new PropertyDescriptor(field
						.getName(), clazz);
				Method method = pd.getReadMethod();
				Object o1 = method.invoke(ob1);
				Object o2 = method.invoke(ob2);
				if(o1 !=null){
					if(o2 !=null){
						if (!o1.toString().equals(o2.toString())) {
							r+=field.getName() + "(" + o1.toString() + "|" + o2.toString() + ")被更改;";
							System.out.println(field.getName()+" has changed");
						}
					}else{
						r+=field.getName() + "(" + o1.toString() + "|null)被更改;";
					}
				}else{
					if(o2 !=null){
						r+=field.getName() + "(null|" + o2.toString() + ")被更改;";
					}
				}
			} 
		}
		if (r.equals(clazz.getName())){
			r+="无修改";
		}
		return r;
	}
	

	@Override
	public Class getPersistentClass() {
		// TODO Auto-generated method stub
		return null;
	}

}
