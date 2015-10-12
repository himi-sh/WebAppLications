/*
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
			player = new YT.Player('ytplayer',
			{
				height : '390',
				width : '640',
				videoId : videoId
			});
		}

	}*/