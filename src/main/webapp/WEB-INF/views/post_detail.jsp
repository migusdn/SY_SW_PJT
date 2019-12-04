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
<title>Poem Platform</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="/app/assets/css/main.css" />

<script src="/app/assets/js/jquery.min.js"></script>
<script src="/app/assets/js/color.js"></script>
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
				<div class="testimonials">
					<section style="padding-bottom: 0">
						<div class="content"
							style="margin-bottom:0;background-color: <c:out value='${post.post_background} '/>">
							<blockquote>
								<c:out value="${post.post_content }" escapeXml="false" />
							</blockquote>
							<div class="author">
								<div class="image">
									<img src="/app/images/pic01.jpg" alt="" />
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
								postid="<c:out value="${post.post_id }"/>">확인</button>
						</div>
						
						
						
						
						<div id="like" style="margin-right: 10px;">
							<i class="fas fa-heart"
								style="font-size: 230%; margin-left: 10px; color: #bbbbbb; cursor:pointer;"></i>
							<i><c:out value="${post.post_like}"/></i>
						</div>
						<div class="reply_view" id="load"
							style="margin-left: 10px; margin-right: 10px;">
						</div>
					</div>
				</div>
				</div>
		</section>
	</div>
	<script>
	$(document).ready(function(){
		//alert(${PList});
	$.each(${reply}, function(index, vo){
        renderList(false, vo);
    }) 	
	});
	let renderList = function(mode, vo){
        // 리스트 html을 정의
        let html = "";
        	html += '<div class="col-6 col-12-small">';
        	html += '<h4>';
        	html += vo.user_id;
        	html += '</h4>';
        	html += '<ul class="alt">';
        	html += '<hr style="margin: 0;">';
        	html += vo.reply_content;
        	html += '</ul>';
        	html += '</div>';
            $("#load").append(html);
        
    }
	$(document).on('click', '.post', function () {
	    var post_id = $(this).attr('postid');
		location.href='post/'+post_id;
	    // your function here
	});
	</script>
	<!-- Footer -->
	<footer id="footer">
		<div class="MenuIcon" onclick="location.href='/app/';">
			<i class="fas fa-home" style="color: #444444;"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='/app/search';">
			<i class="fas fa-search"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='/app/add';">
			<i class="far fa-plus-square"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='/app/follow';">
			<i class="fas fa-heart"></i>
		</div>
		<div class="MenuIcon" onclick="location.href='/app/mypage';">
			<i class="fas fa-user"></i>
		</div>
	</footer>
	<script type="text/javascript">
		$(document).on('click', '.reply', function() {
			var post_id = $(this).attr('postid');
			var reply_content = $(this).parent().children('input');
			var user_id = "${sessionScope.user_id}";
			if (reply_content.length != 0 && user_id.length != 0) {
				var data = {
					'post_id' : post_id,
					'reply_content' : reply_content.val().trim(),
					'user_id' : user_id
				};
				reply_content.val("");
				$.ajax({
					url : "/app/reply",
					type : "POST",
					data : JSON.stringify(data),
					contentType : 'application/json; charset=utf-8;',
					dataType : "json",
					success : function(result) {
						if(result=='-1')
							alert('잘못된 접근');
						else{
							let html = "";
				        	html += '<div class="col-6 col-12-small">';
				        	html += '<h4>';
				        	html += data.user_id;
				        	html += '</h4>';
				        	html += '<ul class="alt">';
				        	html += '<hr style="margin: 0;">';
				        	html += data.reply_content;
				        	html += '</ul>';
				        	html += '</div>';
				            $("#load").append(html);
						}
					}
				});
			} else if (user_id.length == '0')
				alert('로그인이 필요합니다.');
			else
				alert('덧글을 입력해주세요');
			// your function here
		});
	</script>
	<!-- Scripts -->
	<script src="/app/assets/js/browser.min.js"></script>
	<script src="/app/assets/js/breakpoints.min.js"></script>
	<script src="/app/assets/js/util.js"></script>
	<script src="/app/assets/js/main.js"></script>
	<script src="/app/assets/js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>