<#assign showState = "false">
<#if opName == "view">
  <#assign showState="true">
</#if>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr>
      <th class="thFormNormal"></th>
      <th class="thFormNormal"></th>
      </tr>
   <tr class="trcolor">
      <td class ="tdFormLeft">功能名称</td>
      <td class="tdFormRight"><@ww.textfield  name="'func.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" /><font color=red>**</font></td>
   </tr>
  <tr class="trwhite">
      <td class="tdFormleft">功能连接</td>
      <td class="tdFormRight"><@ww.textfield  name="'func.link'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  /><font color=red>**</font></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">图片路径</td>
      <td class="tdFormRight"><@ww.textfield  name="'func.imagePath'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  /></td>
  </tr>
   <tr class="trwhite">
      <td class="tdFormleft">显示顺序</td>
      <td class="tdFormRight"><@ww.textfield  name="'func.seq'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  /></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">功能描述</td>
      <td class="tdFormRight"><@ww.textarea name="'func.desc'"  cols="40" rows="5" cssClass="'textarea'" tabindex = "3" disabled ="'${showState}'"  /></td>
 </tr>
  <tr class="trwhite">
      <td class="tdFormleft">当前状态</td>
      <td class="tdFormRight"><@ww.select name="'func.state'" list="getDictMap('state')" cssClass="'selectStyleNormal'" disabled ="'${showState}'" theme ="simple"/></td>
 </tr>
 </table>