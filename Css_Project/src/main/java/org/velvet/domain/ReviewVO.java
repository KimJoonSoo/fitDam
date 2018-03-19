package org.velvet.domain;

import java.sql.Date;

public class ReviewVO 
{
	private int 	r_no;        //후기번호
    private String 	r_title;     //후기제목
    private String 	r_content;   //후기내용
    private String 	u_id;        //유저
    private String 	p_no;        //상품번호
    private Date 	r_regdate;   //후기등록날짜
	
    
    public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	
	@Override
	public String toString() 
	{
		return "ReviewVO [r_no=" + r_no + ", r_title=" + r_title + ", r_content=" + r_content + ", u_id=" + u_id
				+ ", p_no=" + p_no + ", r_regdate=" + r_regdate + "]";
	}
}