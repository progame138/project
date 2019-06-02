<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>상품 리스트</title>
		
		<link rel="stylesheet" href="/resources/include/css/prodctg.css" />
		<link rel="stylesheet" href="/resources/include/css/product.css" />
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript">
			$(function() {
				showProductList();
				showProductCategory();
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
				
			}
		</script>
	</head>
	
	<body>
		<div id="mainFrame">
			
			<!-- ############################## 카테고리 경로 ############################## -->
			<div id="breadcrumbs">카테고리 경로 표시 자리</div>
			
			<!-- ############################## 메뉴란 ############################## -->
			<div id="sideMenuBar" class="col-md-2">
				<!-- 카테고리 선택란 -->
				<div class="menuSection">
					<div class="menuTitle">
						<h3 class="menuTitleBody">분류</h3>
					</div>
					<!-- 카테고리 리스트 -->
					<ul class="menuList" id="ctgList">
						<li class=""><a href="#">HTML</a></li>
						<li class=""><a href="#">CSS</a></li>
						<li class=""><a href="#">ECMAScript5</a></li>
					</ul>
				</div>
				<div class="menuSection">
					<!-- 사이즈 필터 -->
					<div class="menuTitle">
						<h3 class="menuTitleBody">사이즈</h3>
					</div>
					<!-- 사이즈 리스트 -->
					<ul class="menuList" id="sizeList"><!-- 코어태그로 나이별 처리하기 -->
						<li class=""><a href="#">jQuery</a></li>
						<li class=""><a href="#">BootStrap</a></li>
					</ul>
					
					<!-- 컬러 필터 -->
					<div class="menuTitle">
						<h3 class="menuTitleBody">색상</h3>
					</div>
					<!-- 색상 리스트 -->
					<ul class="menuList" id="colorList">
						<li class=""><a href="#">About</a></li>
						<li class=""><a href="#">Help</a></li>
					</ul>
					
					<!-- 가격 필터 -->
					<div class="menuTitle">
						<h3 class="menuTitleBody">가격대</h3>
					</div>
					<!-- 가격 리스트 -->
					<ul class="menuList" id="priceList">
						<li class=""><a href="#">About</a></li>
						<li class=""><a href="#">Help</a></li>
					</ul>
				</div>
				<!-- 필터 적용을 위한 폼 -->
				<div class="sumbitSection">
					필터 선택 적용을 위한 자리
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