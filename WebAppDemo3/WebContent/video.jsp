<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>You Tube Video's</title>
<script type="text/javascript" src="http://www.youtube.com/player_api"></script>
<script>
	// Load the IFrame Player API code asynchronously.
	var tag = document.createElement('script');
	tag.src = "https://www.youtube.com/player_api";
	console.log(('script')[0]);
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	// Replace the 'ytplayer' element with an <iframe> and
	// YouTube player after the API code downloads.
	var player;
	function onYouTubePlayerAPIReady() {
		player = new YT.Player('ytplayer', {
			height : '390',
			width : '640',
			videoId : 'M7lc1UVf-VE'
		});
		
	}
</script>

</head>
<body>
	<iframe width=inherit height=inherit
		src="https://www.youtube.com/embed/Vd4iNPuRlx4" frameborder="0"></iframe>
	<iframe width=inherit height=inherit
		src="https://www.youtube.com/embed/Vd4iNPuRlx4?autoplay=1"> </iframe>
		
	<div id="ytplayer"></div>





</body>
</html>