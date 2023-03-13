<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

<script src="js/bootstrap.bundle.js"></script>
<style type="text/css">
.header{
	height: 200px;
	background: gray;
}
.d-flex{
	margin-bottom: 0 !important;
}
</style>
</head>
<body>
<div class="container header">
	<ul class="nav justify-content-end">
	  <li class="nav-item">
	  <c:if test="${resultVO == null}">
	    <a class="nav-link active" aria-current="page" href="login.do">로그인</a>
	   </c:if>
	    <c:if test="${resultVO != null}">
	    <a class="nav-link active" aria-current="page" href="logout.do">로그아웃</a>
	   </c:if>
	  </li>
	  <li class="nav-item">
	   <!--   <a class="nav-link" onclick="javascript:fn_signUp();">회원가입</a> -->
	  </li>
	  <li class="nav-item">
	   <!-- TOURAPI 데이터 입력 완료로 주석처리   -->
	 <!--   <a class="nav-link active" aria-current="page" href="api.do">API테스트</a> --> 
	   <a class="nav-link active" aria-current="page" href="tourList.do">여행 목록</a>
	  </li>
	</ul>
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/"><img src="images/logo.png" style="width: 150px;"/></a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarScroll">
	      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
	        <li class="nav-item">
	          <a class="nav-link active" href="/about.do" style="cursor: pointer;">회사소개</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link active" href="/faq.do" style="cursor: pointer;">FAQ</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link active" href="/board.do" style="cursor: pointer;">게시판</a>
	        </li>
	      </ul>
	      <form class="d-flex" role="search">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</nav>
</div>