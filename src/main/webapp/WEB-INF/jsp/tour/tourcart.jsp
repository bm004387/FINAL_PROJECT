<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.datatables.net/1.13.3/css/jquery.dataTables.css">
<link href="https://cdn.datatables.net/1.13.3/js/dataTables.bootstrap5.min.js">
  
<script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.js"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/cart.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="h-100 h-custom" style="background-color: #d2c9ff;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
          <div class="card-body p-0">
            <div class="row g-0">
              <div class="col-lg-8">
                <div class="p-5">
                  <div class="d-flex justify-content-between align-items-center mb-5">
                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                    
                   
                  </div>
                   <c:forEach items="${cartlist}" var="cartlist" varStatus="status">
                  <hr class="my-4">

                  <div class="row mb-4 d-flex justify-content-between align-items-center">
                    <div class="col-md-2 col-lg-2 col-xl-2">
                      <img
                        src="${cartlist.firstimage}"
                        class="img-fluid rounded-3" alt="image">
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted">상품이름</h6>
                      <h6 class="text-black mb-0">${cartlist.title}</h6>
                    </div>
                    
                   
                 
                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                    
                    <h6 class="text-muted">상품가격</h6>
                    
                      <h6 id="price1" class="mb-0">${cartlist.price} 원</h6>
                    </div>
                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                      <a href="#!" class="text-muted"><i class="fas fa-times"></i></a>
                    </div>
                  </div>
                  <c:set var="totalprice" value="${totalprice + cartlist.price}" />
                  <c:set var="count" value="${status.count}" />
                  </c:forEach>

                  <hr class="my-4">

                  <div class="pt-5">
                    <h6 class="mb-0"><a href="#!" class="text-body"><i
                          class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 bg-grey">
                <div class="p-5">
                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                  <hr class="my-4">

                  <div class="d-flex justify-content-between mb-4">
                    <h5 class="text-uppercase">items <c:out value="${count}"/></h5>
                    <h5><c:out value="${totalprice}"/></h5>
                  </div>

                  <h5 class="text-uppercase mb-3">Shipping</h5>
                
                  <hr class="my-4">

                  <div class="d-flex justify-content-between mb-5">
                    <h5 class="text-uppercase">Total price</h5>
                    <h5>￦ <c:out value="${totalprice}"/></h5>
                  </div>

                  <button type="button" class="btn btn-dark btn-block btn-lg"
                    data-mdb-ripple-color="dark">주문하기</button>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>

</html>