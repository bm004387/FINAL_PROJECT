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
	<script src="/js/bootstrap.bundle.js"></script>
	<script src="/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src="../js/vegas.min.js"></script>
	<link rel="stylesheet" href="../css/vegas.min.css">
</head>
    <script>
    $(document).ready(function() {
        //문서 전체(body 태그)에 플러그인 적용함
        $('body').vegas({
        slides: [
            //초반이미지 나타나게 함. 주석처리하면 안 나타남
            {
                //video{}안에 배경 동영상과 옵션값 지정함
        video: {
            //src 속성을 사용해 동영상 지정해 줌
            src: [
                '../videos/landing.mp4'],
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
<body>

    <div id="content">
            <strong>
                <!-- 홈페이지에 들어가기 위한 링크 생성 -->
                    <a href="/main.do" style="cursor: pointer;">홈페이지로 GO~!</a>
                <h1>미래 건축을 선도하는 남율건설</h1>
            </strong>
        <p>
          	  지나온 30년 앞으로 다가올 30년 <br> 미래를 만들어갑니다.
        </p>
    </div>

</body>
</html>