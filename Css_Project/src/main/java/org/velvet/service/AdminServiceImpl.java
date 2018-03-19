package org.velvet.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.velvet.dao.AdminDAO;
import org.velvet.domain.AdminVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.UserVO;

@Service
public class AdminServiceImpl implements AdminService
{
	@Inject
	AdminDAO dao;
	
	// 관리자 등록
	@Override
	public void adminRegister(AdminVO vo) throws Exception 
	{
		dao.adminRegister(vo);
	}
	
	// 관리자 로그인
	@Override
	public AdminVO adminLogin(AdminVO vo) throws Exception 
	{
		return dao.adminLogin(vo);		
	}
	
	// 관리자 로그인 체크
	@Override
	public boolean adminloginCheck(AdminVO vo, HttpSession session) throws Exception
	{
		boolean result = dao.adminloginCheck(vo);
		if (result) 
		{ 	// true일 경우 세션에 등록
			AdminVO vo2 = dao.adminMypage(vo.getA_id());
			// 세션 변수 등록
			session.setAttribute("a_id", vo2.getA_id());
			session.setAttribute("a_name", vo2.getA_name());
		} 
		return result;
	}
	
	// 관리자 아이디 중복확인
	@Override
	public String adminidCheck(String a_id) throws Exception
	{	
		return dao.adminidCheck(a_id);
	}

	// 관리자 로그아웃
	@Override
	public void adminLogout(HttpSession session) throws Exception
	{
		String a_id = ((AdminVO)session.getAttribute("adminsession")).getA_id();
		dao.adminrecentLogout(a_id);
		session.invalidate();
	}
		
	// 관리자 마이페이지
	@Override
	public AdminVO adminMypage(HttpServletRequest request) throws Exception
	{
		AdminVO vo = null;
		
		if(request.getSession().getAttribute("adminsession") != null)	// 세션이 유효한 경우에만 실행
		{
			vo = (AdminVO)request.getSession().getAttribute("adminsession");	
		}
		return dao.adminMypage(vo.getA_id());
	}	
	
	// 관리자 목록 기능
	@Override
	public List<AdminVO> adminList() throws Exception
	{
		return dao.adminList();
	}
	
	// 관리자 목록 검색 기능
	@Override
	public List<AdminVO> adminlistSearch(SearchCriteria cri)throws Exception
	{
		return dao.adminlistSearch(cri);
	}
	
	// 관리자 목록 검색 카운트 기능
	@Override
	public int adminlistSearchCount(SearchCriteria cri) throws Exception
	{
		return dao.adminlistSearchCount(cri);
	}
	
	// 관리자 정보보기
	@Override
	public AdminVO adminInfo(String a_id) throws Exception 
	{
		return dao.adminInfo(a_id);
	}
	
	// 관리자 아이디 검색
	@Override
	public AdminVO adminsearchID(AdminVO vo) throws Exception
	{
		return dao.adminsearchID(vo);
	}
	
	// 관리자 비밀번호 검색
	@Override
	public String adminsearchPW(AdminVO vo) throws Exception
	{
		String result = "";
		
		dao.adminsearchPW(vo);
		String dbpasswd = dao.searchPW(vo);
		System.out.println("service : " + dbpasswd);
		// 검색한 비밀번호의 값과 변환된 비밀번호의 값이 같을경우 (= 정보들이 올바르게 입력된 경우) 메일을 전송
		if(dbpasswd.equals(vo.getA_password())) 
		{
			result = "send";
		}
		else
		{
			result = "fail";
		}
		
		return result;
	}
	
	// 관리자 마이페이지 정보수정
	@Override
	public void adminModify(AdminVO vo, HttpServletRequest request) throws Exception 
	{
		HttpSession adminsession = request.getSession();
		if(adminsession.getAttribute("adminsession") != null)
		{
			/*AdminVO vo = ((AdminVO) adminsession.getAttribute("adminsession"));*/
			dao.adminModify(vo);
		}
		
	}
	
	// 최고관리자가 관리자 관리등급 정보수정
	@Override
	public void alevelModify(AdminVO vo, HttpServletRequest request) throws Exception 
	{
		HttpSession adminsession = request.getSession();
		if(adminsession.getAttribute("adminsession") != null)
		{
			dao.alevelModify(vo);
		}		
	}
	
	
	
	
	
	/////////////////////////////     여기까지 순수 관리자 기능        ///////////////////////////////////////////
	
	
	/////////////////////////////     여기부터 관리자의 유저관리 기능          //////////////////////////////////////
	
		
	
	// 관리자의 유저 목록 기능
	@Override
	public List<UserVO> auserList() throws Exception
	{
		return dao.auserList();
	}
	
	// 관리자의 유저 목록 검색 기능
	@Override
	public List<UserVO> auserlistSearch(SearchCriteria cri)throws Exception
	{
		
		return dao.auserlistSearch(cri);
	}
	
	// 관리자의 유저 목록 검색 카운트 기능
	@Override
	public int auserlistSearchCount(SearchCriteria cri) throws Exception
	{
		return dao.auserlistSearchCount(cri);
	}
	
	// 관리자의 유저삭제
	@Override
	public void auserWithdraw(String u_id) throws Exception 
	{	
		dao.auserWithdraw(u_id);
	}

	// 관리자 회원정보보기
	@Override
	public UserVO auserInfo(UserVO vo) throws Exception
	{
		return dao.auserInfo(vo);
	}

	// 관리자 유저 정보수정
	@Override
	public void auserModify(UserVO vo) throws Exception 
	{
		System.out.println("service : " + vo.getU_point());
		System.out.println("service : " + vo.getG_code());
		dao.auserModify(vo);	
	}
}
