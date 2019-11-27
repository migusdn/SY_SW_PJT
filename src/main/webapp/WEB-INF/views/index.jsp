<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="assets/js/color.js"></script>
<style>
#productBeforeList {
	height: 600px;
	border: 1px solid blue;
}

#productScroll {
	height: 200px;
	border: 1px solid red;
}

#productScroll::after {
	content: '';
	clear: both;
	display: table;
}

.product-item {
	float: left;
	width: 25%;
	height: 50px;
	text-align: center;
	background-color: lightgray;
	box-sizing: border-box;
}
</style>
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
	<div id="preloadpost">
		<section class="wrapper" style="padding-top:0;">
			<div class="inner">
				<div class="testimonials" id="load">
					<c:forEach var="post" items="${post}">
						<section style="padding-bottom: 0">
							<div class="content"
								style="margin-bottom:0;background-color: <c:out value='${post.post_background} '/>">
								<blockquote>
									<c:out value="${post.post_content }" escapeXml="false" />
								</blockquote>
								<div class="author">
									<div class="image">
										<img src="images/pic01.jpg" alt="" />
									</div>
									<div>
										<strong><c:out value="${post.user_id }" /></strong>
									</div>
								</div>
							</div>
						</section>
						<div class="content" style="background-color: white">
							<div id="reply_area">
								<input type="text" id="reply_content" placeholder="덧글달기"
									style="margin-left: 10px; margin-right: 10px; width: 70%; margin-bottom: 10px; display: inline-block;">
								<button id="reply" class="reply"
									postid='<c:out value="${post.post_id }"></c:out>'>확인</button>
							</div>
							<div id="like" style="margin-right: 10px;">

								<i class="fas fa-heart"
									style="font-size: 230%; margin-left: 10px; color: #bbbbbb;"></i>
								<i>100</i>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
	</div>
	<input type="hidden" id="startNo" value="1">
	<!-- Footer -->
	<footer id="footer">
		<div class="MenuIcon" onclick="location.href='/app/';">
			<i class="fas fa-home" style="color: #444444;"></i>
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
			<i class="fas fa-user"></i>
		</div>
	</footer>
	<script type="text/javascript">
		$(document).on('click', '.reply', function() {
			var post_id = $(this).attr('postid');
			var reply_content = $(this).parent().children('input').val().trim();
			var user_id = "${sessionScope.user_id}";
			if (reply_content.length != 0 && user_id.length != 0) {
				var data = {
					'post_id' : post_id,
					'reply_content' : reply_content,
					'user_id' : user_id
				};
				alert(JSON.stringify(data));
				$.ajax({
					url : "reply",
					type : "POST",
					data : JSON.stringify(data),
					contentType : 'application/json; charset=utf-8;',
					dataType : "json",
					success : function(result) {
						if(result=='-1')
							alert('잘못된 접근');
						else
							alert('성공');
					}
				});
			} else if (user_id.length == '0')
				alert('로그인이 필요합니다.');
			else
				alert('덧글을 입력해주세요');
			// your function here
		});

		let isEnd = false;
		$(function() {
			$(window).scroll(
					function() {
						let $window = $(this);
						let scrollTop = $window.scrollTop();
						let windowHeight = $window.height();
						let documentHeight = $(document).height();

						console.log("documentHeight:" + documentHeight
								+ " | scrollTop:" + scrollTop
								+ " | windowHeight: " + windowHeight);

						// scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
						if (scrollTop + windowHeight + 30 > documentHeight) {
							fetchList();
						}
					})
			fetchList();
		})

		let fetchList = function() {
			if (isEnd == true) {
				return;
			}

			// 방명록 리스트를 가져올 때 시작 번호
			// renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
			// ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
			let startNo = $("#startNo").val();
			$.ajax({
				url : "postfetch",
				type : "POST",
				data : startNo,
				contentType : 'text/plain; charset=utf-8;',
				dataType : "json",
				success : function(result) {
					$("#startNo").val(Number(startNo) + 1);
					// 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
					// 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
					let length = result.post.length;
					if (length < 5) {
						isEnd = true;
					}
					$.each(result.post, function(index, vo) {
						renderList(false, vo);
					})
				}
			});
		}

		let renderList = function(mode, vo) {
			// 리스트 html을 정의
			let html = ""
			html += '<section style="padding-bottom: 0">';
			html += '<div class="content" style="background-color:'+vo.post_background+'">';
			html += '<blockquote>';
			html += vo.post_content;
			html += '</blockquote>';
			html += '<div class="author">';
			html += '<div class="image">';
			html += '<img src="images/pic01.jpg" alt="" />'
			html += '</div><div>'
			html += '<strong>'
			html += vo.user_id;
			html += '</strong>';
			html += '</div></div></div></section>';
			html += '<div class="content" style="background-color: white">';
			html += '<div id="reply_area">';
			html += '<input type="text" id="reply_content" placeholder="덧글달기"';
			html += 'style="margin-left: 10px; margin-right: 10px; width: 70%; margin-bottom: 10px; display: inline-block;">';
			html += '<button id="reply" class="reply"';
			html += 'postid='+vo.post_id+'>';
			html += '확인</button>';
			html += '</div>';
			html += '<div id="like" style="margin-right: 10px;">';
			html += '<i class="fas fa-heart"';
			html += 'style="font-size: 230%; margin-left: 10px; color: #bbbbbb;"></i>';
			html += '<i>100</i>';
			html += '</div>';
			html += '</div>';
			
					
					
			
			

				
					
				
			
		
			
			
			
			
			
			
			
			
			
			if (mode) {
				$("#load").prepend(html);
			} else {
				$("#load").append(html);
			}
		}
	</script>
	<!-- Scripts -->
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>