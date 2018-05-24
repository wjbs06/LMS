package com.guest.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guest.controller.Action;
import com.guest.controller.ActionList;

@WebServlet("/index")//localhost:8080/class6/index.com 기본주소
public class GuestServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String list=null;
		
		String temp=request.getServletPath();
		String temp1=temp.substring(1);
		int leng=0;
		if(temp1.contains(".com")){leng=temp1.length()-4;list=temp1.substring(0,leng);}
		
		System.out.println(temp);
		System.out.println(temp1);
		System.out.println(list);
		// 기본 사이트 방문 시 default 커맨드는 main으로.
		if(list==null){
			list="main";
		}
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
