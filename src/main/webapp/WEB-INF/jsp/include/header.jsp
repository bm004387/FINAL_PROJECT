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
#navbarNav{
	justify-content: space-between;
}
#navbarNav li{
    display: flex;
    align-items: center;
	margin: 10px;
	font-size: 20px;
}
#navbarNav li a{
	color: #000; 
}
.header{
	height: 200px;
}
.d-flex{
	margin-bottom: 0 !important;
}
a{
	font-family: 'Dovemayo_gothic';
	text-decoration: none;
	cursor: pointer;
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
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid" style="background: #fff; z-index: 10; display: flex; flex-direction: column;">
	    <a class="navbar-brand" href="/main.do"><img src="/images/logo1.png" style="width: 350px;"/></a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNav" style="width: 100%; background: lightblue;">
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link active" href="/about.do">회사소개</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link active" href="/faq.do">FAQ</a>
	        </li>
	          <li class="nav-item">
	           <a class="nav-link active" href="/location.do">찾아오시는길</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link active" href="/board.do">공지사항</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link active" href="/react.do">홍보게시판</a>
	        </li>
			<c:if test="${resultVO != null }">
				<li class="dropdown">
					<a class="dropdown-toggle"data-bs-toggle="dropdown" aria-expanded="false">여행 상품 메뉴 </a>
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
				</li>
			</c:if>
		</ul>
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
	    </div>
	  </div>
	</nav>
</div>