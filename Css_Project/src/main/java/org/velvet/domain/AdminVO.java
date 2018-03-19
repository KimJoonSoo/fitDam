package org.velvet.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class AdminVO 
{
	private String 		a_name;				// 이름
	private String 		a_id;				// 아이디
	private String 		a_password;			// 비밀번호
	private String 		a_phonenum;			// 폰번호
	private String 		a_email;			// 이메일
	private String		a_level;			// 관리자 등급
	private Date 		a_regdate; 			// 가입날짜
	private String 		a_recentlogout;		// 최근로그아웃날짜
	
	
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_password() {
		return a_password;
	}
	public void setA_password(String a_password) {
		this.a_password = a_password;
	}
	public String getA_phonenum() {
		return a_phonenum;
	}
	public void setA_phonenum(String a_phonenum) {
		this.a_phonenum = a_phonenum;
	}
	public String getA_email() {
		return a_email;
	}
	public void setA_email(String a_email) {
		this.a_email = a_email;
	}
	public String getA_level() {
		return a_level;
	}
	public void setA_level(String a_level) {
		this.a_level = a_level;
	}
	public Date getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(Date a_regdate) {
		this.a_regdate = a_regdate;
	}
	public String getA_recentlogout() {
		return a_recentlogout;
	}
	public void setA_recentlogout(String a_recentlogout) {
		this.a_recentlogout = a_recentlogout;
	}
	
	
	@Override
	public String toString() 
	{
		return "AdminVO [a_name=" + a_name + ", a_id=" + a_id + ", a_password=" + a_password + ", a_phonenum="
				+ a_phonenum + ", a_email=" + a_email + ", a_level=" + a_level + ", a_regdate=" + a_regdate
				+ ", a_recentlogout=" + a_recentlogout + "]";
	}

}