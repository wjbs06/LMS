package com.login.controller;

import com.login.action.login;

public class ActionList {
	
	public Action getAction(String list){
		Action action=null;
			// ·Î±×.			
			System.out.println("ActionList : "+list);
			
		if(list.equals("login")){
			action=new login();
		}
		return action;
	}
}
