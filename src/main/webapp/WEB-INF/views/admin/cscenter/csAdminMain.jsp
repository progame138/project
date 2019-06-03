<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객센터 관리자 홈</title>
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap-theme.min.css">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	</head>
   
	<body>
		<div class="t">
			<table class="table table-bordered">
				<tr>
					<td rowspan="2" class="text-center">배송준비중</td>
					<td rowspan="2" class="text-center">배송중</td>
					<td class="text-center">취소</td>
					<td class="text-center">교환</td>
					<td class="text-center">반품</td>
					<td rowspan="2" class="text-center">1:1문의</td> 
				</tr>
				<tr>
					<td class="text-center">신청/처리</td>
					<td class="text-center">신청/처리</td>
					<td class="text-center">신청/처리</td>
				</tr>
				<tr>
					<td class="text-center"><!-- 배송준비중인상품갯수 --><a href="#">1/2</a></td>
					<td class="text-center"><!-- 배송중관리 --><a href="#">3/4</a></td>
					<td class="text-center"><!-- 1:1문의취소 --><a href="#">5/8</a></td>
					<td class="text-center"><!-- 1:1문의교환 --><a href="#">1/10</a></td>
					<td class="text-center"><!-- 1:1문의반품 --><a href="#">12/30</a></td>
					<td class="text-center"><!-- 1:1문의 기타 --><a href="#">10/25</a></td>
				</tr>
			</table>
			
			<ul class="nav nav-tabs">
				<li role="presentation" class="active" id="chk"><a href="#">게시물현황</a></li>
				<li role="presentation"><a href="#" id="chk2">주문처리현황</a></li>
			</ul>
			
			<table class="table table-bordered" id="productTotal">
				<tr>
					<th>날짜</th>
					<th>배송준비중</th>
					<th>배송중</th>
					<th>배송완료</th>
					<th>취소</th>
					<th>교환</th>
					<th>반품</th>
					<th>주문합계</th>
				</tr>
				<tr>
					<td><!-- 날짜 -->2019-05-04</td>
					<td><!-- 배송준비중건수 -->1</td>
					<td><!-- 배송중건수 -->3</td>
					<td><!-- 배송완료건수 -->4</td>
					<td><!-- 취소건수 -->2</td>
					<td><!-- 교환건수 -->3</td>
					<td><!-- 반품건수 -->4</td>
					<td><!-- 주문총합건수 -->17</td>
				</tr>
			</table>
			
			<table class="table table-bordered" id="boardTotal">
				<tr>
					<th>날짜</th>
					<th>이벤트</th>
					<th>1:1게시판</th>
					<th>게시물합계</th>
				</tr>
				<tr>
					<td><!--  -->2019-05-04</td>
					<td><!--  -->1</td>
					<td><!--  -->12</td>
					<td><!--  -->13</td>
				</tr>
			</table>
		</div>
		<div class="form-control">
			<label>게시물 등록</label>
			<button type="button" value="자주 묻는 질문  등록하기" class=""></button>
		</div>
	</body>
</html>