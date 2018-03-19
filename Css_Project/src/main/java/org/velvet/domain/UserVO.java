package org.velvet.domain;

import java.sql.Date;

public class UserVO 
{
	private String 	u_name;			//이름
	private String 	u_id;			//아이디
	private String 	u_password;		//비밀번호
	private String 	u_birthdate;	//생일
	private String 	u_gender;		//성별
	private String 	u_address;		//주소
	private String 	u_addnum;		//우편번호
	private String 	u_phonenum;		//폰번호
	private Date 	u_regdate;		//가입날짜
	private String 	g_code;			//등급코드
	private int 	u_point;		//포인트
	private String	u_verify;		//메일인증
	
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_birthdate() {
		return u_birthdate;
	}
	public void setU_birthdate(String u_birthdate) {
		this.u_birthdate = u_birthdate;
	}
	public String getU_gender() {
		return u_gender;
	}
	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	public String getU_addnum() {
		return u_addnum;
	}
	public void setU_addnum(String u_addnum) {
		this.u_addnum = u_addnum;
	}
	public String getU_phonenum() {
		return u_phonenum;
	}
	public void setU_phonenum(String u_phonenum) {
		this.u_phonenum = u_phonenum;
	}
	public Date getU_regdate() {
		return u_regdate;
	}
	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}
	public String getG_code() {
		return g_code;
	}
	public void setG_code(String g_code) {
		this.g_code = g_code;
	}
	public int getU_point() {
		return u_point;
	}
	public void setU_point(int u_point) {
		this.u_point = u_point;
	}
	public String getU_verify() {
		return u_verify;
	}
	public void setU_verify(String u_verify) {
		this.u_verify = u_verify;
	}
	
	
	@Override
	public String toString() 
	{
		return "UserVO [u_name=" + u_name + ", u_id=" + u_id + ", u_password=" + u_password + ", u_birthdate="
				+ u_birthdate + ", u_gender=" + u_gender + ", u_address=" + u_address + ", u_addnum=" + u_addnum
				+ ", u_phonenum=" + u_phonenum + ", u_regdate=" + u_regdate + ", g_code=" + g_code + ", u_point="
				+ u_point + ", u_verify=" + u_verify + "]";
	}
}