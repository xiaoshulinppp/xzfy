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
      <td class ="tdFormLeft">名称</td>
      <td class="tdFormRight"><@ww.textfield  name="'op.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">缩写</td>
      <td class="tdFormRight"><@ww.textfield  name="'op.abbr'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">单项操作</td>
      <td class="tdFormRight"><@ww.select name="'op.single'" cssClass ="'selectStyleNormal'" list="getDictMap('optype')" disabled ="'${showState}'"  theme ="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">顺序</td>
      <td class="tdFormRight"><@ww.textfield  name="'op.seq'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
 </table>