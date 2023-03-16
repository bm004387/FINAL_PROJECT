<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap.min.css">

<script src="/js/bootstrap.bundle.js"></script>

<style type="text/css">
@font-face {
    font-family: 'Dovemayo_gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.header{
	height: 200px;
	background: gray;
}
.d-flex{
	margin-bottom: 0 !important;
}
a{
	font-family: 'Dovemayo_gothic';
}
</style>
<!-- Channel Plugin Scripts -->
<script>
   (function() {
      var w = window;
      if (w.ChannelIO) {
         return (window.console.error || window.console.log || function() {
         })('ChannelIO script included twice.');
      }
      var ch = function() {
         ch.c(arguments);
      };
      ch.q = [];
      ch.c = function(args) {
         ch.q.push(args);
      };
      w.ChannelIO = ch;
      function l() {
         if (w.ChannelIOInitialized) {
            return;
         }
         w.ChannelIOInitialized = true;
         var s = document.createElement('script');
         s.type = 'text/javascript';
         s.async = true;
         s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
         s.charset = 'UTF-8';
         var x = document.getElementsByTagName('script')[0];
         x.parentNode.insertBefore(s, x);
      }
      if (document.readyState === 'complete') {
         l();
      } else if (window.attachEvent) {
         window.attachEvent('onload', l);
      } else {
         window.addEventListener('DOMContentLoaded', l, false);
         window.addEventListener('load', l, false);
      }
   })();
   ChannelIO('boot', {
      "pluginKey" : "634ebfd4-9412-4ee3-89a8-ca5bac58fa25"
   });
</script>
<!-- End Channel Plugin -->
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
	 
	
	  </li>
	</ul>
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="/main.do"><img src="/images/logo.png" style="width: 150px;"/></a>
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
	           <a class="nav-link active" href="/location.do" style="cursor: pointer;">찾아오시는길</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link active" href="/board.do" style="cursor: pointer;">게시판</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link active" href="/react.do" style="cursor: pointer;">게시판</a>
	        </li>
	         
	   
	   <c:if test="${resultVO != null }">
	   <div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		     여행 상품 메뉴
		  </button>
		   <form id="cart" name="cart" method="post" action="tourcartlist.do">
				
				<input type="hidden" name="memberid" value=${resultVO.memberId}>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="tourList.do">여행 상품 목록</a></li>
		    <li><button id ="cartBtn" form="cart" type="submit" class="" >카트리스트</button></li>
		    
		    <li><a class="dropdown-item" href="#">Something else here</a></li>
		    <c:if test="${resultVO.memberId=='admin'}">
		      <li><a class="dropdown-item" href="api.do">데이터 업데이트</a></li>
		      </c:if>
		  </ul>
		 
				</form>
		</div>
	   </c:if>
			
	      </ul>
	    </div>
	  </div>
	</nav>
</div>