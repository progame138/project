<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>브랜드 페이지에 오신것을 환영합니다.</title>
		<!-- 헤더에서 브랜드 클릭시 첫 메인 페이지 -->
		
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
			
		
			
			div.content {
			  margin-left: 200px;
			  padding: 1px 16px;
			  height: 1000px;
			}
			
			@media screen and (max-width: 700px) {
			  .sidebar {
			    width: 100%;
			    height: auto;
			    position: relative;
			  }
			  .sidebar a {float: left;}
			  div.content {margin-left: 0;}
			}
			
			@media screen and (max-width: 400px) {
			  .sidebar a {
			    text-align: center;
			    float: none;
			  }
			}
			
			/*메인 사진 */
			
			* {box-sizing: border-box}
			body {font-family: Verdana, sans-serif; margin:0}
			.mySlides {display: none}
			img {vertical-align: middle;}
			
			/* Slideshow container */
			.slideshow-container {
			  max-width: 1000px;
			  position: relative;
			  margin: auto;
			}
			
			/* Next & previous buttons */
			.prev, .next {
			  cursor: pointer;
			  position: absolute;
			  top: 50%;
			  width: auto;
			  padding: 16px;
			  margin-top: -22px;
			  color: white;
			  font-weight: bold;
			  font-size: 18px;
			  transition: 0.6s ease;
			  border-radius: 0 3px 3px 0;
			  user-select: none;
			}
			
			/* Position the "next button" to the right */
			.next {
			  right: 0;
			  border-radius: 3px 0 0 3px;
			}
			
			/* On hover, add a black background color with a little bit see-through */
			.prev:hover, .next:hover {
			  background-color: pink;
			}
			
			/* Caption text */
			.text {
			  color: #f2f2f2;
			  font-size: 15px;
			  padding: 8px 12px;
			  position: absolute;
			  bottom: 8px;
			  width: 100%;
			  text-align: center;
			}
			
			/* Number text (1/3 etc) */
			.numbertext {
			  color: #f2f2f2;
			  font-size: 12px;
			  padding: 8px 12px;
			  position: absolute;
			  top: 0;
			}
			
			/* The dots/bullets/indicators */
			.dot {
			  cursor: pointer;
			  height: 15px;
			  width: 15px;
			  margin: 0 2px;
			  background-color: #bbb;
			  border-radius: 50%;
			  display: inline-block;
			  transition: background-color 0.6s ease;
			}
			
			.active, .dot:hover {
			  background-color: #717171;
			}
			
			/* Fading animation */
			.fade {
			  -webkit-animation-name: fade;
			  -webkit-animation-duration: 5s;
			  animation-name: fade;
			  animation-duration: 5s;
			}
			
			@-webkit-keyframes fade {
			  from {opacity: .4} 
			  to {opacity: 1}
			}
			
			@keyframes fade {
			  from {opacity: .4} 
			  to {opacity: 1}
			}
			
			/* On smaller screens, decrease text size */
			@media only screen and (max-width: 300px) {
			  .prev, .next,.text {font-size: 11px}
			}
			img{
				height: 500px;
				width: 100%;
			}
			li{
				list-style: none;
			}
			
			.content{
				margin-left: -300px;
			}
			
			/* 목록 보여주기 css dropdown */
			
			
		</style>
		
		<script type="text/javascript">
			
		</script>
		
	</head>
	
	<body>
		<div class="brand">
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
			<!-- 메인설명 시작 -->
			<div class="content">
			<h2>메인페이지</h2>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
			  			<!-- 슈즈스타 메인사진 첨부공간 -->
						<!-- Slideshow container -->
				<div class="slideshow-container">
				
					<div class="mySlides fade">
					  <div class="numbertext">1 / 3</div>
					  <img src="/resources/images/brand/main1.jpg">
					  <div class="text">첫번째 사진에 대한 설명</div>
					</div>
				
					<div class="mySlides fade">
					  <div class="numbertext">2 / 3</div>
					  <img src="/resources/images/brand/main2.jpg">
					  <div class="text">두번째 사진에 대한 설명</div>
					</div>
				
					<div class="mySlides fade">
					  <div class="numbertext">3 / 3</div>
					  <img src="/resources/images/brand/main3.jpg">
					  <div class="text">세번째 사진에 대한 설명</div>
					</div>
				
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				
				</div>
				<!-- 사진아래 설명 -->
				
			
			<br>
				<div style="text-align:center">
				  <span class="dot" onclick="currentSlide(1)"></span> 
				  <span class="dot" onclick="currentSlide(2)"></span> 
				  <span class="dot" onclick="currentSlide(3)"></span> 
				</div>
			</div>
			<script>
			var slideIndex = 1;
			showSlides(slideIndex);
			
			function plusSlides(n) {
			  showSlides(slideIndex += n);
			}
			
			function currentSlide(n) {
			  showSlides(slideIndex = n);
			}
			
			function showSlides(n) {
			  var i;
			  var slides = document.getElementsByClassName("mySlides");
			  var dots = document.getElementsByClassName("dot");
			  if (n > slides.length) {slideIndex = 1}    
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
			      slides[i].style.display = "none";  
			  }
			  for (i = 0; i < dots.length; i++) {
			      dots[i].className = dots[i].className.replace(" active", "");
			  }
			  slides[slideIndex-1].style.display = "block";  
			  dots[slideIndex-1].className += " active";
			}
			
			// 자동으로 사진 변환 함수
			
			var slideIndex = 0;
			showSlides();

			function showSlides() {
			  var i;
			  var slides = document.getElementsByClassName("mySlides");
			  for (i = 0; i < slides.length; i++) {
			    slides[i].style.display = "none"; 
			  }
			  slideIndex++;
			  if (slideIndex > slides.length) {slideIndex = 1} 
			  slides[slideIndex-1].style.display = "block"; 
			  setTimeout(showSlides, 5000); // Change image every 2 seconds
			}
			</script>
		</div>
	</body>
</html>