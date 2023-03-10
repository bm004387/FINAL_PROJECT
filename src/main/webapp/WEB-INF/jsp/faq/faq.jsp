<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ</title>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/faq.css">
	<script src="/js/bootstrap.bundle.js"></script>
	<script src="/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container">
<div class="accordion accordion-flush" id="accordionFlushExample">
<div>
<img class="img-content01"  src="/images/faq01.png" alt="메인이미지1">
</div>
<div>
<img class="img-content03"  src="/images/faq03.png" alt="메인이미지3">
</div>
<div>
<img class="img-content02"  src="/images/faq02.png" alt="메인이미지2">
</div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-1">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-1" aria-expanded="false" aria-controls="flush-collapse-1">
        Q.1) 항공권 예약 문의는 어느 곳에서 해야 하나요?
      </button>
    </h2>
    <div id="flush-collapse-1" class="accordion-collapse collapse" aria-labelledby="flush-heading-1" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">항공권은 1544-5252=> 2번 또는 1544-5353으로 연결 요청드립니다.1544-5252 => 1번은 패키지 관련 상담입니다.</div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-2">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-2" aria-expanded="false" aria-controls="flush-collapse-2">
        Q.2) 호텔은 어디로 예약관련 및 상품권 사용 문의 어떻게 하나요?
      </button>
    </h2>
    <div id="flush-collapse-2" class="accordion-collapse collapse" aria-labelledby="flush-heading-2" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">호텔은 예약 상담 불가하며, 실시간 PC 및 모바일을 통해 실시간 예약만 가능합니다. 상품권 사용의 경우 대부분 사용이 제한되고 있으나, 일부 가능 호텔의 경우 전화 문의는 불가하여, 실시간 예약 후 결제시 	상품권 결제 창 활성화 될 경우 가능합니다. 불편을 끼쳐드린 점 양해 부탁드립니다.</div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-3">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-3" aria-expanded="false" aria-controls="flush-collapse-3">
        Q.3) 상품 검색을 어떻게 해야 하나요?
      </button>
    </h2>
    <div id="flush-collapse-3" class="accordion-collapse collapse" aria-labelledby="flush-heading-3" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">상단의 검색창에 여행하시고자 하는 도시 또는 국가를 입력하시면, 상품이 준비되어 있는 도시를 검색하실 수 있습니다. 해당 도시에는 모두투어에서 판매하고 있는 		현지투어/입장권/패스 전상품이 노출됩니다.</div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-4">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-4" aria-expanded="false" aria-controls="flush-collapse-4">
        Q.4) 취소/변경 절차는 어떻게 되나요?
      </button>
    </h2>
    <div id="flush-collapse-4" class="accordion-collapse collapse" aria-labelledby="flush-heading-4" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">- 입장권/패스 : 경우 마이페이지에서 취소신청을 한 후 실물 티켓, 바우처일 경우 모두투어 본사로 보내주시면 됩니다.
		보내주신 물품 수령후 공지된 취소료를 제외하고 고객님의 계좌로 입금해드립니다.
		- 현지투어 : 1544-5252로 취소요청 부탁드립니다.</div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-5">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-5" aria-expanded="false" aria-controls="flush-collapse-5">
        Q.5) 예약 진행은 어떻게 되나요?
      </button>
    </h2>
    <div id="flush-collapse-5" class="accordion-collapse collapse" aria-labelledby="flush-heading-5" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">예약 이후 완납 시 예약이 진행됩니다.
		- 패스/입장권 : 별도의 안내 전화 없이 지정하신 방법으로 발송이 진행됩니다.
		- 현지투어 : 완납이후 행사 가능여부를 안내해 드립니다.</div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-6">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-6" aria-expanded="false" aria-controls="flush-collapse-6">
        Q.6) 당일 예약이 가능한가요?
      </button>
    </h2>
    <div id="flush-collapse-6" class="accordion-collapse collapse" aria-labelledby="flush-heading-6" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">본 할인쿠폰은 여행출발일 하루전날 오후5시까지 예약하셔야 사용이 가능합니다.
		주말 이용시 금요일 오후5시까지 하셔야합니다.</div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-7">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-7" aria-expanded="false" aria-controls="flush-collapse-7">
        Q.7) 할인 관광지 티켓은 어디에서 수령하나요?
      </button>
    </h2>
    <div id="flush-collapse-7" class="accordion-collapse collapse" aria-labelledby="flush-heading-7" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">- 08:00 ~ 20:30 제주공항 국내선 1층 1번 게이트 왼쪽 수하물보관소
	 - 현지 상황에 따라 인수장소가 변경될 수 있다는 점 유의하시기 바랍니다.</div>
    </div>
  </div>
  
  <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-8">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-8" aria-expanded="false" aria-controls="flush-collapse-8">
        Q.8) 호텔 체크인, 체크아웃 시간은 언제인가요?
      </button>
    </h2>
    <div id="flush-collapse-8" class="accordion-collapse collapse" aria-labelledby="flush-heading-8" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">상단의 검색창에 여행하시고자 하는 도시 또는 국가를 입력하시면, 상품이 준비되어 있는 도시를 검색하실 수 있습니다. 해당 도시에는 모두투어에서 판매하고 있는 	현지투어/입장권/패스 전상품이 노출됩니다.</div>
    </div>
  </div>
  
    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-9">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-9" aria-expanded="false" aria-controls="flush-collapse-9">
        Q.9) 사전 좌석 배정/모바일체크인은 어떻게 하나요?
      </button>
    </h2>
    <div id="flush-collapse-9" class="accordion-collapse collapse" aria-labelledby="flush-heading-9" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">◎ 사전좌석 배정
		- 항공권 예약/결제 후 사전 좌석 배정이 가능합니다.
		- 각 항공사 홈페이지에서 예약 조회 후 좌석 지정이 가능합니다.
		1. 대한항공 : 항공편 출발 361일 전 ~ 48시간 전(프레스티지석은 D-24시간 전)까지 항공사 홈페이지에서 무료로 사전 좌석 배정이 가능합니다.
		2. 아시아나항공 : 항공편 출발 30일 전 ~ 24시간 전까지 항공사 홈페이지에서 무료로 사전 좌석 배정이 가능합니다.
		3. 제주항공/티웨이항공</div>
    </div>
  </div>
  
    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-10">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-10" aria-expanded="false" aria-controls="flush-collapse-10">
        Q.10) 호텔 체크인, 체크아웃 시간은 언제인가요?
      </button>
    </h2>
    <div id="flush-collapse-10" class="accordion-collapse collapse" aria-labelledby="flush-heading-10" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">상단의 검색창에 여행하시고자 하는 도시 또는 국가를 입력하시면, 상품이 준비되어 있는 도시를 검색하실 수 있습니다. 해당 도시에는 모두투어에서 판매하고 있는 	현지투어/입장권/패스 전상품이 노출됩니다.</div>
    </div>
  </div>
  
    <div class="accordion-item">
    <h2 class="accordion-header" id="flush-heading-11">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-11" aria-expanded="false" aria-controls="flush-collapse-11">
        Q.11) 마일리지 적립이 안되었는데 어떻게 하나요?
      </button>
    </h2>
    <div id="flush-collapse-11" class="accordion-collapse collapse" aria-labelledby="flush-heading-11" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body">마일리지의 적립은 여행을 다녀오신 후에도 가능합니다.
		탑승권과 항공권을 버리지 마시고 소지하시어 여행 후 해당 항공사에 요청하시면됩니다.
		※단, 여행 출발 전 해당 항공사의 마일리지 적립카드가 반드시 발급되어져 있어야만 합니다.</div>
    </div>
  </div>
</div>
</div>
</body>
</html>