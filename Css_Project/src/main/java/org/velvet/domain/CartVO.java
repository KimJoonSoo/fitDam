package org.velvet.domain;

public class CartVO 
{
	private int 	c_no;
	private String	p_no;
	private String 	u_id;

	private String 	c_color;
	private String 	c_size;
	private int 	c_count;
	private String 	c_count_string;
	
	private String	p_name;
	private String	p_photo;
	private String	p_price;
	
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_photo() {
		return p_photo;
	}
	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getC_count_string() {
		return c_count_string;
	}
	public void setC_count_string(String c_count_string) {
		this.c_count_string = c_count_string;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getC_color() {
		return c_color;
	}
	public void setC_color(String c_color) {
		this.c_color = c_color;
	}
	public String getC_size() {
		return c_size;
	}
	public void setC_size(String c_size) {
		this.c_size = c_size;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	
	
	@Override
	public String toString() 
	{
		return "CartVO [c_no=" + c_no + ", p_no=" + p_no + ", u_id=" + u_id + ", c_color=" + c_color + ", c_size="
				+ c_size + ", c_count=" + c_count + ", c_count_string=" + c_count_string + ", p_name=" + p_name
				+ ", p_photo=" + p_photo + ", p_price=" + p_price + ", toString()=" + super.toString() + "]";
	}
	

		
}
