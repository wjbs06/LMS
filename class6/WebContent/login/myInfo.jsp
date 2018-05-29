<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>class6-LMS</title>
</head>
<body>

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
        <input type="button" value="취소" onclick="goLogin()">
    </div>
</body>
</html>