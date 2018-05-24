package com.login.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.controller.Action;
import com.login.controller.ActionList;

@WebServlet("/login.com")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String list=null;
		
		System.out.println("로그인");
		String temp=request.getServletPath();
		String temp1=temp.substring(1);
		int leng=0;
		if(temp1.contains(".com")){leng=temp1.length()-4;list=temp1.substring(0,leng);}
		
		// 로깅
		System.out.println("-----------------------------");
		System.out.println("Servlet : list값 - " + list);			
	
		ActionList al=new ActionList();
		Action action=al.getAction(list);
		
		if(action!=null){
			action.execute(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
