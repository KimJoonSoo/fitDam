package org.velvet.dao;

import java.util.HashMap;
import java.util.List;

import org.velvet.domain.CartVO;


public interface UCartDAO 
{	
	// 유저별 장바구니 목록
	public List<CartVO> cartuList(String u_id) throws Exception;
	
	// 장바구니 삭제
	public void cartDel(int c_no) throws Exception;
	
	// 장바구니 존재여부 확인 - 단일항목 확인 가능
	public String cartExsist(String p_no, String u_id, String c_color, String c_size) throws Exception;
	
	// productCheck - 다중확인 가능
	public String productCheck(HashMap<String, String> map) throws Exception;
	
	
	// 장바구니 등록 기능
	public void cartAdd(CartVO vo) throws Exception;
	
	// 장바구니 등록 (update)
	public void cartUp(CartVO vo) throws Exception;
	
}
