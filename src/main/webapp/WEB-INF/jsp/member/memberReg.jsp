<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/memberReg.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
<style>
	.input-group{
		margin-top: 25px;
	}
</style>
<script>
	$(function(){
		$.backstretch([
			"images/back1.webp"
			,"images/back2.jpg"
			,"images/back3.jpg"
		], {duration: 3000, fade: 2000});
	})
</script>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<form id="insertForm" name="insertForm" method="post" enctype="multipart/form-data">
			<div class="input-group text-center" style="display: none;">
				<label class="btn btn-default">
				    Browse <input type="file" id="userImageAttachFile" name="userImageAttachFile" hidden onchange="setThumbnail(event);" />
				</label>
			</div>
			<div class="input-group">
				<span class="input-group-addon col-3" id="basic-addon1">이름</span>
				<input type="text" id="memberName" name="memberName" class="form-control" placeholder="한글로 공백없이 입력해주세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon col-3" id="basic-addon1">이메일</span>
				<input type="text" id="memberEmail" name="memberEmail" class="form-control col-10" placeholder="이메일을 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon col-3" id="basic-addon1">휴대전화</span>
				<input type="text" id="memberPhoneNumber" name="memberPhoneNumber" class="form-control col-10" placeholder="휴대전화를 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon col-3" id="basic-addon1">아이디</span>
				<input type="text" id="memberId" name="memberId" class="form-control col-10" placeholder="아이디를 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon col-3" id="basic-addon1">비밀번호</span>
				<input type="password" id="memberPw" name="memberPw" class="form-control col-10" placeholder="비밀번호를 입력해 주세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon col-3" id="basic-addon1">비밀번호 확인</span>
				<input type="password" id="memberPw2" name="memberPw2" class="form-control col-10" placeholder="비밀번호를 한번 더 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon col-3" id="basic-addon1">주소</span>
				<input type="text" id="memberAddress" name="memberAddress" class="form-control col-10" placeholder="주소를 선택하세요." aria-describedby="basic-addon1" readonly="readonly">
				<span class="input-group-btn">
					<button class="btn btn-default popup" type="button" onclick="javascript:fn_openAddressPopup();">검색</button>
				</span>
			</div>
			<div class="input-group">
				<span class="input-group-addon col-3" id="basic-addon1">나머지 주소</span>
				<input type="text" id="memberAddress2" name="memberAddress2" class="form-control col-10" placeholder="나머지 주소를 입력하세요." aria-describedby="basic-addon1">
			</div>
			<div style="margin-top:15px;">
				<div class="btnForm">
					<button type="button" class="btn btn-lg btn-success pull-right" onclick="javascript:fn_submit();" style="margin-right: 10px;">저장</button>
					<button type="button" class="btn btn-lg btn-warning pull-right" onclick="javascript:history.go(-1);">목록</button>
				</div>
			</div>
		</form>
	</div>

		
</div>

<script>
	<%-- 등록 --%>
	function fn_submit(){
		if(fn_validation()){
			return;
		}
		
		var f = document.insertForm;
		f.action = "/insertMember.do";
		f.submit();
	}

	<%-- 주소검색 팝업 호출 --%>
	function fn_openAddressPopup(){
		var url = "/fwdSearchAddressPopup.do";
		var name = "AddressPopup";
		var option = "width=650, height=500, top=100, left=200, location=no"
		window.open(url, name, option);
	}
	
	<%-- 주소검색 팝업 호출 CallBack --%>
	function callback_openAddressPopup(aParam){
		document.getElementById("memberAddress").value = aParam["roadAddr"];
	}

	<%-- 유효성 검사 --%>
	function fn_validation(){

		var emailReg = /@/gi;
		var phoneNumberReg = /^[0-9]+$/;
		
		if(!emailReg.test(document.getElementById("memberEmail").value)){
			alert("이메일 주소는 '@'가 필수로 입력되어야 합니다'");
			document.getElementById("memberEmail").focus();
			return true;
		}else if(document.getElementById("memberPw").value.length < 1 || document.getElementById("memberPw2").value.length < 1){
			alert("비밀번호 입력하세요.");
			return true;
		}else if(document.getElementById("memberPw").value != document.getElementById("memberPw2").value){
			alert("비밀번호 일치하지않습니다.");
			document.getElementById("memberPw2").focus();
			return true;
		}else if(!phoneNumberReg.test(document.getElementById("memberPhoneNumber").value)){
			alert("휴대전화는 숫자만 입력 가능합니다.");
			document.getElementById("memberPhoneNumber").focus();
			return true;
		}
		
		return false;
	}

	<%-- 이미지 업로드시 이미지 미리보기 --%>
	function setThumbnail(event) { 
		var reader = new FileReader();

		reader.onload = function(event) { 
			document.getElementById("userImage").setAttribute("src", event.target.result);
		};

		reader.readAsDataURL(event.target.files[0]); 
	}
</script>