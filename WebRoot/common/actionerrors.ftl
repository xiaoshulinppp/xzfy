<#assign actionErrors = stack.findValue("actionErrors")?if_exists/>
<#if actionErrors?has_content>
<#list actionErrors as error>
<span id="noticeWords" class="noticeWords">${action.getText(error)}</span>
</#list>
</#if>
