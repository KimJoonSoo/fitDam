package org.velvet.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.velvet.controller.BoardController;
import org.velvet.dao.BoardDAO;
import org.velvet.domain.PageMaker;
import org.velvet.domain.ProductVO;
import org.velvet.domain.ReplyVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.UserVO;
import org.velvet.domain.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board/*")
public class BoardController 
{
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardDAO dao;
	

	// 글목록 기능 (GET)
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session) throws Exception 
	{
		logger.info(cri.toString());
		
		model.addAttribute("listPage", dao.listSearch(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    // pageMaker.setTotalCount(service.listCountCriteria(cri));
	    pageMaker.setTotalCount(dao.listSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	}
	
	
	// 글쓰기 기능 (GET)
	@RequestMapping(value = "/writePage", method = RequestMethod.GET)
	public void registGET(HttpSession session, Model model) throws Exception 
	{
		logger.info("regist get !!");
	    UserVO uv = (UserVO)session.getAttribute("usersession");
	    
	    if(uv != null)
	    {
	    	model.addAttribute("userVO", uv);
	    }
	}
	  
	// 글쓰기 기능 (POST)
	@RequestMapping(value = "/writePage", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception 
	{
		logger.info("regist post !!");
	    logger.info(board.toString());
	    

	    
	    dao.writePage(board);

	    rttr.addFlashAttribute("msg", "ADDSUCCESS");

	    return "redirect:/board/listPage";
	}
	  
	  
	// 글조회 기능 (GET)
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam("b_no") int b_no, @ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session) throws Exception 
	{
		//글 조회 부분에서 조회수 증가 작업을 해줌
		dao.incviewcnt(b_no);	// 조회 수 증가
	    model.addAttribute(dao.readPage(b_no));
	    
	    UserVO uv = (UserVO)session.getAttribute("usersession");
	    
	    model.addAttribute("userVO", uv);
	    
	    model.addAttribute("replyList", dao.replyList(b_no));
	    
	    
	    

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    model.addAttribute("pageMaker", pageMaker);
	}
	
	
	// 글삭제 기능 (POST)
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String removePage(@RequestParam("b_no") int b_no, SearchCriteria cri, RedirectAttributes rttr) throws Exception 
	{

	    dao.delete(b_no);

	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    rttr.addFlashAttribute("msg", "DELSUCCESS");

	    return "redirect:/board/listPage";
	}
	
	
	// 글수정 기능 (GET)
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPageGET(int b_no, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception 
	{
	    model.addAttribute(dao.readPage(b_no));
	}

	// 글수정 기능 (POST)
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagePOST(BoardVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception 
	{
		//System.out.println("여기는되나요");
	    logger.info(vo.toString());
	    dao.modify(vo);
	    //System.out.println("여기는요?");
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());

	    rttr.addFlashAttribute("msg", "MODSUCCESS");

	    logger.info(rttr.toString());

	    return "redirect:/board/listPage";
	}
	
	
	
	
	
	
	
	///////////////////////////////////////댓글 기능 시작
	
	
	
	// 댓글쓰기 기능 (POST)
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	public String replyInsert(ReplyVO vo, RedirectAttributes rttr, @ModelAttribute("cri") SearchCriteria cri) throws Exception 
	{
		logger.info("replyInsert post !!");
	    logger.info(vo.toString());
	    
	    dao.replyInsert(vo);
	    
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    rttr.addAttribute("b_no", vo.getB_no());
	    
	    
	    return "redirect:/board/readPage";
	}
	
	// 댓글 삭제기능 구현하기
}
