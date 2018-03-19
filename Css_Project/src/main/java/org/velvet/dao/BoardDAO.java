package org.velvet.dao;

import java.util.List;

import org.velvet.domain.BoardVO;
import org.velvet.domain.ReplyVO;
import org.velvet.domain.SearchCriteria;

public interface BoardDAO 
{
	// 전체목록 기능
	// 목록이기 때문에 List를 쓴다
	public List<BoardVO> listPage() throws Exception;
		
	// 글쓰기 기능
	public void writePage(BoardVO vo) throws Exception;
		
	// 글조회 기능
	public BoardVO readPage(Integer b_no) throws Exception;
		
	// 조회수 증가
	public void incviewcnt(Integer b_no) throws Exception;
		
	// 글삭제 기능
	public void delete(Integer b_no) throws Exception;
		
	// 글수정 기능		(= 글쓰기 기능과 동일하게 구성한다)
	public void modify(BoardVO vo) throws Exception;

	// 목록 검색 기능
	public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	
	// 목록 검색 카운트 기능
	public int listSearchCount(SearchCriteria cri) throws Exception;



	// 댓글 쓰기 기능 replyInsert
	public void replyInsert(ReplyVO vo) throws Exception;
	
	// 댓글 목록 기능
	public List<ReplyVO> replyList(int b_no) throws Exception;
	
	// 댓글 검색 기능
	public List<ReplyVO> replySearch(SearchCriteria cri)throws Exception;
	
	// 댓글 검색 카운트 기능
	public int replySearchCount(SearchCriteria cri) throws Exception;
}
