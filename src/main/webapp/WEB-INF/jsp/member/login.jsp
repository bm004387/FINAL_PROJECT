<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=1070012790582141" nonce="SiOBIhLG"></script>

<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container">
	<form id="loginForm" name="loginForm" class="form-signin">
		<h2 class="form-signin-heading">Please sign in</h2>
		
		<label for="memberId" class="sr-only">ID</label>
		<input type="text" id="memberId" name="memberId" class="form-control" placeholder="Please enter your ID" required autofocus>
		
		<label for="memberPw" class="sr-only">Password</label>
		<input type="password" id="memberPw" name="memberPw" class="form-control" placeholder="Please enter your Password" required>
		
		<button class="btn btn-lg btn-primary btn-block" type="button" onclick="javascript:fn_signIn();">Sign in</button>
		<button class="btn btn-lg btn-info btn-block" type="button" onclick="javascript:fn_signUp();">Sign up</button>
	</form>
</div><!-- /container -->
<script>

//기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
function statusChangeCallback(res){
	statusChangeCallback(response);
}

function fnFbCustomLogin(){
	FB.login(function(response) {
		if (response.status === 'connected') {
			FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
				console.log(r);
			})
		} else if (response.status === 'not_authorized') {
			// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
			alert('앱에 로그인해야 이용가능한 기능입니다.');
		} else {
			// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
			alert('페이스북에 로그인해야 이용가능한 기능입니다.');
		}
	}, {scope: 'public_profile,email'});
}

window.fbAsyncInit = function() {
	FB.init({
		appId      : '1070012790582141', // 내 앱 ID를 입력한다.
		cookie     : true,
		xfbml      : true,
		version    : 'v16.0'
	});
	FB.AppEvents.logPageView();   
};
</script>

<!-- 카카오 스크립트 -->
<script>
Kakao.init('a2cea4fd1964df0272841d4b5f385760'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
<!-- 카카오 로그인 끝-->
<script>
	var submitYN = false;

	<%-- 로그인 --%>
	function fn_signIn(){

		if(document.getElementById("memberId").value.length < 1){
			alert("아이디를 입력하세요.");
			document.getElementById("memberId").focus()
			return;
		}
		
		if(document.getElementById("memberPw").value.length < 1){
			alert("비밀번호를 입력하세요.");
			document.getElementById("memberPw").focus()
			return;
		}
		
		if(!submitYN){
			submitYN = true;
			
			$.ajax({
				 url :"/loginAction.do"
				,type:"post"
				,data:$("#loginForm").serialize()
				,success:function(data){
					if(data != "N"){
						alert(data + "회원님, 환영합니다");
						location.href="/selectMemberList.do?page=0&size=10"
					}else{
						alert("회원정보 가입을 해주세요");
					}
				}
			    ,error: function(xhr, status, error){
			    	alert("에러발생");
			    }
			    ,complete : function() {
			    	submitYN = false;
			    }
			    
			});
			
		}
		
	}

	<%-- 멤버등록화면으로 이동 --%>
	function fn_signUp(){
		location.href = "/fwdMemberReg.do";
	}

</script>
<!-- 카카오 로그인 Form -->
<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
	 <li onclick="fnFbCustomLogin();">
	  <a href="javascript:void(0)">
	   <span>페이스북으로 로그인</span>
	  </a>
	 </li>
</ul>
