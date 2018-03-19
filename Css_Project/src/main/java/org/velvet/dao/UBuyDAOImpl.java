package org.velvet.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.velvet.domain.CartVO;
import org.velvet.domain.CategoryVO;
import org.velvet.domain.OrderVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.USearchCriteria;
import org.velvet.domain.UserVO;

@Repository
public class UBuyDAOImpl implements UBuyDAO
{
	@Inject
	private SqlSession session;
	private static String namespace = "org.velvet.mapper.UbuyMapper";
	

	// 장바구니에서 주문 목록
	@Override
	public CartVO orderList(String u_id, int c_no) throws Exception
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_no", c_no);
		map.put("u_id", u_id);
		
		return session.selectOne(namespace + ".orderList", map);
	}
	
	// 상품페이지에서 주문목록
	@Override
	public ProductVO orderListP(String u_id, String p_no) throws Exception
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p_no", p_no);
		map.put("u_id", u_id);
		
		return session.selectOne(namespace + ".orderListP", map);
	}
	
	// 상품페이지에서 주문시 옵션값 등록 기능
	@Override
	public void orderAdd(CartVO vo) throws Exception
	{
		session.insert(namespace + ".orderAdd", vo);
	}
	
	// 주문하기
	public void orderOrder(OrderVO vo) throws Exception
	{
		session.insert(namespace + ".orderOrder", vo);
	}
	
	// 주문 추가
	
	// 주문 취소
	
	// 주문 상세
}
