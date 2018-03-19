package org.velvet.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.UserVO;
import org.velvet.domain.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO 
{
	@Inject // 의존성 주입 기능
	private SqlSession session;
	private static String namespace = "org.velvet.mapper.AdminMapper";
	
	// 관리자 가입
	@Override
	public void adminRegister(AdminVO vo) throws Exception 
	{
		session.insert(namespace + ".adminRegister", vo);		
	}

	// 관리자 로그인
	@Override
	public AdminVO adminLogin(AdminVO vo) throws Exception 
	{
		System.out.println("dao : " + vo.toString());
		return session.selectOne(namespace + ".adminLogin", vo);		
	}

	// 관리자 로그인 체크
	@Override
	public boolean adminloginCheck(AdminVO vo) throws Exception
	{
		String name = session.selectOne(namespace + ".adminloginCheck", vo);
		return (name == null) ? false : true;
	}
		
	// 관리자 아이디 중복 확인
	@Override
	public String adminidCheck(String a_id) throws Exception
	{
		return session.selectOne(namespace + ".adminidCheck", a_id);
	}

	// 관리자 로그아웃
	@Override
	public void adminLogout(HttpSession session) throws Exception
	{} 
	
	// 관리자 최근 로그아웃
	@Override
	public void adminrecentLogout(String a_id) throws Exception
	{
		session.update(namespace + ".adminrecentLogout", a_id);
	}
	
	// 관리자 마이페이지
	@Override
	public AdminVO adminMypage(String a_id) throws Exception
	{
		return session.selectOne(namespace + ".adminMypage", a_id);
	}
	
	// 관리자 목록 기능
	@Override 
	public List<AdminVO> adminList() throws Exception 
	{
		return session.selectList(namespace + ".adminList");
	}
	
	// 관리자 목록 검색 기능
	@Override
	public List<AdminVO> adminlistSearch(SearchCriteria cri) throws Exception 
	{
	    return session.selectList(namespace + ".adminlistSearch", cri);
	}
	
	// 관리자 목록 검색 카운트 기능
	@Override
	public int adminlistSearchCount(SearchCriteria cri) throws Exception 
	{
		 return session.selectOne(namespace + ".adminlistSearchCount", cri);
	}
	
	// 관리자 정보 보기
	@Override
	public AdminVO adminInfo(String a_id) throws Exception 
	{
	    return session.selectOne(namespace + ".adminInfo", a_id);
	}
	
	// 관리자 아이디 검색
	@Override
	public AdminVO adminsearchID(AdminVO vo) throws Exception
	{
		return session.selectOne(namespace + ".adminsearchID", vo);
	}
	
	// 관리자의 비밀번호를 임시비밀번호로 업데이트
	@Override
	public void adminsearchPW(AdminVO vo) throws Exception
	{
		System.out.println("dao : " + vo.toString());
		session.update(namespace + ".adminsearchPW", vo);
	}
	// 관리자의 원래 비밀번호 검색
	@Override
	public String searchPW(AdminVO vo) throws Exception
	{
		String result = session.selectOne(namespace + ".searchPW", vo);
		System.out.println("dao : " + result);
		return result;
	}
	
	// 관리자 마이페이지 정보수정
	@Override
	public void adminModify(AdminVO vo) throws Exception 
	{
		session.update(namespace + ".adminModify", vo);
	}
	
	// 최고관리자가 관리자 관리등급 정보수정
	@Override
	public void alevelModify(AdminVO vo) throws Exception 
	{
		System.out.println(vo.getA_id());
		System.out.println(vo.getA_level());
		session.update(namespace + ".alevelModify", vo);
	}
	
	
	
	
	
	/////////////////////////////     여기까지 순수 관리자 기능        ///////////////////////////////////////////
	
	
	/////////////////////////////     여기부터 관리자의 유저관리 기능          //////////////////////////////////////	
	
	
	
	// 관리자의 유저 목록 기능
	@Override 
	public List<UserVO> auserList() throws Exception 
	{
		return session.selectList(namespace + ".auserList");
	}
	
	// 관리자의 유저 목록 검색 기능
	@Override
	public List<UserVO> auserlistSearch(SearchCriteria cri) throws Exception 
	{
	    return session.selectList(namespace + ".auserlistSearch", cri);
	}
	
	// 관리자의 유저 목록 검색 카운트 기능
	@Override
	public int auserlistSearchCount(SearchCriteria cri) throws Exception 
	{
		 return session.selectOne(namespace + ".auserlistSearchCount", cri);
	}
	
	// 관리자의 회원삭제
	@Override
	public void auserWithdraw(String u_id) throws Exception 
	{
		session.delete(namespace + ".auserWithdraw", u_id);
	}
	
	// 관리자 회원정보보기
	@Override
	public UserVO auserInfo(UserVO vo) throws Exception
	{
		return session.selectOne(namespace + ".auserInfo", vo);
	} 

	// 관리자 유저 정보수정
	@Override
	public void auserModify(UserVO vo) throws Exception 
	{
		System.out.println("dao : " + vo.getU_point());
		System.out.println("dao : " + vo.getG_code());
		session.update(namespace + ".auserModify", vo);
	}
}
