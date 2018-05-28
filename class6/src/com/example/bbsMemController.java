package com.example;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.DAO.bbsMemDAO;
import com.user.model.DTO.bbsMemDTO;

@WebServlet(
		urlPatterns={
				"/guest/bbsMem.com"
		})
public class bbsMemController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		bbsMemDAO dao=new bbsMemDAO();
		List<bbsMemDTO> list=null;
		try {
			list = dao.selectAll();
			req.setAttribute("list", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd=req.getRequestDispatcher("../user/memBbs.jsp");
		rd.forward(req,resp);
	}
}
