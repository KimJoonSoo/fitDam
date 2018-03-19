package org.velvet.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class UPageMaker 
{
	// 페이지의 기본구성을 담고 있는 부분이 PageMaker
	private int 	totalCount;	// 총 페이지 수
	private int 	startPage;	// 시작페이지
	private int 	endPage;	// 종료페이지
	private boolean prev;		// 이전페이지
	private boolean next;		// 다음페이지

	//페이지 번호의 개수
	private int displayPageNum = 10;

	// Criteria : 현재 페이지번호, 페이지 출력개수
	private Criteria cri;

 
	public void setCri(Criteria cri) 
	{
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) 
	{
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() 
	{
		//endPage = (현재페이지 / 페이지 번호의 수 ) * 페이지 번호의 수
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		//startPage = (endPage - 페이지 번호의 수) + 1
		startPage = (endPage - displayPageNum) + 1;

		//tempEndPage = Math.ceil(전체 데이타 수 / 출력게시물 개수)
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) // tempEndPage = 현재 목록중 가장 끝 페이지
		{
			endPage = tempEndPage;
		}

		//이전 표시
		prev = startPage == 1 ? false : true;

		//다음 표시
		//	  (endPage * 출력게시물 개수) >= 전체데이타수
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	}

	public int getTotalCount() 
	{
		return totalCount;
	}

	public int getStartPage() 
	{
		return startPage;
	}

	public int getEndPage() 
	{
		return endPage;
	}

	public boolean isPrev() 
	{
		return prev;
	}

	public boolean isNext() 
	{
		return next;
	}	

	public int getDisplayPageNum() 
	{
		return displayPageNum;
	}

	public Criteria getCri() 
	{
		return cri;
	}

	// 이 기능은? 페이지당 출력되는 게시물 수의 쿼리를 만드는 기능
	public String makeQuery(int page) 
	{
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
        .queryParam("perPageNum", cri.getPerPageNum()).build();

		return uriComponents.toUriString();
	}
  
	// 이 기능은? 검색기능에서 URI 부분에 해당페이지의 정보를 출력해주기 위한 기능
	public String makeSearch(int page)
	{
		UriComponents uriComponents =
        UriComponentsBuilder.newInstance()
        					.queryParam("page", page)
        					.queryParam("perPageNum", cri.getPerPageNum())
        					.queryParam("searchType", ((USearchCriteria)cri).getSearchType())
        					.queryParam("keyword", ((USearchCriteria)cri).getKeyword())
        					.queryParam("cat_id", ((USearchCriteria)cri).getCat_id())
        					.build();             
    
		return uriComponents.toUriString();
	} 
}