<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>메인 화면</title>
    
    <script type="text/javascript">
        
        // 로그아웃 담당 JSP로 이동
        function goLogOut(){
            location.href="Logout.jsp";
        }
    </script>
</head>
<body>
    <b><font size="5" color="skyblue">메인화면입니다.</font></b><br><br>
    <%
         if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        { 
            // 로그인 화면으로 이동
            response.sendRedirect("LoginForm.jsp");
        }
        else // 로그인 했을 경우
        { 
    %>
    
    <!-- 로그인 멘트 -->
    <h2>
        <font color="red"><%=session.getAttribute("sessionID") %></font>님 로그인되었습니다.
    </h2>
    
    <br><br>
    <input type="button" value="로그아웃" onclick="goLogOut()" />
    
    <%} %>    
</body>
</html>