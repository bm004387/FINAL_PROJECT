
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>

	<script type="text/javascript">
	
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
<button onclick="location.href='api.do';">api 값 추출하기 테스트</button>


</body>
</html>