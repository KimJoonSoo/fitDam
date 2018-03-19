package org.velvet.service;

import java.util.List;

import org.velvet.domain.CategoryVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.USearchCriteria;

public interface UProductService 
{
	// 유저 1차 카테고리 목록 기능
	public List<ProductVO> uproductList(USearchCriteria cri) throws Exception;
	
	// 유저 1차 카테고리 목록 검색 기능
	public List<ProductVO> uproductlistSearch(USearchCriteria cri)throws Exception;
	
	// 유저 1차 카테고리 목록 검색 카운트 기능
	public int uproductlistSearchCount(USearchCriteria cri) throws Exception;	
	
	// 카테고리 리스트
	public List<CategoryVO> ucategoryList() throws Exception;

	// 상품정보보기
	public ProductVO uproductInfo(String p_no) throws Exception;

	// 메인상단 전체 상품 목록
	public List<ProductVO> uproductAList() throws Exception;
	
	// 메인상단 전체 상품 목록 검색 기능
	public List<ProductVO> uproductAlistSearch(SearchCriteria cri)throws Exception;
	
	// 메인상단 전체 상품 목록 검색 카운트 기능
	public int uproductAlistSearchCount(SearchCriteria cri) throws Exception;		
	
	// 유저 2차 카테고리 목록 기능
	public List<ProductVO> uproductcList(USearchCriteria cri) throws Exception;
	
	// 유저 2차 카테고리 목록 검색 기능
	public List<ProductVO> uproductclistSearch(USearchCriteria cri)throws Exception;
	
	// 유저 2차 카테고리 목록 검색 카운트 기능
	public int uproductclistSearchCount(USearchCriteria cri) throws Exception;
}
