package org.velvet.Interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import org.velvet.domain.UserVO;
import org.velvet.service.UserService;

public class UserInterceptor extends HandlerInterceptorAdapter 
{

  private static final Logger logger = LoggerFactory.getLogger(UserInterceptor.class);
  
  @Inject
  private UserService service;
  
  // 해당 컨트롤러가 동작 하기전에 여기서 먼저 로그인 되었는지 미리 체크 하기 위한 인터셉터
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception 
  { 
    try 
    {   // 고객 세션이 널이면 입력했던 경로를 saveDest에 저장을 하고 Redirect로 로그인창으로 보낸다.
    	if(request.getSession().getAttribute("usersession") == null )
    	{ 
    		saveDest(request);	// 기존에 입력한 주소값을 저장하는 클래스
    		response.sendRedirect("/user/userLogin"); // 인터셉터에 걸렸을 때 이동할 새 주소
    		return false; 
    	}
    } 
    catch (Exception e) 
    { 
    	e.printStackTrace(); 
    } 	// 세션이 널이 아니면 정상적으로 컨트롤러 호출 
    
    return true;
  }  
  
  // 사용자가 처음 요청한 URI 정보를 관리하는 메서드
  private void saveDest(HttpServletRequest req) 
  {

    String uri = req.getRequestURI();

    String query = req.getQueryString();	// URI 상에서 ?뒤에 붙어지는 부분들을 QueryString 이라고 부른다

    if (query == null || query.equals("null")) 
    {
      query = "";
    } else {
      query = "?" + query;
    }

    if (req.getMethod().equals("GET")) 
    {
      logger.info("dest: " + (uri + query));
      req.getSession().setAttribute("dest", uri + query);
    }
  }
}
