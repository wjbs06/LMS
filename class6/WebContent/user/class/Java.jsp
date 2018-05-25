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
	.style13 {font-size: 13px;  font-family:Nanum Gothic; color:#333333;}
	.style18 {font-size: 13px;  font-family:Nanum Gothic; color:#333333; font-weight: bold; letter-spacing:-0.3pt;}
	.style16 {font-size: 16px;  font-family:Nanum Gothic; color:#333333; font-weight: bold; letter-spacing:-0.3pt;}
	.style14 {font-size: 16px;  font-family:Nanum Gothic; color:#FF0000; font-weight: bold; letter-spacing:-0.3pt;}
		
	.btn {
	    border: none;
	    color: white;
	    padding: 14px 28px;
	    font-size: 16px;
	    cursor: pointer;
	}
			
	.btn {
			width: 100px;
			height: 60px;
			background-color: #2196F3;
		} 
	.btn:hover {background: #0b7dda;}

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
					<div class="clear"></div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr> 
					    <td>
					    	<table width="950" border="0" cellspacing="0" cellpadding="0" align="center">
					      <tr>
					    <td width="950"align="center" valign="top">
					      <br>
					      <br>
					      <img src="../img/class/java/java_01.jpg" width="750" height="400"><br>
					      <img src="../img/class/java/java_02.jpg" width="750" height="400"><br>
					      <img src="../img/class/java/java_03.jpg" width="750" height="400"><br>
					      <img src="../img/class/java/java_04.jpg" width="750" height="400"><br>
					      <img src="../img/class/java/java_05.jpg" width="750" height="400"><br>
					      <img src="../img/class/java/java_06.jpg" width="750" height="400"><br>
					      <img src="../img/class/java/java_07.jpg" width="750" height="400"><br>
					    <br>
					    <br>
					    <table width="882" border="0" cellspacing="0" cellpadding="0" align="center">
					        <tr>
					          <td colspan="2"  height="2" bgcolor="DDDDDD"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="102" align="center" bgcolor="#EEEEEE" class="style18"><b>과정개요</b></td>
					          <td width="82%" class="padding style13">한국콘텐츠진흥원의 자료에 따르면 콘텐츠 산업 관련 상장사의 매출액은 22조 3,336억원으로 전년대비 5.5% 성장하였습니다. 정보서비스업 , 소프트웨어 개발 및 공급업이 수익성과 성장성이 높게 나타나고 있습니다. 이처럼 SW분야는 더욱더 중요해지고 있으며, 교육부와 미래창조과학부에서는 2018부터 초 중등학교에서 SW 의무교육을 진행한다고 국무회의에서 발표한 바 있습니다. <br>
					            <br>
					            이렇게 성장하는 IT분야에 맞추어 가장 많이 활용되는 언어인 JAVA에 대해 기초부터 학습할 수 있도록 구성된 과정입니다. </td>
					        </tr>
					        <tr>
					          <td width="18%" height="1" bgcolor="#FFFFFF"></td>
					          <td width="82%"  height="1" bgcolor="#EEEEEE"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="30" align="center" bgcolor="#EEEEEE" class="style18"><b>교육기간</b></td>
					          <td width="82%" class="style14 padding">
					[주말반] 2018.05.12~2018.06.09
					          </td>
					        </tr>
					        <tr>
					          <td width="18%" height="1" bgcolor="#FFFFFF"></td>
					          <td width="82%" bgcolor="#EEEEEE"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="30" align="center" bgcolor="#EEEEEE" class="style18"><b>교육일정</b></td>
					          <td width="82%" class="padding style13">
					[주말반] 총40시간 토 5회 09:30~18:20
					          </td>
					        </tr>
					        <tr>
					          <td width="18%" height="1" bgcolor="#FFFFFF"></td>
					          <td width="82%"  height="1" bgcolor="#EEEEEE"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="30" align="center" bgcolor="#EEEEEE" class="style18"><b>교육장소</b></td>
					          <td width="82%" class="padding style13">구로센터</td>
					        </tr>
					        <tr>
					          <td width="18%" height="1" bgcolor="#FFFFFF"></td>
					          <td width="82%" bgcolor="#EEEEEE"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="30" align="center" bgcolor="#EEEEEE" class="style18"><b>교육정원</b></td>
					          <td width="82%" class="padding style13">20명</td>
					        </tr>
					        <tr>
					          <td width="18%" height="1" bgcolor="#FFFFFF"></td>
					          <td width="82%" bgcolor="#EEEEEE"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="31" align="center" bgcolor="#EEEEEE" class="style18"><b>교육대상</b></td>
					          <td width="82%" class="padding style13">JAVA를 배우고자 하는 일반인, 재직자환급, 대학생</td>
					        </tr>
					        <tr>
					          <td width="18%" height="1" bgcolor="#FFFFFF"></td>
					          <td width="82%" bgcolor="#EEEEEE"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="38" align="center" bgcolor="#EEEEEE" class="style18"><b>교육비용</b></td>
					          <td width="82%" class="padding style13"><b>전화 / 온라인문의</b></td>
					        </tr>
					        <tr>
					          <td width="18%" height="1" bgcolor="#FFFFFF"></td>
					          <td width="82%"  height="1" bgcolor="#EEEEEE"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="55" align="center" bgcolor="#EEEEEE" class="style18"><b>전망 및 진출분야 </b></td>
					          <td width="82%" class="padding style13">
					          
							향후 웹프로그래머의 고용은 증가할 것으로 전망된다. 블로그와 소규모 사업자의 사이트가 늘어나는 등 인터넷 웹사이트 수가 급증하고 있다. 
							또한, 집에서 홈네트워크를 이용해 각종 민원업무를 보거나 교육정보, 생활정보를 얻는 등 인터넷 웹사이트를 통한 정보교환, 금융거래, 
							상거래 등도 향후 더욱 가속화될 것이다. 이처럼 웹사이트 이용자가 늘어남에 따라 인터넷을 이용한 다양한 응용프로그램과 콘텐츠의 개발 필요성이 커지면서 
							웹프로그래머의 수요가 늘어날 것으로 보인다.<br><br>
							
							-교육수료후 진출분야-<br><br>
							
							1.자바기반 웹개발자 (홈페이지제작 및 쇼핑몰사이트 구축)<br>
							2.웹서버 관리자<br>
							  </td>
					        </tr>
					        <tr>
					          <td width="18%" height="1" bgcolor="#FFFFFF"></td>
					          <td width="82%"  height="1" bgcolor="#EEEEEE"></td>
					        </tr>
					        <tr>
					          <td width="18%" height="30" align="center" bgcolor="#EEEEEE" class="style18"><b>문의전화</b></td>
					          <td width="82%" class="padding style13">02-1234-1234</td>
					        </tr>
					        <tr>
					          <td colspan="2"  height="2" bgcolor="DDDDDD"></td>
					        </tr>
					      </table>
					    <br>
					    <br>
					    </td>
					</tr>
					</table>
					</td>
					</tr>
				</table>
				 <table width="882" border="0" cellspacing="4" cellpadding="0" align="center">
				      <tr bgcolor="#AAAAAA" align="center">
				        <td width="20%" height="40" class="style16">구 분</td>
				        <td width="80%" class="style16">주 요 내 용</td>
				      </tr>
				      <tr>
				        <td align="center" bgcolor="#EEEEEE" class="style18"><strong>자바 기초 및 기본문법</strong></td>
				        <td width="80%" height="69" class="style13"><b>ㆍ</b> 자바의 소개와 현업에서 많이 사용되는 자바 기반의 프로그래밍과 프레임워크를 소개<br>
				            <b>ㆍ</b> JDK설치 및 컴파일과정과 JVM메모리 구조에 대한 이해<br>
				            <b>ㆍ</b> 넷빈즈 IDE에 대한 소개와 설치, 환경설정,자바 식별자와 자료형, 연산자, 캐스팅</td>
				      </tr>
				      <tr>
				          <td height="1" colspan="2" bgcolor="#BBBBBB"></td>
				        </tr>
				      <tr>
				        <td align="center" bgcolor="#EEEEEE" class="style18">클래스와 객체의 개념 </td>
				        <td width="80%" height="165" class="style13"><b>ㆍ</b> 제어문과 반복문의 문법과 실무적인응용<br>
				            <b>ㆍ</b> 클래스의 개념과 설계, 객체 개념 이해와 설계<br>
				            <b>ㆍ</b> 오버로딩, Call By Value, Call By Reference<br>
				            <b>ㆍ</b> 생성자와 this, this(), 클래스 상속과 오버라이딩<br>
				            <b>ㆍ</b> 객체형 변화, 다형성<br>
				            <b>ㆍ</b> 추상 클래스와 인터페이스<br>
				            <b>ㆍ</b> 추상 클래스를 활용한 Adapter 클래스 구현<br>
				            <b>ㆍ</b> 내부 클래스의 개념과 사용방법<br>
				            <b>ㆍ</b> 예외와 패키지<br>
				            <b>ㆍ</b> 자바의 유용한 클래스</td>
				      </tr>
				      <tr>
				          <td height="1" colspan="2" bgcolor="#BBBBBB"></td>
				        </tr>
				      <tr>
				        <td align="center" bgcolor="#EEEEEE" class="style18">자바 제네릭과 <br>
				          컬렉션 &amp; Swing </td>
				        <td width="80%" height="107" class="style13"><b>ㆍ</b> 제네릭의 개념과 제네릭을 사용하기 전의 자료구조 사용법<br>
				            <b>ㆍ</b> 제네릭과 Collection, Collection으로 로또 프로그램 만들기<br>
				            <b>ㆍ</b> GUI의 개념<br>
				            <b>ㆍ</b> Swing, Event처리<br>
				            <b>ㆍ</b> 데리케이트 뷰<br>
				            <b>ㆍ</b> Swing 그래픽 처리</td>
				      </tr>
				      <tr>
				          <td height="1" colspan="2" bgcolor="#BBBBBB"></td>
				        </tr>
				      <tr>
				        <td align="center" bgcolor="#EEEEEE" class="style18">Thread</td>
				        <td width="80%" height="119" class="style13"><b>ㆍ</b> Thread 개념<br>
				            <b>ㆍ</b> GUI 와 Thread의 구현<br>
				            <b>ㆍ</b> Thread 동기화의 개념과 사용 예<br>
				            <b>ㆍ</b> Single Thread와 Multi Thread의 차이<br>
				            <b>ㆍ</b> Runnable 인터페이스의 사용방법<br>
				            <b>ㆍ</b> Therad로 응용된 그림 그리기 프로그램 개발 예제</td>
				      </tr>
				      <tr>
				          <td height="1" colspan="2" bgcolor="#BBBBBB"></td>
				        </tr>
				      <tr>
				        <td align="center" bgcolor="#EEEEEE" class="style18">File클래스와 IO 프로그래밍 </td>
				        <td width="80%" height="96" class="style13"><b>ㆍ</b> File 클래스와 사용법<br>
				            <b>ㆍ</b> 스트림의 개념<br>
				            <b>ㆍ</b> GUI 기반의 스트림 처리 프로그램 개발 예제<br>
				            <b>ㆍ</b> Reader/Writer, OvjectStream 객체 직렬화<br>
				            <b>ㆍ</b> GUI 기반의 스트링 처리 프로그램 개발 예제</td>
				      </tr>
				      <tr>
				          <td height="1" colspan="2" bgcolor="#BBBBBB"></td>
				        </tr>
				      <tr>
				        <td align="center" bgcolor="#EEEEEE" class="style18">서버/클라이언트 <br>
				          네트워크 소켓 프로그래밍 </td>
				        <td width="80%" height="122" class="style13"><b>ㆍ</b> TCP의 개념<br>
				            <b>ㆍ</b> Socker의 개념<br>
				            <b>ㆍ</b> ServerSocket의 개념<br>
				            <b>ㆍ</b> Unicast 기반의 네트워크 통신구현<br>
				            <b>ㆍ</b> Multicast 기반의 통신구현<br>
				            <b>ㆍ</b> Protocol의 개념과 이해<br>
				            <b>
				            ㆍ</b> Protocol을 사용한 멀리 네트워크 GUI 채팅 구현</td>
				      </tr>
				      <tr>
				          <td height="1" colspan="2" bgcolor="#BBBBBB"></td>
				        </tr>
				      <tr>
				        <td align="center" bgcolor="#EEEEEE" class="style18">JDBC</td>
				        <td width="80%" height="124" class="style13"><b>ㆍ</b> JDBC의 개념과 Connection 사용하기<br>
				            <b>ㆍ</b> Statement<br>
				            <b>ㆍ</b> ResultSet 사용하기<br>
				            <b>ㆍ</b> PreparedStatement와 Statement의 속도 테스트<br>
				            <b>ㆍ</b> DataBase소개와 Procedure의 개념<br>
				            <b>ㆍ</b> 프로시저 만들기<br>
				            <b>ㆍ</b> CallableStatment 사용하기</td>
				      </tr>
				      <tr>
				        <td height="1" colspan="2" align="center" bgcolor="#BBBBBB"></td>
				      </tr>
				
				    </table>
						</div>
					</div><!-- 커리큘럼 tab-2 -->				
					<table width="847"  border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center">
								<button class="btn"><a href="#"><span>신청</span></a></button>
							</td>
						</tr>
					</table><!-- 버튼 -->
				<br>
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