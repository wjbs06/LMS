//AddForm.jsp
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
        	location.href="../user/index.com";
        }
		
        // id 중복체크 화면
        function idChk() {
        	var id = document.memInfo.memId.value;
        	if(id=="")
        		alert("입력된 아이디가 없습니다.");
			else 
				/* open(팝업창 주소, 팝업창 이름, 팝업창 설명) */
				window.open("../Login/idChk.com?memId="+id,"chkForm", "width=500, height=300, resizable = no, scrollbars = no");
		}
        
//LoginForm.jsp   
        
        
        