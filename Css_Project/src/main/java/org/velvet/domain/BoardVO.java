package org.velvet.domain;

import java.util.Date;

public class BoardVO 
{
	private int 	b_no;			// 글번호
	private String 	b_title;		// 글 제목
	private String 	b_content;		// 글 내용
	private String 	u_id;			// 유저아이디
	private Date 	b_regdate;		// 글 등록 날짜
	private int 	b_viewcnt;		// 글 조회수
	
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_viewcnt() {
		return b_viewcnt;
	}
	public void setB_viewcnt(int b_viewcnt) {
		this.b_viewcnt = b_viewcnt;
	}
	
	
	@Override
	public String toString() 
	{
		return "BoardVO [b_no=" + b_no + ", b_title=" + b_title + ", b_content=" + b_content + ", u_id=" + u_id
				+ ", b_regdate=" + b_regdate + ", b_viewcnt=" + b_viewcnt + "]";
	}
}