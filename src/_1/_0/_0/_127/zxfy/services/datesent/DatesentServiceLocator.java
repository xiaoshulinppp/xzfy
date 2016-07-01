/**
 * DatesentServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package _1._0._0._127.zxfy.services.datesent;

public class DatesentServiceLocator extends org.apache.axis.client.Service implements _1._0._0._127.zxfy.services.datesent.DatesentService {

    public DatesentServiceLocator() {
    }


    public DatesentServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public DatesentServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for datesent
    private java.lang.String datesent_address = "http://127.0.0.1:8787/zxfy/services/datesent";

    public java.lang.String getdatesentAddress() {
        return datesent_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String datesentWSDDServiceName = "datesent";

    public java.lang.String getdatesentWSDDServiceName() {
        return datesentWSDDServiceName;
    }

    public void setdatesentWSDDServiceName(java.lang.String name) {
        datesentWSDDServiceName = name;
    }

    public _1._0._0._127.zxfy.services.datesent.Datesent getdatesent() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(datesent_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getdatesent(endpoint);
    }

    public _1._0._0._127.zxfy.services.datesent.Datesent getdatesent(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            _1._0._0._127.zxfy.services.datesent.DatesentSoapBindingStub _stub = new _1._0._0._127.zxfy.services.datesent.DatesentSoapBindingStub(portAddress, this);
            _stub.setPortName(getdatesentWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setdatesentEndpointAddress(java.lang.String address) {
        datesent_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (_1._0._0._127.zxfy.services.datesent.Datesent.class.isAssignableFrom(serviceEndpointInterface)) {
                _1._0._0._127.zxfy.services.datesent.DatesentSoapBindingStub _stub = new _1._0._0._127.zxfy.services.datesent.DatesentSoapBindingStub(new java.net.URL(datesent_address), this);
                _stub.setPortName(getdatesentWSDDServiceName());
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
        if ("datesent".equals(inputPortName)) {
            return getdatesent();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://127.0.0.1:8787/zxfy/services/datesent", "datesentService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://127.0.0.1:8787/zxfy/services/datesent", "datesent"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("datesent".equals(portName)) {
            setdatesentEndpointAddress(address);
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
