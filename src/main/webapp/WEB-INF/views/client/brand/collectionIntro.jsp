<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>컬렉션소개 페이지에 오신것을 환영합니다.</title>
		<!-- 2. 컬렉션 소개 페이지 -->
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		
		<style type="text/css">
			/*사이드 바 */
			body {
			  margin: 0;
			  font-family: "Lato", sans-serif;
			}
			
			.sidebar {
			  margin-left: -240px;
			  padding: 0px;
			  width: 200px;
			  background-color: #f1f1f1;
			  position: fixed;
			  height: 100%;
			  overflow: auto;
			}
			
			.sidebar a {
			  display: block;
			  color: black;
			  padding: 16px;
			  text-decoration: none;
			}
			 
			.sidebar a.active {
			  background-color: #4CAF50;
			  color: white;
			}
			
			.sidebar a:hover:not(.active) {
			  background-color: #555;
			  color: white;
			}
		</style>
		
	</head>
	
	<body>
		<div>
			<!-- 사이드 바  -->
			<div class="sidebar">
			  <a class="active" href="/brand/brandMain">메인</a>
			  <div class="dropdown">
			    <button class="dropbtn">브랜드 소개 </button>
			    <div class="dropdown-content">
			      <a href="#">브랜드 가치</a>
			      <a href="#">브랜드 기능</a>
			      <a href="#">브랜드 뉴스</a>
			    </div>
			  </div>
			  
			  <a href="/brand/collectionIntro">컬렉션 소개</a>
			  <a href="/brand/noticeList">공지사항</a>
			</div>
		</div>
	</body>
</html>