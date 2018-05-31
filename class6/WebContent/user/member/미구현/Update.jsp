<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 수정 처리 JSP</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="dto" class="memDTO">
        <jsp:setProperty name="dto" property="*" />
    </jsp:useBean>
    
<%
    String id = (String)session.getAttribute("memId");
    dto.setMemId(id);

    memDAO dao = memDAO.getInstance();
    dao.updateMem(dto);
    
%>

	<table>
	    <tr> 
	        <td>
	            회원정보가 수정되었습니다.
	        </td>
	    </tr>
	    
	    <tr>
	        <td> 
	            입력하신 내용대로 수정이 완료되었습니다.
	        </td>
	    </tr>
    </table>
    	<!-- 확인 클릭시 메인페이지로 이동 -->
    	<input type="button" value="확인" onclick="main.jsp" />
</body>
</html>