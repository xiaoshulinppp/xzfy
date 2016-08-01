$(document).ready(function() {
	
	var info=$(".main_lf dl dd").html();
	$(".main_lf dl dd").text(info.substring(0,50)+"......");
	
	
		$auto=autoclick();
        $(".hdp ol li").click(function(e) {
			clearTimeout($auto);
            $(this).addClass("clic").siblings().removeClass("clic");
			$k=$(".hdp ol li").index(this);
			$(".hdp ul li").eq($k).fadeIn(1000).siblings().fadeOut(1000);
			$auto=autoclick();
        });
	function autoclick(){
			var $aa=$(".hdp ol").find(".clic");
			
			$k=$(".hdp ol li").index($aa)+1;
			if($k>2){
				$i=0;	
			}else{
				$i=$k;
				}
			$auto=setTimeout(function(){
				 $(".hdp ol li").eq($i).trigger("click");
				},3000);
				return $auto;
	}
	$("#xxk li").hover(function(){
	$(this).addClass("active").siblings().removeClass("active");
		$k=$("#xxk li").index(this);
		$(".kcxg div").eq($k).css({display:"block"}).siblings().css({display:"none"})
	})
	$(".mid_bot ol li").hover(function(){
		$(".mid_bot ol li span").removeClass("cor");
		$(this).find("span").addClass("cor");
	},function(){
		$(this).find("span").removeClass("cor");
		})

var $oDiv4 = $("#div4");
var $aB = $oDiv4.find(".xyul ul");
var $oUl4 = $oDiv4.find(".xyul");
var $aLi4 = $oUl4.find("ul");

$oUl4.width($aLi4.width()*$aLi4.length + "px");
var iNow = 0;
function move(){

	$oUl4.animate({"left":-$aLi4.width()*iNow+"px"});
}
$aB.on("click",function(){
	iNow = $(this).index();
	move();
});
$(".next").on("click",function(){
	iNow++;
	if(iNow == $aB.length){
		iNow = 0;
	}
	move();
});
$(".pre").on("click",function(){
	iNow--;
	if(iNow == -1){
		iNow = $aB.length-1;
	}
	move();
});


});

