$(".j_category.category-con").mouseleave(function() {
	$(".pannel-con.j_CategoryMenuPannel").css("display", "none");
	$(".j_MenuNav.nav-item").removeClass("selected");
});

$(".j_MenuNav.nav-item").mouseenter(function() {
	$(".j_MenuNav.nav-item").removeClass("selected");
	$(".pannel-con.j_CategoryMenuPannel").css("display", "none");
	$(this).addClass("selected");
	var index = + $(this).attr("class").match(/\d{1,}/);
	$.each($(".content-con.j_categoryContent").children(), function(i, n) {
		if(i == index) {
			$(n).css("display", "block");
			return false;
		}
	});
});
