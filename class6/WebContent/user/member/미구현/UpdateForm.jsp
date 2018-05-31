<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>회원 정보 수정 화면</title>
</head>
	<script type="text/javascript">
		function checkValue() {
			var form = document.memInfo;
			
			var pw = form.memPw;
			var name = form.memName;
			var birth = form.memBirth;
			var mail = form.memMail;
			var pn = form.memPnum;
			
			if(!pw.value){
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			if(!name.value){
				alert("이름을 입력하세요");
				return false;
			}
		
			if(!birth.value){
				alert("생년월일을 입력하세요");
				return false;
			}
			
			if(!mail.value){
				alert("이메일을 입력하세요");
				return false;
			}
			
			if(!pn.value){
				alert("전화번호를 입력하세요");
				return false;
			}
				
		}
	</script>
<body>
<%
	String id = (String)session.getAttribute("sessionID");
	memDAO dao = memDAO.getInstance();
	memDTO dto = dao.getUserInfo(id);
	try{
%>
<form method="post" action="../mem/Update.jsp" onsubmit="return checkValue(this)">
	<table>
		<tr>
			<th>개인 정보 수정</th>
		</tr>
		
		<tr>
			<td id="title">아이디</td>
			<td><%=dto.getMemId() %></td>
		</tr>
		
		<tr>
			<td id="title">비밀번호</td>
			<td>
				<input type="password" name="memPw" maxlength="20" value="<%=dto.getMemPw() %>" />
			</td>
		</tr>
		
		<tr>
			<td id="title">이름</td>
			<td>
				<input type="text" name="memName" maxlength="40" value="<%=dto.getMemName() %>" />
			</td>
		</tr>
		
		<tr>
			<td id="title">성별</td>
			<td>
				<input type="radio" name="memGen" value="남성" checked>남성
                <input type="radio" name="memGen" value="여성" >여성
			</td>
		</tr>
		
		<tr>
			<td id="title">생년월일</td>
			<td>
				<input type="text" name="memBirth" maxlength="8" value="<%=dto.getMemBirth() %>" />
			</td>
		</tr>
		
		<tr>
			<td id="title">이메일</td>
			<td>
				<input type="email" name="memMail" maxlength="40" value="<%=dto.getMemMail() %>"/>
			</td>
		</tr>
		
		<tr>
			<td  id="title">휴대전화</td>
			<td>
				<input type="number" name="memPnum" maxlength="11" value="<%=dto.getMemPnum() %>"/>
            </td>
		</tr>
	</table>
	<input type="submit" value="수정" />
	<!-- 취소 클릭시 마이페이지로 이동 -->
	<input type="button" value="취소" onclick="main.jsp" />
</form>
<%
	}catch(Exception e){}
%>
</body>
</html>