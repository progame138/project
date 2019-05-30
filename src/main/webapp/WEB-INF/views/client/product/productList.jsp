<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title></title>
		
		<script type="text/javascript" src="/resources/include/js/product.js"></script>
		<script type="text/javascript">
			$(function() {
				showProductList();
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
							});
						} else {
							var cont = $("<div>").text("검색 결과가 없습니다.").addClass("text-center align-middle").css({"color":"grey"});
							$("#itemList").append(cont);
						}
					}
				});
			}
		</script>
	</head>
	
	<body>
		<div class="container">
			<div class="sideMenuBar"></div>
			<div class="container">
				<div class="row" id="itemList"></div>
			</div>
		</div>
	</body>
</html>