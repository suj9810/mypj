package com.tech.finalpj.controller;

import javax.servlet.http.HttpServletRequest;

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
	public String loginform(HttpServletRequest request) {
//		System.out.println("login");
//		
//		System.out.println("카카오로그인");
//		System.out.println(request.getParameter("kakaoemail"));
//		System.out.println(request.getParameter("kakaoname"));
//		System.out.println(request.getParameter("kakaobirth"));
//		
//		String kakaoid = request.getParameter("kakaoemail");
//		
//		UserTO userTo = new UserTO();
		
		
		return "/login/loginform";
	}
	@RequestMapping("/loginform2")
	public String loginform2(HttpServletRequest request) {
		
		return "/login/loginform2";
	}
}
