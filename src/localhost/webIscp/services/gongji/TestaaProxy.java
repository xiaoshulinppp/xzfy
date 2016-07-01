package localhost.webIscp.services.gongji;

public class TestaaProxy implements localhost.webIscp.services.gongji.Testaa {
  private String _endpoint = null;
  private localhost.webIscp.services.gongji.Testaa testaa = null;
  
  public TestaaProxy() {
    _initTestaaProxy();
  }
  
  public TestaaProxy(String endpoint) {
    _endpoint = endpoint;
    _initTestaaProxy();
  }
  
  private void _initTestaaProxy() {
    try {
      testaa = (new localhost.webIscp.services.gongji.TestaaServiceLocator()).getgongji();
      if (testaa != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)testaa)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)testaa)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (testaa != null)
      ((javax.xml.rpc.Stub)testaa)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public localhost.webIscp.services.gongji.Testaa getTestaa() {
    if (testaa == null)
      _initTestaaProxy();
    return testaa;
  }
  
  public java.lang.String getmessage(java.lang.String name) throws java.rmi.RemoteException{
    if (testaa == null)
      _initTestaaProxy();
    return testaa.getmessage(name);
  }
  
  
}