package com.tech.finalpj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
//	@RequestMapping("/login")
//	public String login() {
//		System.out.println("login");
//		
//		return "login";
//	}
	@RequestMapping("/loginform")
	public String loginform() {
		System.out.println("login");
		
		return "/login/loginform";
	}
}