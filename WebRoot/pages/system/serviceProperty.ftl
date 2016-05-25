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
      <td class ="tdFormLeft">服务名称</td>
      <td class="tdFormRight"><@ww.textfield  name="'serviceVO.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">服务英文名</td>
      <td class="tdFormRight"><@ww.textfield  name="'serviceVO.serviceName'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">服务路径</td>
      <td class="tdFormRight"><@ww.textfield  name="'serviceVO.servicePath'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">服务描述</td>
      <td class="tdFormRight"><@ww.textarea name="'serviceVO.desc'"  cols="40" rows="5" cssClass="'textarea'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/></td>
 </tr>
 <tr class="trwhite">
      <td class="tdFormleft">服务状态</td>
      <td class="tdFormRight"><@ww.select  name="'serviceVO.state'"     list="getDictMap('state')"  cssClass ="'selectStyleNormal'" disabled ="'${showState}'"  theme="'simple'"/><font color=red>**</font></td>
  </tr>
 </table>