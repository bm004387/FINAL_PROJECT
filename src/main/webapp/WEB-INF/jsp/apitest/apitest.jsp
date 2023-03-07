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
				console.log("���°� : " + xhr.status + "\tHttp �����޽��� : " + xhr.responseText);
			}
		});
		
		function makeList(tour){
			$("#table-body").empty();
			if(tour.length==0){
				let str = `
					<tr class="table-info">
						<td>������ �޾ƿ��� ���߽��ϴ�</td>
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
							<a href="#">�����ư���� �̿�?</a>
							<a href="#">�ӽ� ��ư</a>
						</td>
					</tr>
					`;
					$("#table-body").append(list);
				});	
			}
		}
	})
</script>

<h2 class="user-list">����������</h2>

<table class="user-table">
	<thead>
		<tr class="table-info">
			<td>�ּ�1</td>
			<td>�ּ�2</td>
			<td>�����ڵ�</td>
			<td>å?</td>
			<td>�ڵ�1</td>
			<td>�ڵ�2</td>
			<td>�ڵ�3</td>
			<td>�������ڵ�</td>
			<td>�����������ڵ�</td>
			<td>�����ð�</td>
			<td>�̹���1</td>
			<td>�̹���2</td>
			<td>X��ǥ</td>
			<td>Y��ǥ</td>
			<td>M LEVEL?</td>
			<td>�����ð�</td>
			<td>��ȸī��Ʈ</td>
			<td>�ñ����ڵ�</td>
			<td>��ȭ��ȣ</td>
			<td>����</td>
			<td>�����ȣ</td>
		</tr>
	</thead>
	<tbody id="table-body"></tbody>
</table>


</body>
</html>