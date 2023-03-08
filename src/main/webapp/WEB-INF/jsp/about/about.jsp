<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Tour Visit 회사소개</title>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/about.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<script src="/js/bootstrap.bundle.js"></script>
	<script src="/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src="../js/vegas.min.js"></script>
	<link rel="stylesheet" href="../css/vegas.min.css">
	
	<script>
        $(document).ready(function() {
            //문서 전체(body 태그)에 플러그인 적용함
            $('body').vegas({
            slides: [
                //초반이미지 나타나게 함. 주석처리하면 안 나타남
                // {src: '/videos/sea.jpg'},
                {
                    //video{}안에 배경 동영상과 옵션값 지정함
            video: {
                //src 속성을 사용해 동영상 지정해 줌
                src: [
                    '../videos/location.mp4'],
                    //loop 속성을 사용해 동영상 반복 여부 지정함
                loop: true,
                //동영상을 무음상태로 만들어 줌
                mute: true
            }
        }
    ]
 });
});
</script>

	
	</head>
	<body>
		      <img class="img-fluid w-100"  src="/images/about01.png"  alt="메인이미지1">
			<p>국내의 다양한 볼거리와 체험이<br>가능한 관광 웹사이트입니다.</p>
	 	<div class="content">
		<svg>
			<i class="fas fa-taxi">
				<h1>최상의 교통편 정보 제공</h1>
			</i>
		</svg>
		<svg>
			<i class="fas fa-plane">
				<h1>항공기 티켓팅 할인 혜택</h1>
			</i>
		</svg>
		<svg>
		<i class="fas fa-hotel">
			<h1>맞춤형 다양한 숙박시설</h1>
		</i>
		</svg>
		</div>
		      <img class="img-fluid w-100" style="margin-top:300px"src="/images/about02.png" alt="메인이미지2">
		
	</body>
	</html>
