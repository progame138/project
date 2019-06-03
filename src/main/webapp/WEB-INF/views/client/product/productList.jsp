<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>상품 리스트</title>
		
		<link rel="stylesheet" href="/resources/include/css/prodctg.css" />
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript" src="/resources/include/js/prodctg.js"></script>
		<script type="text/javascript">
			var defaultRequest = "/product/showList?" + splitRequest(window.location.search);
			
			$(function() {
				$("#resetCategory").attr("href", defaultRequest);
				
				showProductList();
				showProductCategory();
				resetPriceList($("#priceList"));
			});
			
			function showProductList() {
				$("#itemList").html("");
				
				$.ajax({
					url: "/product/getList" + window.location.search,
					type: "get",
					dataType: "json",
					error: function() {
						alert("상품 정보를 불러올 수 없었습니다.");
					},
					success: function(data) {
						if(!jQuery.isEmptyObject(data)) {
							$.each(data, function(index, stack) {
								$("#itemList").append(createProductDiv(stack));
								$("#itemList").append(createProductDiv(stack));
								$("#itemList").append(createProductDiv(stack));
								$("#itemList").append(createProductDiv(stack));
								$("#itemList").append(createProductDiv(stack));
							});
						} else {
							var cont = $("<div>").text("검색 결과가 없습니다.").addClass("text-center align-middle emptyResult").css({"color":"grey"});
							$("#itemList").append(cont);
						}
					}
				});
			}
			
			function showProductCategory() {
				$("#ctgList").html("");
				
				$.ajax({
					url: "/pctg/getList" + window.location.search,
					type: "get",
					dataType: "json",
					error: function() {
						alert("상품 분류 정보를 불러올 수 없었습니다.");
					},
					success: function(data) {
						if(!jQuery.isEmptyObject(data)) {
							// 요청값 분석
							var requestParam = splitRequest(window.location.search);
							// li 태그 생성 및 추가
							$.each(data, function(index, stack) {
								$("#ctgList").append(createProdCtgLink(stack, requestParam));
							});
						} else {
							var cont = $("<li>").text("분류가 없습니다.").css({"color":"grey"});
							$("#ctgList").append(cont);
						}
					}
				});
			}
		</script>
	</head>
	
	<body>
		<div id="mainFrame">
			
			<!-- ############################## 카테고리 경로 ############################## -->
			<div id="breadcrumbs">카테고리 경로 표시 자리</div>
			
			<!-- ############################## 메뉴란 ############################## -->
			<div id="sideMenuBar" class="col-md-2">
				<!-- 전체보기 -->
				<div class="menuSection">
					<a href="#" id="resetCategory">전체보기</a>
				</div>
				<!-- 카테고리 선택란 -->
				<div class="menuSection">
					<div class="menuTitle">
						<h3 class="menuTitleBody"><a data-toggle="collapse" aria-expanded="true"
						href="#ctgList" aria-controls="ctgList">분류</a></h3>
					</div>
					<!-- 카테고리 리스트 -->
					<ul class="menuList collapse in" id="ctgList">
					</ul>
				</div>
				<div class="menuSection">
					<!-- 사이즈 필터 -->
					<div class="menuTitle">
						<h3 class="menuTitleBody"><a data-toggle="collapse" aria-expanded="true"
						href="#sizeList" aria-controls="sizeList">사이즈</a></h3>
					</div>
					<!-- 사이즈 리스트 -->
					<ul class="menuList collapse in" id="sizeList"><!-- 코어태그로 나이별 처리하기 -->
						<li><a href="#">jQuery</a></li>
						<li><a href="#">BootStrap</a></li>
					</ul>
					
					<!-- 컬러 필터 -->
					<div class="menuTitle">
						<h3 class="menuTitleBody"><a data-toggle="collapse" aria-expanded="true"
						href="#colorList" aria-controls="colorList">색상</a></h3>
					</div>
					<!-- 색상 리스트 -->
					<ul class="menuList collapse in" id="colorList">
						<li><a href="#">About</a></li>
						<li><a href="#">Help</a></li>
					</ul>
					
					<!-- 가격 필터 -->
					<div class="menuTitle">
						<h3 class="menuTitleBody"><a data-toggle="collapse" aria-expanded="true"
						href="#priceList" aria-controls="priceList">가격대</a></h3>
					</div>
					<!-- 가격 리스트 -->
					<ul class="menuList collapse in" id="priceList">
						<li><button type="button" data-toggle="button"  class="priceFilter" data-pricet="30000">30,000원 미만</button></li>
						<li><a class="priceFilter" data-priceb="30000" data-pricet="60000">30,000 ~ 60,000</a></li>
						<li><a class="priceFilter" data-priceb="60000" data-pricet="100000">60,000 ~ 100,000</a></li>
						<li><a class="priceFilter" data-priceb="100000" >100,000원 이상</a></li>
					</ul>
				</div>
			</div>
			
			<div class="container col-md-9" id="itemListContainer">
				<!-- ############################## 페이지 ############################## -->
				<div id="pagination" class="text-right">페이지네이션 자리</div>
				
				<!-- ############################## 상품란 ############################## -->
				<div class="row" id="itemList"></div>
			</div>
			
		</div>
	</body>
</html>