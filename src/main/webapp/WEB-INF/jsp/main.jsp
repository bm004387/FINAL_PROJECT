<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tour Visit</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">

<script src="js/bootstrap.bundle.js"></script>
</head>
<body>
<div class="container header">
	<ul class="nav justify-content-end">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="login.do">로그인</a>
	    <a class="nav-link active" aria-current="page" href="http://localhost:9008/apitest/apitest.jsp">API테스트</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">회원가입</a>
	  </li>
	</ul>
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Navbar scroll</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarScroll">
	      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
	        <li class="nav-item">
	          <a class="nav-link active" href='/about/about.do' style="cursor: pointer;">about</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Link</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Link
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">Action</a></li>
	            <li><a class="dropdown-item" href="#">Another action</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Something else here</a></li>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link disabled">Link</a>
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
<div class="topcont">
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
		      <img src="images/img2.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="images/img3.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="images/img4.png" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="images/img1.jfif" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="images/img6.jpg" class="d-block w-100" alt="...">
		    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
</div>
<div class="container">
	<div class="bestcont row">
		<div class="bestTour col">
			<h3>Best Tour</h3>
		</div>
		<div class="suggest col">
			<h3>추전 여행지</h3>
		</div>
	</div>
	<div class="ctcont row">
		<div id="carouselExampleFade" class="carousel slide carousel-fade col" data-bs-ride="carousel">
		  <div class="carousel-inner ctcontleft">
		    <div class="carousel-item active">
		      <img src="images/flower_01.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="images/img6.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="images/yuna_flower1.jpg" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		<div class="col notice">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			  <li class="nav-item" role="presentation">
			    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">공지사항</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">자주묻는 질문</button>
			  </li>
			</ul>
			<div class="tab-content" id="pills-tabContent">
			  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
				  <ul class="ntcList">
				  	<li>공지1<span>2023-03-07</span></li>
				  	<li>공지2<span>2023-03-07</span></li>
				  	<li>공지3<span>2023-03-07</span></li>
				  	<li>공지4<span>2023-03-07</span></li>
				  	<li>공지4<span>2023-03-07</span></li>
				  	<li>공지4<span>2023-03-07</span></li>
				  	<li>공지4<span>2023-03-07</span></li>
				  	<li>공지4<span>2023-03-07</span></li>
				  </ul>
			  </div>
			  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
			  	<ul class="faqList">
				  	<li>자주묻는 질문1<span>2023-03-07</span></li>
				  	<li>자주묻는 질문2<span>2023-03-07</span></li>
				  	<li>자주묻는 질문3<span>2023-03-07</span></li>
				  	<li>자주묻는 질문4<span>2023-03-07</span></li>
				  	<li>자주묻는 질문4<span>2023-03-07</span></li>
				  	<li>자주묻는 질문4<span>2023-03-07</span></li>
				  	<li>자주묻는 질문4<span>2023-03-07</span></li>
				  	<li>자주묻는 질문4<span>2023-03-07</span></li>
				  </ul>
			  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>















