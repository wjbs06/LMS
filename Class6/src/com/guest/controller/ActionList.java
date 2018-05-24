package com.guest.controller;

import com.guest.action.Main;
import com.guest.action.bbs;
import com.guest.action.bbsQna;
import com.guest.action.bitcampIntro;
import com.guest.action.bitcampWay;
import com.guest.action.classDb;
import com.guest.action.classJava;
import com.guest.action.classWeb;
import com.guest.action.empTeam;
import com.guest.action.teaIntro;

public class ActionList {
	
	public Action getAction(String list){
		Action action=null;
			// ·Î±×.			
			System.out.println("ActionList : "+list);
			
		if(list.equals("main")){
			action=new Main();
		}else if(list.equals("bbs")){
			action=new bbs();
		}else if(list.equals("bbsQna")){
			action=new bbsQna();
		}else if(list.equals("bitcampIntro")){
			action=new bitcampIntro();
		}else if(list.equals("bitcampWay")){
			action=new bitcampWay();
		}else if(list.equals("classDb")){
			action=new classDb();
		}else if(list.equals("classJava")){
			action=new classJava();
		}else if(list.equals("classWeb")){
			action=new classWeb();
		}else if(list.equals("empTeam")){
			action=new empTeam();
		}else if(list.equals("teaIntro")){
			action=new teaIntro();
		}
		return action;
	}
}
