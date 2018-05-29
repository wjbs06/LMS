<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디/비번찾기</title>
</head>
	<script type="text/javascript">
		function goFind() {
			location.href="findForm.jsp";
		}
	</script>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); 
		
			String name = request.getParameter("memName");
			String mail = request.getParameter("memMail");
			
			mpDAO dao = mpDAO.getInstance();
			mpDTO mDto=dao.findId(name, mail);
			
			try{
	%>
	<form method="post" action="main.jsp">
	<%
		if(mDto != null){
	%>
		<p><%=name %>님 아이디는 <%=mDto.getMemId() %> 입니다.</p>
		<!-- 확인 클릭시 메인화면으로 이동 -->
		<input type="submit" value="확인" />
		<%}else{ %>
		이름 또는 이메일이 틀렸습니다.<br/>
		<!-- 다시 입력 버튼 클릭시 찾기 페이지로 이동 -->
		<input type="button" value="다시 입력" onclick="goFind()" />
		<%} %>
	<%}catch(Exception e){} %>
	</form>
</body>
</html>