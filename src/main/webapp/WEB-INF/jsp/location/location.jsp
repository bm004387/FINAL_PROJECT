<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<meta charset="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Tour Visit 찾아오시는 길</title>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/location.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript"></script>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
</head>
<body>
	<div id="jumbotron" class="container" >
		<div class="jumbotron jumbotron-info" style="background-color: lightgray" >
			<div class="container-fluid" >
                    <div id="map" ></div><br><br>
                    <div class="row mt-3" style="width:100%">
                        <div class="col-md-12 lctx" >
                        <img alt="gps이미지" src="${context}/images/gps.svg" class="mobile-link"><hr><br>
                            <h3>Tour Visit 오시는 길<br><br></h3>
                            <p>
                               	 이메일 : TourVisit@gmail.com<br>
                              	  주소 : 행복시 행복동 123번지 2층<br><hr><br>
                              	  
                              	<div>
									<img class="img-content01"  src="/images/location01.png" alt="메인이미지1">
								</div>
                              	  <br><hr><br>
									고객센터 : 1577-3355<br>
									업무시간 : 09시 ~ 18시(명절당일 휴무)<br>
									Email : TourVisit@gmail.com
                        </div>
                    </div>
                </div>
            </div>
        </div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55fadbaffd48c6dcbcd6419f740a023b" ></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.50325249602558, 126.87888030892368), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨

    };

var map = new kakao.maps.Map(mapContainer, mapOption) ; // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.50325249602558, 126.87888030892368); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
    
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);  

var markerPosition = marker.getPosition(); 
map.relayout();
map.setCenter(markerPosition);

</script>
</body>
</html>