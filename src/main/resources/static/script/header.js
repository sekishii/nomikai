$(function() {

	$("#menu_toggle").click(function() {
		// ロゴとアイコンの表示切り替え
		if($("#sumakagi_logo").css('display') == 'block'
			|| $("#sumakagi_logo").css('display') == 'inline') {
			$("#sumakagi_logo").hide();
			$("#sumakagi_icon").show();
		} else {
			$("#sumakagi_icon").hide();
			$("#sumakagi_logo").show();
		}
	});
}); 