<#assign showState = "false">
<#if opName == "view">
  <#assign showState="true">
</#if>
  <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr>
      <th class="thFormNormal"></th>
      <th class="thFormNormal"></th>
      <th class="thFormNormal"></th>
      <th class="thFormNormal"></th>
      </tr>
   <tr class="trwhite">
      <td class ="tdFormText">名称</td>
      <td class="tdFormInput"><@ww.textfield  name="'dictItem.name'"  cssClass ="'inputTextNormal'"  disabled ="'${showState}'"  theme="'simple'"/><font color=red>**</font></td>
       <td class="tdFormText">缩写</td>
      <td class="tdFormInput"><@ww.textfield  name="'dictItem.abbr'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="'simple'"/><font color=red>**</font></td>
  </tr>
    <tr class="trcolor">
      <td class="tdFormText">字典值</td>
      <td class="tdFormInput"><@ww.textfield  name="'dictItem.value'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="'simple'"/><font color=red>**</font></td>
      <td class="tdFormText">字典显示顺序</td>
      <td class="tdFormInput"><@ww.textfield  name="'dictItem.seq'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="'simple'" /><font color=red>**</font></td>
  
  </tr>
  <tr class="trcolor">
      <td class="tdFormText">状态</td>
		<#if dictItem?exists><#assign state=dictItem.state?default(1)></#if>      
      <td class="tdFormInput"><@ww.select  name="'dictItem.state'"   value="'${state?default(1)}'.toString()"  list="getDictMap('state')"  cssClass ="'selectStyleNormal'" disabled ="'${showState}'"  theme="'simple'"/><font color=red>**</font></td>
  </tr>

 </table>