<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Industrious by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/app/assets/css/main.css" />
<link rel="stylesheet" href="/app/assets/css/bootstrap-datepicker.css">


</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header">
		<a class="logo" href="index.html">시 쓰기 플랫폼</a>

		<nav>
			<a href="#menu">릴레이 시 쓰기</a>
		</nav>
	</header>

	<!-- Banner
    <section id="banner">
        <div class="inner">
            <h1>시 창작 플랫폼</h1>
            <p>A responsive business oriented template with a video background<br />
            designed by <a href="https://templated.co/">TEMPLATED</a> and released under the Creative Commons License.</p>
        </div>
        <video autoplay loop muted playsinline src="images/banner.mp4"></video>
    </section>
-->
	<!-- Testimonials -->
	<section class="wrapper" id="main">
		<div class="inner">
			<div class="content">
				<div class="col-6 col-12-medium">
					<h2 align="center">회원가입</h2>
				</div>
				<div class="col-6 col-12-medium">&nbsp;</div>
				<div class="col-sm-6 col-md-offset-3">
					<div class="form-group">
						<label for="inputName">성명</label> <input type="text"
							class="form-control" id="user_name" value="${param.user_name}"placeholder="이름을 입력해 주세요" ${param.edit}>
					</div>
					<div class="form-group">
						<label for="inputName">아이디</label> <input type="text"
							class="form-control" id="user_id" placeholder="아이디를 입력해 주세요">
					</div>
					<div class="form-group">
						<label for="inputPassword">비밀번호</label> <input type="password"
							class="form-control" id="user_password"
							placeholder="비밀번호를 입력해주세요">
					</div>
					<div class="form-group">
						<label for="inputPasswordCheck">비밀번호 확인</label> <input
							type="password" class="form-control" id="user_password_check"
							placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
					</div>
					<div class="form-group">
						<label for="InputBirth">생년월일</label> <input type="text"
							id="datePicker" class="form-control" placeholder="xxxx-xx-xx">
					</div>
					<div class="form-group">
						<label for="InputEmail">이메일 주소</label> <input type="email"
							class="form-control" id="user_email" value="${param.user_email}"placeholder="이메일 주소를 입력해주세요"${param.edit}>
					</div>
					<div class="form-group">
						<label for="inputMobile">휴대폰 번호</label> <input type="tel"
							class="form-control" id="user_mobile"
							placeholder="휴대폰번호를 입력해 주세요">
					</div>
					<input type="hidden" id="user_type" value="${ regis_type}" ${param.edit}>
					<input type="hidden" id="access_token" value="${param.access_token }" ${param.edit}>
					<div class="form-group text-center">
						<button type="submit" id="join-submit" class="btn btn-primary">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						<button type="submit" class="btn btn-warning">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<footer id="footer">
		<div class="MenuIcon" onclick="location.href='/app/';">
			<i class="fas fa-home"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='search';">
			<i class="fas fa-search"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='add';">
			<i class="far fa-plus-square"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='follow';">
			<i class="fas fa-heart"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='mypage';">
			<i class="fas fa-user" style="color: #444444;"></i>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="/app/assets/js/jquery.min.js"></script>
	<script src="/app/assets/js/browser.min.js"></script>
	<script src="/app/assets/js/breakpoints.min.js"></script>
	<script src="/app/assets/js/util.js"></script>
	<script src="/app/assets/js/main.js"></script>
	<script src="/app/assets/js/fontawesome.js" crossorigin="anonymous"></script>
	<script src="/app/assets/js/join.js"></script>
	<script src="/app/assets/js/bootstrap-datepicker.js"></script>
	<script src="/app/assets/js/bootstrap-datepicker.ko.min.js"></script>
	<script>
		$(function() {
			$('#datePicker').datepicker({
				format : "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
				startDate : '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
				endDate : '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
				autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
				calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
				clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
				datesDisabled : [ '2019-06-24', '2019-06-26' ],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
				daysOfWeekDisabled : [ 0, 6 ], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
				daysOfWeekHighlighted : [ 3 ], //강조 되어야 하는 요일 설정
				disableTouchKeyboard : false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
				immediateUpdates : false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
				multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
				multidateSeparator : ",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
				templates : {
					leftArrow : '&laquo;',
					rightArrow : '&raquo;'
				}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
				showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
				title : "생년월일", //캘린더 상단에 보여주는 타이틀
				todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
				toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
				weekStart : 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
				language : "ko" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

			});//datepicker end
		});//ready end
	</script>
</body>
</html>