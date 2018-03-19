package org.velvet.service;

import java.util.List;

import org.velvet.domain.CategoryVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;

public interface AProductService 
{
	// 관리자 목록 기능
	public List<ProductVO> productList() throws Exception;
	
	// 관리자 목록 검색 기능
	public List<ProductVO> productlistSearch(SearchCriteria cri)throws Exception;
	
	// 관리자 목록 검색 카운트 기능
	public int productlistSearchCount(SearchCriteria cri) throws Exception;	
	
	// 카테고리 리스트
	public List<CategoryVO> categoryList() throws Exception;
	
	// 상품등록
	public void productAdd(ProductVO vo) throws Exception;
	
	// 상품번호 시퀀스
	public String productseq() throws Exception;
	
	// 상품정보보기
	public ProductVO productInfo(String p_no) throws Exception;
	
	// 상품삭제
	public void productDel(String p_no) throws Exception;
	
	// 상품 정보수정
	public void productModify(ProductVO vo) throws Exception;

}
