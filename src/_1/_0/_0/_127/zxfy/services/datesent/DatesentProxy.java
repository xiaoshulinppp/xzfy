package _1._0._0._127.zxfy.services.datesent;

public class DatesentProxy implements _1._0._0._127.zxfy.services.datesent.Datesent {
  private String _endpoint = null;
  private _1._0._0._127.zxfy.services.datesent.Datesent datesent = null;
  
  public DatesentProxy() {
    _initDatesentProxy();
  }
  
  public DatesentProxy(String endpoint) {
    _endpoint = endpoint;
    _initDatesentProxy();
  }
  
  private void _initDatesentProxy() {
    try {
      datesent = (new _1._0._0._127.zxfy.services.datesent.DatesentServiceLocator()).getdatesent();
      if (datesent != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)datesent)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)datesent)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (datesent != null)
      ((javax.xml.rpc.Stub)datesent)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public _1._0._0._127.zxfy.services.datesent.Datesent getDatesent() {
    if (datesent == null)
      _initDatesentProxy();
    return datesent;
  }
  
  public java.lang.String test(java.lang.String name) throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.test(name);
  }
  
  public java.lang.Object[] sentObject(java.lang.String operateCode) throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.sentObject(operateCode);
  }
  
  public java.lang.Object[] sentdogs() throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.sentdogs();
  }
  
  public java.lang.String sendname(java.lang.String id) throws java.rmi.RemoteException{
    if (datesent == null)
      _initDatesentProxy();
    return datesent.sendname(id);
  }
  
  
}