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
<style>
.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
</head>
<body class="is-preload">
<form name="form" id="form"method="post" action="postWrite" encType="multipart">
	<!-- Header -->
	<header id="header">
		<a class="logo" href="index.html">시 쓰기 플랫폼</a>

		<nav>
<div class="filebox"> <label for="input_img">배경 이미지 업로드</label> <input type="file" id="input_img" name="post_background"> </div>

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
	<input type="text" class="form-control" id="post_title" name="post_title" value=""
		placeholder="제목을 입력해주세요">
	<input type="hidden" name="post_content" id="post_content" value="">
	<textarea class="form-control" id="p_content"></textarea>
</form>
	
	<button id="write"
		style="width: 49%; display: inline-block;">게시하기</button>
	<button onclick="button1_click();"
		style="width: 49%; display: inline-block;">확인용</button>
	<div>
		<h2>미리보기</h2> <img id="img" />
	</div>





	<script>
	$(function(){
	     $("#write").click(function(){
	    	var form = $('form')[0];
	    	document.getElementById("post_content").value =CKEDITOR.instances.p_content.getData();
	         var formData = new FormData(form);
	             $.ajax({
	                url: '/app/postWrite',
	                processData: false,
	                contentType: false,
	                data: formData,
	                type: 'POST',
	                success: function(result){
	                    alert("업로드 성공!!");
	                }
	            });
	         });
	})

	</script>

	<script type="text/javascript">
		CKEDITOR.replace('p_content', {
			height : 280
		});
		//데이터 세팅부분 수정시 파싱후 데이터 수정
		CKEDITOR.instances.p_content.setData('<p>Some other editor data.</p>',
				function() {
					this.checkDirty(); // true
				});
	</script>
	<!-- Testimonials -->




<script>
		var sel_file;
		$(document).ready(function() {
			$("#input_img").on("change", handleImgFileSelect);
		});
		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("이미지 파일만 지정 할 수 있습니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			})
		}
	</script>










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