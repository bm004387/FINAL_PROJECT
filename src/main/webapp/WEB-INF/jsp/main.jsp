<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tour Visit</title>

<jsp:include page="include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/main.css">

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
                    $.cookie("popup","none",{expires:1, path:"/"});
                }
                $("#cookie").fadeOut("fast");
            }
        });
    </script>
    <style>
a{
	cursor: pointer;	
}
</style>
<div id="cookie">
   	<a><img src="images/cookie.jpg" alt="공지사항이미지"></a> 
    <p class="closeWrap">
        <input type="checkbox" name="expiresChk" id="expiresChk">
        <label for="expiresChk">오늘 하루 이 창 열지 않기</label>
        <button class="closeBtn btn btn-secondary">닫기</button>
    </p>
</div>
<div class="topcont">
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
		      <a><img src="images/액스포대교 무지게 분수.jpg" class="d-block w-100" alt="액스포 대교"></a>
		    </div>
		    <div class="carousel-item">
		      <a><img src="images/경복궁.jpg" class="d-block w-100" alt="경복궁"></a>
		    </div>
		    <div class="carousel-item">
		      <a><img src="images/img4.png" class="d-block w-100" alt="야간관광 100선"></a>
		    </div>
		    <div class="carousel-item">
		      <a><img src="images/경복궁1.jpg" class="d-block w-100" alt="경복궁"></a>
		    </div>
		    <div class="carousel-item">
		      <a><img src="images/남산 순환도로.png" class="d-block w-100" alt="남산 순환도로"></a>
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
			<a href="#"><img src="images/besttour.jpg" class="img-thumbnail" alt="..."></a>
		</div>
		<div class="suggest col">
			<!-- <img src="images/recommend.jpg"> -->
			<a href="#"><img src="images/recommend.jpg" class="img-thumbnail" alt="..."></a>
		</div>
	</div>
	<div class="ctcont row">
		<div id="carouselExampleFade" class="carousel slide carousel-fade col" data-bs-ride="carousel">
		  <div class="carousel-inner ctcontleft">
		    <div class="carousel-item active">
		      <a href="#"><img src="images/img2.png" class="d-block w-100" alt="케러셀 이미지1"></a>
		    </div>
		    <div class="carousel-item">
		      <a href="#"><img src="images/img6.jpg" class="d-block w-100" alt="케러셀 이미지1"></a>
		    </div>
		    <div class="carousel-item">
		      <a href="#"><img src="images/img3.jfif" class="d-block w-100" alt="케러셀 이미지1"></a>
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
			    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">FAQ</button>
			  </li>
			</ul>
			<div class="tab-content" id="pills-tabContent">
			  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
				  <ul class="ntcList">
				  	<c:forEach items="${boardList}" var="boardList" end="8">
				  		<li><a class="move" href="/detail.do/bno=${boardList.bno}"><c:out value="${boardList.title}" /></a>
				  			<span><c:out value="${boardList.regDate}" /></span></li>
				  	</c:forEach>
				  </ul>
			  </div>
			  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
			  	<ul class="faqList">
				  	<li><a>자주묻는 질문1</a><span>2023-03-07</span></li>
				  	<li><a>자주묻는 질문1</a><span>2023-03-07</span></li>
				  	<li><a>자주묻는 질문1</a><span>2023-03-07</span></li>
				  	<li><a>자주묻는 질문1</a><span>2023-03-07</span></li>
				  	<li><a>자주묻는 질문1</a><span>2023-03-07</span></li>
				  	<li><a>자주묻는 질문1</a><span>2023-03-07</span></li>
				  	<li><a>자주묻는 질문1</a><span>2023-03-07</span></li>
				  	<li><a>자주묻는 질문1</a><span>2023-03-07</span></li>
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
			<img src="http://tong.visitkorea.or.kr/cms/resource/53/2951253_image2_1.jpg" class="img-thumbnail" alt="피나클랜드 불꽃축제">
		</div>
		<div>
			<img src="http://tong.visitkorea.or.kr/cms/resource/50/2944950_image2_1.jpg" class="img-thumbnail" alt="정월대보름 민속축제">
		</div>
		<div>
			<img src="http://tong.visitkorea.or.kr/cms/resource/16/2943316_image2_1.jpg" class="img-thumbnail" alt="연천거리 문화축제">
		</div>
		<div>
			<img src="http://tong.visitkorea.or.kr/cms/resource/07/2951407_image2_1.jpg" class="img-thumbnail" alt="서울 FCI 국제 도그쇼">
		</div>
		<div>
			<img src="images/20230320_01.jpg" class="img-thumbnail" alt="...">
		</div>
		<div>
			<img src="images/images.jpg" class="img-thumbnail" alt="...">
		</div>
	</div>
</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
		
	
</div>
</body>
</html>














