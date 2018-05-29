package com.login.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.model.DAO.memDAO;



public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="../login/login.jsp";
		
		String memId=request.getParameter("memId");
		System.out.println(memId);
		String memPw=request.getParameter("memPw");
		System.out.println(memPw);
		
		memDAO dao=new memDAO();
		int result=dao.loginCheck(memId, memPw);
		System.out.println(result);
		
		String realpath="../..";
		String subpath="..";
		request.setAttribute("realpath",realpath );
		request.setAttribute("subpath",subpath );
		if(result==1){
			request.setAttribute("memId",memId);
			RequestDispatcher dispatcher=request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			System.out.println("로그인성공");
		}else{
			System.out.println("로그인안됨");
		}
	}

}
