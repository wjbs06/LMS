<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Class6-LMS</title>
	</head>	
	<body>
		<div class="container">
			<jsp:include page="${realpath }/layout/Header.jsp" />
			<div class="page">
				<div class="top">
					<!-- 상단 로그인 -->
					<div class="login">
						<button class="memberLogin" id="Add">회원가입</button>
						<button class="memberLogin" id="Login">로그인</button>
					</div>
				</div>
				<div class="main" style="overflow: auto" >
					<!-- main slide -->
					<div class="slideshow-container" style="margin: 20px 10px 10px 20px">
					
					<div class="mySlides fade">
					  <img src="${subpath }/img/main/MainPage_Banner_01.JPG" style="width:100%">
					</div>
					<div class="mySlides fade">
					  <img src="${subpath }/img/main/MainPage_Banner_02.JPG" style="width:100%">
					</div>
					<div class="mySlides fade">
					  <img src="${subpath }/img/main/MainPage_Banner_03.JPG" style="width:100%">
					</div>
					<div class="mySlides fade">
					  <img src="${subpath }/img/main/MainPage_Banner_04.JPG" style="width:100%">
					</div>
					<div class="mySlides fade">
					  <img src="${subpath }/img/main/MainPage_Banner_05.JPG" style="width:100%">
					</div>
					<div class="mySlides fade">
					  <img src="${subpath }/img/main/MainPage_Banner_06.JPG" style="width:100%">
					</div>
					</div>
					<div style="text-align:center">
					  <span class="dot" onclick="currentSlide(1)"></span> 
					  <span class="dot" onclick="currentSlide(2)"></span> 
					  <span class="dot" onclick="currentSlide(3)"></span> 
					  <span class="dot" onclick="currentSlide(4)"></span> 
					  <span class="dot" onclick="currentSlide(5)"></span> 
					  <span class="dot" onclick="currentSlide(6)"></span> 
					</div>
				</div>					
				<jsp:include page="${realpath }/layout/Footer.jsp" />
			</div>
		</div>
		<jsp:include page="${realpath }/layout/slide.jsp" />
	</body>
</html>