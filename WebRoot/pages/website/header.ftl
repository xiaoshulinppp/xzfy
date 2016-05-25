<div class="headDiv">
<div class="wal">
<#assign user_name=Session['_USER_LOGIN_'].name>
      <!--<a href="http://www.beijing.gov.cn/" class="logo" target="_blank"><img src="../webstyle/image/logo.png"/></a>-->
      <div class="time"  id="time"></div>
      <div class="nav">
            <ul>
  				<#assign thisColumn="${column?default('0')}">
               <li class="li_01"><a href="../xzfy/gotoIndex.action?funcCode=${funcCode}">首页</a></li>
               <li class="li_02"><a href="../website/showColumn.action?funcCode=${funcCode}&column=1" <#if thisColumn=="1">class="aNow"</#if>>复议动态</a></li>
               <li class="li_03"><a href="../website/showColumn.action?funcCode=${funcCode}&column=2" <#if thisColumn=="2">class="aNow"</#if>>时政快递</a></li>
               <li class="li_04"><a href="../website/showColumn.action?funcCode=${funcCode}&column=3" <#if thisColumn=="3">class="aNow"</#if>>法律法规</a></li>
               <li class="li_05"><a href="../website/subColumnMoreDxal.action?funcCode=${funcCode}&column=4" <#if thisColumn=="4">class="aNow"</#if>>典型案例</a></li>
               <li class="li_06"><a href="../website/showColumn.action?funcCode=${funcCode}&column=5" <#if thisColumn=="5">class="aNow"</#if>>统计查询</a></li>
               <li class="li_07"><a href="../website/articleAreaOnFrontPage.action?funcCode=${funcCode}&column=6" <#if thisColumn=="6">class="aNow"</#if>>内容管理</a></li>
              <#-- <li class="li_08"><a href="../website/xinXiBaoSong.action?funcCode=${funcCode}&column=7" <#if thisColumn=="7">class="aNow"</#if>>信息报送</a></li>
               <li class="li_10"><a href="../xzcj/showUndertakerList.action?funcCode=${funcCode}&column=9" <#if thisColumn=="9">class="aNow"</#if>>裁决案件</a></li>
               -->
               <li class="li_09"><a href="../website/zlk.action?funcCode=${funcCode}&column=8" <#if thisColumn=="8">class="aNow"</#if>>资料库</a></li>
            	
            </ul>
      </div>
</div>
</div>
<!-- 需在各页面body上加  onload="startTime()"  -->
<script type="text/javascript">
			function startTime()
			{
			var today=new Date()
			var y=today.getFullYear()
			var month=today.getMonth()+1
			var d=today.getDate()
			var h=today.getHours()
			var m=today.getMinutes()
			var s=today.getSeconds()
			// add a zero in front of numbers<10
			m=checkTime(m)
			s=checkTime(s)
			document.getElementById('time').innerHTML="${Session['_USER_LOGIN_'].name}：您好！  "+"当前时间："+y+"年"+month+"月"+d+"日"+h+"点"+m+"分"
			//document.getElementById('time').innerHTML="当前时间："+y+"年"+month+"月"+d+"日"+h+"点"+m+"分"
			t=setTimeout('startTime()',1000)
			}
			
			
			
			function checkTime(i)
			{
			if (i<10) 
			  {i="0" + i}
			  return i
			}
			startTime();
		</script>