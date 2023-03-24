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
<!-- 아임포트 결제 cdn 추가 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
                    <h1 class="fw-bold mb-0 text-black">Shopping Pay List</h1>
                    
                   
                  </div>
                   <c:forEach items="${payimlist}" var="payimlist" varStatus="status">
                  <hr class="my-4">

                  <div class="row mb-4 d-flex justify-content-between align-items-center">
                    <div class="col-md-2 col-lg-2 col-xl-2">
                     <h6 class="text-muted">pay 결제 순서</h6>
                      <h6 class="text-black mb-0">${payimlist.pay_id}</h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted">iamport 결제 번호</h6>
                      <h6 class="text-black mb-0">${payimlist.import_id}</h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted">iamport 결제 금액</h6>
                      <h6 class="text-black mb-0">${payimlist.pay_amount}</h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted">iamport 결제 건수</h6>
                      <h6 class="text-black mb-0">${payimlist.per_num}</h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted">iamport 결제 날짜</h6>
                      <h6 class="text-black mb-0">${payimlist.per_time}</h6>
                    </div>

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
                  
                  </div>

                  <h5 class="text-uppercase mb-3">Shipping</h5>
                
                  <hr class="my-4">

                        

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