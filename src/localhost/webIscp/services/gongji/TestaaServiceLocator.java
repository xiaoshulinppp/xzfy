/**
 * TestaaServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package localhost.webIscp.services.gongji;

public class TestaaServiceLocator extends org.apache.axis.client.Service implements localhost.webIscp.services.gongji.TestaaService {

    public TestaaServiceLocator() {
    }


    public TestaaServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public TestaaServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for gongji
    private java.lang.String gongji_address = "http://localhost:8080/webIscp/services/gongji";

    public java.lang.String getgongjiAddress() {
        return gongji_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String gongjiWSDDServiceName = "gongji";

    public java.lang.String getgongjiWSDDServiceName() {
        return gongjiWSDDServiceName;
    }

    public void setgongjiWSDDServiceName(java.lang.String name) {
        gongjiWSDDServiceName = name;
    }

    public localhost.webIscp.services.gongji.Testaa getgongji() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(gongji_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getgongji(endpoint);
    }

    public localhost.webIscp.services.gongji.Testaa getgongji(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            localhost.webIscp.services.gongji.GongjiSoapBindingStub _stub = new localhost.webIscp.services.gongji.GongjiSoapBindingStub(portAddress, this);
            _stub.setPortName(getgongjiWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setgongjiEndpointAddress(java.lang.String address) {
        gongji_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (localhost.webIscp.services.gongji.Testaa.class.isAssignableFrom(serviceEndpointInterface)) {
                localhost.webIscp.services.gongji.GongjiSoapBindingStub _stub = new localhost.webIscp.services.gongji.GongjiSoapBindingStub(new java.net.URL(gongji_address), this);
                _stub.setPortName(getgongjiWSDDServiceName());
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
        if ("gongji".equals(inputPortName)) {
            return getgongji();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://localhost:8080/webIscp/services/gongji", "testaaService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://localhost:8080/webIscp/services/gongji", "gongji"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("gongji".equals(portName)) {
            setgongjiEndpointAddress(address);
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
