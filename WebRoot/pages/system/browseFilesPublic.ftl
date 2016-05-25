<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="text/javascript" src="../js/commonTool.js"></script>
<body>
<form  name="fileForm"  method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
    <td height="20"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>${action.getText("current.location")}:${action.getText("pubfilemgr.title")}</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabtitle">
  <tr>
    <td>${action.getText("pubfilemgr.title")}</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainTop">
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td align="right">
            <input type="text" name="searchfield" id="searchfield">
            
            <input type="button" name="Button" value="${action.getText("pubfilemgr.search")}" class="button" onclick="GotoSearch()">
            <input name="button2" type="button" class="button" onClick = "GotoImport()" value="${action.getText("pubfilemgr.uploadfile")}">
            <input name="button" type="button" class="button" onClick = "GotoExport()" value="${action.getText("pubfilemgr.downfile")}">
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout" >
    <tr>
      <th width="40" class="thListNormal"><input type="checkbox" name="selectAllCheckbox" onclick="selectAll('selectAllCheckbox','filenamelist')"></th>
      <th class="thListNormal"><a href="javascript:order('filename','${orderType}')">${action.getText("pubfilemgr.filename")}</a></th>
      <th class="thListNormal"><a href="javascript:order('filesize','${orderType}')">${action.getText("pubfilemgr.filesize")}</a></th>
      <th class="thListNormal"><a href="javascript:order('filetype','${orderType}')">${action.getText("pubfilemgr.filetype")}</a></th>
      <th class="thListNormal"><a href="javascript:order('filemod','${orderType}')">${action.getText("pubfilemgr.filetime")}</a></th>
   </tr> 
       <#assign count = 0>
      <#list filelist as curFile>
       <tr class="trcolor">
          <td class="tdlistCenter"> <input type="checkbox" name="filenamelist" id ="filenamelist" value="${count}"> 
          </td>
		  <#if curFile.isDir() >
          <td class="tdlistCenter" ><a href="browseFilesPublic.action?filePath=${curFile.relPath}&funcCode=${funcCode}">${curFile.fileName}</a></td>
          <td class="tdlistCenter" >${curFile.fileSize}&nbsp;</td>
          <td class="tdlistCenter" >${curFile.fileType}</td>
          <td class="tdlistCenter" >${curFile.fileModified}</td>
		  <#else>
          <td class="tdlistCenter" >${curFile.fileName}</td>
          <td class="tdlistCenter" >${curFile.fileSize}</td>
          <td class="tdlistCenter" >${curFile.fileType}</td>
          <td class="tdlistCenter" >${curFile.fileModified}</td>
		  </#if>
        </tr>
        <#assign count = count+1>
		</#list>
      </table></td></tr> 
	
	</table> 
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0"> 
		<tr><td colspan=4 height=8></td></tr> 
		<tr> 
			<td class="xxline"><img src="../images/01/dot.gif" width="1" height="1"></td> 
		</tr> 
		<tr><td colspan=4 height=8></td></tr> 
   </table> 
   <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0"> 
   <tr  valign=middle> 
     <td  bordercolor="6B9E39" > 
       <div align="right"><b>${action.getText("di")}${pageNum}/${pageMax}${action.getText("page")}</b> 
	     <a href="../system/browseFilesPublic.action?pageNum=1&orderName=${orderName}&orderType=${orderType}&funcCode=${funcCode}&filePath=${filePath}" class="a">${action.getText("firstpage")}</a> 
	     <#if pageNum!=1>
	        <#assign pNum =pageNum-1>
	          <a href="../system/browseFilesPublic.action?pageNum=${pNum}&orderName=${orderName}&orderType=${orderType}&funcCode=${funcCode}&filePath=${filePath}" class="a">${action.getText("uptopage")}</a> 
        </#if>
        <#if pageNum!=pageMax>
            <#assign pNum =pageNum+1>
            <a href="../system/browseFilesPublic.action?pageNum=${pNum}&orderName=${orderName}&orderType=${orderType}&funcCode=${funcCode}&filePath=${filePath}" class="a">${action.getText("downtopage")}</a> 
        </#if>
            <a href="../system/browseFilesPublic.action?pageNum=${pageMax}&orderName=${orderName}&orderType=${orderType}&funcCode=${funcCode}&filePath=${filePath}" class="a">${action.getText("endpage")}</a> 
       <input type="text" name="pNum" size="3" maxlength="3">&nbsp;&nbsp; <input type="button" value="Go" class="button" onclick="gotoPage(${pageMax})">
	   <#if filePath!="">
	   &nbsp;&nbsp;&nbsp;&nbsp;<input name="Button2" type="button" class="button" value="${action.getText("return.text")}" onClick = "GotoUpLevel('${filePath}')">
      </#if>
        </div> 
      </td>               
  </tr> 
</table> 
</td> 
 <td width=10></td>  
 </tr> 
 </table> 
 
 
 
<script language="javascript"> 

 function gotoPage(pMax) {
    var pLastNum = window.fileForm.pNum.value ;
  
    for(var ii =0; ii<pLastNum.length; ii++) {			
      if(pLastNum.charCodeAt(ii)>57 || pLastNum.charCodeAt(ii)<48)
        return false;	
    }
    
    if(pLastNum=='')
      return false ;
    if(parseInt(pLastNum)>parseInt(pMax)){
      pLastNum = pMax ;		
    }
    if(pLastNum == '0')
      pLastNum = 1;
    
	
  window.fileForm.action="../system/browseFilesPublic.action?orderName=${orderName}&orderType=${orderType}&filePath=${filePath}&pageNum="+pLastNum;
  window.fileForm.submit();
  
  
 }

function GotoUpLevel(path) {
 var index = path.lastIndexOf("\\");
 
 if(index == path.length-1) {
	 path = path.substring(0,index-1);
 }
 
 
 index =  path.lastIndexOf("\\");
 var pa = path.substring(0,index);
 window.location="../system/browseFilesPublic.action?filePath="+pa+"&funcCode=${funcCode}";
}


 function order(orderName,orderFlag){  

  	 if(orderFlag == "asc")
  		 orderFlag ="desc";
 	 else 
  		 orderFlag = "asc";
   window.location="../system/browseFilesPublic.action?orderName="+orderName+"&orderType="+orderFlag+"&filePath=${filePath}&funcCode=${funcCode}"; 
  }


  function GotoExport(){ 
	var selectValue="";
	var len = window.fileForm.filenamelist.length; 
	var flag = false;
	
	for(var i=0;i<len;i++) {
		if(window.fileForm.filenamelist[i].checked) {
          selectValue=selectValue+window.fileForm.filenamelist[i].value+"|";
          flag = true;
		}
	}
	
	if(!flag)
	   return;
	   
	window.open("../system/bFilesPubDownload.action?selectValue="+selectValue+"&filePath=${filePath}&funcCode=${funcCode}","","width=300,height=200,resizable=1,scrollbars=1,left=50,top=50"); 
  } 
  
  function GotoSearch(){ 
	 var tex = window.fileForm.searchfield.value;
	 window.location="../system/browseFilesPublic.action?orderName=${orderName}&orderType=${orderType}&searchText="+tex+"&filePath=${filePath}&funcCode=${funcCode}"; 
  }
  function GotoImport(){ 
    	window.open("../system/bFilesPubViewUpload.action?filePath=${filePath}&funcCode=${funcCode}"); 
  }
</script> 
<input type ='hidden' name ='funcCode' value='${funcCode}'>
<input type ='hidden' name ='pageNum' value='${pageNum}'>
</form>
</BODY> 
</HTML> 
 