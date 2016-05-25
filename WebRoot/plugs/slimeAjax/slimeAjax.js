var slime = new Object();

slime.params = "";

slime.responseText = "";

slime.responseXML = "";

slime.instanceRequest = function() {
	var httpRequest = null;
	if (window.XMLHttpRequest) {
		httpRequest = new XMLHttpRequest();
		if (httpRequest.overrideMimeType) {
			httpRequest.overrideMimeType("text/xml");
		}
	} else if (window.ActiveXObject) {
		try {
			httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				window.alert("无法创建XMLHTTPREQUEST！");
			}
		}
	}
	if (!httpRequest) {
		window.alert("创建XMLHTTPREQUEST失败！");
	}
	return httpRequest;
}

slime.sendRequest = function(url, method) {
	var requestObject = slime.instanceRequest();
	if (requestObject != null) {
		if (method.match("(P|p)(O|o)(S|s)(T|t)")) {
			requestObject.onreadystatechange = processResponse;
			requestObject.open("POST", url, true);
			requestObject.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			requestObject.send(slime.params);
		} else {
			requestObject.open("GET", url, true);
			requestObject.onreadystatechange = processResponse;
			requestObject.send(null);
		}
	}
	function processResponse() {
		if (requestObject.readyState == 4) {
			if (requestObject.status == 200) {
				slime.responseText = requestObject.responseText;
				slime.responseXML = requestObject.responseXML;
				slime.processRequest();
			}
		}
	}
}

slime.addParamById = function() {
	if (arguments.length == 1) {
		var paramId = arguments[0];
		var paramValue = window.document.getElementById(paramId).value;
		var paramName = window.document.getElementById(paramId).name;
		if (paramName == "") {
			paramName = paramId;
		}
		if (slime.params == "") {
			slime.params += paramName + "=" + paramValue;
		} else {
			slime.params += "&" + paramName + "=" + paramValue;
		}
	} else if (arguments.length == 2) {
		var paramId = arguments[0];
		var paramName = arguments[1];
		var paramValue = window.document.getElementById(paramId).value;
		if (paramName != "") {
			if (slime.params == "") {
				slime.params += paramName + "=" + paramValue;
			} else {
				slime.params += "&" + paramName + "=" + paramValue;
			}
		}
	} else {
		alert("此方法最多包含两个参数！");
	}
}

slime.addParam = function(paramName, paramValue) {
	if (paramName != "") {
		if (slime.params == "") {
			slime.params += paramName + "=" + paramValue;
		} else {
			slime.params += "&" + paramName + "=" + paramValue;
		}
	}
}

slime.clearParams = function() {
	slime.params = "";
}

slime.processRequest = function() {
	alert(slime.responseText);
	alert(slime.responseXML);
}

slime.testFileUrl = function() {
	alert("成功引入JS文件！");
}
