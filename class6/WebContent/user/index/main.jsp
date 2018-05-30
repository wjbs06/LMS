<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Class6-LMS</title>
			<jsp:include page="${realpath }/layout/Header.jsp" />
				<div class="main" style="overflow: auto" >
					<!-- main contents Start -->
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
					<!-- main contents End -->
				</div>					
			<jsp:include page="${realpath }/layout/Footer.jsp" />
		<jsp:include page="${realpath }/layout/slide.jsp" />
	</body>
</html>