package org.velvet.service;

import javax.servlet.http.HttpSession;
import org.velvet.domain.AdminVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.UserVO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface AdminService 
{	
	// 관리자 가입
	public void adminRegister(AdminVO vo) throws Exception;
	
	// 관리자 로그인
	public AdminVO adminLogin(AdminVO vo) throws Exception;
	
	// 관리자 로그인 체크
	public boolean adminloginCheck(AdminVO vo, HttpSession session) throws Exception;
	
	// 관리자 아이디 중복확인
	public String adminidCheck (String a_id) throws Exception;
	
	// 관리자 로그아웃
	public void adminLogout(HttpSession session) throws Exception;
	
	// 관리자 마이페이지
	public AdminVO adminMypage(HttpServletRequest request) throws Exception;
	
	// 관리자 목록 기능
	public List<AdminVO> adminList() throws Exception;
	
	// 관리자 목록 검색 기능
	public List<AdminVO> adminlistSearch(SearchCriteria cri)throws Exception;
	
	// 관리자 목록 검색 카운트 기능
	public int adminlistSearchCount(SearchCriteria cri) throws Exception;
		
	// 관리자 정보보기
	public AdminVO adminInfo(String a_id) throws Exception;
	
	// 관리자 아이디 검색
	public AdminVO adminsearchID(AdminVO vo) throws Exception;
	
	// 관리자 비밀번호 검색
	public String adminsearchPW(AdminVO vo) throws Exception;
	
	// 관리자 마이페이지 정보수정
	public void adminModify(AdminVO vo, HttpServletRequest request) throws Exception;
	
	// 최고관리자가 관리자 관리등급 정보수정
	public void alevelModify(AdminVO vo, HttpServletRequest request) throws Exception;
	
	
	
	
	
	/////////////////////////////     여기까지 순수 관리자 기능        ///////////////////////////////////////////
	
	
	/////////////////////////////     여기부터 관리자의 유저관리 기능          //////////////////////////////////////
	

	
	// 관리자의 유저 목록 기능
	public List<UserVO> auserList() throws Exception;
	
	// 관리자의 유저 목록 검색 기능
	public List<UserVO> auserlistSearch(SearchCriteria cri)throws Exception;
	
	// 관리자의 유저 목록 검색 카운트 기능
	public int auserlistSearchCount(SearchCriteria cri) throws Exception;
	
	// 관리자의 유저 삭제
	public void auserWithdraw(String u_id) throws Exception;
	
	// 관리자 회원정보보기
	public UserVO auserInfo(UserVO vo) throws Exception;
		
	// 관리자 회원정보수정
	public void auserModify(UserVO vo) throws Exception;
}
