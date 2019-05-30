<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
	    <title>약관설명</title>
	
	    <!-- 스타일 -->
	    <link href="/resources/include/dist/css/bootstrap-ko.css" rel="stylesheet">
	    
	    
	    <script ></script>
	    <style type="text/css">
	      body {
	        padding-top: 60px;
	        padding-bottom: 40px;
	      }
	      .sidebar-nav {
	        padding: 9px 0;
	      }
	
	      @media (max-width: 980px) {
	        /* Enable use of floated navbar text */
	        .navbar-text.pull-right {
	          float: none;
	          padding-left: 5px;
	          padding-right: 5px;
	        }
	        
	        
	        .hero-unit, .well {
	        	background: white;
	        }
	      }
	    </style>
	    <link href="/resources/include/dist/css/bootstrap-responsive.css" rel="stylesheet">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	</head>
	<body>
	<div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav"><!--  -->
            <ul class="nav nav-list">
              <li class="nav-header">자주묻는질문</li>
              <li class="active"><a href="/cscenter/faqList?fc_no=1">-주문/결제</a></li>
              <li><a href="/cscenter/faqList?fc_no=2">-취소/반품</a></li>
              <li><a href="/cscenter/faqList?fc_no=3">-상품/배송</a></li>
              <li><a href="/cscenter/faqList?fc_no=4">-이벤트</a></li>
              <li><a href="/cscenter/faqList?fc_no=5">-기타</a><hr></li>
              <li class="nav-header">1:1 게시판<hr></li>
              <li class="nav-header"><a href="/cscenter/provision?p_no=2">개인정보처리지침</a><hr></li>
              <li class="nav-header"><a href="/cscenter/provision?p_no=1">이용약관</a></li>
            </ul>
          </div>
        </div>
      
      
         <div class="span9" >
       	<div class="hero-unit" ><!--  -->
            <h2>${provisionList.p_title}</h2><hr>
            <p>${provisionList.p_content}</p>
        </div>
       </div>
      </div>
      </div>       
	</body>
</html>