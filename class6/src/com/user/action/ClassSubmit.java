package com.user.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.model.DAO.SubmitDAO;

public class ClassSubmit extends HttpServlet{//수강신청 페이지

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("id");
		int subject=Integer.parseInt(req.getParameter("subject"));
		
		SubmitDAO dao = new SubmitDAO();
		int result=0;
		try {
			result=dao.submitClass(id,subject);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		resp.sendRedirect("./user/mypage.com");
	}
	
}
