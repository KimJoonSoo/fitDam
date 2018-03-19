package org.velvet.dao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import org.velvet.domain.UserVO;

public interface UserDAO 
{
	// 유저 가입!
	public void userRegister(UserVO vo) throws Exception;
	
	// 유저 이메일 인증!
	public void userVerify(UserVO vo) throws Exception;
	
	// 유저 로그인!
	public UserVO userLogin(UserVO vo) throws Exception;
	
	// 유저 로그인 체크!
	public boolean userloginCheck(UserVO vo) throws Exception;
	
	// 유저 아이디 중복 확인!
	public String useridCheck(String u_id) throws Exception;
	
	// 유저 로그아웃!
	public void userLogout(HttpSession session) throws Exception;
	
	// 마이페이지!
	public UserVO userMypage(String u_id) throws Exception;
	
	// 유저 정보수정!
	public void userModify(UserVO vo) throws Exception;
	
	// 유저 탈퇴!
	public void userWithdraw(String u_id) throws Exception;
	public String userwithdrawCheck(HashMap<String, String> map) throws Exception;
	
	// 유저 아이디 검색
	public UserVO usersearchID(UserVO vo) throws Exception;
	
	// 유저의 비밀번호를 임시비밀번호로 업데이트
	public void usersearchPW(UserVO vo) throws Exception;
	// 유저의 원래 비밀번호 검색
	public String searchPW(UserVO vo) throws Exception;
	
}
