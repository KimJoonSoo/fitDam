package org.velvet.domain;

import java.sql.Date;

public class QnaboardVO 
{
	private int 	q_no;			//질문번호 	       
    private String 	q_title; 	   	//질문제목
    private String 	q_content;  	//질문내용
    private String 	q_reply;		//질문답변
    private String 	u_id; 			//유저
    private String 	a_id;			//관리자
    private Date 	q_qregdate;		//질문등록날짜
    private Date 	q_aregdate;		//답변등록날짜
	
    
    public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_reply() {
		return q_reply;
	}
	public void setQ_reply(String q_reply) {
		this.q_reply = q_reply;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public Date getQ_qregdate() {
		return q_qregdate;
	}
	public void setQ_qregdate(Date q_qregdate) {
		this.q_qregdate = q_qregdate;
	}
	public Date getQ_aregdate() {
		return q_aregdate;
	}
	public void setQ_aregdate(Date q_aregdate) {
		this.q_aregdate = q_aregdate;
	}
	
	
	@Override
	public String toString() 
	{
		return "QnaboardVO [q_no=" + q_no + ", q_title=" + q_title + ", q_content=" + q_content + ", q_reply=" + q_reply
				+ ", u_id=" + u_id + ", a_id=" + a_id + ", q_qregdate=" + q_qregdate + ", q_aregdate=" + q_aregdate
				+ "]";
	}
}