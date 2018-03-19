package org.velvet.domain;

public class GradeVO 
{
	private String 	g_code;			//등급코드
	private String 	g_name;			//등급명
	private int 	g_discount;		//등급별 할인율
	
	
	public String getG_code() {
		return g_code;
	}
	public void setG_code(String g_code) {
		this.g_code = g_code;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public int getG_discount() {
		return g_discount;
	}
	public void setG_discount(int g_discount) {
		this.g_discount = g_discount;
	}
	
	
	@Override
	public String toString() 
	{
		return "GradeVO [g_code=" + g_code + ", g_name=" + g_name + ", g_discount=" + g_discount + "]";
	}	
}