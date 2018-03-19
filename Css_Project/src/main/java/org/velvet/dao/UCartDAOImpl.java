package org.velvet.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.velvet.domain.CartVO;

@Repository
public class UCartDAOImpl implements UCartDAO 
{
	@Inject // 의존성 주입 기능
	private SqlSession session;
	
	private static String namespace = "org.velvet.mapper.UcartMapper";
	
	
	// 장바구니 삭제 기능
	@Override
	public void cartDel(int c_no) throws Exception 
	{
		session.delete(namespace + ".cartDel", c_no);
	}
	
	// 유저별 장바구니 목록
	@Override
	public List<CartVO> cartuList(String u_id) throws Exception
	{
		return session.selectList(namespace + ".cartuList", u_id);
	}
	
	// 장바구니 존재여부 체크 - 단일항목
	@Override
	public String cartExsist(String p_no, String u_id, String c_color, String c_size) throws Exception
	{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p_no", p_no);
		map.put("u_id", u_id);
		map.put("c_color", c_color);
		map.put("c_size", c_size);
		
		System.out.println("dao : " + p_no + " / " + u_id + " / "  + c_color + " / "  + c_size);
		
		return session.selectOne(namespace + ".cartExsist", map);
	}
	
	// 장바구니 존재여부 체크 - 다중항목
	@Override
	public String productCheck(HashMap<String, String> map) throws Exception
	{
		return session.selectOne(namespace + ".productCheck", map);
	}
	
	
	// 장바구니 등록 기능
	@Override
	public void cartAdd(CartVO vo) throws Exception
	{
		session.insert(namespace + ".cartAdd", vo);
	}
	
	// 장바구니 등록 (update)
	@Override
	public void cartUp(CartVO vo) throws Exception
	{
		session.update(namespace + ".cartUp", vo);
	}
}
