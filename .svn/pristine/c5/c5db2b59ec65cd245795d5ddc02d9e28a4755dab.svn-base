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
      <td class="tdFormRight"><@ww.textfield  name="'position.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/></td>
   </tr>
  <tr class="trcolor">
      <td class="tdFormleft">缩写</td>
      <td class="tdFormRight"><@ww.textfield  name="'position.abbr'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  theme="simple"/></td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">报送方式</td>
      <td class="tdFormRight">
      <@ww.select id="posttype" name="'position.type'"  cssClass ="'selectStyleNormal'" list="getDictMap('assign')" onchange="'check()'" disabled ="'${showState}'" />
      </td>
  </tr>
  <tr class="trcolor">
      <td class="tdFormleft">审批方式</td>
      <td class="tdFormRight">
        <@ww.select id="checklevel_" name="'position.checklevel1'"  cssClass ="'selectStyleNormal'"  list="getDictMap('checktype')" onchange="'setValue()'" disabled ="'${showState}'"  theme="'simple'"/>
      </td>
  </tr>
  <tr class="trwhite">
      <td class="tdFormleft">查询方式</td>
      <td class="tdFormRight">
        <@ww.select name="'position.state'"  cssClass ="'selectStyleNormal'" list="getDictMap('publicstate')"  disabled ="'${showState}'"  theme="'simple'"/>
      </td>
  </tr>
 </table>
 <input type="hidden" name="position.checklevel" id="checklevelValue"/>
 <script>
 checklevel = document.getElementById("checklevel_");
 posttype = document.getElementById("posttype");
 checklevelValue = document.getElementById("checklevelValue");
 function check(){
   
   if(posttype.value == "1"){
	 checklevel.disabled = true;
	 checklevelValue.value = 0;
   }
   else{
	 checklevel.disabled = false;
   }
 }
 function setValue(){
  checklevelValue.value = checklevel.value;
 } 
 </script>