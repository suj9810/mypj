package com.tech.finalpj.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

	@Value("${KAKAO.JS}")
	String kakaoApi;
	
	@RequestMapping(value = "/getKakaoApi.do", method = RequestMethod.POST)
	public String getKakaoApi() throws SQLException, Exception {
		System.out.println("getKakaoApi");
		return kakaoApi;
	}
	
}
