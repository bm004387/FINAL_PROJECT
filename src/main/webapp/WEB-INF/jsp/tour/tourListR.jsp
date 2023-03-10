<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.datatables.net/1.13.3/css/jquery.dataTables.css">
<link href="https://cdn.datatables.net/1.13.3/js/dataTables.bootstrap5.min.js">
  
<script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.js"></script>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>

	<br><br><br>
	<div class="container">
		<div class="page-header">
			<h1>TOUR VISIT</h1>
		</div>
		<div class="jumbotron">
			<div class="row">
				<c:forEach items="${tourlist}" var="tourlist" >
					<div class="col-md-6">

						<div class="col">
							<div class="row-md-12">
							
								<img class="img-fluid" src="${tourlist.firstimage}" onerror="this.onerror=null; this.src='images/noimage.png';" width=100% height=100%/>
						
					        </div>
					        <div class="row-md-12">
								<font color="black"><b>우편번호 : ${tourlist.zipcode}</b></font><br>
								<font color="black"><b>주소 : ${tourlist.addr1}</b></font><br>
									<font color="black"><b>연락처 : ${tourlist.telname}</b></font><br>
									<font color="black"><b>번호 : ${tourlist.tel}</b></font><br>
									<font color="black"><b>관광 이름 : ${tourlist.title}</b></font><br>
					        </div>
					      					     
				        </div>
				       
					</div>
				</c:forEach>
				</div>
		</div>
	</div>

</body>
</html>