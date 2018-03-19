package org.velvet.dao;

import java.util.HashMap;
import java.util.List;

import org.velvet.domain.CartVO;
import org.velvet.domain.OrderVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.UserVO;


public interface UBuyDAO 
{
	// 장바구니에서 주문 목록
	public CartVO orderList(String u_id, int c_no) throws Exception;
	
	// 상품페이지에서 주문목록
	public ProductVO orderListP(String u_id, String p_no) throws Exception;

	// 상품페이지에서 주문시 옵션값 등록 기능
	public void orderAdd(CartVO vo) throws Exception;
	
	// 주문하기
	public void orderOrder(OrderVO vo) throws Exception;
	
	// 주문 추가
	
	// 주문 취소
	
	// 주문 상세
}
