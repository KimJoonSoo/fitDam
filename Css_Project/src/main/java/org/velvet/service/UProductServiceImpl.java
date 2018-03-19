package org.velvet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.velvet.dao.UProductDAO;
import org.velvet.domain.CategoryVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.USearchCriteria;

@Service
public class UProductServiceImpl implements UProductService
{
	@Inject
	UProductDAO dao;

	// 유저 1차 카테고리 상품 목록 String cat_id
	@Override
	public List<ProductVO> uproductList(USearchCriteria cri) throws Exception 
	{
		return dao.uproductList(cri);
	}

	// 유저 1차 카테고리 상품 목록 검색
	@Override
	public List<ProductVO> uproductlistSearch(USearchCriteria cri) throws Exception 
	{
		return dao.uproductlistSearch(cri);
	}

	// 유저 1차 카테고리 상품 목록 카운트
	@Override
	public int uproductlistSearchCount(USearchCriteria cri) throws Exception 
	{
		return dao.uproductlistSearchCount(cri);
	}
	
	// 카테고리 리스트
	@Override
	public List<CategoryVO> ucategoryList() throws Exception
	{
		return dao.ucategoryList();
	}
	
	// 상품정보보기
	@Override
	public ProductVO uproductInfo(String p_no) throws Exception
	{
		return dao.uproductInfo(p_no);
	}
	
	// 메인상단 전체 상품 목록
	@Override
	public List<ProductVO> uproductAList() throws Exception 
	{
		return dao.uproductAList();
	}

	// 메인상단 전체 상품 목록 검색
	@Override
	public List<ProductVO> uproductAlistSearch(SearchCriteria cri) throws Exception 
	{
		return dao.uproductAlistSearch(cri);
	}

	// 메인상단 전체 상품 목록 카운트
	@Override
	public int uproductAlistSearchCount(SearchCriteria cri) throws Exception 
	{
		return dao.uproductAlistSearchCount(cri);
	}
	
	// 유저 2차 카테고리 상품 목록 String cat_id
	@Override
	public List<ProductVO> uproductcList(USearchCriteria cri) throws Exception 
	{
		return dao.uproductcList(cri);
	}

	// 유저 2차 카테고리 상품 목록 검색
	@Override
	public List<ProductVO> uproductclistSearch(USearchCriteria cri) throws Exception 
	{
		return dao.uproductclistSearch(cri);
	}

	// 유저 2차 카테고리 상품 목록 카운트
	@Override
	public int uproductclistSearchCount(USearchCriteria cri) throws Exception 
	{
		return dao.uproductclistSearchCount(cri);
	}
}
