<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title><tiles:getAsString name="title" /></title>
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />

		<!-- Bootstrap core CSS -->
		<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
		
		<!-- Custom styles for this template -->
		<link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet">
		
		<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
		
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
	<%-- <div class="container">
		<div class="page-header">
			<h1><tiles:getAsString name="title" /></h1>
		</div>
		<tiles:insertAttribute name="body" />
	</div> --%>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>메인 페이지!</h1>
				<p>
					어서오세요!!!
				</p>
			</div>
		</div>
		
		<div class="container">
			<!-- Example row of columns -->
			<div class="row">
				<div class="col-md-4">
					<h2>게시판 관리</h2>
					<p>처음은 아니지만 아무튼 만든 게시판. 관리는 안되지만 어째서인지 관리라는 헤딩이 붙어있네. 아무튼 관리임.</p>
					<p><a class="btn btn-default" href="/board/boardList" role="button">이동 &raquo;</a></p>
				</div>
				<div class="col-md-4">
					<h2>갤러리 게시판 관리</h2>
					<p>썸네일 처리 게시판. 입력/수정/삭제 처리 완료...는 안 됨. lightbox 처리 등등.</p>
					<p><a class="btn btn-default" href="#" role="button">이동 &raquo;</a></p>
				</div>
				<div class="col-md-4">
					<h2>로그인 및 회원 관리</h2>
					<p>회원 가입/정보 수정/회원 탈퇴 처리 완료. 로그인 및 로그아웃 처리 완료.</p>
					<p><a class="btn btn-default" href="#" role="button">이동 &raquo;</a></p>
				</div>
			</div>
			
			<hr>
		</div> <!-- /container -->
	</div>
	
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
	
	
	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
	</body>
</html>
