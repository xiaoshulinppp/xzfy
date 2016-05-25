/**
 * 遮罩层
 * @return
 */
// 打开弹出层
function getTheResultDiv() {
	var divObj = document.getElementById("mydiv");
	divObj.style.display = "none";
	showDiv();
}

function showDiv() {
	// div居中显示
	var screenWidth = document.body.clientWidth;
	var screenHeight = document.body.clientHeight;

	var divObj = document.getElementById("mydiv");
	divObj.style.display = "block";

	var divWidth = divObj.offsetWidth;
	var divHeight = divObj.offsetHeight;

	var left = parseInt((screenWidth - divWidth) / 2);
	var top = parseInt((screenHeight - divHeight) / 2);
	divObj.style.left = left + document.body.scrollLeft;
	divObj.style.top = top + document.body.scrollTop;

	popCoverDiv();
}
// =========================================================================
// 创建遮盖层
function popCoverDiv() {
	if (M("cover_div")) {
		// 如果存在遮盖层，则让其显示
		M("cover_div").style.display = 'block';
	} else {
		// 否则创建遮盖层
		var coverDiv = MC('div');
		document.body.appendChild(coverDiv);
		coverDiv.id = 'cover_div';
		with (coverDiv.style) {
			position = 'absolute';
			background = '#E6E6FA';
			left = '0px';
			top = '0px';
			var bodySize = getBodySize();
			width = bodySize[0] + 'px'
			height = bodySize[1] + 'px';
			zIndex = 0;
			if (isIE()) {
				filter = "Alpha(Opacity=40)";// IE逆境
			} else {
				opacity = 0.4;
			}
		}
	}
}
var W = screen.width;// 取得屏幕分辨率宽度
var H = screen.height;// 取得屏幕分辨率高度

function M(id) {
	return document.getElementById(id);// 用M()方法代替document.getElementById(id)
}
function MC(t) {
	return document.createElement(t);// 用MC()方法代替document.createElement(t)
};
// 判断浏览器是否为IE
function isIE() {
	return (document.all && window.ActiveXObject && !window.opera) ? true
			: false;
}
// 取得页面的高宽
function getBodySize() {
	var bodySize = [];
	with (document.documentElement) {
		bodySize[0] = (scrollWidth > clientWidth) ? scrollWidth : clientWidth;// 如果滚动条的宽度大于页面的宽度，取得滚动条的宽度，否则取页面宽度
		bodySize[1] = (scrollHeight > clientHeight) ? scrollHeight
				: clientHeight;// 如果滚动条的高度大于页面的高度，取得滚动条的高度，否则取高度
	}
	return bodySize;
}

// =========================================================================
// 关闭弹出层
function closeTheDiv() {
	var divObj = document.getElementById("mydiv");
	divObj.style.display = "none";
	var div_cov = document.getElementById("cover_div");
	document.body.removeChild(div_cov);
}