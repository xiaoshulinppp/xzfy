package localhost;

import java.rmi.RemoteException;

import localhost.webIscp.services.gongji.TestaaProxy;

public class aaa {
	
	public static void main(String[] args) throws RemoteException {
		TestaaProxy tj=new TestaaProxy();
		String bb=tj.getmessage("jdj");
		
System.out.println("s"+bb);
	}
}
