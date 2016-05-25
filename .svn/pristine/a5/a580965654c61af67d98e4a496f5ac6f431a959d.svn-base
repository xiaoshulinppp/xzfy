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
      <td class="tdFormRight"><@ww.textfield  name="'ptree.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'" theme="'simple'"/>
  <#if post.type == "1">
   </td></tr>
  <tr class="trcolor">
      <td class="tdFormleft">上报级别上限</td>
      <td class="tdFormRight"><@ww.textfield  name="'ptree.max'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="'simple'"/></td>
  </tr>
    <tr class="trwhite">
      <td class="tdFormleft">上报级别下限</td>
      <td class="tdFormRight"><@ww.textfield  name="'ptree.min'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="'simple'"/></td>
  </tr>
  </#if>
  <#if post.type != "1">
   <input type ='hidden' name="ptree.max" value="1"/>
   <input type ='hidden' name="ptree.min" value="1"/>
   </td></tr>
  </#if>
  <tr class="trcolor">
      <td class="tdFormleft">状态</td>
      <td class="tdFormRight"><@ww.select name="'ptree.enable'"  cssClass ="'selectStyleNormal'" list="getDictMap('state')"  disabled ="'${showState}'"  theme="'simple'"/></td>
   </tr>
 </table>