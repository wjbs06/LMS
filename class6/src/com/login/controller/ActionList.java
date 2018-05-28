package com.login.controller;

import com.login.action.Action;
import com.login.action.AddForm;
import com.login.action.findForm;
import com.login.action.idChk;
import com.login.action.loginForm;

public class ActionList {
	
	public Action getAction(String list){
		Action action=null;
			// ·Î±×.			
			System.out.println("ActionList : "+list);
			
		if(list.equals("LoginForm")){
			action=new loginForm();
		}else if(list.equals("AddForm")){
			action=new AddForm();
		}else if(list.equals("findForm")){
			action=new findForm();
		}else if(list.equals("idChk")){
			action=new idChk();
		}
		return action;
	}
}
