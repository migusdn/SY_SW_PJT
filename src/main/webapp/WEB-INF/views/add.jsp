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
<script src="assets/js/jquery.min.js"></script>
<script src="ckeditor/ckeditor.js"></script>
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
	<input type="hidden" name="user_id" value="${sessionScope.user_id }">
	<textarea class="form-control" id="p_content"></textarea>
	<button onclick="button1_click();"
		style="width: 49%; display: inline-block;">확인용</button>
	<button onclick="button1_click();"
		style="width: 49%; display: inline-block;">확인용</button>
	<script>
		function button1_click() {
			var post_dat = {
					user_id:'${sessionScope.user_id}',
					test:'asdf'
			}
			alert(post_dat);
			alert(CKEDITOR.instances.p_content.getData());
		}
	</script>
	
	<script type="text/javascript">
		CKEDITOR.replace('p_content', {
			height : 314
		});
		//데이터 세팅부분 수정시 파싱후 데이터 수정
		CKEDITOR.instances.p_content.setData('<p>Some other editor data.</p>',
				function() {
					this.checkDirty(); // true
				});
	</script>
	<!-- Testimonials -->


	<!-- Footer -->
	<footer id="footer">
		<div class="MenuIcon" onclick="location.href='/app/';">
			<i class="fas fa-home"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='search';">
			<i class="fas fa-search"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='add';">
			<i class="far fa-plus-square" style="color: #444444;"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='follow';">
			<i class="fas fa-heart"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='mypage';">
			<i class="fas fa-user"></i>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>