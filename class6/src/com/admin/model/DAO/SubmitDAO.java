package com.admin.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.admin.model.DTO.SubmitDTO;


import util.DB;

public class SubmitDAO {//미완성
	private Connection conn;
	private PreparedStatement pstmt;
//회원 id와 강의 번호가 온다는 가정
	public int submitClass(String id,int subject) throws SQLException {
		
		String sql="insert into submit values(?,?)";
		int result = 0;
		try{
			try{
				conn=DB.getConnction();
				conn.setAutoCommit(false);
			}catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, subject);
			pstmt.setString(2, id);
			result=pstmt.executeUpdate();
			
			conn.commit();
		}catch(SQLException e){
			conn.rollback();
		}finally{
			conn.setAutoCommit(true);
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
}
