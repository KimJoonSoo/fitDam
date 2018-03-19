package org.velvet.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.velvet.domain.AdminVO;
import org.velvet.domain.CartVO;
import org.velvet.domain.CategoryVO;
import org.velvet.domain.OrderVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.USearchCriteria;
import org.velvet.domain.UserVO;

public interface UBuyService 
{
	// 장바구니에서 주문 목록
	public List<CartVO> orderList(String u_id, String c_no) throws Exception;
	
	// 상품페이지에서 주문목록
	public List<ProductVO> orderListP(String u_id, String p_no) throws Exception;
	
	// 상품페이지에서 주문시 옵션값 등록 기능
	public void orderAdd(CartVO vo) throws Exception;
	
	// 주문하기
	public void orderOrder(OrderVO vo) throws Exception;
	
	
	
	// 주문 추가
	
	// 주문 취소
	
	// 주문 목록
	
	// 주문 상세
}
