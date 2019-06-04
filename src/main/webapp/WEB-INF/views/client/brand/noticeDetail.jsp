<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>Title</title>
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		
	</head>
	
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header">
				<h3 class="text-center">게시판 상세보기</h3>
			</div>
			
			<!--  상세정보 보기 -->
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td>말머리</td>
							<td class="text-left">${detail.no_kind}</td>
							<td>작성일</td>
							<td class="text-left">${detail.no_date}</td>
							<td>작성자</td>
							<td class="text-left">${detail.adm_no}</td>
						</tr>
						<tr>
							<td>제 목</td>
							<td colspan="5" class="text-left">${detail.no_content}</td>
						</tr>
						<tr class="table-height">
							<td>내 용</td>
							<td colspan="5" class="text-left"><textarea>${detail.no_content}</textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>