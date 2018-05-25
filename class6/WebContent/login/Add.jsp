<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<html>
<head>
    <title>회원가입 처리 JSP</title>
    
    <script type="text/javascript">
    
    	function goLogin(){
    		location.href="LoginForm.jsp";
    	}
    	
    </script>
    
</head>
<body>
	<!-- AddForm.jsp에서 넘겨받은 입력정보 -->
    <% 
    	// 한글 깨짐 방지
    	request.setCharacterEncoding("UTF-8");
    	
        // getParameter()를 이용해 넘겨진 파라미터 값을 얻어올 수 있다.
        // 파라미터 값을 얻을때 name= 에 지정해둔 값과 동일한 값을 인자로 지정해야 된다.
        String id = request.getParameter("memId");
        String pw = request.getParameter("memPw");
        String name = request.getParameter("memName");
        String[] gens = request.getParameterValues("memGen");
        String birth = request.getParameter("memBirth");
        String mail = request.getParameter("memMail");
        String pnum = request.getParameter("memPnum");
    %>

    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=name %></font>님 가입을 축하드립니다.
        <br><br>
        
        <%-- 자바빈(memDTO)에서 입력된 값을 추출한다. --%>
        <table>
        
            <tr>
                <td id="title">아이디</td>
                <td><%=id %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=pw %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=name %></td>
            </tr>
                    
            <tr>
                <td id="title">생년월일</td>
                <td>
                    <%=birth %> 
                </td>
            </tr>
                    
            <tr>
                <td id="title">성별</td>
                <td>
                <%
               		for(String g : gens){
						out.println(g);
               		}
                //  ë¨,ì¬ 
                %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=mail %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=pnum %></td>
            </tr>
            
        </table>
        
        <br>
        <input type="button" value="확인" onclick="goLogin()">
    </div>
</body>
</html>