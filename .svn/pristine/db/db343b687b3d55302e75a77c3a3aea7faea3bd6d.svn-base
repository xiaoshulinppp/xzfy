package com.sinosoft.completesyn;


import javax.xml.namespace.QName;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

public class Test {

	public static void main(String[] args) {
		try {
			String endpoint = "http://localhost:8011/webIscp/services/Synchronization?wsdl";

			Service service = new Service();
			Call call = null;
			QName qn = new QName(
					"http://localhost:8011/webIscp/services/Synchronization",
					"synchronizedUserInfo");
			call = (Call) service.createCall();
			// 注册序列化和反序列化类
//			call.registerTypeMapping(Activity.class, qn,
//					new BeanSerializerFactory(Activity.class, qn),
//					new BeanDeserializerFactory(Activity.class, qn));
//			// 设置返回类型
//			call.setReturnType(qn, Activity[].class);
			call.setOperationName(qn);
			call.setTargetEndpointAddress(new java.net.URL(endpoint));
//			call.addParameter("activity", qn, javax.xml.rpc.ParameterMode.IN);

//			Activity activity = new Activity();
//			activity.setReference("8888");
			Boolean ret = (Boolean) call.invoke(new Object[] { 11,"6c5e055155698fb3f6eeb8d6d270fb76","1" });
			System.out.println("return value is " + ret);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
