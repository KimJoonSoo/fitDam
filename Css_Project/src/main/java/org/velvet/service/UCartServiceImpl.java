package org.velvet.service;


import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.velvet.domain.CartVO;
import org.velvet.domain.UserVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.velvet.dao.UCartDAO;

@Service
public class UCartServiceImpl implements UCartService
{
	@Inject
	UCartDAO dao;
	
	// 장바구니 삭제 기능 
	@Transactional
	@Override
	public void cartDel(String c_no) throws Exception
	{
		// 하나만 삭제할 때
		if(c_no.indexOf(",") == -1)
		{	
			dao.cartDel(Integer.parseInt(c_no));
		}
		// check된 상품이 여러개 있을 때 ,로 구분된만큼 삭제
		else 
		{
			String[] check = c_no.split(",");
			for (int i = 0; i < check.length; i++) 
			{
				dao.cartDel(Integer.parseInt(check[i]));
			}
		}
	}
	
	// 유저별 장바구니 목록
	@Override
	public List<CartVO> cartuList(String u_id) throws Exception
	{
		return dao.cartuList(u_id);
	}
	
	// 장바구니 등록시 insert(장바구니에 없을경우), update(장바구니에 있을경우) 선택하기
	@Override
	public String cartExsist(String p_no, String u_id, String c_color, String c_size) throws Exception
	{
		System.out.println("dao : " + p_no + " / " + u_id + " / "  + c_color + " / "  + c_size);
		return dao.cartExsist(p_no, u_id, c_color, c_size);
	}
	
	// productCheck
	@Override
	public boolean productCheck(String p_no,String c_color, String c_size, HttpSession session) throws Exception
	{
		boolean isOk = false;	// 값을 t or f로 판별하기 위한 설정
		String u_id = "";
		if(session.getAttribute("usersession") != null)
		{
			// u_id에 UserVO의 로그인 한 사용자의 세션값 u_id를 넣어준다.
			u_id = ((UserVO) session.getAttribute("usersession")).getU_id();
		}
		System.out.println(u_id);
		// 데이터의 저장은 key, value 형태. 그리고 해싱(Hashing) 검색을 사용하기 때문에 대용량 데이터 관리에도 좋다
		// 값이 모두 String이기 때문에 키, 값 모두 String으로 지정
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("p_no", p_no);
		map.put("c_color", c_color);
		map.put("c_size", c_size);
		
		if(dao.productCheck(map) == null)
		{
			isOk = true;
		}
		
		return isOk;	
	}
	
	// 장바구니 등록 기능
	@Override
	@Transactional
	public void cartAdd(CartVO vo) throws Exception
	{
		String[] color = vo.getC_color().split(",");
		String[] size = vo.getC_size().split(",");
		String[] count = vo.getC_count_string().split(",");
		
		for (int i = 0; i < count.length; i++) 
		{
			vo.setC_color(color[i]);
			vo.setC_size(size[i]);
			vo.setC_count(Integer.parseInt(count[i]));
			dao.cartAdd(vo);
		}		
	}
	
	// 장바구니 등록 (update)
	@Override
	public void cartUp(CartVO vo) throws Exception
	{
		dao.cartUp(vo);
	}
}
