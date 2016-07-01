<html>
<head></head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0" onload='javascript:add_sccess()'>
	<script language="javascript">
	     function add_sccess(){
	        <#if flag>
	        alert("操作成功完成");
	        <#else>
	         alert("操作失败");
	        </#if>
	      	window.close();
         }
	  </script>
</body>
</html>