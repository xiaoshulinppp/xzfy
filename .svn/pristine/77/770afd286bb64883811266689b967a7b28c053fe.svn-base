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
      <td class ="tdFormleft">数据库表名</td>
      <td class="tdFormRight"><@ww.textfield  name="'table.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">域表名</td>
      <td class="tdFormRight"><@ww.textfield  name="'table.mappingName'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">显示名</td>
      <td class="tdFormRight"><@ww.textfield  name="'table.showName'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">描述</td>
      <td class="tdFormRight"><@ww.textarea name="'table.desc'"  cols="40" rows="5" cssClass="'textarea'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/></td>
 </tr>
 </table>