package org.velvet.service;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.velvet.domain.UserVO;
import org.springframework.stereotype.Service;
import org.velvet.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService
{
	@Inject
	UserDAO dao;
	
	// 유저 가입!
	@Override
	public void userRegister(UserVO vo) throws Exception 
	{
		dao.userRegister(vo);
	}
	
	// 유저 이메일 인증!
	@Override
	public void userVerify(UserVO vo) throws Exception
	{
		dao.userVerify(vo);
	}
	
	// 유저 로그인!
	@Override
	public UserVO userLogin(UserVO vo) throws Exception 
	{
		return dao.userLogin(vo);		
	}
	
	// 유저 로그인체크!
	@Override
	public boolean userloginCheck(UserVO vo, HttpSession session) throws Exception
	{
		boolean result = dao.userloginCheck(vo);
		if (result) 
		{ 	// true일 경우 세션에 등록
			UserVO vo2 = dao.userMypage(vo.getU_id());
			// 세션 변수 등록
			session.setAttribute("u_id", vo2.getU_id());
			session.setAttribute("u_name", vo2.getU_name());
		} 
		return result;
	}
	
	// 유저 아이디 중복 확인!
	@Override
	public String useridCheck (String u_id) throws Exception
	{	
		return dao.useridCheck(u_id);
	}

	// 유저 로그아웃!
	@Override
	public void userLogout(HttpSession session) throws Exception
	{
		// 세션 변수 개별 삭제
		// session.removeAttribute("u_id");
		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
	
	// 마이페이지!
	@Override
	public UserVO userMypage(HttpServletRequest request) throws Exception
	{
		UserVO vo = (UserVO)request.getSession().getAttribute("usersession");
		return dao.userMypage(vo.getU_id());
	}

	// 유저 정보수정!
	@Override
	public void userModify(UserVO vo, HttpServletRequest request) throws Exception 
	{
		HttpSession usersession = request.getSession();
		if(usersession.getAttribute("usersession") != null)
		{
			/*UserVO vo = ((UserVO) usersession.getAttribute("usersession"));*/
			dao.userModify(vo);
		}
		
	}
	
	// 유저 탈퇴!
	@Override
	public void userWithdraw(HttpServletRequest request) throws Exception 
	{	// 리퀘스트에서 세션을 참조하고 싶을 때는 이 과정이 추가,  Http 들어가는 것들 중에 request가 가장 넓은 개념
		HttpSession usersession = request.getSession();
		
		if(usersession.getAttribute("usersession") != null)
		{
			String u_id = ((UserVO) usersession.getAttribute("usersession")).getU_id();
			dao.userWithdraw(u_id);
			usersession.invalidate();
		}
	}
	@Override
	public boolean userwithdrawCheck(String u_password, HttpSession session) throws Exception
	{
		boolean isOk = false;	// 값을 t or f로 판별하기 위한 설정
		String u_id = "";
		
		if(session.getAttribute("usersession") != null)
		{
			// u_id에 UserVO의 로그인 한 사용자의 세션값 u_id를 넣어준다.
			u_id = ((UserVO) session.getAttribute("usersession")).getU_id();
		}
		
		// 데이터의 저장은 key, value 형태. 그리고 해싱(Hashing) 검색을 사용하기 때문에 대용량 데이터 관리에도 좋다
		// id, password 값이 모두 String이기 때문에 키, 값 모두 String으로 지정
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_password", u_password);
		
		if(dao.userwithdrawCheck(map) != null)
		{
			dao.userWithdraw(u_id);
			isOk = true;
			session.invalidate();
		}
		
		return isOk;	
	}
	
	// 유저 아이디 검색
	@Override
	public UserVO usersearchID(UserVO vo) throws Exception
	{
		return dao.usersearchID(vo);
	}
	
	// 유저 비밀번호 검색
	@Override
	public String usersearchPW(UserVO vo) throws Exception
	{
		String result = "";
		
		dao.usersearchPW(vo);
		String dbpasswd = dao.searchPW(vo);
		
		// 검색한 비밀번호의 값과 변환된 비밀번호의 값이 같을경우 (= 정보들이 올바르게 입력된 경우) 메일을 전송
		if(dbpasswd.equals(vo.getU_password())) 
		{
			result = "send";
		}
		else
		{
			result = "fail";
		}
		
		return result;
	}
}
