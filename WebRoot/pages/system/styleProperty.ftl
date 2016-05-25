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
      <td class ="tdFormLeft">风格名称</td>
      <td class="tdFormRight"><@ww.textfield  name="'style.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">主框架路径</td>
      <td class="tdFormRight"><@ww.textfield  name="'style.framePath'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">CSS路径</td>
      <td class="tdFormRight"><@ww.textfield  name="'style.cssPath'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">JS路径</td>
      <td class="tdFormRight"><@ww.textfield  name="'style.jsPath'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">图片路径</td>
      <td class="tdFormRight"><@ww.textfield  name="'style.imagePath'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
   <tr class="trcolor">
      <td class="tdFormleft">预览图片路径</td>
      <td class="tdFormRight"><@ww.textfield  name="'style.preImage'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
   <tr class="trwhite">
      <td class="tdFormleft">预览文件路径</td>
      <td class="tdFormRight"><@ww.textfield  name="'style.preFile'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">风格描述</td>
      <td class="tdFormRight"><@ww.textarea name="'style.desc'"  cols="40" rows="5" cssClass="'textarea'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/></td>
 </tr>
 </table>