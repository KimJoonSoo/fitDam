package org.velvet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.velvet.domain.CategoryVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.USearchCriteria;

@Repository
public class UProductDAOImpl implements UProductDAO
{
	@Inject
	private SqlSession session;
	private static String namespace = "org.velvet.mapper.UproductMapper";
	
	// 유저 1차 카테고리 상품 목록
	@Override
	public List<ProductVO> uproductList(USearchCriteria cri) throws Exception 
	{
		return session.selectList(namespace + ".uproductList");
	}

	// 유저 1차 카테고리 상품 목록 검색
	@Override
	public List<ProductVO> uproductlistSearch(USearchCriteria cri) throws Exception 
	{
		return session.selectList(namespace + ".uproductlistSearch", cri);
	}

	// 유저 1차 카테고리 상품 목록 카운트
	@Override
	public int uproductlistSearchCount(USearchCriteria cri) throws Exception 
	{
		return session.selectOne(namespace + ".uproductlistSearchCount", cri);
	}
	
	// 카테고리 리스트
	@Override
	public List<CategoryVO> ucategoryList() throws Exception
	{
		return session.selectList(namespace + ".ucategoryList");
	}
	
	// 상품정보보기
	@Override
	public ProductVO uproductInfo(String p_no) throws Exception 
	{
		return session.selectOne(namespace + ".uproductInfo", p_no);
	}
	
	// 메인상단 전체 상품 목록
	@Override
	public List<ProductVO> uproductAList() throws Exception 
	{
		return session.selectList(namespace + ".uproductAList");
	}

	// 메인상단 전체 상품 목록 검색
	@Override
	public List<ProductVO> uproductAlistSearch(SearchCriteria cri) throws Exception 
	{
		return session.selectList(namespace + ".uproductAlistSearch", cri);
	}

	// 메인상단 전체 상품 목록 카운트
	@Override
	public int uproductAlistSearchCount(SearchCriteria cri) throws Exception 
	{
		return session.selectOne(namespace + ".uproductAlistSearchCount", cri);
	}
	
	// 유저 2차 카테고리 상품 목록
	@Override
	public List<ProductVO> uproductcList(USearchCriteria cri) throws Exception 
	{
		return session.selectList(namespace + ".uproductcList");
	}

	// 유저 2차 카테고리 상품 목록 검색
	@Override
	public List<ProductVO> uproductclistSearch(USearchCriteria cri) throws Exception 
	{
		return session.selectList(namespace + ".uproductclistSearch", cri);
	}

	// 유저 2차 카테고리 상품 목록 카운트
	@Override
	public int uproductclistSearchCount(USearchCriteria cri) throws Exception 
	{
		return session.selectOne(namespace + ".uproductclistSearchCount", cri);
	}
}
