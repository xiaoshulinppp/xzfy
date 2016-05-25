<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../${Session['_USER_STYLE_'].cssPath}/style.css" rel="stylesheet" type="text/css">
<title>选择功能</title>
</head>
</title>
<body>
<form id="search_form" name="queryForm" >

<!--底部按钮表格开始-->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabout">
  <tr class="trWhite">
    <td class="tdFormCenter">
      <fieldset class="fieldsetStyle">
      <legend>设置功能</legend>
      <table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
        <tr>
          <th width="45%" class="thFormNormal">全部功能</th>
          <th class="thFormNormal">选择</th>
          <th width="45%" class="thFormNormal">选中功能</th>
        </tr>
        <tr class="trColor">
          <td class="tdFormCenter">
              <select multiple id="allFields" name="allFields" size="7" class="selectStyleLong">
              <#list funcList as func>
                 <option value="${func.id}">${func.name}</option>
              </#list>
              </select>
          </td>
          <td class="tdFormCenter"><br />
              <input name="right" type="button" title="右移" class="arrowButton" value="-&gt;"  onclick="showSelectedFields()"/>
              <br />
              <input name="left" type="button" title="左移" class="arrowButton" value="&lt;-" onclick="hideSelectedFields()"/>
              <br />
          </td>
          
          
          <td class="tdFormCenter">
             <select multiple id="showFields" name="showFields" size="7" class="selectStyleLong">
             </select>
         </td>
         
        </tr>
     </table>
      </fieldset><br></td>
    </tr>
  
  
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td><input  type="button" class="button" value="确定" onClick="submitFunc()"/>
    <input  type="button" class="button" value="关闭" onclick="window.close()"/>
      </td>
  </tr>
</table>

</form>
</body>
</html>

<script>
var allFields_ = document.getElementById("allFields");
var showFields_ = document.getElementById("showFields");
function showSelectedFields(){

	for(var i = 0;allFields_.options != null && i<allFields_.options.length;i++){
		if(allFields_.options[i].selected){
			var existed = false;
			for(var j = 0;j<showFields_.length;j++){
				existed = existed || (allFields_.options[i].value == showFields_.options[j].value);
			}
			if(!existed){
				showFields_.options[showFields_.options.length] = new Option(allFields_.options[i].innerHTML,allFields_.options[i].value);
				showFields_.options[showFields_.options.length-1].selected = true;
			}
		}
	}

}

function hideSelectedFields(){
	for(var i = 0;showFields_.options != null && i<showFields_.options.length;i++){
		if(showFields_.options[i].selected){
			showFields_.options.removeChild(showFields_.options[i]);
			i--;
		}
	}
}
function submitFunc(){
    var selectShowField="";
	for(var i = 0;showFields_.options != null && i<showFields_.options.length;i++){
		if(showFields_.options[i].selected){
			selectShowField+=showFields_.options[i].value+"|";
		}
	}
	
	window.opener.setFuncValue(selectShowField);
	window.close();
}
</script>
