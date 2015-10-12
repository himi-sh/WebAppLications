<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>You Tube Video's</title>
<script type="text/javascript" src="http://www.youtube.com/player_api"></script>
<script src="search.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script	src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
<script src="https://apis.google.com/js/client.js?onload=init"></script>





<script>
	
	var videoId = null;
	// Load the IFrame Player API code asynchronously.
	var tag = document.createElement('script');
	
	tag.src = "https://www.youtube.com/player_api";
	console.log(('script')[0]);
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	// Replace the 'ytplayer' element with an <iframe> and
	// YouTube player after the API code downloads.
	var player;
	
	function appendResults(text) {
		var results = document.getElementById('results');
		results.appendChild(document.createElement('P'));
		results.appendChild(document.createTextNode(text));
	}

	function makeRequest() {
		var request = gapi.client.urlshortener.url.get({
			'shortUrl' : 'http://goo.gl/fbsS'
		});
		request.then(function(response) {
			console.log(response.result);
			appendResults(response.result.longUrl);
		}, function(reason) {
			console.log('Error: ' + reason.result.error.message);
		});
	}

	function init() {

		gapi.client.setApiKey('AIzaSyAkPYFYBDFmoIPLA4zSMIgoBu1z3ZbJrSk');
		gapi.client.load('urlshortener', 'v1').then(makeRequest);
		gapi.client.load("youtube", "v3", function() {
			// yt api is ready
		});
		console.log("gapi client " + gapi.client);
	}

	// Search for a specified string.
	function search() {
		console.log("searching");
		var q = document.getElementById('query').value;
		console.log("searching " + q);
		var request = gapi.client.youtube.search.list({
			q : q,
			part : 'snippet'
		});

		request.execute(function(response) {
			videoId = response.items[0].id.videoId;
			console.log("result " + videoId);
			var str = JSON.stringify(response.result);
			$('#search-container').html('<pre>' + str + '</pre>');
			onYouTubePlayerAPIReady();
		});
		
		function onYouTubePlayerAPIReady() {
			player = new YT.Player('ytplayer', {
				height : '390',
				width : '640',
				videoId : videoId
		});

	}
</script>

</head>
<body>

	<div id="ytplayer"></div>

	<br>
	<br>

	<div id="buttons">
		<label> <input id="query" type="text" />
			<button id="search-button" onclick="search()">Search</button></label>
	</div>

	<div id="search-container"></div>

	<div id="results"></div>

</body>
</html>