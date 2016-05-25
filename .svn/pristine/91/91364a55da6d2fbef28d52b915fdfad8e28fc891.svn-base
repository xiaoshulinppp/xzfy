/*****************************************************************************
函数名称：fncComCheckIfNumber
处理机能：检查是否是是数字
参数	：sCheck 字符串
日期	：2002/04/16
修改人-------修改日--------概要--------------------------
******************************************************************************/
function fncComCheckIfNumber(sCheck) {
  if((sCheck=="")||(sCheck==null)) return false;
  for(cnt=0;cnt<=sCheck.length-1;cnt++){
    if (sCheck.substring(cnt,cnt+1)>"9"||sCheck.substring(cnt,cnt+1)<"0"){
    	return false;
    }
  }
  return true;
}

/*****************************************************************************
函数名称：fncComCheckIfPhoneNumber
处理机能：检查是否是电话号码
参数	：sCheck 字符串
日期	：2002/04/16
修改人-------修改日--------概要--------------------------
******************************************************************************/
function fncComCheckIfPhoneNumber(sCheck){
  if ((sCheck=="")||(sCheck==null)) return false;
  for(cnt=0;cnt<=sCheck.length-1;cnt++){
  	if (sCheck.substring(cnt,cnt+1) != "-" && sCheck.substring(cnt,cnt+1) != "_"){
		 if (sCheck.substring(cnt,cnt+1) > "9"||sCheck.substring(cnt,cnt+1) < "0"){
		    return false;
		 }
	}
  }
  return true;
}

/*****************************************************************************
函数名称：fncComCheckIfBirthYear
处理机能：检查是否是有效出生年
参数	：sCheck 字符串，代表年
日期	：2002/04/16
修改人-------修改日--------概要--------------------------
******************************************************************************/
function fncComCheckIfBirthYear(sCheck){

	if ( fncComCheckIfNumber(sCheck) == false ){
		return false;
	}

	dteCur = new Date();

	if (parseInt(sCheck) <= 1000 || parseInt(sCheck) > dteCur.getYear() ){
		return false;
	}

	return true;
}

/*****************************************************************************
函数名称：fncComCheckIfEMail
处理机能：检查是否是email
参数	：sCheck email
日期	：2002/04/16
修改人-------修改日--------概要--------------------------
******************************************************************************/
function fncComCheckIfEMail(sCheck){
  if ((sCheck=="")||(sCheck==null)) return false;

  //Check if '@' is proper
  if (sCheck.indexOf("@") <= 0 || sCheck.indexOf("@") == sCheck.length -1 || sCheck.indexOf("@") != sCheck.lastIndexOf("@") ){
  	return false;
  }

  //Check if '.' is proper
  if (sCheck.indexOf(".") <= 0 || sCheck.indexOf(".") == sCheck.length -1 || sCheck.indexOf("..") >-1 ){
  	return false;
  }

  //Check if each character is digital or letter
  for(cnt=0;cnt<=sCheck.length-1;cnt++){
  	if (sCheck.substring(cnt,cnt+1) != "-" && sCheck.substring(cnt,cnt+1) != "_" && sCheck.substring(cnt,cnt+1) != "@" && sCheck.substring(cnt,cnt+1) != "."){
  		 //                           below '0'                                                    above '9' and below 'A'                                                     above 'Z' and below 'a'                              above 'z'
		 if ( (sCheck.substring(cnt,cnt+1) < "0") || (sCheck.substring(cnt,cnt+1) > "9" && sCheck.substring(cnt,cnt+1) < "A") || (sCheck.substring(cnt,cnt+1) > "Z" && sCheck.substring(cnt,cnt+1) < "a") || (sCheck.substring(cnt,cnt+1) > "z") ){
		    return false;
		 }
	}
  }
  return true;
}

/*****************************************************************************
函数名称：fncTrim()
处理机能：STRING FUNCTIONS，删除字符的前后空格
参数	：
作者	：
日期	：
修改人-------修改日--------概要--------------------------
******************************************************************************/
function fncTrim( str ) {
	// Immediately return if no trimming is needed
	if( (str.charAt(0) != ' ') && (str.charAt(str.length-1) != ' ') ) { return str; }
	// Trim leading spaces
	while( str.charAt(0)  == ' ' ) {
		str = '' + str.substring(1,str.length);
	}
	// Trim trailing spaces
	while( str.charAt(str.length-1)  == ' ' ) {
		str = '' + str.substring(0,str.length-1);
	}

	return str;
}

// 判断是否为Email
function isEmail(szExp){
	szExp = trim(szExp);

	if ( isNull(szExp) ){
		return false;
	}

	if ( szExp.indexOf("@") <= 0 || szExp.indexOf("@") == szExp.length -1 || szExp.indexOf("@") != szExp.lastIndexOf("@") ){
		return false;
	}

	return true;
}


// 截空
function trim( szExp ) {
	if( szExp == null )	return null;
	if( (szExp.charAt(0) != ' ') && (szExp.charAt(szExp.length-1) != ' ') ) { return szExp; }
	while( szExp.charAt(0)  == ' ' ) {
		szExp = '' + szExp.substring(1,szExp.length);
	}
	while( szExp.charAt(szExp.length-1)  == ' ' ) {
		szExp = '' + szExp.substring(0,szExp.length-1);
	}

	return szExp;
}

// 判断是否为空
function isNull(szExp)
{
	return ( szExp == "" || szExp == null )? true : false;
}

// 判断是否为数值
function isNumeric(szNum)
{
	return ( isInt(szNum)==true || isFloat(szNum)==true )? true:false
}

// 判断是否为整数
function isInt(szNum)
{
	if ( isNull(szNum) )
		return false;

	if ( isNaN(parseInt(szNum )) )
		return false;

	for(var i = 0; i <= szNum.length-1; i++ ){
		var chr = szNum.substring(i,i+1);

		if      ( i == 0 && chr == "-" ){
			continue;
		}else if( chr > "9" || chr < "0" ){
			return false;
		}
	}
	return true;
}

// 判断是否为浮点数
function isFloat(szNum)
{
	var bDot = false;

	if ( isNull(szNum) )
		return false;

	if ( isNaN(parseInt(szNum )) )
		return false;

	for(var i = 0; i <= szNum.length-1; i++ ){
		var chr = szNum.substring(i,i+1);

		if      ( i == 0 && chr == "-" ){
			continue;
		}else if( chr == "." ){
			if ( bDot == true )
				return false;
			bDot = true;
		}else if( chr > "9" || chr < "0" ){
			return false;
		}
	}
	return true;
}

// 判断是否为日期
function isDateB(strDate) {
	if ( strDate.length != 10 )
		return false;

	sYear  = strDate.substring(0,4);
	sMonth = strDate.substring(5,7);
	sDay   = strDate.substring(8,10);
	return isDate(sYear,sMonth,sDay)
}

// 判断是否为日期
function isDate(sYear,sMonth,sDay)
{
	if( isNull(sYear ) ) return false;
	if( isNull(sMonth) ) return false;
	if( isNull(sDay  ) ) return false;

	if( sMonth.charAt(0) == '0' ) { sMonth = sMonth.substring(1,2); }
	if( sDay.charAt(0)   == '0' ) { sDay   = sDay.substring(1,2);   }

	var nYear  = parseInt(sYear );
	var nMonth = parseInt(sMonth);
	var nDay   = parseInt(sDay  );
	var arrMon = new Array(12);

	if ( isNaN(nYear ) )	return false;
	if ( isNaN(nMonth) )	return false;
	if ( isNaN(nDay  ) )	return false;

	arrMon[ 0] = 31;
	arrMon[ 1] = nYear % 4 == 0 ? 29:28;
	arrMon[ 2] = 31;
	arrMon[ 3] = 30;
	arrMon[ 4] = 31;
	arrMon[ 5] = 30;
	arrMon[ 6] = 31;
	arrMon[ 7] = 31;
	arrMon[ 8] = 30;
	arrMon[ 9] = 31;
	arrMon[10] = 30;
	arrMon[11] = 31;

	if ( nYear  < 1900 || nYear > 2100 )			return false;
	if ( nMonth < 1 || nMonth > 12 )				return false;
	if ( nDay < 1 || nDay > arrMon[nMonth - 1] )	return false;

	return true;
}

// 实际长度
function len(szExp)
{
	var iLen = 0;

	if (isNull(szExp))
		return 0;

	for(i=0; i<szExp.length; i++){
		temp=szExp.charAt(i);
		start=unescape("%00")
		end=unescape("%7f")
		if(temp>end||temp<start)
			iLen ++;
		iLen ++;
	}
    return iLen;
}

// 日期相加
function AddDate(strDate, strFlag,intAdd) {
	sYear  = strDate.substring(0,4);
	sMonth = strDate.substring(5,7);
	sDay   = strDate.substring(8,10);

	if( sMonth.charAt(0) == '0' ) { sMonth = sMonth.substring(1,2); }
	if( sDay.charAt(0)   == '0' ) { sDay   = sDay.substring(1,2);   }

	var nYear  = parseInt( sYear  );
	var nMonth = parseInt( sMonth );
	var nDay   = parseInt( sDay   );

	if ( isNaN(nYear ) )	return false;
	if ( isNaN(nMonth) )	return false;
	if ( isNaN(nDay  ) )	return false;

	nYear  = nYear  - 1900;
	nMonth = nMonth - 1;

	if ( strFlag == null || strFlag.length == 0 )  strFlag = "d"
	strFlag = strFlag.toLowerCase();

	if      ( strFlag == "y" )	{	nYear   = nYear  + intAdd;	}
	else if ( strFlag == "m" )	{	nMonth  = nMonth + intAdd;	}
	else						{	nDay    = nDay   + intAdd;	}

	var datCalc = new Date(nYear,nMonth,nDay);
	nYear  = datCalc.getYear()  + 1900 + "";
	nMonth = datCalc.getMonth() + 1 + "";
	nDay   = datCalc.getDate()  + "";

	if( nMonth.length == 1 ) { nMonth = "0" + nMonth; }
	if( nDay.length   == 1 ) { nDay   = "0" + nDay  ;   }
	return nYear + "/" + nMonth + "/" + nDay ;
}

// 将日期变成字符串
function DateToString( datExp ) {
	if ( datExp == null )
		return "";

	nYear  = datExp.getYear()  + "";
	nMonth = datExp.getMonth() + 1 + "";
	nDay   = datExp.getDate()  + "";

	if( nMonth.length == 1 ) { nMonth = "0" + nMonth; }
	if( nDay.length   == 1 ) { nDay   = "0" + nDay  ;   }
	return nYear + "/" + nMonth + "/" + nDay ;
}

// 创建日期控件
function PutDateCtl(strNM) {
	document.write("<INPUT  NAME='" + strNM + "' ID='" + strNM + "' SIZE=18 class=InputFace  readonly>");
	document.write("<INPUT TYPE='BUTTON' VALUE='▼' ID='btn" + strNM + "' onclick=\"JavaScript:GetSelectDate('" + strNM + "')\" STYLE=\"font:'normal small-caps 6pt serif';\" >");
	document.all.item('btn' + strNM).style.height = 19;
	document.all.item('btn' + strNM).style.width  = 19;
	document.all.item(strNM).style.height = 19;
	return true;
}
// 创建日期控件
function PutDateCtlDate(strNM,strTemp) {
    if (strTemp==null || strTemp==""){
	PutDateCtl(strNM);
    } else {
	document.write("<INPUT  NAME='" + strNM + "' ID='" + strNM + "' value="+strTemp +"  SIZE=18 class=InputFace  readonly>");
	document.write("<INPUT TYPE='BUTTON' VALUE='▼' ID='btn" + strNM + "' onclick=\"JavaScript:GetSelectDate('" + strNM + "')\" STYLE=\"font:'normal small-caps 6pt serif';\" >");
	document.all.item('btn' + strNM).style.height = 19;
	document.all.item('btn' + strNM).style.width  = 19;
	document.all.item(strNM).style.height = 19;
    } 
  	return true;
}
// 选择日期
function GetSelectDate(strID) {
	document.all.item(strID).value = getPopDate(document.all.item(strID).value);
	return true;
}

function selectAll() {
alert("1111");
}
