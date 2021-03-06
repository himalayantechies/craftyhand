function categoryReload () {
//animate the opening of the branch (span.grower jQueryElement)
function openBranch(jQueryElement, noAnimation) {
		jQueryElement.addClass('icon-double-angle-down').removeClass('icon-double-angle-right');
		if(noAnimation)
			jQueryElement.parent().find('ul:first').show();
		else
			jQueryElement.parent().find('ul:first').slideDown();
}
//animate the closing of the branch (span.grower jQueryElement)
function closeBranch(jQueryElement, noAnimation) {
	jQueryElement.addClass('icon-double-angle-right').removeClass('icon-double-angle-down');
	if(noAnimation)
		jQueryElement.parent().find('ul:first').hide();
	else
		jQueryElement.parent().find('ul:first').slideUp();
}

//animate the closing or opening of the branch (ul jQueryElement)
function toggleBranch(jQueryElement, noAnimation) {
	if(jQueryElement.hasClass('icon-double-angle-down'))
		closeBranch(jQueryElement, noAnimation);
	else
		openBranch(jQueryElement, noAnimation);
}

//when the page is loaded...

	//to do not execute this script as much as it's called...
	$('.column ul.tree.dhtml ul').parent().find("i.icon-double-angle-right").remove();
		$('.column ul.tree.dhtml ul').prev().before("<i class='grower icon-double-angle-down'></i>");
		
		//dynamically add the '.last' class on each last item of a branch
		$('.column ul.tree.dhtml ul li:last-child, .column ul.tree.dhtml li:last-child').addClass('last');
		
		//collapse every expanded branch
		$('.column ul.tree.dhtml i.grower.icon-double-angle-down').addClass('icon-double-angle-right').removeClass('icon-double-angle-down').parent().find('ul:first').hide();
		$('.column ul.tree.dhtml').show();
		
		//open the tree for the selected branch
			$('.column ul.tree.dhtml .selected').parents().each( function() {
				if ($(this).is('ul'))
					toggleBranch($(this).prev().prev(), true);
			});
			toggleBranch( $('.column ul.tree.dhtml .selected').prev(), true);
		
		//add a fonction on clicks on growers
		$('.column ul.tree.dhtml i.grower').click(function(){
			toggleBranch($(this));
		});
};
$(document).ready(function() {
	function openBranch(jQueryElement, noAnimation) {
		jQueryElement.addClass('icon-double-angle-down').removeClass('icon-double-angle-right');
		if(noAnimation)
			jQueryElement.parent().find('ul:first').show();
		else
			jQueryElement.parent().find('ul:first').slideDown();
}
//animate the closing of the branch (span.grower jQueryElement)
function closeBranch(jQueryElement, noAnimation) {
	jQueryElement.addClass('icon-double-angle-right').removeClass('icon-double-angle-down');
	if(noAnimation)
		jQueryElement.parent().find('ul:first').hide();
	else
		jQueryElement.parent().find('ul:first').slideUp();
}

//animate the closing or opening of the branch (ul jQueryElement)
function toggleBranch(jQueryElement, noAnimation) {
	if(jQueryElement.hasClass('icon-double-angle-down'))
		closeBranch(jQueryElement, noAnimation);
	else
		openBranch(jQueryElement, noAnimation);
}
    $('.footer-bg-mob ul.tree.dhtml ul').prev().before("<i class='grower icon-double-angle-down'> </i>");
		
		//dynamically add the '.last' class on each last item of a branch
		$('.footer-bg-mob ul.tree.dhtml ul li:last-child, .footer-bg-mob ul.tree.dhtml li:last-child').addClass('last');
		
		//collapse every expanded branch
		$('.footer-bg-mob ul.tree.dhtml i.grower.icon-double-angle-down').addClass('icon-double-angle-right').removeClass('icon-double-angle-down').parent().find('ul:first').hide();
		//$('.footer-bg-mob ul.tree.dhtml').show();
		
		//open the tree for the selected branch
			$('.footer-bg-mob ul.tree.dhtml .selected').parents().each( function() {
				if ($(this).is('ul'))
					toggleBranch($(this).prev().prev(), true);
			});
			toggleBranch( $('.footer-bg-mob ul.tree.dhtml .selected').prev(), true);
		
		//add a fonction on clicks on growers
		$('.footer-bg-mob ul.tree.dhtml i.grower').click(function(){
			toggleBranch($(this));
		});
});
