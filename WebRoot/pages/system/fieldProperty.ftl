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
   <tr class="trWhite">
      <td class ="tdFormText">名字:</td>
      <td class="tdFormInput"><@ww.textfield  name="'field.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
      <td class="tdFormText">显示名</td>
      <td class="tdFormInput"><@ww.textfield  name="'field.showName'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>    
   </tr>
  <tr class="trColor">
     <td class="tdFormText">类型</td>
     <td class="tdFormInput"><@ww.select name="'field.type'"  cssClass ="'selectStyleNormal'" disabled ="'${showState}'"  list="getDictMap('fieldtype')" theme="simple"/><font color=red>**</font></td>
     <td class="tdFormText">显示类型</td>
     <td class="tdFormInput"><@ww.select  name="'field.showType'"  cssClass ="'selectStyleNormal'" disabled ="'${showState}'"  list="getDictMap('fieldshow')" theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormText">长度</td>
      <td class="tdFormInput"><@ww.textfield  name="'field.length'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
      <td class="tdFormText">主键</td>
      <td class="tdFormInput"><@ww.radio  name="'field.keyColumn'"   disabled ="'${showState}'"  list="getDictMap('equal')"  theme="simple"/></td>
  </tr>
 
   <tr class="trwhite">
      <td class="tdFormText">默认值</td>
      <td class="tdFormInput"><@ww.textfield  name="'field.defaultValue'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
      <td class="tdFormText">展现顺序</td>
      <td class="tdFormInput"><@ww.textfield  name="'field.order'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>

 </table>