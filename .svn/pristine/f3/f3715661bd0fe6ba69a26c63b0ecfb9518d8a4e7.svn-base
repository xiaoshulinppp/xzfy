<#assign showState = "false">
<#if opName == "view">
<#assign showState="true">
</#if>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
				<tr>
					<th class="thFormNormal"></th>
					<th class="thFormNormal">基本信息</th>
				</tr>
				<tr class="trwhite">
					<td class ="tdFormLeft" style="height:57px;">用户名</td>
					<td class="tdFormRight">
						<@ww.textfield  name="'userVO.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font>
					</td>
				</tr>
				<tr class="trwhite">
					<td class="tdFormleft" style="height:57px;">登录名</td>
					<td class="tdFormRight"><@ww.textfield  name="'userVO.logName'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'" theme="simple"/><font color=red>**</font>
						<#assign actionErrors = stack.findValue("actionErrors")?if_exists />
						<#if actionErrors?has_content>
						<#list actionErrors as error>
						<span id="noticeWords" class="noticeWords">${action.getText(error)}</span>
						</#list>
						</#if>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdFormleft" style="height:57px;">固定电话</td>
					<td class="tdFormRight">
						<@ww.textfield name="'userVO.phone'"   cssClass="'inputTextNormal'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdFormleft" style="height:57px;">手机</td>
					<td class="tdFormRight">
						<@ww.textfield name="'userVO.mphone'"   cssClass="'inputTextNormal'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdFormleft" style="height:57px;">地址</td>
					<td class="tdFormRight">
						<@ww.textfield name="'userVO.address'"   cssClass="'inputTextNormal'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdFormleft" style="height:57px;">邮编</td>
					<td class="tdFormRight">
						<@ww.textfield name="'userVO.postMan'"   cssClass="'inputTextNormal'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdFormleft" style="height:57px;">EMail</td>
					<td class="tdFormRight">
						<@ww.textfield name="'userVO.email'"   cssClass="'inputTextNormal'" tabindex = "3" disabled ="'${showState}'"  theme="simple"/>
					</td>
				</tr>
				<!--
				<tr class="trcolor">
					<td class="tdFormleft" style="height:57px;">用户类型</td>
					<td class="tdFormRight">
						<@ww.radio name="'userVO.type'" list="getDictMap('userType')"     cssClass="inputTextNormal"  tabindex = "3"  disabled ="'${showState}'"  theme="simple"/><font color=red>**</font>
					</td>
				</tr>
				-->
				<input type="hidden" name="userVO.type" value="732" />
				<tr class="trwhite">
					<td class="tdFormleft" style="height:57px;">角色</td>
					<td class="tdFormRight">
						<@ww.radio name="'selectRole'"  list="getAllRole()" cssClass="inputTextNormal" tabindex = "3" disabled ="'${showState}'" value="getAllCutsomRole()" theme="simple"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>