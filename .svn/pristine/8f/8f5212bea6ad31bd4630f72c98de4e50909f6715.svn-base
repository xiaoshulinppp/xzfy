<#assign showState = "false">
<#if opName == "view">
  <#assign showState="true">
</#if>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr>
      <th class="thFormNormal"></th>
      <th class="thFormNormal"></th>
      </tr>
   <tr class="trwhite">
      <td class ="tdFormLeft">用户组名</td>
      <td class="tdFormRight"><@ww.textfield  name="'group.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
   
   <input type="hidden" name="uservaluelist"/>
 </table>
 <script language="JavaScript">
	function select_item(dept_id,form_name,field_name,field_id,func,multiSelect){
		window.open("../user/userSelected.action?entityId="+dept_id+"&formName="+form_name+"&fieldName="+field_name+"&fieldId="+field_id+"&function="+func+"&funcCode=${funcCode}&multiSelect="+multiSelect,"","width=300,height=200,resizable=1,scrollbars=1,left=50,top=50");
	}
</script>