<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet" type="text/css">
<style type="text/css">					
	*{
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			$('.menu2').mouseover(function(){
				$('.bitbutton').css("background", "rgba(255, 255, 255, 0.28)");
				$('.bit').css("display","inline");
			});					
			$('.menu2').mouseout(function(){
				$('.bitbutton').css("background", "rgba(255, 255, 255, 0)");
				$('.bit').css("display","none");
			});	
			$('.menu3').mouseover(function(){
				$('.clabutton').css("background", "rgba(255, 255, 255, 0.28)");
				$('.cla').css("display","inline");
			});					
			$('.menu3').mouseout(function(){
				$('.clabutton').css("background", "rgba(255, 255, 255, 0)");
				$('.cla').css("display","none");
			});	
			$(".cla>div, .bit>div").mouseover(function(){
				$(this).css("background", "rgba(0, 0, 0, 0.28)");
			});
			$(".cla>div, .bit>div").mouseout(function(){
				$(this).css("background", "rgba(0, 0, 0, 0)");
			});
			
			$('.menu1').mouseover(function(){
				$('.mainbutton').css("background", "rgba(255, 255, 255, 0.28)");
			});					
			$('.menu1').mouseout(function(){
				$('.mainbutton').css("background", "rgba(255, 255, 255, 0)");
			});	
			$('.menu7').mouseover(function(){
				$('.membutton').css("background", "rgba(255, 255, 255, 0.28)");
			});					
			$('.menu7').mouseout(function(){
				$('.membutton').css("background", "rgba(255, 255, 255, 0)");
			});	
			$('.menu4').mouseover(function(){
				$('.advice').css("background", "rgba(255, 255, 255, 0.28)");
			});					
			$('.menu4').mouseout(function(){
				$('.advice').css("background", "rgba(255, 255, 255, 0)");
			});	
		});
</script>
	</head>	
	<body>
		<div class="container">
			<div class="menuBar">
				<div class="logo">
					<img src="../img/logo.JPG"/>
				</div>
				<div class="menu0" id="menu">
					<!-- 빈공간 -->
				</div>
				<div class="menu1" id="menu">
					<!-- 메인화면버튼 -->
					<div class="mainbutton">
						<a href="../main/Main.jsp">메인화면</a>
					</div>
				</div>
				<div class="menu2" id="menu">
					<!-- 소개 -->
					<div class="bitbutton">
						<a href="../guro/Intro.jsp">비트캠프구로지점</a>					
					</div>
					<div class="bit">
						<div class="bitintro">
							<a href="../guro/Intro.jsp">비트캠프 소개</a>						
						</div>
						<div class="bitcla">
							<a href="../guro/CompanyChart.jsp">조직도</a>
						</div>
						<div class="bittea">
							<a href="../guro/Profile.jsp">강사진 소개</a>
						</div>
						<div class="bitnavi">
							<a href="../guro/Directions.jsp">오시는길</a>
						</div>
					</div>
				</div>				
				<div class="menu3" id="menu">
					<!-- 강의 -->
					<div class="clabutton">
						<a href="../class/Intro.jsp">강의 소개</a>					
					</div>
					<div class="cla">
						<div class="clajava">
							<a href="../class/Java.jsp">JAVA 과정</a>
						</div>
						<div class="clac">
							<a href="../class/Clanguage.jsp">C언어 과정</a>
						</div>
						<div class="clabig">
							<a href="../class/Bigdata.jsp">빅데이터 과정</a>
						</div>
						<div class="claand">
							<a href="../class/Android.jsp">안드로이드 과정</a>
						</div>
					</div>
				</div>
				<div class="menu4" id="menu">
					<!-- 상담 -->
					<div class="advice">
						<a href="#">상담</a>
					</div>
				</div>
				<div class="menu5" id="menu">
					<!-- 빈공간 -->
				</div>
				<div class="menu6" id="menu">
					<!-- 빈공간 -->
				</div>
				<div class="menu7" id="menu">
					<!-- 회원페이지 -->
					<div class="membutton">
						<a href="#">회원 페이지</a>
					</div>
				</div>
				<div class="menu8" id="menu">
					<!-- 빈공간 -->
				</div>		
			</div>
			<div class="page">
				<div class="top">
					<!-- 상단 로그인 -->
					<div class="login">
						아이디
						<input type="text" class="id"/>
						비밀번호
						<input type="text" class="pw"/>
						<button class="memberLogin">로그인</button>
					</div>
				</div>
				<div class="main" style="overflow: auto">
					<!-- 메인화면 -->
					<h1 align="center">강의소개</h1>
					
						<div class="clear"></div>
						<img alt="java" src="../img/class/java_02.jpg" style="width: 100%;">
							<div id="tab31" class="tabcontent3" style="display:block">
							<div class="table-responsive" style=" border:1px solid #fff;">
						<table class="table    table-striped  "    width="100%" cellspacing=0  > 
		                    <thead >
		                      <tr class="table_header">
		                        <th style=" text-align:center;"> 순번 </th>
								<th style=" text-align:center;"> <b>과정명</th>
								<th style=" text-align:center;"> <b>교육기간</th>
								<th style=" text-align:center;"> <b> 교육장소</th>
								<th style=" text-align:center;"> <b>   </th>
		                      </tr>
		                    </thead>
		                    <tbody id="invoice_table_body">
					<tr >
						<td align=center  > 1      
						<td align=center>  자바개발자과정 
			          <td align="center"  >     
			          [주말반]  2018.05.12~2018.06.09
			              <td align="center">     구로센터 
			              <td align="center">    
			               <a href="../class/Java.jsp" 
			                style="background:#000;color:#ddd;padding:7px 20px;">자세히보기</a>
					</tr>
					</table>
					</div>
				</div>
						<br>
						<img alt="c" src="../img/class/c_01.jpg" style="width: 100%;">
							<div id="tab31" class="tabcontent3" style="display:block">
							<div class="table-responsive" style=" border:1px solid #fff;">
						<table class="table    table-striped  "    width="100%" cellspacing=0  > 
		                    <thead >
		                      <tr class="table_header">
		                        <th style=" text-align:center;"> 순번 </th>
								<th style=" text-align:center;"> <b>과정명</th>
								<th style=" text-align:center;"> <b>교육기간</th>
								<th style=" text-align:center;"> <b> 교육장소</th>
								<th style=" text-align:center;"> <b>   </th>
		                      </tr>
		                    </thead>
		                    <tbody id="invoice_table_body">
						<tr >
						<td align=center> 1      
						<td align=center>  C 언어 입문 
			          <td align="center">     
			          [주말반] 2018.04.14~2018.05.19
			              <td align="center">     구로센터 
			              <td align="center">    
			               <a href="../class/Clanguage.jsp" 
			                style="background:#000;color:#ddd;padding:7px 20px;">자세히보기</a>
						</tr>
						</table>
					</div>
				</div>
						<br>
						<img alt="bigdata" src="../img/class/bigdata/bigdata_01.jpg" style="width: 100%;">
							<div id="tab31" class="tabcontent3" style="display:block">
							<div class="table-responsive" style=" border:1px solid #fff;">
						<table class="table    table-striped  "    width="100%" cellspacing=0  > 
		                    <thead >
		                      <tr class="table_header">
		                        <th style=" text-align:center;"> 순번 </th>
								<th style=" text-align:center;"> <b>과정명</th>
								<th style=" text-align:center;"> <b>교육기간</th>
								<th style=" text-align:center;"> <b> 교육장소</th>
								<th style=" text-align:center;"> <b>   </th>
		                      </tr>
		                    </thead>
		                    <tbody id="invoice_table_body">
						<tr >
						<td align=center> 1      
						<td align=center>  R프로그래밍을 활용한 빅데이터 분석 
			          <td align="center">     
			          [주말반]  2018.05.12~2018.06.09
			              <td align="center">     구로센터 
			              <td align="center">    
			               <a href="../class/Bigdata.jsp" 
			                style="background:#000;color:#ddd;padding:7px 20px;">자세히보기</a>
						</tr>
						</table>
						</div>
					</div>
						<br>
						<img alt="android" src="../img/class/android/android_01.jpg" style="width: 100%;">
							<div id="tab31" class="tabcontent3" style="display:block">
							<div class="table-responsive" style=" border:1px solid #fff;">
						<table class="table    table-striped  "    width="100%" cellspacing=0  > 
		                    <thead >
		                      <tr class="table_header">
		                        <th style=" text-align:center;"> 순번 </th>
								<th style=" text-align:center;"> <b>과정명</th>
								<th style=" text-align:center;"> <b>교육기간</th>
								<th style=" text-align:center;"> <b> 교육장소</th>
								<th style=" text-align:center;"> <b>   </th>
		                      </tr>
		                    </thead>
		                    <tbody id="invoice_table_body">
						<tr >
						<td align=center> 1      
						<td align=center>  안드로이드 프로그래밍(앱개발 기초) 
			          <td align="center">     
			          [주말반] 2018.06.12~2018.07.14
			              <td align="center">     구로센터 
			              <td align="center">    
			               <a href="../class/Android.jsp" 
			                style="background:#000;color:#ddd;padding:7px 20px;">자세히보기</a>
						</tr>
						</table>
						</div>
					</div>						
						<br>
				</div>
				<div class="footer">
					<!-- footer -->
					<img src="../img/logo_foot.JPG"/>
					<p>비트캠프 구로지점 서울시 구로구 구로동 1234-1 2층 비트캠프 | 사업자 등록번호 : 123-45-6789<br>
					(주)비트컴퓨터 구로지점 대표이사 : 조현정 / 문의 : 02 - 2345 - 6789 / 팩스 : 02 - 1234 - 5678<br>
					통신판매업 신고번호 : 제 구로-00011호 / 개인정보보호관리책임자 : 홍길동<br>
					Copyright (c) 비트캠프 All rights reserved.</p>
				</div>
			</div>
		</div>
	</body>
</html>