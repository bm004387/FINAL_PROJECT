<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:'https://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=Lte9EaFEKl77Nf7DNWMbLTbLKPzbziOIHqfdh9EfekbiV9YBUQBtp9HchlcWxDH7IJ0YFxO7TQWh5VKTnmCi%2BQ%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=C',
			type: 'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			success: function(data){
				makeList(data);
			},
			error: function(xhr, status, error){
				console.log("상태값 : " + xhr.status + "\tHttp 에러메시지 : " + xhr.responseText);
			}
		});
		
		function makeList(tour){
			$("#table-body").empty();
			if(tour.length==0){
				let str = `
					<tr class="table-info">
						<td>정보를 받아오지 못했습니다</td>
					</tr>
				`;
				$("#table-body").append(str);
			}
			else{
				$(tour).each(function(index, user){
					let list = `<tr>
						<td>${'${tour.addr1}'}</td>
						<td>${'${tour.addr2}'}</td>
						<td>${'${tour.areacode}'}</td>
						<td>${'${tour.booktour}'}</td>
						<td>${'${tour.cat1}'}</td>
						<td>${'${tour.cat2}'}</td>
						<td>${'${tour.cat3}'}</td>
						<td>${'${tour.contentid}'}</td>
						<td>${'${tour.contenttypeid}'}</td>
						<td>${'${tour.createdtime}'}</td>
						<td>${'${tour.firstimage}'}</td>
						<td>${'${tour.firstimage2}'}</td>
						<td>${'${tour.mapx}'}</td>
						<td>${'${tour.mapy}'}</td>
						<td>${'${tour.mlevel}'}</td>
						<td>${'${tour.modifiedtime}'}</td>
						<td>${'${tour.readcount}'}</td>
						<td>${'${tour.sigungucode}'}</td>
						<td>${'${tour.tel}'}</td>
						<td>${'${tour.title}'}</td>
						<td>${'${tour.zipcode}'}</td>
						
						<td colspan="2" class="text-right">
							<a href="#">저장버튼으로 이용?</a>
							<a href="#">임시 버튼</a>
						</td>
					</tr>
					`;
					$("#table-body").append(list);
				});	
			}
		}
	})
</script>

<h2 class="user-list">관광지정보</h2>

<table class="user-table">
	<thead>
		<tr class="table-info">
			<td>주소1</td>
			<td>주소2</td>
			<td>지역코드</td>
			<td>책?</td>
			<td>코드1</td>
			<td>코드2</td>
			<td>코드3</td>
			<td>관광지코드</td>
			<td>관광지종류코드</td>
			<td>생성시간</td>
			<td>이미지1</td>
			<td>이미지2</td>
			<td>X좌표</td>
			<td>Y좌표</td>
			<td>M LEVEL?</td>
			<td>수정시간</td>
			<td>조회카운트</td>
			<td>시군구코드</td>
			<td>전화번호</td>
			<td>제목</td>
			<td>우편번호</td>
		</tr>
	</thead>
	<tbody id="table-body"></tbody>
</table>


</body>
</html>