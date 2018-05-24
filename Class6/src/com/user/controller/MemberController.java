package com.user.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.DAO.memDAO;
import com.user.model.DTO.memDTO;


@WebServlet("/MemberServlet")
public class MemberController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String memId=req.getParameter("memId");
	
		memDAO dao=new memDAO();
		List<memDTO> list=null;
		try {
			list = dao.getMyPage(memId);
			req.setAttribute("MyPage", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd=req.getRequestDispatcher("/mem/memInfo.jsp");
		rd.forward(req,resp);
	}
}
