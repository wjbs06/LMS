package com.login.model.DAO;

import java.sql.*;
import java.util.ArrayList;

import util.DB;

import com.login.model.DTO.memDTO;

public class memDAO 
{
	
	private static memDAO instance;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private memDTO member,mem;
	private StringBuffer sb1,sb2;
    
    // 싱글톤 패턴
   /* private memDAO(){}
    public static memDAO getInstance(){
        if(instance==null)
            instance=new memDAO();
        return instance;
    }*/
    
    // String -> Date로 변경하는 메서드
    // 문자열로된 생년월일을 Date로 변경하기 위해 필요
    // java.util.Date클래스로는 오라클의 Date형식과 연동 불가
    // Oracle의 date형식과 연동되는 java의 Date는 java.sql.Date 클래스
    public Date stringToDate(memDTO member)
    {
        String birth = member.getMemBirth();
        Date birthday = Date.valueOf(birth);
        
        return birthday;
        
    } // end stringToDate()
    
    // 로그인 체크
    // 아이디/비밀번호 체크
    public int loginCheck(String id, String pw) 
    {

    	String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회
            sb1 = new StringBuffer();
            sb1.append("SELECT MEMPW FROM MEMBER WHERE MEMID=?");
 
            conn = DB.getConnction();
            pstmt = conn.prepareStatement(sb1.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("memPw"); // 비번을 변수에 넣는다.
 
                if (dbPW.equals(pw)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호가 다르면, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
 
            return x;
 
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()
	
    // 회원 정보 조회
    public memDTO getUserInfo(String id) {

		try {
			// 쿼리
			sb1 = new StringBuffer();
			sb1.append("SELECT * FROM MEMBER WHERE MEMID=?");

			conn = DB.getConnction();
			pstmt = conn.prepareStatement(sb1.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 회원정보를 DTO에 담는다.
			{
				// 자바빈에 정보를 담는다.
				member = new memDTO();
				member.setMemId(rs.getString("memId"));
				member.setMemPw(rs.getString("memPw"));
				member.setMemName(rs.getString("memName"));
				member.setMemGen(rs.getString("memGen"));
				member.setMemBirth(rs.getString("memBirth"));
				member.setMemMail(rs.getString("memMail"));
				member.setMemPnum(Integer.parseInt(rs.getString("memPnum")));
			}

			return member;

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	}// end getUserInfo
    
    // 회원 정보 수정
	public void updateMem(memDTO member) throws SQLException {

		try {

			sb1 = new StringBuffer();
			sb1.append("UPDATE MEMBER SET MEMPW=?, MEMMAIL=?, MEMPNUM=? WHERE MEMID=?");

			conn = DB.getConnction();
			pstmt = conn.prepareStatement(sb1.toString());

			// 자동 커밋을 false로
			conn.setAutoCommit(false);
			
			pstmt.setString(1, member.getMemPw());
			pstmt.setString(2, member.getMemMail());
			pstmt.setInt(3, member.getMemPnum());
			pstmt.setString(4, member.getMemId());

			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit(); 
						
		} catch (Exception e) {
			conn.rollback(); // 오류시 롤백
			throw new RuntimeException(e.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null; }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}		
	}// end updateMem
	
	// 회원 정보 삭제	 
	public int delMem(String id, String pw) {

		String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
		int x = -1;

		try {
			// 비밀번호 조회
			sb1 = new StringBuffer();
			sb1.append("SELECT MEMPW FROM MEMBER WHERE MEMID=?");

			// 회원 삭제
			sb2 = new StringBuffer();
			sb2.append("DELETE FROM MEMBER WHERE MEMID=?");

			conn = DB.getConnction();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			// 1. 아이디에 해당하는 비밀번호를 조회한다.
			pstmt = conn.prepareStatement(sb1.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) 
			{
				dbpw = rs.getString("memPw");
				if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
				{
					// 같을경우 회원삭제 진행
					pstmt = conn.prepareStatement(sb2.toString());
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					conn.commit(); 
					x = 1; // 삭제 성공
				} else {
					x = 0; // 비밀번호 다름 - 삭제 실패
				}
			}

			return x;

		} catch (Exception sqle) {
			try {
				conn.rollback(); // 오류시 롤백
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null; }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	}// end delMem
	
	// 회원 정보 목록 가져옴
	public ArrayList<memDTO> getMemList() {
		ArrayList<memDTO> memberList = new ArrayList<memDTO>();
        
        try {
            sb1 = new StringBuffer();
            sb1.append("SELECT * FROM MEMBER");
            
            conn = DB.getConnction();
            pstmt = conn.prepareStatement(sb1.toString());
            rs = pstmt.executeQuery();
            
            while (rs.next()) 
            {
                member = new memDTO();
                member.setMemId(rs.getString("memId"));
                member.setMemPw(rs.getString("memPw"));
                member.setMemName(rs.getString("memName"));
                member.setMemGen(rs.getString("memGen"));
                member.setMemBirth(rs.getDate("memBirth").toString());
                member.setMemMail(rs.getString("memMail"));
                member.setMemPnum(Integer.parseInt(rs.getString("memPnum")));
                
                memberList.add(member);
            }
            
            return memberList;
            
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null; }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end getMemList

	// 아이디 중복 검사
	public boolean idChk(String id) {

		boolean x= false;
        
        try {
            // 쿼리
            sb1 = new StringBuffer();
            sb1.append("SELECT MEMID FROM MEMBER WHERE MEMID=?");
                        
            conn = DB.getConnction();
            pstmt = conn.prepareStatement(sb1.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next())
            	
            	x= true; //해당 아이디 존재
            
            return x;
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null; }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end duplicateIdCheck()
	
	// 회원 정보 입력(회원 가입)
	public int addMem(memDTO member) throws SQLException {
        
        try {
            // 커넥션을 가져온다.
            conn = DB.getConnction();
            
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            // 쿼리 생성
            // 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용
            sb1 = new StringBuffer();
            sb1.append("INSERT INTO MEMBER ");
            // sb1.append("INSERT INTO MEMBER (memId,memPw,memName,memGen,memBirth,memMail,memPnum,memIpD)");
            sb1.append("VALUES (?, ?, ?, ?, ?, ?, ?, SYSDATE)");        
            stringToDate(member);

            // StringBuffer에 담긴 값을 얻으려면 toString()메서드를 사용해야 함
            pstmt = conn.prepareStatement(sb1.toString());
            pstmt.setString(1, member.getMemId());
            pstmt.setString(2, member.getMemPw());
            pstmt.setString(3, member.getMemName());
            pstmt.setString(4, member.getMemGen());
            pstmt.setString(5, member.getMemBirth());
            pstmt.setString(6, member.getMemMail());
            pstmt.setInt(7, member.getMemPnum());
            pstmt.setDate(8, stringToDate(member));
            
            // 쿼리 실행
            pstmt.executeUpdate();
            // 완료시 커밋
            conn.commit(); 
            
        } catch (SQLException e) {
            // 오류시 롤백
            conn.rollback();             
            throw new RuntimeException(e.getMessage());
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        } 
		return 0;
    }// end addMem
	
	// 아이디 찾기
	public memDTO findId(String name, String mail) {
			
		try {
			mem = new memDTO();
			
			conn=DB.getConnction();
			
			sb1 = new StringBuffer();
			sb1.append("select memId from member where memName=? and memMail=?");

			pstmt = conn.prepareStatement(sb1.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, mail);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				member = new memDTO();
                member.setMemId(rs.getString("memId"));
                mem = member;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return null;
	}// end findId
	
	// 비번 찾기
	public memDTO findPw(String id, String name, String mail) {
			
		try {
			mem = new memDTO();
			
			conn=DB.getConnction();
			
			sb1 = new StringBuffer();
			sb1.append("select memPw from member where memId=? and memName=? and memMail=?");
			
			pstmt = conn.prepareStatement(sb1.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, mail);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				member = new memDTO();
                member.setMemPw(rs.getString("memPw"));
                mem = member;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return null;
	}// end findPw

}// end memDAO
