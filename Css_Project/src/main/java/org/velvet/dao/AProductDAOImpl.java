package org.velvet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.velvet.domain.CategoryVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;

@Repository
public class AProductDAOImpl implements AProductDAO
{
	@Inject
	private SqlSession session;
	private static String namespace = "org.velvet.mapper.AproductMapper";
	
	// 상품 목록
	@Override
	public List<ProductVO> productList() throws Exception 
	{
		return session.selectList(namespace + ".productList");
	}

	// 상품 목록 검색
	@Override
	public List<ProductVO> productlistSearch(SearchCriteria cri) throws Exception 
	{
		return session.selectList(namespace + ".productlistSearch", cri);
	}

	// 상품 목록 카운트
	@Override
	public int productlistSearchCount(SearchCriteria cri) throws Exception 
	{
		return session.selectOne(namespace + ".productlistSearchCount", cri);
	}
	
	// 카테고리 리스트
	@Override
	public List<CategoryVO> categoryList() throws Exception
	{
		return session.selectList(namespace + ".categoryList");
	}
	
	// 상품등록 기능
	@Override
	public void productAdd(ProductVO vo) throws Exception 
	{
		session.insert(namespace + ".productAdd", vo);		
	}
	
	// 상품번호 시퀀스
	@Override
	public String productseq() throws Exception
	{
		return session.selectOne(namespace + ".productseq");
	}
	
	// 상품정보보기
	@Override
	public ProductVO productInfo(String p_no) throws Exception 
	{
		return session.selectOne(namespace + ".productInfo", p_no);
	}
	
	// 상품삭제
	public void productDel(String p_no) throws Exception
	{
		session.delete(namespace + ".productDel", p_no);
	}
	
	// 상품 정보수정
	@Override
	public void productModify(ProductVO vo) throws Exception 
	{
		session.update(namespace + ".productModify", vo);
		System.out.println("dao : " + vo.toString());
	}
}
