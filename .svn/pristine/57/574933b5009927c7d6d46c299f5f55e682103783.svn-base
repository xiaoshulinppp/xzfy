// JavaScript Document
$(document).ready(function(){
	$("#main-nav li a.no-submenu").click( // When a menu item with no sub menu is clicked...
			function () {
				//window.location.href=(this.href); // Just open the link instead of a sub menu
				$("#main-nav li a.no-submenu").removeClass("current");
				$("#main-nav li ul li a.current").removeClass("current");
				$(this).addClass("current");
				parent.document.mainframe.location.href=(this.href);
				return false;
			}
		); 
	$("#main-nav li ul li a").click(// aileen add 鼠标点击高亮二级菜单项
			function(){
				$("#main-nav li ul li a.current").removeClass("current");
				$("#main-nav li a.no-submenu").removeClass("current");
				$(this).addClass("current");
				}	
		 );
});


