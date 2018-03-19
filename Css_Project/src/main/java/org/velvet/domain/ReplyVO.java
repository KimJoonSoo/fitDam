package org.velvet.domain;

import java.sql.Date;

public class ReplyVO 
{
    private int 	re_no;           //댓글번호
    private int 	b_no;            //글번호
    private String 	re_title;        //댓글제목
    private String 	re_content;      //댓글내용
    private String 	u_id;            //작성자
    private String 	re_regdate;		 //댓글등록날짜
	
    
    public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getRe_title() {
		return re_title;
	}
	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getRe_regdate() {
		return re_regdate;
	}
	public void setRe_regdate(String re_regdate) {
		this.re_regdate = re_regdate;
	}
	
	
	@Override
	public String toString() 
	{
		return "ReplyVO [re_no=" + re_no + ", b_no=" + b_no + ", re_title=" + re_title + ", re_content=" + re_content
				+ ", u_id=" + u_id + ", re_regdate=" + re_regdate + ", toString()=" + super.toString() + "]";
	}
	
    
}