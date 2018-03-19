package org.velvet.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.velvet.dao.AProductDAO;
import org.velvet.domain.CategoryVO;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;

@Service
public class AProductServiceImpl implements AProductService
{
	@Inject
	AProductDAO dao;

	// 상품 목록
	@Override
	public List<ProductVO> productList() throws Exception 
	{
		return dao.productList();
	}

	// 상품 목록 검색
	@Override
	public List<ProductVO> productlistSearch(SearchCriteria cri) throws Exception 
	{
		return dao.productlistSearch(cri);
	}

	// 상품 목록 카운트
	@Override
	public int productlistSearchCount(SearchCriteria cri) throws Exception 
	{
		return dao.productlistSearchCount(cri);
	}
	
	// 카테고리 리스트
	@Override
	public List<CategoryVO> categoryList() throws Exception
	{
		return dao.categoryList();
	}
	
	// 상품등록
	@Override
	public void productAdd(ProductVO vo) throws Exception 
	{
		dao.productAdd(vo);
	}
	
	// 상품번호 시퀀스
	@Override
	public String productseq() throws Exception
	{
		return dao.productseq();
	}
	
	// 상품정보보기
	@Override
	public ProductVO productInfo(String p_no) throws Exception
	{
		return dao.productInfo(p_no);
	}

	// 상품삭제
	@Override
	public void productDel(String p_no) throws Exception 
	{
		dao.productDel(p_no);
	}
	
	// 상품 정보수정
	@Override
	public void productModify(ProductVO vo) throws Exception 
	{
		dao.productModify(vo);	
		System.out.println("service : " + vo.toString());
	}
}
