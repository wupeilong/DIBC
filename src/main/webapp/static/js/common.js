function eject_pic(img_boxid) {
	//调用示例
	layer.photos({
		photos: img_boxid,
		anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
	});
}

function showModel(title, con, anim) {
	layer.open({
		type: 1,
		title: title,
		content: con, //这里content是一个普通的String
		area: ['300px', 'auto'],
		anim: anim
	});
}

function laymsg(con){
	layer.msg(con,{
		icon: 1,
		time: 2000 //2秒关闭（如果不配置，默认是3秒）
	}, function() {
		//do something
		location.href="../home.html"
	});
}
