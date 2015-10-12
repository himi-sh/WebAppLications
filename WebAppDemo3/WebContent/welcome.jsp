<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Welcome</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
   <script src="search.js"></script>
   <script src="https://apis.google.com/js/client.js?onload=init"></script>

<script
	src="https://apis.google.com/js/client.js?onload=googleApiClientReady">   </script>
<script type="text/javascript">
	var totalTabs = document.getElementsByTagName("a");

	function changeTab(currentTabNumber) {

		var tabNumber = "tab_" + currentTabNumber;
		console.log(tabNumber);

		console.log(totalTabs.length);

		for (var i = 1; i <= totalTabs.length; i++) {

			if (i == currentTabNumber)
				document.getElementById(tabNumber).style.display = "block";
			else
				document.getElementById("tab_" + i).style.display = "none";
		}
	}
	
	function appendResults(text) {
        var results = document.getElementById('results');
        results.appendChild(document.createElement('P'));
        results.appendChild(document.createTextNode(text));
      }

	
	function makeRequest() {
        var request = gapi.client.urlshortener.url.get({
          'shortUrl': 'http://goo.gl/fbsS'
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
		console.log("gapi client "+gapi.client);
		console.log(totalTabs.length);

		for (var i = 2; i <= totalTabs.length; i++) {

			var tabNumber = "tab_" + i;
			var tabContent = document.getElementById(tabNumber);
			tabContent.style.display = "none";
			console.log(tabContent.style.display);
		}
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
			var videoId = response.items[0].id.videoId;
        	console.log("result "+videoId);
			var str = JSON.stringify(response.result);
			$('#search-container').html('<pre>' + str + '</pre>');
		});
	}
</script>
</head>
<body onload="init()">
	<h1>
		Welcome
		<%=request.getParameter("name")%></h1>

	<div class="tabs">
		<a href="javascript:changeTab(1);">Tab 1</a> <a
			href="javascript:changeTab(2);">Tab 2</a> <a
			href="javascript:changeTab(3);">Tab 3</a>
	</div>

	<div class="tabsContent">

		<div id="tab_1">
			I am inside Tab 1 <br>
<!-- 
			<form action="YouTubeVideoSearchServlet">
				<label>Search Video</label> <input name="query" type="text" />
				<input type="submit">
			</form>
 -->
		</div>

		<span id="tab_2">I am inside Tab 2 </span>
		 <span id="tab_3">I
			am inside Tab 3 </span>
	</div>


	<br>
	<br>

	<div id="buttons">
		<label> <input id="query"  type="text" />
			<button id="search-button"  onclick="search()">Search</button></label>
	</div>

	<div id="search-container"></div>
	
	<div id="results"></div>

</body>
</html>