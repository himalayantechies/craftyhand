var responsiveflagMenu = false;
function menuChange (status){
	if(status == 'enable'){
	$('#menu-wrap').removeClass('desktop').addClass('mobile').find('#menu-trigger').show();
	$(' #menu-custom').removeAttr('style');
	$('#menu-trigger i').removeClass('icon-double-angle-down-alt').addClass('icon-double-angle-right-alt');
	$('.mobile #menu-trigger').on('click touchstart', function() {
			var catUl = $(this).next('ul#menu-custom');
			var anotherFirst = $('.header-button').find('ul');
			var anotherSecond = $('#header').find('#cart_block');
			if (anotherFirst.is(':visible')) {
				anotherFirst.slideUp(),
				$('.header-button').find('.icon_wrapp').removeClass('active')
			}
			if (anotherSecond.is(':visible')) {
				anotherSecond.slideUp();
				$('#header_user').removeClass('close-cart')
			}
			if(catUl.is(':hidden')) {
				catUl.slideDown(),
				$(this).find('i').removeClass('icon-double-angle-right-alt').addClass('icon-double-angle-down-alt')	
			}
			else {
				catUl.slideUp(),
				$(this).find('i').removeClass('icon-double-angle-down-alt').addClass('icon-double-angle-right-alt');
			}
			return false
		}
		)
		$('#menu-wrap.mobile #menu-custom').on('click touchstart', function(e){
			e.stopPropagation();
		});
		
		$('.main-mobile-menu ul ul').addClass('menu-mobile-2'); 
		$('#menu-custom ul ').addClass('menu-mobile-2'); 
		$('#menu-custom  li').has('.menu-mobile-2').prepend('<i class="open-mobile-2 icon-double-angle-right"></i>');
		$("#menu-custom   .open-mobile-2").on('click touchstart', function() {
				var catSubUl = $(this).next().next('.menu-mobile-2');
				if(catSubUl.is(':hidden')) {
				catSubUl.slideDown(),
				$(this).removeClass('icon-double-angle-right').addClass('icon-double-angle-down')	
				}
				else {
					catSubUl.slideUp(),
					$(this).removeClass('icon-double-angle-down').addClass('icon-double-angle-right');
				}
				return false
				})
		$(document).on('click  touchstart', function(){
			$('.mobile #menu-trigger').find('i').removeClass('icon-double-angle-down-alt').addClass('icon-double-angle-right-alt'),
			$('.mobile #menu-trigger').next('ul#menu-custom').slideUp();	
		})
		return false;
	}
	else {
		$('#menu-wrap').removeClass('mobile').addClass('desktop'),
		$('#menu-custom  li').has('.menu-mobile-2').children('i').remove(),
		$('#menu-custom  li .menu-mobile-2, #menu-custom').removeAttr('style');
		$("#menu-custom   .open-mobile-2").off();
		$('#menu-wrap').find('#menu-trigger').off().hide();	
	}
}
function menuChangeDo(){
	  container_width = $('body').find('.container').width();
	  if (container_width <= 940 && responsiveflagMenu == false){
		    menuChange('enable');
			responsiveflagMenu = true;
				
		}
		else if (container_width > 940){
			menuChange('disable');
	        responsiveflagMenu = false;
		}
}
$(document).ready(menuChangeDo);
$(window).resize(menuChangeDo);