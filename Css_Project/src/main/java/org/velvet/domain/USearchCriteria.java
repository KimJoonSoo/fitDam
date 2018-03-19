package org.velvet.domain;

public class USearchCriteria extends Criteria
{
	// 글 검색기능 구현을 위한 변수 설정부분
	private String searchType; 	//title,content,writer.....
	private String keyword;		//검색어
	private String cat_id;		//카테고리 코드
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	
	
	@Override
	public String toString() 
	{
		return "USearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", cat_id=" + cat_id
				+ ", toString()=" + super.toString() + "]";
	}
	
}


