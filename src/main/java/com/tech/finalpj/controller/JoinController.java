package com.tech.finalpj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/join/*")
public class JoinController {
	
//	@RequestMapping("/login")
//	public String login() {
//		System.out.println("login");
//		
//		return "login";
//	}
	@RequestMapping("/joinform2")
	public String joinform2() {
		System.out.println("join");
		
		return "/join/joinform2";
	}
	@RequestMapping("/joinform3")
	public String joinform3() {
		System.out.println("join");
		
		return "/join/joinform3";
	}
}
