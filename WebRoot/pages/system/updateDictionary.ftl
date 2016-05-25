<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>${action.getText("platform.name")}</title>
<link href="../${Session["_USER_STYLE_"].cssPath}/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<@ww.form  name="'dictForm'"  action ="'doUpdateDictionary'" validate="'true'" disableSubmit="'saveid,returnid'" method="'post'">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="yourPlace">
  <tr>
         <td>${action.getText("current.location")}:${action.getText("dict.title")}</td>
      </tr>
   
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tabtitle">
  <tr>
    <td height="24" align="center"></td>
  </tr>
</table>

<#include "dictionaryProperty.ftl">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabMainBot">
  <tr>
    <td>
      <#if opName == "update">
      <input id = "saveid" name="Button32" type="submit" class="button" value="${action.getText("update.text")}">
      </#if>
      <#if flag?has_content>
      <input id = "closeid" name="Button42" type="reset" class="button" value="关闭" onclick="window.close()">
      <#else>
      <input id = "returnid" name="Button42" type="reset" class="button" value="${action.getText("return.text")}" onclick="returnPage()">
      </#if>
    </td>
  </tr>
</table>
<br>
<script>
    function returnPage() {
    submitDisableButton();
     document.location.href="../system/listDictionary.action?funcCode=${funcCode}&pageNum=${pageNum}";
    }
    
    function submitDisableButton() { 
      <#if opName == "update">
      document.getElementById("saveid").disabled = true;
      </#if>
      document.getElementById("returnid").disabled = true;
   }
   
 function showDict() {
     document.getElementById("storage")
     if(document.getElementById("storage").checked){
         document.getElementById("1").style.display="";
         var value = document.getElementById("dict.type").value;
         if(value=="1")
         document.getElementById("2").style.display="";
     }
     else {
          document.getElementById("1").style.display="none";
          document.getElementById("2").style.display="none";
          document.getElementById("dict.tableName").value="";
          document.getElementById("dict.keyColumn").value="";
          document.getElementById("dict.valueColumn").value="";
          var value = document.getElementById("dict.type").value;
          if(value=="1")  
            document.getElementById("dict.parentColumn").value="";
     }
   
   }
  
</script>
<@ww.hidden name ="'funcCode'"/>
<@ww.hidden name ="'pageNum'"/>
<input type ='hidden' name ='entityId' value='${dict.id}'>
</@ww.form>
</body>
</html>