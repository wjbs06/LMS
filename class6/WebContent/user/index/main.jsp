<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>    
<%@ page import="com.user.model.DTO.bbsDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<!-- main bbs start -->
					  <div class="column">
					    <div class="card">
					        <h3><a href="BbsList.com">공지사항</a></h3>
					        <table>
								<c:forEach items="${mainbbs }" var="bbs"> 		        
								          <tr>
								            <td align="left">●${bbs.bbsNo }</td>
								            <td align="left">${bbs.bbsName }</td>
								            <td align="right">${bbs.bbsDate }</td>
								          </tr>
					            </c:forEach>
					        </table>
					    </div>
					  </div>
					  <div class="column">
					    <div class="card">
					        <h3><a href="#">상담게시판</a></h3>
					        <table>
								<c:forEach items="${mainbbsqna }" var="bbsq"> 
						          <tr>
						          	<td align="left">●${bbsq.bbsNo }</td>
						          	<td align="left">${bbsq.bbsName }</td>
						          	<td align="right">${bbsq.bbsDate }</td>
						          </tr>
					           </c:forEach>
					        </table>
					    </div>
					  </div>					
					    <!-- <div class="column">
					    	<div class="crad">
					     		<a href="http://www.moel.go.kr/index.do" target=blank> 
					     			<img src="../img/main/link1.jpg"  height="70" width="300"/>
					     		</a>
					     		<a href="https://www.bit.kr/" target=blank> 
					     			<img src="../img/main/link2.jpg"  height="70" width="300"/>
					     		</a>
				     		</div>
					     </div> -->
					<!-- main bbs end -->
				</div>					
			<jsp:include page="${realpath }/layout/Footer.jsp" />
		<jsp:include page="${realpath }/layout/slide.jsp" />
	</body>
</html>