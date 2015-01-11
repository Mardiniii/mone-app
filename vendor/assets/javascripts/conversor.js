$(document).on("page:change",function(){
	$('#mone_value').keyup(function(){
		var mones = $('#mone_value').val();
		console.log(mones);
		$('#value').val(mones*1000);
	});
});

