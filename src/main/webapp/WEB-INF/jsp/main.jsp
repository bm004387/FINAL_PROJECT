<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tour Visit</title>
<script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script>
        $(function(){
            if($.cookie('popup') == 'none'){
                $("#cookie").hide();
            }
            var $expiresChk = $("#expiresChk");
            $(".closeBtn").on("click", closePop );
            function closePop(){
                if($expiresChk.is(":checked")){
                    $.cookie("popup","none",{expires:3, path:"/"});
                }
                $("#cookie").fadeOut("fast");
            }
        });
    </script>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="cookie">
   	<img src="images/img1.jfif" alt="공지사항이미지" width="300px" height="300px"> 
    <p class="closeWrap">
        <input type="checkbox" name="expiresChk" id="expiresChk">
        <label for="expiresChk">3일 동안 이 창 열지 않기</label>
        <button class="closeBtn">닫기</button>
    </p>
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
<div class="container">
	<h3>이달의 추천 여행지</h3>
	<hr>
	<div class="btcont">
		<div>
			<img src="images/img1.jfif">
		</div>
		<div>
			<img src="#">
		</div>
		<div>
			<img src="#">
		</div>
		<div>
			<img src="#">
		</div>
		<div>
			<img src="#">
		</div>
		<div>
			<img src="#">
		</div>
	</div>
</div>
<div class="container">
	<div class="footer">
		
	</div>
</div>
</body>
</html>














