<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>아이디 중복 체크</title>   
</head>
	<%
		String id = request.getParameter("memId");
	%>
    <script type="text/javascript">
    	function chkClose(memId) {
			opener.memInfo.memId.value = memId;
			window.close();
		}
    </script>    
<body>
	<form method="post" action="idChk.jsp">
	<%
		if(id==null){
	%>
		현재 <%=id %>는 사용 불가능<br/>
		아이디 : <input type="text" name="memId" />
		<input type="submit" value="중복 확인" />
	<%}else{ %>
		현재 <%=id %>는 사용 가능
		<a href="idChk.jsp">다른 아이디 사용하기</a><br/>
		<input type="button" value="아이디 선택" onclick="chkClose('<%=id %>')" />
	<%} %>
	</form>
</body>
</html>
