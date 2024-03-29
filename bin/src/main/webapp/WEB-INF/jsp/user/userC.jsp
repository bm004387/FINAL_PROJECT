<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="userC.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>GKYK mall Sign Up</title>
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/process.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	
	<script type="text/javascript">

	var dong;
	var imageFolder;

	$(document).ready(function(){
// 		$('#dataTables-example').dataTable();
		fn_init();

		imageFolder = "userImg";

		$( "#birth" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2015"
	    });

		$("#dong").keydown(function (key){
			if(key.keyCode == 13){
				fn_postCheck();
			}

		});
	});

	function fn_setData(self){
		var postAllData = self.children().text();

		var postSplit = postAllData.split(" ");

		var zipcode = postSplit[0].split("-");
		var postNum1 = zipcode[0];
		var postNum2 = zipcode[1];
		var sido = postSplit[1];
		var gugun = postSplit[2];
		var dong = postSplit[3];
		var subDong = postSplit[4];

		if(subDong == null) subDong = "";

		var detailAddress = address1 + address2;

		$("#postNum1").val(postNum1);
		$("#postNum2").val(postNum2);

		$("#address").val(detailAddress);

		$("#searchPost").modal('hide');
	}

	function fn_postCheck(){
		dong = $("#dong").val();

		if(dong == ""){
			alert("동을 입력하세요.");
			return;
		}
		$("#postBody").children().remove();

		var aheadHtml = "<tr><td style='text-align: center;'><a onclick=javascript:fn_setData($(this))><b>";
		var backHtml = "</b></a></td></tr>";
		var appendHtml = "";
		var param = {};


		param["dong"] = dong;

		$.ajax({
   			url:"${context}/work/applicant/retrievePostByDong.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
   			success:function(result){
   				for(var i = 0; i < result.length; i++){
   					appendHtml
   					   += aheadHtml
   					   + result[i].zipcode + " "
					   + result[i].sido    + " "
				       + result[i].gugun   + " "
					   + result[i].dong    + " "
					   + backHtml;
   				}
   					$("#postBody").append(appendHtml);
   			}
   		});
	}

	function fn_save(){
		if(!fn_validation()) return;
		if($("#flag").val() == "false"){
			alert("이미 사용중인 ID입니다");
			$("id").focus();
			return;
		}


		$("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());
 		$("#postNum").val($("#postNum1").val());
 		$("#address").val($("#address1").val() + "/" + $("#address2").val());

 		$("#joinFrm").submit();
	}

	function idCheck(){
		var id = $("#id").val();
		var access = $("#message");
		$.ajax({
			url:"${context}/work/user/idCheck.do?id=" + id,
			success:function(result){
				result2 = result.replace(/"/gi, "");
				var splResult = result2.split("@");
				access.html(splResult[0]);
				$("#flag").val(splResult[1]);
			}
		});
	}

	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data2 = data.replace(/"/gi, "");
	        	var imageUrl = "${context}/userImg/" + data2;
	        	$("#pic").attr("src", imageUrl);
	        	$("#userImage").val(data2);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
	        }
	    });
	}
	<%-- 주소검색 팝업을 호출합니다 --%>
	function fn_openAddressPopup() {
		var url = "${context}/user/addressAPIPopup.jsp";
		var name = "AddressPopup";
		var option = "width=650, height=500, top=100, left=200, location=no"
		window.open(url, name, option);
	}
<%-- 주소검색 팝업 호출 콜백 callback_openAddressPopup() 메서드 입니다  --%>
	function callback_openAddressPopup(aParam) {
		document.getElementById("address1").value = aParam["roadAddr"];
		document.getElementById("postNum1").value = aParam["zipNo"];
		
	}
</script>

</head>
<body>
<!--  	<jsp:include page="../common/header_userc.jsp"></jsp:include> -->

	<div id="jumbotron" class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>회원가입</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span></font></h1>
			<p>GKYK mall 회원가입을 진심으로 환영합니다.</p>
		</div>
	</div>
	<div class="container">
	<form id="joinFrm" method="post" action="${context}/work/user/createUser.do" role="form">
		<div class="form-horizontal">
			<hr/>
			<div class="form-group" style="margin-top: 5%; display: flex; justify-content: center; flex-wrap: wrap;">
				<label for="id" class="control-label col-md-2"><b>아이디</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" onkeyup="idCheck();"/>
				</div>
			</div>
			<p class="col-md-7" id="message" style="display: flex; justify-content: flex-end;"></p>
			
			<div class="form-group" style="display: flex; justify-content: center; flex-wrap: wrap;">
				<label for="pw" class="control-label col-md-2"><b>비밀번호</b></label>
				<div class="col-md-6">
					<input class="form-control" type="password" name="pw" id="pw" required="required"/>
				</div>
			</div>

			<div class="form-group" style="display: flex; justify-content: center; flex-wrap: wrap;">
				<label for="email" class="control-label col-md-2"><b>이메일</b></label>
				<div class="col-md-6">
					<input class="form-control" style="display: flex;" type="email" name="email" id="email" required="required"/>
				</div>
			</div>
			<div class="form-group" style="display: flex; justify-content: center; flex-wrap: wrap;">
				<label for="name" class="control-label col-md-2"><b>성명</b></label>
				<div class="col-md-6">
					<input class="form-control" style="display: flex;" type="text" id="name" name="name" autofocus="autofocus" required="required"/>
				</div>
			</div>

			<div class="form-group" style="display: flex; justify-content: center; flex-wrap: wrap;">
				<label for="birth" class="control-label col-md-2"><b>생년월일</b></label>
				<div class="col-md-6">
					<input class="form-control" autocomplete="off" style="display: flex;" type="text" id="birth" name="birth" required="required" maxlength="10"/>
				</div>
			</div>

			<div class="form-group" style="display: flex; justify-content: center;">
				<label for="phoneCd" class="control-label col-md-2"><b>연락처</b></label>
				<div class="col-md-2">
		        	<select class="form-control" style="display: flex; justify-content: center;" id="phoneCd" name="phoneCd" required="required">
						<c:forEach items="${dsCode1}" var="code1">
							<option value="${code1.commCd}">${code1.commCdNm}</option>
						</c:forEach>
		     		</select>
	     		</div>
				<div class="col-md-2">
					<input class="form-control" style="display: flex; justify-content: center;" type="text" id="phone1" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
				<div class="col-md-2">
					<input class="form-control" style="display: flex; justify-content: center;" type="text" id="phone2" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
				<input type="hidden" id="phoneNum" name="phoneNum">
			</div>

			<div class="form-group" style="display: flex; justify-content: center;">
				<label for="postnum1" class="control-label col-md-2"><b>우편번호</b></label>
				<div class="col-md-3">
					<input class="form-control" style="display: flex;" type="text" id="postNum1" disabled="disabled" required="required"/>
	     		</div>
				<span class="col-md-3">
					<button type="button" class="btn btn-info"onclick="javascript:fn_openAddressPopup();"data-target="#searchPost"><b>주소검색</b></button>
				</span>
				<input type="hidden" id="postNum" name="postNum">
			</div>

			<div class="form-group" style="display: flex; justify-content: center; flex-wrap: wrap;">
				<label for="address1" class="control-label col-md-2"><b>주소</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="address1" disabled="disabled" required="required"/>
				</div>
			</div>

			<div class="form-group" style="display: flex; justify-content: center; flex-wrap: wrap;">
				<label for="address2" class="control-label col-md-2"><b>상세주소</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="address2"/>
				</div>
				<input type="hidden" id="address" name="address">
			</div>

			<div class="form-group" style="display: flex; justify-content: center; flex-wrap: wrap;">
				<label class="control-label col-md-2"><b>사진</b></label>
				<img id="pic" class="col-md-4" height="180px" width="150px" src="${context}/backgroundImage/defaultpic.png"><br/>
				<div class="col-md-2">
					<input type="hidden" id="userImage" name="userImage" required="required">
				</div>
			</div>

			<input type="hidden" id="flag" name="flag" value="false">
		</div>
	</form>
	<form id="ajaxform" action="${context}/work/product/saveFile.do" method="post" enctype="multipart/form-data" role="form">
		<div class="form-group" style="display: flex; justify-content: center; flex-wrap: wrap;">
		<label class="control-label col-md-2"></label>
			<div class="col-md-6">
				<input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()"/>
				<input type="hidden" id="imageFolder" name="imageFolder" value="userImg">
			</div>
		</div>
		<br><br><br>
		<div class="form-group" style="display: flex;justify-content: center; flex-wrap: wrap;">
			<div class="col-md-3">
				<button type="button" class="btn btn-success" onclick="fn_back()" style="width: 100%; height: 50px; border-radius: 10px; margin-top: 5%; ">뒤로가기</button>
			</div>
			<div class="col-md-3">
				<button class="btn btn-info" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()" style="width: 100%; height: 50px; border-radius: 10px; margin-top: 5%; ">등록하기</button>
			</div>
		</div>
	</form>
	</div>

	<!-- <jsp:include page="../common/footer.jsp"></jsp:include> -->
</body>
</html>