package org.velvet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.velvet.controller.UBuyController;
import org.velvet.domain.CartVO;
import org.velvet.domain.OrderVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.UserVO;
import org.velvet.service.UBuyService;
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
public class UBuyController 
{
	// 로그를 쓰기 위한 클래스 설정
	private static final Logger logger = LoggerFactory.getLogger(UBuyController.class);
	
	// DI 의존성주입 중 Inject 사용
	@Inject
	private UBuyService service;


	// 장바구니에서 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void orderList(@RequestParam("c_no") String c_no, HttpServletRequest request, Model model) throws Exception
	{
		logger.info("orderList 진입"+c_no);
		// 주문자 정보 불러오는 부분
		HttpSession session = request.getSession();	// 세션 사용을 위한 설정
		
		UserVO uv = (UserVO)session.getAttribute("usersession");	// 세션 정보를 얻어 옴
		
		// 세션이 있는 경우 (로그인 된 경우)
		if(uv != null) 
		{
			logger.info(uv.toString());
			
			// UserVO에 있는 모든 세션 정보들을 userVO라는 이름으로 jsp 페이지에 전달
			model.addAttribute("userVO", uv);
			
			
			// 장바구니 테이블에서 내가 구매하고 싶은 데이터들을 cartVO라는 이름으로 가져오는 부분 (해당계정, 체크한 c_no)
			model.addAttribute("cartVO", service.orderList(uv.getU_id(),c_no));	
		}
	}
	
	
	
	
	
	// 장바구니에서 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.POST)
	public String orderListPOST(OrderVO vo) throws Exception
	{
		service.orderOrder(vo);
	    
	    // 완전히 새로운 작업을 이어가고 싶을 때는 redirect를 사용한다.
		return "redirect:/user/orderDetail/";
	}
	
	
	
	
	
	
	
	
	
	// 상품페이지에서 주문 목록
	@RequestMapping(value = "/orderListP", method = RequestMethod.POST)
	public void orderListP(CartVO vo, HttpSession session, Model model) throws Exception
	{
		logger.info("orderListP 진입 : ");
		// 주문자 정보 불러오는 부분
		
		UserVO uv = (UserVO)session.getAttribute("usersession");	// 세션 정보를 얻어 옴
		
		List<CartVO> cv = new ArrayList<CartVO>();
		
		String[] color = vo.getC_color().split(",");
		String[] size = vo.getC_size().split(",");
		String[] count = vo.getC_count_string().split(",");
		
		logger.info(vo.getC_color());
		logger.info(vo.getC_size());
		logger.info(vo.getC_count_string());
		
		for (int i = 0; i < count.length; i++) 
		{
			CartVO cart = new CartVO();
			
			cart.setC_color(color[i]);
			cart.setC_size(size[i]);
			cart.setC_count(Integer.parseInt(count[i]));
			
			cart.setP_photo(vo.getP_photo());
			cart.setP_name(vo.getP_name());
			cart.setP_price(vo.getP_price());
			
			// 컬렉션에 데이터 하나하나 추가 하기 위한 메서드
			// cv(=List)안에 cart(=CartVO)를 넣는 작업
			cv.add(cart);
		}	
		
		logger.info("" +count.length);
		
		// UserVO에 있는 모든 세션 정보들을 userVO라는 이름으로 jsp 페이지에 전달
		model.addAttribute("userVO", uv);		
		
		// 상품정보 테이블에서 내가 구매하고 싶은 데이터들을 cartVO라는 이름으로 가져오는 부분 (해당계정, 선택한 p_no)
		model.addAttribute("cartlist", cv);	
	}


}
