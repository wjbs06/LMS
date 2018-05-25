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
						<button class="memberLogin">로그인</button>
						<button class="memberLogin">회원가입</button>
					</div>
				</div>
				<div>
					<div class="clear"></div>
					<div class="grid_12 content">
						<h3>조직도</h3>
						<img alt="chart" src="../img/guro/chart/chart_01.jpg">
						<img style="width: 800px;" alt="chart" src="../img/guro/chart/chart_02.jpg">
						
					</div>
				</div>
				<jsp:include page="${realpath }/layout/Footer.jsp" />
			</div>
		</div>
	</body>
</html>