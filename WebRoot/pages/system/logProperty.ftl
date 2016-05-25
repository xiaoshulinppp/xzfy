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
      <td class ="tdFormLeft">操作人</td>
      <td class="tdFormRight"><@ww.textfield  name="'log.creatorName'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">操作时间</td>
      <td class="tdFormRight"><@ww.textfield  name="'log.createTime'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">操作内容</td>
      <td class="tdFormRight"><@ww.textfield  name="'log.content'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">操作类型</td>
      <td class="tdFormRight"><@ww.textfield  name="'log.typeName'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>

 </table>