<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Title</title>
      
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<link rel="shortcut icon" type="image⁄x-icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" type="image⁄x-icon" href="../image/icon.png" />
		<!-- [if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif] -->
      
	</head>
   
	<body>
    <div class="container-fluid">
    	<form name="faq_data" id="faq_data" method="post">
    		<input type="hidden" name="faq_no" value="${detail.faq_no}">
    	</form>
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">자주묻는질문</li>
              <li class="active"><a href="#">-주문/결제</a></li>
              <li><a href="#">-취소/반품</a></li>
              <li><a href="#">-상품/배송</a></li>
              <li><a href="#">-이벤트</a></li>
              <li><a href="#">-기타</a><hr></li>
              <li class="nav-header">1:1 게시판<hr></li>
              <li class="nav-header">개인정보처리지침<hr></li>
              <li class="nav-header">이용약관</li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
       <!-- faq리스트 -->
      <div class="container-fluid">
      <div class="row-fluid">
      	<div class="buttonForm">
	        <button class="">주문/결제</button>
	        <button class="">취소/반품</button>
	        <button class="">상품/배송</button>
	        <button class="">이벤트</button>
	        <button class="">기타</button>
        </div>
        <div class="span9">
          <div id="faqList"> 	
	          <!-- 디테일 정보 -->
	          <div>
	          	<table class="table table-bordered">
					<colgroup>
						<col width="17%" />
						<col width="33%" />
						<col width="17%" />
						<col width="33%" />
					</colgroup>
					<tbody>
						<tr>
							<td>작성자</td>
							<td class="text-left">관리자</td>
							<td>작성일</td>
							<td class="text-left">${faq.faq_date}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3" class="text-left">${faq.faq_title}</td>
						</tr>
						<tr class="table-height">
							<td>내용</td>
							<td colspan="3" class="text-left">${faq.faq_content}</td>
						</tr>
					</tbody>
				</table>
	          </div>
	        </div><!--/span-->
	      </div><!--/row-->
		</div><!--/faqList  -->
      <hr>
    </div><!--/.fluid-container-->
	</div>
	</div>
    
  </body>
</html>