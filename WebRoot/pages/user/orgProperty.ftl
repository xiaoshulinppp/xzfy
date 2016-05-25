<#assign showState = "false">
<#if opName?exists && opName == "view">
  <#assign showState="true">
</#if>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
	<tr>
		<th colspan="2" class="thFormNormal" id="title">
			&nbsp;
		</th>
	</tr>
   <tr class="trcolor" >
      <td class ="tdFormText" style="width:30%">名称</td>
      <td class="tdFormInput" ><@ww.textfield  name="'org.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
    <tr class="trcolor">
      <td class ="tdFormText">编码</td>
      <td class="tdFormInput"><@ww.textfield name="'org.locbm'" cssClass="'inputTextNormal'" tabindex="'2'"    disabled ="'${showState}'" theme="simple" /><font color=red>**</font></td>
   </tr> 
   
    <tr class="trcolor">
      <td class ="tdFormText">上级主管（区县所属委办局才需要填写）</td>
      <td class="tdFormInput"><@ww.textfield name="'org.org_manage'" cssClass="'inputTextNormal'" tabindex="'2'"    disabled ="'${showState}'" theme="simple" /><font color=red></font></td>
   </tr> 
   
    <tr class="trcolor">
      <td class ="tdFormText">复议机关标识(1：是；0：否)</td>
      <td class="tdFormInput"><@ww.textfield name="'org.org_fy'" cssClass="'inputTextNormal'" tabindex="'2'"    disabled ="'${showState}'" theme="simple" /><font color=red>**</font></td>
   </tr> 
	<tr class="trcolor">
		<td class="tdFormText">当前状态</td>
		<#if org?exists><#assign state=org.state?default(-1)></#if>
		<td class="tdFormInput"><@ww.select  name="'org.state'" list="getDictMap('state')" cssClass="'selectStyleNormal'" disabled ="'${showState}'" theme ="simple" value="'${state?default(-1)}'.toString()"  /><font color=red>**</font></td>
	</tr>
   <tr class="trcolor">
      <td class ="tdFormText" width ="20%">用户所在组织机构类型：</td>
		<#if org?exists><#assign fyLv=org.fyLv?default(-1)></#if>
        <td class="tdFormInput" ><@ww.select  name="'org.fyLv'"  headerKey="''" headerValue="'--请选择--'"  list="getDictMap('fyLv')"   cssClass="'selectStyleNormal'"  theme ="simple" value="'${fyLv?default(-1)}'.toString()" /></td>
   </tr>
   <tr class="trcolor">
      <td class ="tdFormText" width ="20%">被申请人种类：</td>
  		<#if org?exists><#assign fyBeAppType=org.fyBeAppType?default(-1)></#if>
        <td class="tdFormInput" ><@ww.select  name="'org.fyBeAppType'"  headerKey="''" headerValue="'--请选择--'"  list="getDictMap('fyBeAppType')"   cssClass="'selectStyleNormal'"  theme ="simple" value="'${fyBeAppType?default(-1)}'.toString()" /></td>
   </tr>
   <tr class="trColor">
    	<td class="tdFormText" width ="10%">督报部门：</td>
    	<td class="tdFormInput">
  			<#if org?exists><#assign fyParent=org.fyParent?default(-1)></#if>
			<input type='hidden' name="org.fyParent" id="org.fyParent" value="${fyParent?default('')}"/>
    		<@ww.textfield readonly="true" name="'org.fyParentName'" id ="'org.fyParentName'" cssClass ="'inputTextNormal '"/>
    		<input name="fyParentButton"  type="button" class="button" value="选 择" onClick="typeTree('org.fyParent','org.fyParentName')"/>
    	</td>
    </tr>
   <tr class="trColor">
    	<td class="tdFormText" width ="10%">上级部门：</td>
    	<td class="tdFormInput">
  			<#if org?exists><#assign fySup=org.fySup?default(-1)></#if>
			<input type='hidden' name="org.fySup" id="org.fySup" value="${fySup?default('')}"/>
    		<@ww.textfield readonly="true" name="'org.fySupName'" id ="'org.fySupName'" cssClass ="'inputTextNormal '"/>
    		<input name="fySupButton"  type="button" class="button" value="选 择" onClick="typeTree('org.fySup','org.fySupName')"/>
    	</td>
    </tr>       
 </table>
<script> 
 	//类型树   
	function typeTree(field_id,field_name){
			var url="../user/typeTree.action?funcCode=${funcCode}&orgId=1&fieldName=" + field_name+"&fieldId="+field_id;
			window.open(url,"","width=350,height=500,resizable=1,scrollbars=1,left=50,top=50");
	}
</script>