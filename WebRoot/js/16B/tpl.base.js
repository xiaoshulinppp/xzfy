// JavaScript Document
$(function(){
		$(".discolor tr:odd").addClass("tr-odd-bg"); //先排除第一行,然后给奇数行添加样式
		$(".discolor tr:even").addClass("tr-even-bg"); //先排除第一行,然后给偶数行添加样式
	}) 
$(function(){
		$(".discolor_form tr:odd").addClass("tr-odd-bg"); //先排除第一行,然后给奇数行添加样式
		$(".discolor_form tr:even").addClass("tr-even-bg"); //先排除第一行,然后给偶数行添加样式
	})
	 

function slideUp(div){
$(div).slideUp(1000);//窗帘效果展开
}

function slideToggle(div1){
      if($(div1).css("display")=="block")
      {
    //  $(div2).css("display")=="none"; 
     // $('#searchbar-icon').attr("className","show-search");
     $('#searchbar-icon').removeClass('hide-search').addClass('show-search');
	 $("#search-box-btn").attr("title","显示搜索面板");
	 //$(div1).removeClass('hide-search').addClass('show-search');
	// $(div1).attr("title","显示搜索面板");
    }else{
     // $(div2).css("display")=="block";
      $('#searchbar-icon').removeClass('show-search').addClass('hide-search')
	  $("#search-box-btn").attr("title","隐藏搜索面板");
	 // $(div1).removeClass('show-search').addClass('hide-search')
	 // $(div1).attr("title","隐藏搜索面板");
     // $('#searchbar-icon').attr("className","show-search");
      
    }
  $(div1).slideToggle(500);
  //窗帘效果的切换,点一下收,点一下开,参数可以无,参数说明同上 
}



function slideFlod(obj2){
	if($(obj2).css("display")=="block"){
	//	$("#obj1").attr("src","../themes_blue/images/icons/panel_display.png");		
		}
	else{
		$(obj2).css("display")=="none";
	//	$("#obj1").attr("src","../themes_blue/images/icons/panel_hide.png");
		}
		$(obj2).slideToggle(500);//窗帘效果的切换,点一下收,点一下开,参数可以无,参数说
	}

  