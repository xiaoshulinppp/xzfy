package localhost.webIscp.services.dateTransfer_nei;

public class DateTransfer_neiProxy implements localhost.webIscp.services.dateTransfer_nei.DateTransfer_nei {
  private String _endpoint = null;
  private localhost.webIscp.services.dateTransfer_nei.DateTransfer_nei dateTransfer_nei = null;
  
  public DateTransfer_neiProxy() {
    _initDateTransfer_neiProxy();
  }
  
  public DateTransfer_neiProxy(String endpoint) {
    _endpoint = endpoint;
    _initDateTransfer_neiProxy();
  }
  
  private void _initDateTransfer_neiProxy() {
    try {
      dateTransfer_nei = (new localhost.webIscp.services.dateTransfer_nei.DateTransfer_neiServiceLocator()).getdateTransfer_nei();
      if (dateTransfer_nei != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)dateTransfer_nei)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)dateTransfer_nei)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (dateTransfer_nei != null)
      ((javax.xml.rpc.Stub)dateTransfer_nei)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public localhost.webIscp.services.dateTransfer_nei.DateTransfer_nei getDateTransfer_nei() {
    if (dateTransfer_nei == null)
      _initDateTransfer_neiProxy();
    return dateTransfer_nei;
  }
  
  public java.lang.String saveJSON(java.lang.String cc) throws java.rmi.RemoteException{
    if (dateTransfer_nei == null)
      _initDateTransfer_neiProxy();
    return dateTransfer_nei.saveJSON(cc);
  }
  
  public java.lang.String saveTest(java.lang.String cc) throws java.rmi.RemoteException{
    if (dateTransfer_nei == null)
      _initDateTransfer_neiProxy();
    return dateTransfer_nei.saveTest(cc);
  }
  
  
}