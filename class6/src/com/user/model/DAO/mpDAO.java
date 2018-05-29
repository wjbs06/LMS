package com.user.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.user.model.DTO.mpDTO;





import util.DB;

public class mpDAO {//mypage DAO
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
//mypage에 표시할 내용 기능
public List<mpDTO> getMyPage(String memId) throws SQLException {
		
		List<mpDTO> list = new ArrayList<mpDTO>();
		String sql1="SELECT LECNAME,LECSTART,LECEND FROM LECHURE WHERE LECNO=(SELECT LECNO FROM MEMBER WHERE MEMID=?)";
		String sql2="SELECT GRAJAVA,GRAWEB,GRADB FROM GRADE WHERE MEMID=?";
		String sql3="SELECT COUNT(*) AS CNT FROM CHK WHERE MEMID=? AND (TO_CHAR( CHKIPD, 'YYYY-MM-DD' ) > SYSDATE-1)";
		
		System.out.println(memId);//id 확인출력
		mpDTO mDTO = new mpDTO();
		try{
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
				//conn=db.getConnction();
			}catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//강의에 대한 내용
			pstmt=conn.prepareStatement(sql1);
			pstmt.setString(1, memId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				mDTO.setLecName(rs.getString("lecName"));
				mDTO.setLecStart(rs.getDate("lecStart"));
				mDTO.setLecEnd(rs.getDate("lecEnd"));
			}
			//성적에 대한 내용
			pstmt=conn.prepareStatement(sql2);
			pstmt.setString(1, memId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				mDTO.setGraJava(rs.getInt("graJava"));
				mDTO.setGraWeb(rs.getInt("graWeb"));
				mDTO.setGraDb(rs.getInt("graDb"));
			}
			//출석에 대한 내용
			pstmt=conn.prepareStatement(sql3);
			pstmt.setString(1, memId);
			rs=pstmt.executeQuery();
			String result;
			if(rs.next()){
				if(rs.getInt("cnt")>=1){result="출석완료";}else{result="미출석";};
				mDTO.setChk(result);
			}
			
			list.add(mDTO);
			//conn.commit();
		}catch(SQLException e){
			//conn.rollback();
		}finally{
			conn.setAutoCommit(true);
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		
		System.out.println("완료");
		return list;
	}

	
}
