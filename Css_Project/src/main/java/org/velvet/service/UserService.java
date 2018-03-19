package org.velvet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.velvet.domain.UserVO;

public interface UserService 
{
	// 유저 가입!
	public void userRegister(UserVO vo) throws Exception;
	
	// 유저 이메일 인증!
	public void userVerify(UserVO vo) throws Exception;
	
	// 유저 로그인!
	public UserVO userLogin(UserVO vo) throws Exception;
	
	// 유저 로그인 체크!
	public boolean userloginCheck(UserVO vo, HttpSession session) throws Exception;
		
	// 유저 아이디 중복 확인!
	public String useridCheck (String u_id) throws Exception;
	
	// 유저 로그아웃!
	public void userLogout(HttpSession session) throws Exception;
	
	// 마이페이지!
	public UserVO userMypage(HttpServletRequest request) throws Exception;
		
	// 유저 정보수정!
	public void userModify(UserVO vo, HttpServletRequest request) throws Exception;
		
	// 유저 탈퇴!
	public void userWithdraw(HttpServletRequest request) throws Exception;
	public boolean userwithdrawCheck(String u_password, HttpSession session) throws Exception;
	
	// 유저 아이디 검색!
	public UserVO usersearchID(UserVO vo) throws Exception;
	
	// 유저 비밀번호 검색!
	public String usersearchPW(UserVO vo) throws Exception;
}
