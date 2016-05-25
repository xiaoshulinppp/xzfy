<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form name="menuPermListForm" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace" >
  <tr>
            <td>${action.getText("current.location")}:${action.getText("menuperm.title")}</td>
      </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("menuperm.title")}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
  <@ww.textfield name="'selectFuncName'"  theme ="simple"/><input type="button" value="选择" class="button" onclick="GetSelectFunc('','0','menuPermListForm','selectFuncName','selectFunc','pickselect1',true)">
                ${action.getText("menuperm.oplist")}:<@ww.select name="'selectOp'" list="opList" multiple="'true'" theme ="simple"/>
               <input name="Button" type="button" class="button" value="${action.getText("create.text")}" onclick="FormSubmit('create')">
               <input name="Button" type="button" class="button" value="${action.getText("delete.text")}" onclick="FormSubmit('delete')">
               <input name="Button" type="button" class="button" value="${action.getText("close.text")}" onclick="javascirpt:window.close()">
           </td>
        </tr>
    </table></td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
    <tr>
      <th width="40" class="thListNormal"><input type="checkbox" name="selectAllCheckbox" onclick="selectAll('selectAllCheckbox','selectRecord')"></th> 
      <th class="thListNormal">${action.getText("menuperm.funcname")}</th>
      <th class="thListNormal">${action.getText("menuperm.opname")}</th> 
   </tr>
  
   <#list menuFuncList.items as item >   
   <tr class="trcolor">
    <td class="tdlistCenter"><input type="checkbox" name="selectRecord" value=${item[0]}></td>  
     <td class="tdlistCenter">${item[1]}</td> 
     <td class="tdlistCenter">${item[2]}</td>
  </tr>
  </#list>
</table>
<@pagnation.pagnation formName="menuPermListForm" currentPage="${pageNum}" totalPage="${menuFuncList.totalPage}" reqUrl="../user/viewMenuPermission.action" params="funcCode=${funcCode}&permId=${permId}"/>

<script>
  function FormSubmit(opName) {
     window.menuPermListForm.action="../user/"+opName+"MenuPermission.action";
     window.menuPermListForm.submit();
  }
 
    function MM_openBrWindow(theURL,winName,features) {
  window.open(theURL,winName,features);
  }
  
	function GetSelectFunc(fliterCond,parentId,form_name,field_name,field_id,func,multiSelect){
		window.open("../system/funcSelected.action?funcCode=${funcCode}&fliterCond="+fliterCond+"&entityId="+parentId+"&formName=" + form_name + "&fieldName=" + field_name + "&fieldId=" + field_id + "&func=" + func + "&multiSelect=" + multiSelect,"","width=300,height=500,resizable=1,scrollbars=1,left=50,top=50");
	}
</script>
<input type ='hidden' name ='selectFunc'>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
<input type ='hidden' name ='permId' value='${permId}'>
</form>
</body>
</html>