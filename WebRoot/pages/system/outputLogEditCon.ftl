<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/formControl.js"></script>
<script language="javascript" type="text/javascript" src="../common/calendar1.js"></script>
<script language="javascript" type="text/javascript" src="../common/Comm.js"></script>
<script language="javascript" type="text/javascript" src="../common/PopupDlg.js"></script>
<body>
<@ww.form  name="'logForm'" action ="'outputLog'"  method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
            <td>${action.getText("current.location")}:日志管理</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id=control class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr>
      <th class="thFormNormal"></th>
      <th class="thFormNormal"></th>
      </tr>
   <tr class="trwhite">
      <td class ="tdFormLeft">导出至</td>
      <td class="tdFormRight"><@ww.textfield  name="'param.logFilePath'"  cssClass ="'inputTextNormal'"   required = "'true'" theme="simple"/></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">日志起始时间</td>
      <td class="tdFormRight"><@ww.textfield  name="'param.logStartTime'"  cssClass ="'inputTextNormal'"   theme="simple"/><input type="button" value=">>" class="button" onclick="GetSelectDate('param.logStartTime')" ></td>
  </tr>
   <tr class="trwhite">
      <td class="tdFormleft">日志终止起始时间</td>
      <td class="tdFormRight"><@ww.textfield  name="'param.logEndTime'"  cssClass ="'inputTextNormal'"   theme="simple"/><input type="button" value=">>" class="button" onclick="GetSelectDate('param.logEndTime')" ></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">日志类型</td>
      <td class="tdFormRight"><select class="selectStyleNormal" name="param.logType">
<option value="1">DEBUG
<option value="2">INFO
<option value="3">WARN
<option value="4">ERROR
</select></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">日志操作人</td>
      <td class="tdFormRight"><@ww.textfield  name="'logPersonName'"  cssClass ="'inputTextNormal'"   theme="simple"/><input type ='hidden' name ='param.logPersonId'>
      <input name="selectB" type="button" width="20" value="选择" onClick="select_item('0','logForm','logPersonName','param.logPersonId','pickselect1',true)"></td>
  </tr>
 </table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <input  name="Button22" type="submit" class="button" value="导出" > 
      <input  name="Button42" type="button" class="button" value="关闭" onClick ="window.close()">
    </td>
  </tr>
</table>
<br>
<script language="JavaScript">
	function select_item(orgid,form_name,field_name,field_id,func,multiSelect){
		window.open("../user/userSelected.action?funcCode=${funcCode}&entityId="+orgid+"&formName="+form_name+"&fieldName="+field_name+"&fieldId="+field_id+"&function="+func+"&multiSelect="+multiSelect,"","width=300,height=200,resizable=1,scrollbars=1,left=50,top=50");
	}
</script>
<input type ='hidden' name ='funcCode' value='${funcCode}'>
</@ww.form>
</body>
</html>