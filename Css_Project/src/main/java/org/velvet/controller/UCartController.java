package org.velvet.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.velvet.controller.UCartController;
import org.velvet.domain.CartVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.UserVO;
import org.velvet.service.UCartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user/*")
public class UCartController 
{
	// 로그를 쓰기 위한 클래스 설정
	private static final Logger logger = LoggerFactory.getLogger(UCartController.class);
	
	// DI 의존성주입 중 Inject 사용
	@Inject
	private UCartService service;
	
	// 장바구니 등록 기능
	@RequestMapping(value = "/cartAdd", method = RequestMethod.GET)
	public void cartAddGET(Model model) throws Exception
	{

	}
	
	// 장바구니 등록 기능 (POST)
	@RequestMapping(value = "/cartAdd", method = RequestMethod.POST)
	public String cartAddPOST(CartVO vo, HttpSession session, RedirectAttributes rttr, SearchCriteria cri) throws Exception
	{
		logger.info(vo.toString());

		// 최초 초기 변수들을 공백으로 설정, 전역변수로 쓰기 위해 최상위 구역에 위치를 잡아준다
		String u_id = "";
		String p_no = "";
		String c_color = "";
		String c_size = "";
		
		
		
		// 로그인이 됐을 경우, u_id에 세션 넣어주고, p_no에 카트 정보 담아두기
		if(session.getAttribute("usersession") != null)
		{
			u_id = ((UserVO)session.getAttribute("usersession")).getU_id();
			p_no = vo.getP_no();
			c_color = vo.getC_color();
			c_size = vo.getC_size();
			
			logger.info("아이디 : " + u_id);
			logger.info("상품명 : " + p_no);
			logger.info("색상 : " + c_color);
			logger.info("사이즈 : " + c_size);
		}
		
		
		String ce = service.cartExsist(p_no, u_id, c_color, c_size);   // 이거 막고 하니까 카트로 진행은 되는데.. 이쪽이 문제가 있는거 같은데...
			
		if(ce != null)
		{
			rttr.addFlashAttribute("cartinfo", "already");
		    rttr.addAttribute("page", cri.getPage());
		    rttr.addAttribute("perPageNum", cri.getPerPageNum());
		    rttr.addAttribute("searchType", cri.getSearchType());
		    rttr.addAttribute("keyword", cri.getKeyword());
		    rttr.addAttribute("p_no", p_no);
			logger.info("exsist!!");
			return "redirect:/user/uproductInfo";
		}
		else if(ce == null)
		{
			// VO : 데이터 커맨드 객체
			vo.setU_id(u_id);	// u_id 부분을 수동으로 값 입력

			// 인서트 구문
			logger.info(vo.toString());
			service.cartAdd(vo);
			logger.info("insert!!!");			
		}

		
		return "redirect:/user/cartuList/";
	}
	
	// 장바구니 존재여부 체크 - 다중항목
	@ResponseBody
	@RequestMapping(value = "/productCheck", method = RequestMethod.POST)
	public int productCheck(@RequestParam("p_no") String p_no, @RequestParam("c_color") String c_color, @RequestParam("c_size") String c_size, HttpSession session) throws Exception 
	{
		logger.info("상품명 : " + p_no);
		logger.info("색상 : " + c_color);
		logger.info("사이즈 : " + c_size);
		boolean isOk = false;
		
		isOk = service.productCheck(p_no, c_color, c_size, session);
		
		// 상품이 존재하지 않는경우 (=장바구니 추가가능)
		if(isOk == true)
		{
			return 1;
		}
		// 상품이 존재하는경우 (=장바구니 추가불가)
		else
		{
			return 0;
		}
	}	
	
	// 유저별 장바구니 목록 기능  
	@RequestMapping(value = "/cartuList", method = RequestMethod.GET)
	public ModelAndView cartuList(HttpServletRequest request, ModelAndView mav) throws Exception 
	{
		HttpSession session = request.getSession();
		String u_id = "";
		
		// 세션변수 확인
		Map<String, Object> map = new HashMap<>();
		
		UserVO uv = (UserVO)session.getAttribute("usersession");
		if(uv != null) 
		{
			u_id = uv.getU_id();
		}
		else u_id = null;
		
		logger.info(u_id + "아이디입니다");
		
		if(u_id != null)	// 로그인 한 경우
		{
			// 목록 자체
			List<CartVO> list = service.cartuList(u_id);
			
			// 총액 구하는 기능
			int sum = 0;
			for (CartVO cv : list) 
			{
				sum += Integer.parseInt(cv.getP_price()) * cv.getC_count();
			}
			
			// map String Object 값들 설정
			logger.info(sum + "");
			map.put("list", list);				// 목록자체 map.list
			map.put("count", list.size());		// 목록배열갯수 map.count
			map.put("total", sum);				// 목록총합 map.total
			mav.setViewName("user/cartuList");
			mav.addObject("map", map);
			return mav;
		}
		else // 로그인 하지 않은 경우
		{
			return new ModelAndView("user/userLogin","",null);
		}
	}
	
	// 장바구니 삭제 기능 (POST)
	@RequestMapping(value = "/cartDel", method = RequestMethod.POST)
	public String cartDel(@RequestParam("c_no") String c_no, RedirectAttributes rttr) throws Exception 
	{	
		logger.info(c_no + "");
	    service.cartDel(c_no);

	    rttr.addFlashAttribute("cartdel", "deldeldel");
	    return "redirect:/user/cartuList";	
	}
	
	// 장바구니 수정기능
	@RequestMapping(value = "/cartUp", method = RequestMethod.GET)
	public String cartUp(CartVO vo, HttpServletRequest request) throws Exception 
	{	
		logger.info("controller : " + vo.toString());
	    service.cartUp(vo);
	    
	    return "redirect:/user/cartuList";	
	}
}
