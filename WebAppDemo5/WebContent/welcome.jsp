<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Welcome</title>

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

	function init() {

		console.log(totalTabs.length);

		for (var i = 2; i <= totalTabs.length; i++) {

			var tabNumber = "tab_" + i;
			var tabContent = document.getElementById(tabNumber);
			tabContent.style.display = "none";
			console.log(tabContent.style.display);
		}
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
			<form action="YouTubeSearchServlet">
				<input type="submit" value="Search Video">
			</form>

		</div>

		<span id="tab_2">I am inside Tab 2 </span> <span id="tab_3">I
			am inside Tab 3 </span>
	</div>


</body>
</html>