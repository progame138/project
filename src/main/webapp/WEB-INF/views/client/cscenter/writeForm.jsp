<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1게시판 문의</title>
      
      	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	</head>
   
	<body>
			<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">게시판 글작성</h3></div>
			<div class="contentTB ">
				<form id="f_writeForm">
					<div class="form-group">
						<label for="mem_id">작성자아이디</label>
						<input type="text" id="mem_id" name="mem_id" class="form-control"/>
					</div>
					<div class="form-group">	
						<label for="od_no">주문번호</label>
						<select>
							<%-- <c:forEach var="num" begin="${ }" end="${ }">
								<option></option>
							</c:forEach> --%>
						</select>
					</div>
					<div class="form-group">
						<label for="qna_title">제목</label>
						<input type="text" id="qna_title" name="qna_title" class="form-control"/>
					</div>
					<div class="form-group">		
						<label for="b_content">내용</label>
						<textarea id="b_content" name="b_content" class="form-control" rows="8"></textarea>
					</div>
					
					<div class="text-right">
						<input type="button" value="저장" id="boardInsertBtn" class="btn btn-success">
						<input type="button" value="취소" id="boardCancelBtn" class="btn btn-default"> 
						<input type="button" value="목록" id="boardListBtn" class="btn btn-default">
					</div>
				</form>
			</div>
			
		</div>
	</body>
</html>