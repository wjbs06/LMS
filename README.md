LMS

기본구조 설명

서버를 켜고 localhost:8080/class6/user/index 주소로 접속하면 /user/index/main.jsp로 접속하게 됩니다

여기서 소개,강의 등 페이지를 클릭하면 이 요청이 com.user.servlet.userservlet에서 요청을 받습니다.

만약 메인로고를 눌러서 메인페이지로 다시 접속한다고 하면 /user/index가 서버로 날아가고 userServlet에서 user / index 2개를 요청한다는것을 구분합니다

actionList에서 index=main 이기 때문에 main을 돌려주고 com.user.action.main.java 로 가고 거기서 ../user/index/main.jsp 파일을 불러다 줍니다

접속요청 -> userServlet -> actionList -> action(main,teacher,mypage 등) -> (필요하면)DAO -> action(main,teacher,mypage 등) -> 사용자

var 0.1.0

-서버 켜신후 기본주소는

-localhost:8080/class6/user/index or localhost:8080/class6/user/index.com

var 0.1.2

로그인하여 회원페이지(mypage)로 접속가능

회원페이지에서 회원게시판과 회원정보로 접속가능

자바스크립트 파일 분리함

ver 0.1.3

로그인 전 후 버튼 변화

회원게시판 목록 -> 게시글 확인

ver 0.1.4 

회원가입 연결

ver 0.1.5

아이디,비번 찾기

출석체크 구현 회원정보 수정 구현 메인에 공지사항 보이는거 연결

ver 0.1.6

공지사항 쪽 연결

admin 파일 포함시킴.

ver 0.1.7
공지사항 쪽 완료

유저애서 보는것만 가능하고 관리자가 작성 및 수정 삭제 가능
어드민 쪽 연결함
상담게시판 거의 했는데 수정이 안됨
어드민쪽에 상담게시판 연결도 해야함


