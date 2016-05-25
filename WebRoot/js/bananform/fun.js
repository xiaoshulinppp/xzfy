var indexPart1_01Now=0;
function indexPart1_01Fun(){
	$('.indexPart1_01').find('span').removeClass('spanNow');
	$('.indexPart1_01').find('.list1').find('li').hide();
	$('.indexPart1_01').find('.list').find('li').eq(indexPart1_01Now).animate({left: -522}, "slow",function(){
		$(this).css('left',522);
		});	
	if(indexPart1_01Now<$('.indexPart1_01').find('.list').find('li').length-1){
		indexPart1_01Now++;
		}else{
			indexPart1_01Now=0;
			}
	$('.indexPart1_01').find('.list1').find('li').eq(indexPart1_01Now).show();		
	$('.indexPart1_01').find('.list').find('li').eq(indexPart1_01Now).animate({left: 0}, "slow");		
	$('.indexPart1_01').find('span').eq(indexPart1_01Now).addClass('spanNow');
	}