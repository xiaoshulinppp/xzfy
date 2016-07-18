/**
 * DateTransfer_neiServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package _1._0._0._127.webIscp.services.dateTransfer_nei;

public class DateTransfer_neiServiceLocator extends org.apache.axis.client.Service implements _1._0._0._127.webIscp.services.dateTransfer_nei.DateTransfer_neiService {

    public DateTransfer_neiServiceLocator() {
    }


    public DateTransfer_neiServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public DateTransfer_neiServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for dateTransfer_nei
    private java.lang.String dateTransfer_nei_address = "http://127.0.0.1:8080/webIscp/services/dateTransfer_nei";

    public java.lang.String getdateTransfer_neiAddress() {
        return dateTransfer_nei_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String dateTransfer_neiWSDDServiceName = "dateTransfer_nei";

    public java.lang.String getdateTransfer_neiWSDDServiceName() {
        return dateTransfer_neiWSDDServiceName;
    }

    public void setdateTransfer_neiWSDDServiceName(java.lang.String name) {
        dateTransfer_neiWSDDServiceName = name;
    }

    public _1._0._0._127.webIscp.services.dateTransfer_nei.DateTransfer_nei getdateTransfer_nei() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(dateTransfer_nei_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getdateTransfer_nei(endpoint);
    }

    public _1._0._0._127.webIscp.services.dateTransfer_nei.DateTransfer_nei getdateTransfer_nei(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            _1._0._0._127.webIscp.services.dateTransfer_nei.DateTransfer_neiSoapBindingStub _stub = new _1._0._0._127.webIscp.services.dateTransfer_nei.DateTransfer_neiSoapBindingStub(portAddress, this);
            _stub.setPortName(getdateTransfer_neiWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setdateTransfer_neiEndpointAddress(java.lang.String address) {
        dateTransfer_nei_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (_1._0._0._127.webIscp.services.dateTransfer_nei.DateTransfer_nei.class.isAssignableFrom(serviceEndpointInterface)) {
                _1._0._0._127.webIscp.services.dateTransfer_nei.DateTransfer_neiSoapBindingStub _stub = new _1._0._0._127.webIscp.services.dateTransfer_nei.DateTransfer_neiSoapBindingStub(new java.net.URL(dateTransfer_nei_address), this);
                _stub.setPortName(getdateTransfer_neiWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("dateTransfer_nei".equals(inputPortName)) {
            return getdateTransfer_nei();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://127.0.0.1:8080/webIscp/services/dateTransfer_nei", "dateTransfer_neiService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://127.0.0.1:8080/webIscp/services/dateTransfer_nei", "dateTransfer_nei"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("dateTransfer_nei".equals(portName)) {
            setdateTransfer_neiEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
