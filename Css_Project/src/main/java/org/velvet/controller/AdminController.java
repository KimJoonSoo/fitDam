package org.velvet.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.velvet.domain.AdminVO;
import org.velvet.domain.PageMaker;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.UserVO;
import org.velvet.option.MailHandler;
import org.velvet.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController 
{
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 의존관계(DI)를 자동으로 연결해주는 기능을 가진 어노테이션
	// @Inject, @Autowired, @Resource
	// @Inject는 자바에서 지원	@Autowired는 스프링 전용		@Resource는 자바에서 지원 (이름으로 연결)
	
	@Inject
	private AdminService service;
	
	@Inject
	private JavaMailSender mailSender;	
	
	// 단순하게 jsp창을 띄우고 싶을때는 GET방식을 사용해서 보여준다
	
	// 관리자 홈
	@RequestMapping(value = "/adminHome", method = RequestMethod.GET)
	public void adminHome() throws Exception
	{}
	
	// 관리자 가입 (GET)
	@RequestMapping(value = "/adminRegister", method = RequestMethod.GET)
	public void registGET() throws Exception 
	{
		logger.info("adminRegister get");
	}
	  
	// 관리자 가입 (POST)
	@RequestMapping(value = "/adminRegister", method = RequestMethod.POST)
	public String registPOST(AdminVO admin) throws Exception
	{
		logger.info("adminRegister post");
		logger.info(admin.toString());
	    service.adminRegister(admin);
	    
	    // 완전히 새로운 작업을 이어가고 싶을 때는 redirect를 사용한다.
		return "redirect:/admin/adminLogin/";
	}
	
	// 관리자 로그인 (GET)
	@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
	public void adminLoginGET() throws Exception 
	{
		logger.info("adminLogin get");
	}
	
	
	// 관리자 로그인 (POST)
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public String adminLogin(AdminVO admin, HttpServletRequest request, RedirectAttributes rttr) throws Exception
	{
		//RedirectAttributes : redirect post 구현이 가능하게 하는 객체
		//HttpServletRequest : 클라이언트의 요청과 관련된 정보와 동작을 가진 객체 (정보, 쿠키, 헤더, get, post)
		//HttpServletResponse : 응답할 클라이언트에 대한 정보와 동작을 가진 객체 (content type 설정, redirect방식으로 수행 넘기기)
		
		// 세션정보를 얻어와야 할 필요가 있다면 HttpSession을 사용한다
		HttpSession session = request.getSession();
		
		AdminVO vo = service.adminLogin(admin);
		String result = "";
		
		String uriquery = "";
		
		if (vo != null) // 로그인이 되어있을 경우
		{
			session.setAttribute("adminsession", vo);
			
			if(session.getAttribute("dest") != null)
			{
				uriquery = (String)session.getAttribute("dest");
				result = "redirect:" + uriquery;
			}
			else
			{
				result = "redirect:/admin/adminHome";
			}
			
			System.out.println(result);
		} 
		else	// 로그인이 되어있지 않는 경우
		{
			result = "redirect:/admin/adminLogin";
			rttr.addFlashAttribute("info", "noExists");
		}
		
		// if와 else구문에 각 상황에 맞는 result변수를 입력하고 return값으로 result를 출력해준다
		return result;
	}
	
	
	// 관리자 로그인 체크
	@RequestMapping("/adminloginCheck")
	public ModelAndView adminloginCheck(@ModelAttribute AdminVO vo, HttpSession session) throws Exception
	{
		// ModelAndView : 컨트롤러의 처리결과를 보여줄 뷰와 뷰에 전달할 값을 저장하는 용도
		
		boolean result = service.adminloginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) 
		{ 	// 컨트롤러의 처리결과를 보여줄 뷰 ↓↓↓↓↓↓↓↓↓↓
			mav.setViewName("/admin/adminHome");
		} 
		else 
		{	
			mav.setViewName("/admin/adminLogin");
		}
		return mav;
	}
		
	
	// 관리자 아이디 중복 확인
	@ResponseBody
	@RequestMapping(value = "/adminidCheck", method = RequestMethod.POST)
	public String adminidCheckPOST(String a_id) throws Exception 
	{
		String result = "false";
		
		logger.info("adminidCheck : " + a_id);
		
		String idcheck = service.adminidCheck(a_id);
		
		if(idcheck==null || idcheck.equals(null)) 
		{
			result = "true";
		}
		
		return result;
	}
	

	// 관리자 로그아웃
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session) throws Exception
	{
		String result = "";
		service.adminLogout(session);
		result = "redirect:/admin/adminHome";
		return result;
	}	
	
	
	// 관리자 마이페이지 (GET)
	@RequestMapping(value = "/adminMypage", method = RequestMethod.GET)
	public void adminMypage(HttpServletRequest request, Model model) throws Exception 
	{
		// HttpServletRequest : 객체의 정보들을 저장하고 있는 데이터를 불러오고 싶을 때 사용
		// 여기서는 adminMypage의 정보들을 가져와야 하기 때문에 사용
		logger.info("adminMypage get");
	    AdminVO vo = service.adminMypage(request);
	    model.addAttribute(vo);
	}
	
	
	// 관리자 목록 기능 (GET)
	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	public void adminList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception 
	{
		logger.info(cri.toString());

	    model.addAttribute("adminList", service.adminlistSearch(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.adminlistSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	}
	
	
	// 관리자 정보보기 (GET)
	@RequestMapping(value = "/adminInfo", method = RequestMethod.GET)
	public void adminInfo(@RequestParam("a_id") String a_id, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception 
	{
		// @RequestParam : HTTP 요청 파라미터를 메소드 파라미터에 넣어 주는 애노테이션이다. 
		//				      가져올 오쳥 파라미터의 이름을 @RequestParam 애노테이션의 기본 값으로 지정해주면 된다. 
		//				      요청 파라미터의 값은 메소드 파라미터의 타입에 따라 적절하게 변환된다.
		logger.info("adminInfo get");
	    model.addAttribute(service.adminInfo(a_id));
	}
	
	
	// 관리자 아이디 잊었을때
	@RequestMapping("/forgotID")
	public void forgotID() throws Exception
	{}
	// 관리자 아이디 찾기 (POST)
	@RequestMapping(value = "/forgotID", method = RequestMethod.POST)
	public String adminsearchIDPOST(HttpServletRequest request, RedirectAttributes rttr) throws Exception
	{
		String a_name = request.getParameter("a_name");
		String a_phonenum = request.getParameter("a_phonenum");
		
		System.out.println(a_name);
		System.out.println(a_phonenum);
		
		AdminVO vo = new AdminVO();
		
		vo.setA_name(a_name);
		vo.setA_phonenum(a_phonenum);
		
		AdminVO search = service.adminsearchID(vo);
		
		if (search != null) 
		{
			logger.info("성공" + search.getA_id());			
			rttr.addFlashAttribute("msg", "suc");
			rttr.addFlashAttribute("sid", search.getA_id());
			return "redirect:/admin/forgotID";
		} 
		else 
		{
			logger.info("실패");
			rttr.addFlashAttribute("msg", "fai");
			return "redirect:/admin/forgotID";
		}
	}

	
	// 관리자 패스워드 잊었을때
	@RequestMapping("/forgotPW")
	public void forgotPW() throws Exception
	{}
	
	// 관리자 비밀번호 찾기 (POST)
	@RequestMapping(value = "/forgotPW", method = RequestMethod.POST)
	public String adminsearchPWPOST(HttpServletRequest request, RedirectAttributes rttr) throws Exception 
	{
		String a_id = request.getParameter("a_id");
		String a_name = request.getParameter("a_name");
		String a_phonenum = request.getParameter("a_phonenum");
		String a_email = request.getParameter("a_email");
		
		System.out.println(a_id);
		System.out.println(a_name);
		System.out.println(a_phonenum);
		System.out.println(a_email);

		AdminVO admin = new AdminVO();
		
		logger.info(admin.toString());
		
		admin.setA_id(a_id);	// 아이디를 불러온다.
		admin.setA_name(a_name);
		admin.setA_phonenum(a_phonenum);
		admin.setA_email(a_email);
		
		// 비밀번호 6자리 난수 생성하기
		String ran = "";
		StringBuffer sb = new StringBuffer();
		
		for( int i = 0; i<6; i++) 
		{
		    sb.append((char)((Math.random() * 10) + 48)); //아스키번호 48(1) 부터 10글자 중에서 택일
		}
		
		ran = sb.toString();
		
		// 임시 비밀번호에 생성한 난수값을 넣어준다
		String temp_pw = "fitdam" + ran + "pw";	// 현재 비밀번호를 fitdam + 난수6자리 + pw로 수정
		
		admin.setA_password(temp_pw);
		
		String result = service.adminsearchPW(admin);	// 매퍼에서 값 변환 실행

		// 검색한 비밀번호의 값과 변환된 비밀번호의 값이 같을경우 (= 정보들이 올바르게 입력된 경우) 메일을 전송
		if(result.equals("send"))
		{
			MailHandler sendMail = new MailHandler(mailSender);	// 바뀐 비밀번호를 메일로 전송
			
			sendMail.setSubject("[fitDam 시스템 메시지 ]: " + admin.getA_name() + " 관리자님의 임시 비밀번호가 발급되었습니다.");
			
			sendMail.setText(new StringBuffer().append("<table width=\"470px\" align=\"center\" style=\"border: 2px solid black; border-radius: 8px;\">")
					.append("<tr>\r\n" + "<th style=\"background-color:#FFA500; color: white;\" height=\"50px\" colspan=\"2\">fitDam 임시 비밀번호 발급</th>\r\n" + "</tr>")
					.append("<tr>\r\n" + "<td align=\"center\" height=\"50px\">" + "<b>" + admin.getA_name() + " 관리자 님의 임시 비밀번호는 : [" + temp_pw + "] 입니다</b><br/>")
					.append("<a style=\"text-decoration:none; color : blue; cursor: pointer;\" href='http://localhost:8088/admin/adminLogin'>fitDam에서 로그인 하기</a>")
					.append("</td>\r\n" + "</tr>\r\n" + "</table>").toString());

			sendMail.setFrom("fitdam0627@gmail.com", "fitDam");
			sendMail.setTo(admin.getA_email());
			sendMail.send();
			
			rttr.addFlashAttribute("msg", "sendmail");
			return "redirect:/admin/forgotPW/";
		}
		else
		{
			rttr.addFlashAttribute("msg", "nosend");
			return "redirect:/admin/forgotPW";
		}	
	}
	
	// 관리자 마이페이지 정보수정(GET)
	@RequestMapping(value = "/adminModify", method = RequestMethod.GET)
	public void adminModifyGET(String a_id, Model model, HttpServletRequest request) throws Exception 
	{
		model.addAttribute(service.adminMypage(request));
	}

	// 관리자 마이페이지 정보수정 (POST)
	@RequestMapping(value = "/adminModify", method = RequestMethod.POST)
	public String adminModifyPOST(AdminVO vo, RedirectAttributes rttr, HttpServletRequest request) throws Exception 
	{
		logger.info(vo.toString());
	    service.adminModify(vo, request);
		return "redirect:/admin/adminMypage";
	}
	
	// 최고관리자가 관리자 관리등급 정보수정 (GET)
	@RequestMapping(value = "/alevelModify", method = RequestMethod.GET)
	public void alevelModifyGET(String a_id, Model model) throws Exception 
	{
		model.addAttribute(service.adminInfo(a_id));
	}

	// 최고관리자가 관리자 관리등급 정보수정 (POST)
	@RequestMapping(value = "/alevelModify", method = RequestMethod.POST)
	public String alevelModifyPOST(AdminVO vo, HttpServletRequest request) throws Exception 
	{
		logger.info(vo.toString());
	    service.alevelModify(vo, request);
		return "redirect:/admin/adminList";
	}
	
	
	
	
	
	/////////////////////////////     여기까지 순수 관리자 기능        ///////////////////////////////////////////
	
	
	/////////////////////////////     여기부터 관리자의 유저관리 기능          //////////////////////////////////////
	
	
	// 관리자의 유저 목록 기능 (GET)
	@RequestMapping(value = "/auserList", method = RequestMethod.GET)
	public void auserList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception 
	{
		//@ModelAttribute : 모델 맵에 담겨서 뷰에 전달되는 모델 오브젝트의 한가지
		// 					컨트롤러가 전달 받은 오브젝트 형태의 정보
		
		logger.info(cri.toString());

	    model.addAttribute("auserList", service.auserlistSearch(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.auserlistSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	}
	
	// 관리자의 유저 삭제 기능 (GET)
	@RequestMapping(value = "/auserWithdraw", method = RequestMethod.GET)
	public String auserWithdraw(@RequestParam("u_id") String u_id, @ModelAttribute("cri") SearchCriteria cri) throws Exception 
	{	
		//@RequestParam : 파라미터의 값을 요청하고자 할 때 사용한다.
		
		logger.info(u_id);
	    service.auserWithdraw(u_id);
	    
	    logger.info(u_id + "계정 삭제 완료");
	    
	    return "redirect:/admin/auserList?page=" + cri.getPage() 
	    		+ "&perPageNum=" + cri.getPerPageNum()
				+ "&searchType=" + cri.getSearchType()
				+ "&keyword=" + cri.getKeyword();	
	}
	
	// 관리자 회원정보보기 (GET)
	@RequestMapping(value = "/auserInfo", method = RequestMethod.GET)
	public void auserInfo(@ModelAttribute("cri") SearchCriteria cri , UserVO vo, Model model) throws Exception 
	{
		logger.info("userMypage get");
	    UserVO vo2 = service.auserInfo(vo);
	    model.addAttribute(vo2);
	}
	
	// 관리자 유저 정보수정(GET)
	@RequestMapping(value = "/auserModify", method = RequestMethod.GET)
	public void auserModifyGET(@ModelAttribute("cri") SearchCriteria cri , UserVO vo, Model model, HttpServletRequest request) throws Exception 
	{
		model.addAttribute(service.auserInfo(vo));
	}

	// 관리자 유저 정보수정 (POST)
	@RequestMapping(value = "/auserModify", method = RequestMethod.POST)
	public String auserModifyPOST(UserVO vo, @ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request) throws Exception 
	{
		logger.info(vo.toString());
	    service.auserModify(vo);
	    System.out.println("controller : " + vo.toString());
	    System.out.println("controller : " + cri.toString());
	    
		return "redirect:/admin/auserInfo?page=" + cri.getPage() 
		+ "&perPageNum=" + cri.getPerPageNum()
		+ "&searchType=" + cri.getSearchType()
		+ "&keyword=" + cri.getKeyword()
		+ "&u_id=" + vo.getU_id();
	}
}
