<#assign objectName = "${table.getVariableName()}">
<#assign className = "${table.destinationClassName}">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${r"${action.getText('platform.name')}"}</title>
<link href="../${r"${Session['_USER_STYLE_'].cssPath}"}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/formControl.js"></script>
<script language="javascript" type="text/javascript" src="../common/calendar1.js"></script>
<script language="javascript" type="text/javascript" src="../common/Comm.js"></script>
<script language="javascript" type="text/javascript" src="../common/PopupDlg.js"></script>
<body>
${r"<@ww.form"} name="'${objectName}Form'"  validate="'true'" >
<div id="navi" style="position:relative; width:100%; height:expression(body.offsetHeight-control.offsetHeight-10);  left: 0px; top: 0px; overflow: auto" class="dbutton">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id=control class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>
${r"<#include"} "${objectName}Property.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
     
      <input name="Button22" type="button" class="button" value="${r"${action.getText('save.text')}"}" onclick="javascript:formSubmit()"> 
      <input name="Button42" type="reset" class="button" value="${r"${action.getText('close.text')}"}" onclick="javascript:window.close()">
    </td>
  </tr>
</table>
<br>

</div>
${r"<@ww.hidden"} name ="'funcCode'"/>
<#list table.relationshipRoles as relationshipRole >
      <#if relationshipRole.enabled>
       <#assign one2one = relationshipRole.relation.one2One>
       <#assign relationObjectName = table.getVariableName(relationshipRole)>
         ${r"<@ww.hidden"} name ="'${relationObjectName}Id'"/>
	   </#if>	
 
</#list>
<script language="javascript">
	function formSubmit(){
	    window.${objectName}Form.action="../info/doCreate${className}InLine.action";	    
	    window.${objectName}Form.submit();

    }
</script>
${r"</@ww.form>"}
</body>
</html>