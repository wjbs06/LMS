package com.login.model.DAO;

import java.sql.*;
import java.util.ArrayList;

import util.DBManager;


import com.login.model.DTO.memDTO;


public class memDAO 
{
    // 싱글톤 패턴
	private static memDAO instance;
    
    // 싱글톤 패턴
    private memDAO(){}
    public static memDAO getInstance(){
        if(instance==null)
            instance=new memDAO();
        return instance;
    }
    
    // String -> Date로 변경하는 메서드
    // 문자열로된 생년월일을 Date로 변경하기 위해 필요
    // java.util.Date클래스로는 오라클의 Date형식과 연동할 수 없다.
    // Oracle의 date형식과 연동되는 java의 Date는 java.sql.Date 클래스이다.
    public Date stringToDate(memDTO member)
    {
        String birth = member.getMemBirth();
        Date birthday = Date.valueOf(birth);
        
        return birthday;
        
    } // end stringToDate()
    
    // 로그인시 아이디, 비밀번호 체크 메서드
    // 아이디, 비밀번호를 인자로 받는다.
    public int loginCheck(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
            StringBuffer query = new StringBuffer();
            query.append("SELECT MEMPW FROM MEMBER WHERE MEMID=?");
 
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("memPw"); // 비번을 변수에 넣는다.
 
                if (dbPW.equals(pw)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
 
            return x;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()
	
    // 회원 정보 가져옴
    public memDTO getUserInfo(String id) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		memDTO member = null;

		try {
			// 쿼리
			StringBuffer query = new StringBuffer();
			query.append("SELECT * FROM JSP_MEMBER WHERE ID=?");

			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query.toString());
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

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
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
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			StringBuffer query = new StringBuffer();
			query.append("UPDATE MEMBER SET MEMPW=?, MEMMAIL=?, MEMPNUM=? WHERE MEMID=?");

			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(query.toString());

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			pstmt.setString(1, member.getMemPw());
			pstmt.setString(2, member.getMemMail());
			pstmt.setInt(3, member.getMemPnum());
			pstmt.setString(5, member.getMemId());

			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit(); 
						
		} catch (Exception sqle) {
			conn.rollback(); // 오류시 롤백
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}		
	}// end updateMem
	
	// 회원 정보 삭제	 
	@SuppressWarnings("resource")
	public int delMem(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
		int x = -1;

		try {
			// 비밀번호 조회
			StringBuffer query1 = new StringBuffer();
			query1.append("SELECT MEMPW FROM MEMBER WHERE MEMID=?");

			// 회원 삭제
			StringBuffer query2 = new StringBuffer();
			query2.append("DELETE FROM MEMBER WHERE MEMID=?");

			conn = DBManager.getConnection();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			
			// 1. 아이디에 해당하는 비밀번호를 조회한다.
			pstmt = conn.prepareStatement(query1.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) 
			{
				dbpw = rs.getString("memPw");
				if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
				{
					// 같을경우 회원삭제 진행
					pstmt = conn.prepareStatement(query2.toString());
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					conn.commit(); 
					x = 1; // 삭제 성공
				} else {
					x = 0; // 비밀번호 비교결과 - 다름
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
				if ( conn != null ){ conn.close(); conn=null;	}
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	}// end delMem
	
	// 회원 정보 목록 가져옴
	public ArrayList<memDTO> getMemList() {
		ArrayList<memDTO> memberList = new ArrayList<memDTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        memDTO member = null;
        
        try {
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM MEMBER");
            
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(query.toString());
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
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end getMemList

	// 중복 검사
	public boolean duplicateIdCheck(String id) {
		Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        boolean x= false;
        
        try {
            // 쿼리
            StringBuffer query = new StringBuffer();
            query.append("SELECT MEMID FROM MEMBER WHERE MEMID=?");
                        
            conn = DBManager.getConnection();
            pstm = conn.prepareStatement(query.toString());
            pstm.setString(1, id);
            rs = pstm.executeQuery();
            
            if(rs.next()) x= true; //해당 아이디 존재
            
            return x;
            
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstm != null ){ pstm.close(); pstm=null; }
                if ( conn != null ){ conn.close(); conn=null; }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end duplicateIdCheck()
	
	// 회원 정보 입력
	public int addMem(memDTO member) throws SQLException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // 커넥션을 가져온다.
            conn = DBManager.getConnection();
            
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            // 쿼리 생성
            // 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용
            StringBuffer sql = new StringBuffer();
            sql.append("insert into MEMBER values");
            sql.append("(?, ?, ?, ?, ?, ?, ?, sysdate)");        
            stringToDate(member);

            // StringBuffer에 담긴 값을 얻으려면 toString()메서드를 사용해야 함
            pstmt = conn.prepareStatement(sql.toString());
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
            
        } catch (SQLException sqle) {
            // 오류시 롤백
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        } // end try~catch 
		return 0;
    }// end addMem
	
	// 아이디 찾기
	public memDTO findId(String name, String mail) {
		
		return null;
	}// end findId
	
	// 비번 찾기
	public memDTO findPw(String id, String name, String mail) {
		
		return null;
	}// end findPw

}// end memDAO
