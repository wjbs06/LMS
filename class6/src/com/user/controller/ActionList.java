package com.user.controller;

import com.user.action.Action;
import com.user.action.CompanyChart;
import com.user.action.Intro;
import com.user.action.main;
import com.user.action.tea;
import com.user.action.way;


public class ActionList {
	
	public Action getAction(String list){
		Action action=null;
			// 로그.			
			System.out.println("ActionList : "+list);
			
		if(list.equals("main")){
			action=new main();
		}else if(list.equals("Intro")){//비트캠프구로지점 or 소개
			action=new Intro();
		}else if(list.equals("CompanyChart")){//조직도
			action=new CompanyChart();
		}else if(list.equals("tea")){//강사진
			action=new tea();
		}else if(list.equals("way")){
			action=new way();
		}/*else if(list.equals("classDb")){
			action=new classDb();
		}else if(list.equals("classJava")){
			action=new classJava();
		}else if(list.equals("classWeb")){
			action=new classWeb();
		}else if(list.equals("empTeam")){
			action=new empTeam();
		}else if(list.equals("teaIntro")){
			action=new teaIntro();
		}else if(list.equals("memBbs")){
			action=new memBbs();
		}else if(list.equals("memBbsW")){
			action=new memBbsW();
		}*/
		return action;
	}
}
