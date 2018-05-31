package com.user.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.DAO.bbsDAO;
import com.user.model.DTO.bbsDTO;



public class main implements Action {//main 페이지

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="../user/index/main.jsp";
		
		//main 공지사항 
		bbsDAO dao = new bbsDAO();
		ArrayList<bbsDTO> bbs = dao.view();
		ArrayList<bbsDTO> bbsqna = dao.viewqna();
		
		request.setAttribute("mainbbs", bbs);
		request.setAttribute("mainbbsqna", bbsqna);
		
		String realpath="../..";
		String subpath="..";
		request.setAttribute("realpath",realpath );
		request.setAttribute("subpath",subpath );
		RequestDispatcher dispatcher=request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
