package org.velvet.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.velvet.domain.CartVO;


public interface UCartService 
{
	// 장바구니 삭제 기능
	public void cartDel(String c_no) throws Exception;
	
	// 유저별 장바구니 목록
	public List<CartVO> cartuList(String u_id) throws Exception;
	
	// 장바구니 존재여부 체크 - 단일항목
	public String cartExsist(String p_no, String u_id, String c_color, String c_size) throws Exception;
	
	// 장바구니 존재여부 체크 - 다중항목
	public boolean productCheck(String p_no, String c_color, String c_size, HttpSession session) throws Exception;
	
	// 장바구니 등록 기능
	public void cartAdd(CartVO vo) throws Exception;
	
	// 장바구니 등록 (update)
	public void cartUp(CartVO vo) throws Exception;
}
