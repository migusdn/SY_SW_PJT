<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="assets/js/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("8tx_pBAlod4OIxq2dlgB", "http://migusdn.cafe24.com/app/N_callback");
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    $.ajax({
	    url: '/app/N_Login',
	    type: 'POST',
	    dataType: 'text', //서버로부터 내가 받는 데이터의 타입
	    contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
	    data: naver_id_login.getProfileData('id'),
	    success: function(data){
	         if(data == 0){
	         console.log("Login Success");
	         location.href="/app/";
	         }else{
	         	console.log("네이버로 회원가입 진행");
	         	alert("네이버 아이디로 회원가입을 진행합니다.");
	         	var form = document.createElement("form");
	         	form.setAttribute("charset", "UTF-8");
	            form.setAttribute("method", "Post");  //Post 방식
	            form.setAttribute("action", "/app/register/naver"); //요청 보낼 주소	
	            var user_name = document.createElement("input");
	            user_name.setAttribute("type", "hidden");
	            user_name.setAttribute("name", "user_name");
	            user_name.setAttribute("value", naver_id_login.getProfileData('name'));
	            var access_token = document.createElement("input");
	            access_token.setAttribute("type", "hidden");
	            access_token.setAttribute("name", "access_token");
	            access_token.setAttribute("value", naver_id_login.getProfileData('id'));
	            var user_email = document.createElement("input");
	            user_email.setAttribute("type", "hidden");
	            user_email.setAttribute("name", "user_email");
	            user_email.setAttribute("value", naver_id_login.getProfileData('email'));
	            var edit = document.createElement("input");
	            edit.setAttribute("type", "hidden");
	            edit.setAttribute("name", "edit");
	            edit.setAttribute("value", "readonly");
	            form.appendChild(user_name);
	            form.appendChild(user_email);
	            form.appendChild(access_token);
	            form.appendChild(edit);
	            document.body.appendChild(form);
	            form.submit();
	            
	         }
	    },
	    error: function (){        
	                      
	    }
	  });
    
  }
</script>
</body>
</html>