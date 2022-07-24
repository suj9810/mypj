package com.tech.finalpj.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class KakaoController {
	
//	@RequestMapping(value="/kakaoLoginPro.do", method=RequestMethod.POST)
//	public Map<String, Object> kakaoLoginPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
//		System.out.println("paramMap:" + paramMap);
//		Map <String, Object> resultMap = new HashMap<String, Object>();
//		
//		Map<String, Object> kakaoConnectionCheck = userservice.kakaoConnectionCheck(paramMap);
//		if(kakaoConnectionCheck == null) { //일치하는 이메일 없으면 가입
//			resultMap.put("JavaData", "register");
//		}else if(kakaoConnectionCheck.get("KAKAOLOGIN") == null && kakaoConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
//			System.out.println("kakaoLogin");
//			userservice.setKakaoConnection(paramMap);
//			Map<String, Object> loginCheck = userservice.userKakaoLoginPro(paramMap);
//			session.setAttribute("userInfo", loginCheck);
//			resultMap.put("JavaData", "YES");
//		}else{
//			Map<String, Object> loginCheck = userservice.userKakaoLoginPro(paramMap);
//			session.setAttribute("userInfo", loginCheck);
//			resultMap.put("JavaData", "YES");
//		}
//		
//		return resultMap;
//	}
}
