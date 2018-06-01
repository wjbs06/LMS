package com.login.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.model.DAO.memDAO;
import com.login.model.DTO.memDTO;



public class LoginAction implements Action {
	//id,pw 입력 후 로그인 버튼을 누르면 오는 페이지

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="../login/login.jsp";
		String url2="../admin/login.jsp";
		
		String memId=request.getParameter("memId");
		System.out.println(memId);
		String memPw=request.getParameter("memPw");
		System.out.println(memPw);
		
		memDAO dao=new memDAO();
		memDTO dto=new memDTO();
		int result=dao.loginCheck(memId, memPw);
		System.out.println(result);
		
		try {
			dto=dao.getUserInfo(memId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(dto.getMemId());
		
		String realpath="../..";
		String subpath="..";
		request.setAttribute("realpath",realpath );
		request.setAttribute("subpath",subpath );
		if(result==1){
			if(dto.getMemId()!="") {
				System.out.println("직원");
				request.setAttribute("memId",memId);
				RequestDispatcher dispatcher=request.getRequestDispatcher(url2);
				dispatcher.forward(request, response);
			}else {
			System.out.println("학생");
			request.setAttribute("memId",memId);
			RequestDispatcher dispatcher=request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			System.out.println("로그인성공");
			}
		}else{
			System.out.println("로그인안됨");
		}
	}

}
