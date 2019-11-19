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
<link rel="stylesheet" href="assets/css/main.css" />
<script src="assets/js/facebook.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
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
				<div class="row">
					<div class="col-6 col-12-medium">
						<h2 align="center">로그인</h2>
					</div>
					<div class="col-6 col-12-medium">&nbsp;</div>
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							<input type="text" name="user_id" id="user_id" value=""
								placeholder="ID or Email" required>
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="password" name="user_password" id="user_password"
								value="" placeholder="PASSWORD" required>
						</div>
						<div class="col-3 col-12-small">
							<ul class="actions stacked">
								<li><button id="login">로그인</button></li>
							</ul>
						</div>
						<div class="col-3 col-12-small">
							<ul class="actions stacked">
								<li><button
									onclick="location.href='register_type'">회원가입</button></li>
							</ul>
						</div>
						<h3 align="center">소셜 로그인</h3>
						<div class="col-3 col-12-small">
							<div id="naver_id_login">
							<img src="assets/img/Naver.PNG">
							</div>
						</div>
						<div class="col-3 col-12-small">
							<fb:login-button scope="public_profile,email"
								onlogin="checkLoginState();">
							</fb:login-button>
						</div>
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
	<script type="text/javascript">
  	var naver_id_login = new naver_id_login("8tx_pBAlod4OIxq2dlgB", "http://127.0.0.1:8080/app/N_callback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setDomain("http://127.0.0.1/");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();
  </script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/fontawesome.js" crossorigin="anonymous"></script>
	<script src="assets/js/login.js"></script>

</body>
</html>