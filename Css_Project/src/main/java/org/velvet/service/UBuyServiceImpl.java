package org.velvet.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.velvet.dao.UBuyDAO;
import org.velvet.dao.UProductDAO;
import org.velvet.domain.AdminVO;
import org.velvet.domain.CartVO;
import org.velvet.domain.CategoryVO;
import org.velvet.domain.OrderVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.USearchCriteria;
import org.velvet.domain.UserVO;

@Service
public class UBuyServiceImpl implements UBuyService
{
	@Inject
	UBuyDAO dao;

	// 장바구니에서 주문 목록
	@Override
	public List<CartVO> orderList(String u_id, String c_no) throws Exception
	{
		// 임의의 리스트배열을 만들어준다
		List<CartVO> list = new ArrayList<CartVO>();
		
		// 상품을 하나만 골랐을 때 주문하기
		if(c_no.indexOf(",") == -1)
		{	
			list.add(dao.orderList(u_id, Integer.parseInt(c_no)));
		}
		// check된 상품이 여러개 있을 때 ,로 구분된만큼 구매
		else 
		{
			String[] check = c_no.split(",");
			for (int i = 0; i < check.length; i++) 
			{
				list.add(dao.orderList(u_id, Integer.parseInt(check[i])));
			}
		}
		return list;
	}
	
	// 상품페이지에서 주문목록
	@Override
	public List<ProductVO> orderListP(String u_id, String p_no) throws Exception
	{
		// 임의의 리스트배열을 만들어준다
		List<ProductVO> list = new ArrayList<ProductVO>();
		
		// 상품을 하나만 골랐을 때 주문하기
		if(p_no.indexOf(",") == -1)
		{	
			list.add(dao.orderListP(u_id, p_no));
		}
		// check된 상품이 여러개 있을 때 ,로 구분된만큼 구매
		else 
		{
			String[] check = p_no.split(",");
			for (int i = 0; i < check.length; i++) 
			{
				list.add(dao.orderListP(u_id, check[i]));
			}
		}
		return list;
	}
	
	// 상품페이지에서 주문시 옵션값 등록 기능
	@Override
	public void orderAdd(CartVO vo) throws Exception
	{
		String[] color = vo.getC_color().split(",");	// 시작부터 에러
		String[] size = vo.getC_size().split(",");
		String[] count = vo.getC_count_string().split(",");
		
		for (int i = 0; i < count.length; i++) 
		{
			vo.setC_color(color[i]);
			vo.setC_size(size[i]);
			vo.setC_count(Integer.parseInt(count[i]));
			dao.orderAdd(vo);
		}
	}
	

	// 주문 하기
	@Override
	public void orderOrder(OrderVO vo) throws Exception 
	{
		dao.orderOrder(vo);
	}
	// 주문 추가
	
	// 주문 취소
	
	// 주문 목록
	
	// 주문 상세
}
