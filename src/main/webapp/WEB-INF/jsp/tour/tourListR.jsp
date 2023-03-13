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

<style>
:root {
  --gradient: linear-gradient(to left top, #DD2476 10%, #FF512F 90%) !important;
}
	.card{
	background:#222;
	 border: 1px solid #dd2476;
  color: rgba(250, 250, 250, 0.8);
  margin-bottom: 2rem;
	}
	
	.btn {
  border: 5px solid;
  border-image-slice: 1;
  background: var(--gradient) !important;
  -webkit-background-clip: text !important;
  -webkit-text-fill-color: transparent !important;
  border-image-source:  var(--gradient) !important; 
  text-decoration: none;
  transition: all .4s ease;
}

.btn:hover, .btn:focus {
      background: var(--gradient) !important;
  -webkit-background-clip: none !important;
  -webkit-text-fill-color: #fff !important;
  border: 5px solid #fff !important; 
  box-shadow: #222 1px 0 10px;
  text-decoration: underline;
}

</style>

<body>

	<br><br><br>
	<div class="container mx-auto mt-4">
		<div class="page-header">
			<h1>TOUR VISIT</h1>
		</div>
				<form action="/toursearch.do" method="post">
				<label for="name">검색 : </label>
				<input type="text" id="search" name="search">
				<input type="submit" value="submit">
				</form>
            
		<div class="jumbotron">
				<div class="row">
			
				<c:forEach items="${tourlist}" var="tourlist" >
					<div class="col-md-4">

						<div class="col">
							<div class="card" style="width: 18rem;">
							
								<img class="card-img-top" src="${tourlist.firstimage}" onerror="this.onerror=null; this.src='images/noimage.png';" width=100% height=100%/>
						
					        
					        <div class="card-body">
					        	<h5 class="card-title">관광 이름 : ${tourlist.title}</h5>
					        	<p class="card-text">우편번호 : ${tourlist.zipcode}</p>
								<p class="card-text">주소 : ${tourlist.addr1}</p>
								<p class="card-text">연락처 : ${tourlist.telname}</p>
								<p class="card-text">번호 : ${tourlist.tel}</p>
								
								<a href="#" class="btn mr-2"><i class="fas fa-link"></i>버튼 1</a>
								<a href="#" class="btn mr-2"><i class="fas fa-link"></i>버튼 2</a>
									
					        </div>
					      					     
				        </div>
				       
					</div>
				</div>
				
				</c:forEach>
		</div>
	</div>

</body>
</html>