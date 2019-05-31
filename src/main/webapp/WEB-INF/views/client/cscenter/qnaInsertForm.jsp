<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1문의 게시판 글쓰기</title>
	</head>
   
	<body>
		<div class="contentContainer container-fluid">
			<div class="contentTit page-header"><h3 class="text-center">게시판 글작성</h3></div>
			<div class="contentTB ">
				<form id="f_writeForm">
					<div class="form-group">
						<label for="b_name">작성자</label>
						<input type="text" id="b_name" name="b_name" class="form-control"/>
					</div>
					
					<div class="form-group">	
						<label for="b_title">글제목</label>
						<input type="text" id="b_title" name="b_title" class="form-control"/>
					</div>
					
					<div class="form-group">		
						<label for="b_content">내용</label>
						<textarea id="b_content" name="b_content" class="form-control" rows="8"></textarea>
					</div>
					
					<div class="form-group">	
						<label for="b_pwd">비밀번호</label>
						<input type="password" id="b_pwd" name="b_pwd" class="form-control">
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
	</body>
</html>