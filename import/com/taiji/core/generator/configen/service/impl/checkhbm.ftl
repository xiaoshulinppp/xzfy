<?xml version="1.0"?>
<!DOCTYPE hibernate-mapping PUBLIC
    "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
    "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd" >
    
<hibernate-mapping package="com.taiji.infogather.domain">
<class 
    name="${classname}" 
    table="${tablename}"
    dynamic-update="true"
	dynamic-insert="true"    
>
    <id
        name="id"
        type="java.lang.Integer"
        column="id"
    >
        <generator class="increment" />
    </id>

    <property
        name="proposer"
        type="java.lang.Integer"
        column="proposer"
		not-null="true"
    />
   <property
        name="applyTime"
        type="java.lang.String"
        column="applaytime"
        not-null="true"
    />
    <property
        name="reporter"
        type="java.lang.Integer"
        column="reporter"

    />
   <property
        name="advice"
        type="java.lang.String"
        column="advice"
      
    />	
    <property
        name="checkTime"
        type="java.lang.String"
        column="time1"

    />
   <property
        name="parents"
        type="java.lang.String"
        column="parents"
 
    />	
   <property
        name="positionid"
        type="java.lang.Integer"
        column="positionid"
 
    />	
    <property
        name="nextPosition"
        type="java.lang.Integer"
        column="nextposition"
	
    />
   <property
        name="reject"
        type="java.lang.Integer"
        column="reject"
        not-null="true"
    />	
    <property
        name="state"
        type="java.lang.Integer"
        column="state"
		not-null="true"
    />
   <property
        name="endFlag"
        type="java.lang.Integer"
        column="endflag"
        not-null="true"
    />	
    <many-to-one name="${infoObject}" cascade="all"
			column="infoid" class="${infoClass}" unique="true" not-null="true"/>
</class>
</hibernate-mapping>
