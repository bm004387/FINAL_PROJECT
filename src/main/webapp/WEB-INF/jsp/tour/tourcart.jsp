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

<script>
function dateFormat(date) {
        let month = date.getMonth() + 1;
        let day = date.getDate();
        let hour = date.getHours();
        let minute = date.getMinutes();
        let second = date.getSeconds();

        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
        hour = hour >= 10 ? hour : '0' + hour;
        minute = minute >= 10 ? minute : '0' + minute;
        second = second >= 10 ? second : '0' + second;

        return date.getFullYear() + '-' + month + '-' + day;
       // + ' ' + hour + ':' + minute + ':' + second;
	}
    
    function fn_finalBuy(paramProductName,paramSellPrice){
    	
    	var memberid = "${resultVO.memberId}";
    	var email = "${resultVO.memberEmail}";
		var name = "${resultVO.memberName}";
		var phonenum = "${resultVO.memberPhoneNumber}";
		var address = "${resultVO.memberAddress}";
		//var postnum = "${userparam.postNum}";
		let today = new Date();
    	
		if(confirm("결제하시겠습니까?")){
			//location.href = "${context}/work/sell/updateFinalBuy.do?sellCode=" + paramSellCode + "&sellCount=" + paramSellCount + "&productCode=" + paramProductCode;
			
			//========================================
		
				
				
			var IMP = window.IMP;  
		    IMP.init("imp27037718");  // IMP.init( ) 메서드 가맹점코드 수정 바랍니다.
		    IMP.request_pay({
		        pg : 'html5_inicis', // version 1.1.0부터 지원.
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : paramProductName,
		        amount : paramSellPrice,
		        buyer_email :email,
		        buyer_name : name,
		        buyer_tel : phonenum,
		        buyer_addr :address,
		       // buyer_postcode : postnum,
		        m_redirect_url :"tourlist.do"
		    }, function(rsp) {
		        if ( rsp.success ) {
		        	 var paymentInfo = {
		            		  imp_uid : rsp.imp_uid,
		            		  merchant_uid : rsp.merchant_uid,
		            		  paid_amount : rsp.paid_amount,
		            		  apply_num : rsp.apply_num,
		            		  paid_at : dateFormat(today)
		              };
		        	 //결제 성공했을시 결제 상품을 카트에서 결제완료 리스트로 이동
		    		location.href = "tourcartpay.do?memberid="+memberid;
		        	 $.ajax({
		            	  url :  "${context}/work/iamport/paymentProcess.do",
		            	  //method : "POST",
		            	   type:"POST", 	  
		            	  contentType: "application/json",
		            	  data :  JSON.stringify(paymentInfo),
		            	  success : function (data, textStatus) {
		            		  console.log(paymentInfo);
		            		 //결제 성공했을시 결제 정보 저장
		            		//  location.href = "${context}/work/sell/updateFinalBuy.do?sellCode=" + paramSellCode + "&sellCount=" + paramSellCount + "&productCode=" + paramProductCode;
		            		  //"/paymentDone.do";
							//"/paymentProcess.do",
		            	  },
		            	  error : function(e){
		            		  console.log(paymentInfo);
		            		  console.log(e);
		            	  
						}
		              });
		        } else {
		        	 alert("결제 실패:"+rsp.error_msg);
		        }
		    });	
    	}
    }
			  

    </script>
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
                  <c:set var="cartname" value="${cartlist.title}" />
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
                  <!--    <h5><c:out value="${cartname}"/></h5> -->
                  </div>
					
                  <button type="button" class="btn btn-dark btn-block btn-lg"
                    data-mdb-ripple-color="dark" onclick="fn_finalBuy('<c:out value="${cartname}"/>','<c:out value="${totalprice}"/>')">주문하기</button>

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