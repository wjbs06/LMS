<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>회원가입 화면</title>
    
    <script type="text/javascript">
    
        // 필수 입력 정보가 입력되었는지 확인하는 함수(아이디 중복, 유효성 검사 등)
        // checkValue 시작
        function checkValue()
        {
        	var form = document.memInfo;
            
            if(!form.memId.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(form.idDupl.value != "idCheck"){
                alert("아이디 중복체크를 해주세요.");
                return false;
            }
            
            if(!form.memPw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            if(!form.memName.value){
                alert("이름을 입력하세요.");
                return false;
            }
            
            if(!form.memBirth.value){
                alert("생년월일을 입력하세요.");
                return false;
            }
            
            if(isNaN(form.memBirth.value)){
                alert("생년월일은 숫자만 입력가능합니다.");
                return false;
            }
           
            if(!form.memMail1.value){
                alert("메일 주소를 입력하세요.");
                return false;
            }
            
                        
            if(!form.memPnum.value){
                alert("전화번호를 입력하세요.");
                return false;
            }
            
            if(isNaN(form.memPnum.value)){
                alert("전화번호는 - 제외한 숫자만 입력해주세요.");
                return false;
            }

        }// checkValue 끝
        
        // 취소 버튼 클릭시 로그인 화면으로 이동
        function goMain() {
            location.href="main.jsp";
        }
		
        // id 중복체크 화면
        function idChk() {
        	var id = document.memInfo.memId.value;
        	if(id=="")
        		alert("입력된 아이디가 없습니다.");
			else 
				/* open(팝업창 주소, 팝업창 이름, 팝업창 설명) */
				window.open("../mem/idChk.jsp?memId="+id,"chkForm", "width=500, height=300, resizable = no, scrollbars = no");
		}
        
    </script>
    
</head>
<body>
	<%
		// 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");	
	%>
    <div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원가입</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 memAddJoin.jsp -->
        <form method="post" action="../mem/Add.jsp" name="memInfo" onsubmit="return checkValue()">                
            <table>
            	<!-- 필수 정보 입력 -->
            	<!-- 아이디,비번,이름,성별,생년월일,이메일,폰번호 순서 -->
                <tr>
                    <td id="title">아이디</td>
                    <td>
                        <input type="text" name="memId" maxlength="20" />
                        <input type="button" value="중복확인" onclick="idChk()" /> 
                    </td>
                </tr>
                        
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="memPw" maxlength="20">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">이름</td>
                    <td>
                        <input type="text" name="memName" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">성별</td>
                    <td>
                        <input type="radio" name="memGen" value="남" checked>남성
                        <input type="radio" name="memGen" value="여" >여성
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">생년월일</td>
                    <td>
                    	<input type="text" name="memBirth" maxlength="8">
                    </td>
                </tr>
                    
                <tr>
	                <!-- 이메일 -->
                    <td id="title">이메일</td>
                    <td>
						<input type="email" name="memMail" maxlength="40">
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
						<input type="number" name="memPnum" maxlength="11"/>
                    </td>
                </tr>
            </table>
            <br>
			<input type="submit" value="가입"/>  
			<input type="button" value="취소" onclick="goMain()">
        </form>
    </div>
</body>
</html>