package org.velvet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.velvet.controller.UserController;
import org.velvet.domain.UserVO;
import org.velvet.service.UserService;

import org.velvet.option.MailHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user/*")
public class UserController 
{
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@Inject
	private JavaMailSender mailSender;
	
	
	
	// 유저 가입 (GET)!
	@RequestMapping(value = "/userRegister", method = RequestMethod.GET)
	public void registGET() throws Exception 
	{
		logger.info("userRegister get");
	}
	  
	// 유저 가입 (POST)!
	@RequestMapping(value = "/userRegister", method = RequestMethod.POST)
	public String registPOST(UserVO user, RedirectAttributes rttr) throws Exception
	{
		logger.info("userRegister post");
		logger.info(user.toString());
	    service.userRegister(user);

	    //메일발송기능
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[fitDam 시스템 메시지 ]: " + user.getU_name() + " 회원님의 인증 메일입니다.");
		sendMail.setText(new StringBuffer().append("<table width=\"470px\" align=\"center\" style=\"border: 2px solid black; border-radius: 8px;\">")
				.append("<tr>\r\n" + "<th style=\"background-color:#C0392B; color: white;\" height=\"50px\" colspan=\"2\">fitDam 회원 인증</th>\r\n" + 	"</tr>")
				.append("<tr>\r\n" + "<td align=\"center\" height=\"50px\">" + "<a style=\"text-decoration:none; color : blue; cursor: pointer;\" href='http://localhost:8088/user/userVerify?u_id=" + user.getU_id())
				.append("' target='_blank'>이메일 인증은 여기를 클릭해주세요</a>"+ "</td>\r\n" + "</tr>\r\n" + 	"</table>").toString());
		sendMail.setFrom("fitdam0627@gmail.com", "fitDam");
		sendMail.setTo(user.getU_id());
		sendMail.send();
		
		rttr.addFlashAttribute("info", "regist");
		return "option/mailSend";	// jsp 호출, 가입완료시 인증메일을 발송했다는 메시지 띄우는 기능
	}
	
	// 유저 이메일 인증 기능 (GET)!
	@RequestMapping(value = "/userVerify", method = RequestMethod.GET)
	public String userVerify(UserVO user, @RequestParam String u_id) throws Exception
	{
		System.out.println("이메일 인증기능 처리");
		System.out.println(u_id);

		user.setU_id(u_id);
		service.userVerify(user);
		return "option/verifyComplete";	// 인증완료시 인증완료되었습니다 라는 메시지 띄우는 기능
	}
	
	// 유저 로그인 (GET)!
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET)
	public void userLoginGET(UserVO user, RedirectAttributes rttr) throws Exception 
	{
		logger.info("userLogin get");
	}
	
	
	// 유저 로그인 (POST)!
	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(UserVO user, HttpServletRequest request, RedirectAttributes rttr) throws Exception
	{
		HttpSession session = request.getSession();
		
		UserVO vo = service.userLogin(user);
		String result = "";
		
		String uriquery = "";
		
		if (vo != null) 
		{
			if (vo.getU_verify().equals("Y")) // '' : char, "" : String
			{
				session.setAttribute("usersession", vo);
				
				if(session.getAttribute("dest") != null)
				{
					uriquery = (String)session.getAttribute("dest");
					result = "redirect:" + uriquery;
				}
				else
				{
					result = "redirect:/";
				}
				
				System.out.println(result);
			} 
			else
			{
				result = "redirect:/user/userLogin/";
				rttr.addFlashAttribute("info", "noVerify");
			}
		} 
		else
		{
			result = "redirect:/user/userLogin/";
			//mav.setViewName("/user/userLogin");
			rttr.addFlashAttribute("info", "noExists");
			//mav.addObject("info", "noExists");	
		}
		return result;
	}
	
	// 약관체크!
	@RequestMapping("/yakgwan")
	public void yakgwan() throws Exception
	{}
	
	// 유저 로그인 체크!
	@RequestMapping("/userloginCheck")
	public ModelAndView userloginCheck(@ModelAttribute UserVO vo, HttpSession session) throws Exception
	{
		boolean result = service.userloginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) 
		{ 	// 로그인 성공
			// main.jsp로 이동
			mav.setViewName("main");
		} 
		else 
		{	// 로그인 실패
			// login.jsp로 이동
			mav.setViewName("/user/userLogin");
		}
		return mav;
	}
		
	
	// 유저 아이디 중복 확인!
	@ResponseBody
	@RequestMapping(value = "/useridCheck", method = RequestMethod.POST)
	public String useridCheckPOST(String u_id) throws Exception 
	{
		String result = "false";
		
		logger.info("useridCheck : " + u_id);
		
		String idcheck = service.useridCheck(u_id);
		
		if(idcheck==null || idcheck.equals(null)) 
		{
			result = "true";
		}
		//logger.info("useridCheck : " + idcheck);
		return result;
	}
	

	// 유저 로그아웃!
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) throws Exception
	{
		String result = "";
		service.userLogout(session);
		result = "redirect:/";
		return result;
	}	
	
	
	// 마이페이지 (GET)!
	@RequestMapping(value = "/userMypage", method = RequestMethod.GET)
	public void userMypage(HttpServletRequest request, Model model) throws Exception 
	{
		logger.info("userMypage get");
		/*HttpSession session = request.getSession();*/
	    UserVO vo = service.userMypage(request);
	    model.addAttribute(vo);
	}
	
	// 유저 정보수정(GET)!
	@RequestMapping(value = "/userModify", method = RequestMethod.GET)
	public void userModifyGET(String u_id, Model model, HttpServletRequest request) throws Exception 
	{
		model.addAttribute(service.userMypage(request));
	}

	// 유저 정보수정 (POST)!
	@RequestMapping(value = "/userModify", method = RequestMethod.POST)
	public String userModifyPOST(UserVO vo, RedirectAttributes rttr, HttpServletRequest request) throws Exception 
	{
		logger.info(vo.toString());
	    service.userModify(vo, request);
		return "redirect:/user/userMypage";
	}	

	// 유저 탈퇴 (GET)!
	@RequestMapping(value = "/userWithdraw", method = RequestMethod.GET)
	public String userWithdraw(RedirectAttributes rttr, HttpServletRequest request) throws Exception 
	{	
	    service.userWithdraw(request);
	    return "redirect:/";
	}
	
	// 유저 탈퇴 (POST)!
	@ResponseBody
	@RequestMapping(value = "/userwithdrawCheck", method = RequestMethod.POST)
	public int userwithdrawCheck(@RequestParam("u_password") String u_password, HttpSession session) throws Exception 
	{
		boolean isOk = false;
		
		isOk = service.userwithdrawCheck(u_password, session);
		
		if(isOk == true)
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}	
	
	// 아이디 잊었을때!
	@RequestMapping("/forgotID")
	public void forgotID() throws Exception
	{}
	
	// 유저 아이디 찾기 (POST)!
	@RequestMapping(value = "/forgotID", method = RequestMethod.POST)
	public String usersearchIDPOST(HttpServletRequest request, RedirectAttributes rttr) throws Exception
	{
		String u_name = request.getParameter("u_name");
		String u_phonenum = request.getParameter("u_phonenum");
		
		System.out.println(u_name);
		System.out.println(u_phonenum);
		
		UserVO vo = new UserVO();
		
		vo.setU_name(u_name);
		vo.setU_phonenum(u_phonenum);
		
		UserVO search = service.usersearchID(vo);
		
		if (search != null) 
		{
			logger.info("성공" + search.getU_id());			
			rttr.addFlashAttribute("msg", "suc");
			rttr.addFlashAttribute("sid", search.getU_id());
			return "redirect:/user/forgotID";
		} 
		else 
		{
			logger.info("실패");
			rttr.addFlashAttribute("msg", "fai");
			return "redirect:/user/forgotID";
		}
	}

	// 패스워드 잊었을때!
	@RequestMapping("/forgotPW")
	public void forgotPW() throws Exception
	{}
	
	// 유저 비밀번호 찾기 (POST)!
	@RequestMapping(value = "/forgotPW", method = RequestMethod.POST)
	public String usersearchPWPOST(HttpServletRequest request, RedirectAttributes rttr) throws Exception 
	{
		String u_id = request.getParameter("u_id");
		String u_name = request.getParameter("u_name");
		String u_phonenum = request.getParameter("u_phonenum");
		
		System.out.println(u_id);
		System.out.println(u_name);
		System.out.println(u_phonenum);

		UserVO user = new UserVO();
		
		logger.info(user.toString());
		
		user.setU_id(u_id);	// 아이디를 불러온다.
		user.setU_name(u_name);
		user.setU_phonenum(u_phonenum);
		
		// 비밀번호 6자리 난수 생성하기
		String ran = "";
		StringBuffer sb = new StringBuffer();
		
		for( int i = 0; i<6; i++) 
		{
		    sb.append((char)((Math.random() * 10) + 48)); //아스키번호 48(1) 부터 10글자 중에서 택일
		}
		
		ran = sb.toString();
		
		// 임시 비밀번호에 생성한 난수값을 넣어준다
		String temp_pw = "fitdam" + ran + "pw";	// 현재 비밀번호를 fitdam + u_id로 수정
		
		user.setU_password(temp_pw);
		
		service.usersearchPW(user);	// 매퍼에서 값 변환 실행

		// 검색한 비밀번호의 값과 변환된 비밀번호의 값이 같을경우 (= 정보들이 올바르게 입력된 경우) 메일을 전송
		if(service.usersearchPW(user).equals("send"))
		{
			MailHandler sendMail = new MailHandler(mailSender);	// 바뀐 비밀번호를 메일로 전송
			
			sendMail.setSubject("[fitDam 시스템 메시지 ]: " + user.getU_name() + " 회원님의 임시 비밀번호가 발급되었습니다.");
			
			sendMail.setText(new StringBuffer().append("<table width=\"470px\" align=\"center\" style=\"border: 2px solid black; border-radius: 8px;\">")
					.append("<tr>\r\n" + "<th style=\"background-color:#C0392B; color: white;\" height=\"50px\" colspan=\"2\">fitDam 임시 비밀번호 발급</th>\r\n" + "</tr>")
					.append("<tr>\r\n" + "<td align=\"center\" height=\"50px\">" + "<b>" + user.getU_name() + " 님의 임시 비밀번호는 : [" + temp_pw + "] 입니다</b><br/>")
					.append("<a style=\"text-decoration:none; color : blue; cursor: pointer;\" href='http://localhost:8088/user/userLogin'>fitDam에서 로그인 하기</a>")
					.append("</td>\r\n" + "</tr>\r\n" + "</table>").toString());

			sendMail.setFrom("fitdam0627@gmail.com", "fitDam");
			sendMail.setTo(user.getU_id());
			sendMail.send();
			
			rttr.addFlashAttribute("msg", "sendmail");
			return "redirect:/user/forgotPW/";
		}
		else
		{
			rttr.addFlashAttribute("msg", "nosend");
			return "redirect:/user/forgotPW";
		}
		
	}
}
