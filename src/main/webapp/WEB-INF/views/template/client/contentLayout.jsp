<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />

		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		
		<!-- Custom styles for this template -->
		<link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet">
		
		<!-- jQuery & Bootstrap JavaScript -->
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
	</head>
	
	<body>
	
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<tiles:insertAttribute name="header" />
	</nav>
	
	<!-- Begin page content -->
	<div class="container mainBody">
		<tiles:insertAttribute name="body" />
	</div>
	
	<!-- footer -->
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
	
	</body>
</html>
