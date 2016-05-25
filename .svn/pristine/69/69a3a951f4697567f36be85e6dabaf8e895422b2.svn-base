<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script language="javascript">
function WindowsClose(){ 
		window.close(); 
	}

</script>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>${action.getText("current.location")}:${action.getText("pubfilemgr.upload")}</td>
      </tr>
    </table></td>
  </tr>
</table>
<form action="bFilesPubUpload.action?filePath=${filePath}&funcCode=${funcCode}" method="post" enctype="multipart/form-data" name=inputForm id="iscpInputForm">
<table width="770" border="0" align="center">
  <tr>
    <td width="770" align="center" valign="middle">
    <TABLE width="100%" align="center" cellpadding="0" cellspacing="1" class="tabout">
      <tr class="trcolor">
            <td height="30" colspan="2" align="center" valign="middle" class="tdultitle">${action.getText("pubfilemgr.uploadoption")}</td>
      </tr>
      <tr >
        <td width="15%" height="35" align="right" valign="middle" bgcolor="#CCCCCC" >${action.getText("pubfilemgr.uploadfiletype")}</td>
            <td width="75%" height="35" align="left" valign="middle" bgcolor="#CCCCCC" > 
              &nbsp;${action.getText("pubfilemgr.shi")} .txt .rar .zip .doc .xls ……</td>
      </tr>
      <tr >
          <td height="35" align="right" valign="middle" bgcolor="#CCCCCC"> &nbsp;${action.getText("pubfilemgr.filename")}:</td>
          <td><input type="file" name="doc"></td>
      </tr>
    </table>
    </td>
   </tr>
  <tr>
    <td align="center" valign="middle">
      <input type="submit" name="Submit2" value="${action.getText("pubfilemgr.uploadfile.button")}" class="button">
   </td>
  </tr>
  <tr>
    <td align="center" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="middle">
      <input name="${action.getText("pubfilemgr.button")}" type="button" class="button" value="${action.getText("pubfilemgr.winclose.button")}" onClick="WindowsClose()">
   </td>
  </tr>
</table>
</form>
</body>
</html> 