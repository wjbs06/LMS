package com.login.model.DAO;

import java.sql.*;
import java.util.ArrayList;

import util.DB;

import com.login.model.DTO.memDTO;

public class memDAO2 //회원가입 및 검사 DAO
{
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private memDTO member,mem;
	private String sql1,sql2;
    
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
    
    
	
 // 회원 입력 정보 조회
    public memDTO getUserInfo(String id) {

		try {
			// 쿼리
			sql1 = "SELECT * FROM PRIVACY WHERE MEMID=?";

			conn = DB.getConnction();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // 회원정보를 DTO에 담는다.
			{
				// 자바빈에 정보를 담는다.
				member = new memDTO();
				member.setMemId(rs.getString("memId"));
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
				if ( conn != null ){ conn.close(); conn=null; }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	}// end getUserInfo()
	
	
	// 아이디 찾기
	public memDTO findId(String name, String mail) {
			
		try {
			mem = new memDTO();
			
			conn=DB.getConnction();
			
			sql1 = "SELECT MEMID FROM PRIVACY WHERE MEMNAME=? AND MEMMAIL=?";

			pstmt = conn.prepareStatement(sql1.toString());
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
                if ( conn != null ){ conn.close(); conn=null; }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return null;
	}// end findId
	
	// 비번 찾기
//	public memDTO findPw(String id, String name, String mail) {
	public memDTO findPw(String name, String mail) {
			
		try {
			mem = new memDTO();
			
			conn=DB.getConnction();
			
			sql1 = "SELECT MEMPW FROM MEMBER WHERE MEMID = (SELECT MEMID FROM PRIVACY WHERE MEMNAME=? AND MEMMAIL=?)";
//			sql1 = "SELECT MEMPW, MEMID FROM MEMBER WHERE MEMID = (SELECT MEMID FROM PRIVACY WHERE MEMNAME=? AND MEMMAIL=?)";
			
			pstmt = conn.prepareStatement(sql1.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, mail);
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
                if ( conn != null ){ conn.close(); conn=null; }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return null;
	}// end findPw

}// end memDAO
