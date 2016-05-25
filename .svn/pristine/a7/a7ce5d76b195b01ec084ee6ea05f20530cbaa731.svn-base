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
      <td class ="tdFormLeft">字典名称</td>
      <td class="tdFormRight"><@ww.textfield  name="'dict.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">缩写</td>
      <td class="tdFormRight"><@ww.textfield  name="'dict.abbr'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">字典类型</td>
      <td class="tdFormRight"><@ww.select name="'dict.type'"  cssClass ="'selectStyleNormal'" disabled ="'${showState}'"  list="getDictMap('dictType')"    onchange="'showDict()'" theme="simple"/><font color=red>**</font></td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">是否使用默认字典存储</td>
      <td class="tdFormRight"><input type="checkbox" name="storage"  onpropertychange="showDict()"  <#if showState == "true"> disabled </#if>>不</td>
  </tr>
  <tbody id="1" style="display:none">
  <tr class="trwhite">
      <td class="tdFormleft">字典表名</td>
      <td class="tdFormRight"><@ww.textfield  name="'dict.tableName'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>
    <tr class="trcolor">
      <td class="tdFormleft">显示名字段</td>
      <td class="tdFormRight"><@ww.textfield  name="'dict.nameColumn'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>
    <tr class="trwhite">
      <td class="tdFormleft">主键字段</td>
      <td class="tdFormRight"><@ww.textfield  name="'dict.keyColumn'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>
     <tr class="trcolor">
      <td class="tdFormleft">父键字段</td>
      <td class="tdFormRight"><@ww.textfield  name="'dict.parentColumn'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>
     <tr class="trwhite">
      <td class="tdFormleft">字典值字段</td>
      <td class="tdFormRight"><@ww.textfield  name="'dict.valueColumn'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>
  </tbody>
  <tr class="trcolor">
      <td class="tdFormleft">描述</td>
      <td class="tdFormRight"><@ww.textarea name="'dict.desc'"  cols="40" rows="5" cssClass="'textarea'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/></td>
 </tr>
    <tr class="trwhite">
      <td class="tdFormleft">字典状态</td>
		<#if dict?exists><#assign state=dict.state?default(1)></#if>
      <td class="tdFormRight"><@ww.select  name="'dict.state'"  value="'${state?default(1)}'.toString()"   list="getDictMap('state')"  cssClass ="'selectStyleNormal'" disabled ="'${showState}'"  theme="'simple'"/><font color=red>**</font></td>
  </tr>
 </table>