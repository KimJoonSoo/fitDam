package org.velvet.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.velvet.domain.BoardVO;
import org.velvet.domain.ReplyVO;
import org.velvet.domain.SearchCriteria;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO 
{

	@Inject // 의존성 주입 기능
	private SqlSession session;
	
	private static String namespace = "org.velvet.mapper.BoardMapper";
	
	
	// 글목록 기능
	@Override 
	public List<BoardVO> listPage() throws Exception 
	{
		return session.selectList(namespace + ".listPage");
	}
		
	@Override
	public void writePage(BoardVO vo) throws Exception 
	{
		session.insert(namespace + ".writePage", vo);			// namespace = org.test.mapper.BoardMapper 호출
	}

	@Override
	public BoardVO readPage(Integer b_no) throws Exception 
	{
		session.update(namespace + ".incviewcnt", b_no);			// 조회수 증가
	    return session.selectOne(namespace + ".readPage", b_no);	// b_no 하나를 선택하기 때문에 selectOne을 쓴다
	}

	@Override
	public void incviewcnt(Integer b_no) throws Exception 
	{

	}

	@Override
	public void delete(Integer b_no) throws Exception 
	{
		session.delete(namespace + ".deletePage", b_no);
	}

	@Override
	public void modify(BoardVO vo) throws Exception 
	{
		System.out.println("update : "+vo.toString());
		session.update(namespace + ".modifyPage", vo);
	}
	
	// 목록 검색 기능
	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception 
	{
	    return session.selectList(namespace + ".listSearch", cri);
	}
	
	// 목록 검색 카운트 기능
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception 
	{
		 return session.selectOne(namespace + ".listSearchCount", cri);
	}



	// 댓글 쓰기 기능
	@Override
	public void replyInsert(ReplyVO vo) throws Exception
	{
		session.insert(namespace + ".replyInsert", vo);
	}
	
	// 댓글 목록 기능
	@Override
	public List<ReplyVO> replyList(int b_no) throws Exception 
	{
		return session.selectList(namespace + ".replyList", b_no);
	}
	
	// 댓글 검색 기능
	@Override
	public List<ReplyVO> replySearch(SearchCriteria cri) throws Exception 
	{
	    return session.selectList(namespace + ".replySearch", cri);
	}
	
	// 댓글 검색 카운트 기능
	@Override
	public int replySearchCount(SearchCriteria cri) throws Exception 
	{
		 return session.selectOne(namespace + ".replySearchCount", cri);
	}
}
