<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
		<title>공지사항 페이지에 오신것을 환영합니다.</title>
		<!-- 3. 공지사항 페이지 -->
		
		<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="/resources/images/icon.png" />
		
		<!-- [if lt IE 9]>
			<script src="/resources/include/js/html5shiv.js"></script>
		<![endif] -->
		<link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="/resources/include/dist/css/bootstrap-ko.css" rel="stylesheet">
    	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      	<script type="text/javascript" src="/resources/include/js/common.js"></script>
      	<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
     	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<style>
				table{
				line-height:1.8;
				font-size:17px;
				width:100%;
				margin:50px 70px;
				}
				#insertFormBtn{
				float:right;}
				.cnt{color:red;}
				h3{
				text-align:center;}
				#boardsearch{
				float:right;}
				.required{
				color:red;}
				
			</style>
		
		<script type="text/javascript">
			
		</script>
		
	</head>
	
	<body>
		<div class="contentContainer container">
			<div class="contentTit"><h3>공지사항 리스트</h3></div>
			
			<form id="detailForm">
				
			</form>
			
			<<!-- 검색기능 시작 -->
			<div id="noticeSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<div class="form-group">
						<label style="font-size:16px">검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="no_title">제목</option>
							<option value="no_content">내용</option>
						</select>
						<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요." class="form-control">
						<button type="button" id="searchData" class="btn btn-success">검색</button>
					</div>
				</form>
			</div>
			
			<div id="noticeList">
			<table class="table-striped" summary="게시판리스트">
				<colgroup>
					<col width="10%"/>
					<col width="62%"/>
					<col width="15%"/>
					<col width="13%"/>
				</colgroup>
				<thead>
					<tr>
						<th data-value="no_no" class="order">글번호</th>
						<th data-value="no_kind">말머리</th>
						<th data-value="no_title">글제목</th>
						<th data-value="no_content">글내용</th>
						<!-- <th data-value="adm_no">작성자</th> -->
						<th data-value="no_date">작성일</th>
					</tr>
				</thead>
				
				<tbody id="list">
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty noticeList}">
							<c:forEach var="board" items="${noticeList}" varStatus="status">
								<tr class="tac" data-num="${notice.no_no}">
									<td>${notice.no_no}</td>
									<td>${notice.no_kind}</td>
									<td class="goDetail tal">${notice.no_title}</td>
									<td>${notice.no_content}</td>
									<td>${notice.no_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			</div>
		</div>
		
		
		
	</body>
</html>