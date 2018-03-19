package org.velvet.dao;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.velvet.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO 
{
	@Inject // 의존성 주입 기능
	private SqlSession session;
	
	private static String namespace = "org.velvet.mapper.UserMapper";
	
	
	// 유저 가입!
	@Override
	public void userRegister(UserVO vo) throws Exception 
	{
		session.insert(namespace + ".userRegister", vo);		
	}
		
	// 유저 이메일 인증!
	@Override
	public void userVerify(UserVO vo) throws Exception
	{
		session.update(namespace + ".userVerify", vo);
	}
	
	// 유저 로그인 !
	@Override
	public UserVO userLogin(UserVO vo) throws Exception 
	{
		System.out.println(vo.toString());
		return session.selectOne(namespace + ".userLogin", vo);		
	}
	
	// 유저 로그인체크!
	@Override
	public boolean userloginCheck(UserVO vo) throws Exception
	{
		String name = session.selectOne(namespace + ".userloginCheck", vo);
		return (name == null) ? false : true;
	}
		
	// 유저 아이디 중복 확인!
	@Override
	public String useridCheck(String u_id) throws Exception
	{
		return session.selectOne(namespace + ".useridCheck", u_id);
	}

	// 유저 로그아웃!
	@Override
	public void userLogout(HttpSession session) throws Exception
	{} 
	
	// 마이페이지
	@Override
	public UserVO userMypage(String u_id) throws Exception
	{
		return session.selectOne(namespace + ".userMypage", u_id);
	} 

	// 유저 정보수정
	@Override
	public void userModify(UserVO vo) throws Exception 
	{
		session.update(namespace + ".userModify", vo);
	}

	// 유저 탈퇴
	@Override
	public void userWithdraw(String u_id) throws Exception 
	{
		session.delete(namespace + ".userWithdraw", u_id);
	}
	public String userwithdrawCheck(HashMap<String, String> map) throws Exception
	{
		return session.selectOne(namespace + ".userwithdrawCheck", map);
	}
		
	// 유저 아이디 검색
	@Override
	public UserVO usersearchID(UserVO vo) throws Exception
	{
		return session.selectOne(namespace + ".usersearchID", vo);
	}
	
	// 유저의 비밀번호를 임시비밀번호로 업데이트
	@Override
	public void usersearchPW(UserVO vo) throws Exception
	{
		session.update(namespace + ".usersearchPW", vo);
	}
	// 유저의 원래 비밀번호 검색
	@Override
	public String searchPW(UserVO vo) throws Exception
	{
		return session.selectOne(namespace + ".searchPW", vo);
	}
}
