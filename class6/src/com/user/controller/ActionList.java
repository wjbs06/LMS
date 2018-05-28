package com.user.controller;

import com.user.action.Action;
import com.user.action.Android;
import com.user.action.Bigdata;
import com.user.action.Clanguage;
import com.user.action.CompanyChart;
import com.user.action.Intro;
import com.user.action.Java;
import com.user.action.LecIntro;
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
		}else if(list.equals("LecIntro")){
			action=new LecIntro();
		}else if(list.equals("Java")){
			action=new Java();
		}else if(list.equals("Clanguage")){
			action=new Clanguage();
		}else if(list.equals("Bigdata")){
			action=new Bigdata();
		}else if(list.equals("Android")){
			action=new Android();
		}else {
			action=new main();
		}
		return action;
	}
}
