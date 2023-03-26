<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Tour Visit 회사소개</title>
    <link rel="stylesheet" href="/css/vg.css">
    <link rel="stylesheet" href="/css/vegas.min.css">
	<link rel="stylesheet" href="/css/about.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<script src="/js/jquery-2.2.4.min.js"></script>
    <script src="/js/vegas.min.js"></script>
	
       <script>
        $(function(){
        $('.test').vegas({
            slides: [//이미지를 할당하여 vagas가 구동이 되도록 경로를 지정
                {   src: '/images/tour1.jpg' },
                {   src: '/images/tour2.jpg'  },
                {   src: '/images/tour3.jpg'  },
                {   src: '',
                    video: {
                        src: [
                            '',
                        ],
                        mute: true
                    }
                }
            ]
        });
        });
    </script>
	<jsp:include page="../include/header.jsp"></jsp:include>
      <img class="img-fluid w-100"  src="/images/about01.png"  alt="메인이미지1" style="z-index: -1;">
      <body>
      <div class="test">
	 	<div class="content">
		<p>국내의 다양한 볼거리와 체험이<br>가능한 관광 웹사이트입니다.</p>
		<i class="fas fa-taxi">
			<h1>최상의 교통편 정보 제공</h1>
		</i>
		<i class="fas fa-plane">
			<h1>항공기 티켓팅 할인 혜택</h1>
		</i>
		<i class="fas fa-hotel">
			<h1>맞춤형 다양한 숙박시설</h1>
		</i>
		</div>
		</div>
		</body>
      <img class="img-fluid w-100" src="/images/about02.png" alt="메인이미지2">
