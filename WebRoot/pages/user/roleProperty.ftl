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
      <td class ="tdFormLeft">角色名称</td>
      <td class="tdFormRight"><@ww.textfield  name="'role.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">权限</td>
      <td class="tdFormRight"><@ww.checkboxlist name="'selectPermission'"   tabindex = "4"  list="getAllPermission()" disabled ="'${showState}'" value="getAllCutsomPermission()" theme="simple"/></td>
  </tr>
 </table>