package org.velvet.controller;

import java.util.List;

import javax.inject.Inject;


import org.velvet.controller.UProductController;
import org.velvet.domain.UPageMaker;
import org.velvet.domain.PageMaker;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.USearchCriteria;
import org.velvet.service.UProductService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/*")
public class UProductController 
{
	private static final Logger logger = LoggerFactory.getLogger(UProductController.class);
	
	@Inject
	private UProductService service;
	
	
	// 대분류 카테고리별 상품리스트
	@RequestMapping(value = "/uproductList", method = RequestMethod.GET)
	public void uproductList(@ModelAttribute("cri") USearchCriteria cri, Model model) throws Exception 
	{
		logger.info(cri.toString());
		
	    model.addAttribute("uproductList", service.uproductlistSearch(cri));
	    List<ProductVO> list = service.uproductlistSearch(cri);
	    for(int i = 0; i < list.size(); i++)
	    logger.info(list.get(i).toString());
	    
	    UPageMaker upageMaker = new UPageMaker();
	    upageMaker.setCri(cri);

	    upageMaker.setTotalCount(service.uproductlistSearchCount(cri));

	    model.addAttribute("pageMaker", upageMaker);
	}
	
		
	// 메인페이지 상단에서 상품 전체 목록 기능 (GET)
	@RequestMapping(value = "/uproductAList", method = RequestMethod.GET)
	public void uproductAList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception 
	{
		logger.info(cri.toString());

		
	    model.addAttribute("productAList", service.uproductAlistSearch(cri));
	    
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.uproductAlistSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	}
	
	// 메인페이지 상단에서 상품 전체 목록 바둑판식 (GET)
	@RequestMapping(value = "/uproductABList", method = RequestMethod.GET)
	public void uproductABList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception 
	{
		logger.info(cri.toString());

		cri.setPerPageNum(12);
	    model.addAttribute("productAList", service.uproductAlistSearch(cri));
	    
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.uproductAlistSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	}
	
	
	
	
    // 상품정보보기 (GET)
 	@RequestMapping(value = "/uproductInfo", method = RequestMethod.GET)
 	public void uproductInfo(@ModelAttribute("cri") USearchCriteria cri, String p_no, Model model) throws Exception 
 	{
 		logger.info("uproductInfo get");
 	    ProductVO vo2 = service.uproductInfo(p_no);
 	    model.addAttribute(vo2);
 	    logger.info(vo2.getP_no());
 	}
 	
 	// 2차 카테고리별 목록보기
	@RequestMapping(value = "/uproductcList", method = RequestMethod.GET)
	public void uproductcList(@ModelAttribute("cri") USearchCriteria cri, Model model) throws Exception 
	{
		logger.info(cri.toString());
		
	    model.addAttribute("uproductcList", service.uproductclistSearch(cri));
	    List<ProductVO> list = service.uproductclistSearch(cri);
	    for(int i = 0; i < list.size(); i++)
	    logger.info(list.get(i).toString());
	    
	    UPageMaker upageMaker = new UPageMaker();
	    upageMaker.setCri(cri);

	    upageMaker.setTotalCount(service.uproductclistSearchCount(cri));

	    model.addAttribute("pageMaker", upageMaker);
	}
}
