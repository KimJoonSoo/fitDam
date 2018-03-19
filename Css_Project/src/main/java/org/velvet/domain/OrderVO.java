package org.velvet.domain;

public class OrderVO 
{
    private int 		o_no;
    
    private String 		p_no;
    private String 		u_id;
    private int 		c_no;
	private String 		g_code;
	
    private String 		o_infoname;
    private String 		o_infophone;
    private String 		o_infoadd;
    private String 		o_addnum;
    private String 		o_infomessage;

    private String 		c_color;
    private String 		c_size;
	private int 		c_count;
	private String 		c_count_string;
	
	
	
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
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
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getG_code() {
		return g_code;
	}
	public void setG_code(String g_code) {
		this.g_code = g_code;
	}
	public String getO_infoname() {
		return o_infoname;
	}
	public void setO_infoname(String o_infoname) {
		this.o_infoname = o_infoname;
	}
	public String getO_infophone() {
		return o_infophone;
	}
	public void setO_infophone(String o_infophone) {
		this.o_infophone = o_infophone;
	}
	public String getO_infoadd() {
		return o_infoadd;
	}
	public void setO_infoadd(String o_infoadd) {
		this.o_infoadd = o_infoadd;
	}
	public String getO_addnum() {
		return o_addnum;
	}
	public void setO_addnum(String o_addnum) {
		this.o_addnum = o_addnum;
	}
	public String getO_infomessage() {
		return o_infomessage;
	}
	public void setO_infomessage(String o_infomessage) {
		this.o_infomessage = o_infomessage;
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
	public String getC_count_string() {
		return c_count_string;
	}
	public void setC_count_string(String c_count_string) {
		this.c_count_string = c_count_string;
	}
	
	
	@Override
	public String toString() 
	{
		return "OrderVO [o_no=" + o_no + ", p_no=" + p_no + ", u_id=" + u_id + ", c_no=" + c_no + ", g_code=" + g_code
				+ ", o_infoname=" + o_infoname + ", o_infophone=" + o_infophone + ", o_infoadd=" + o_infoadd
				+ ", o_addnum=" + o_addnum + ", o_infomessage=" + o_infomessage + ", c_color=" + c_color + ", c_size="
				+ c_size + ", c_count=" + c_count + ", c_count_string=" + c_count_string + ", toString()="
				+ super.toString() + "]";
	}
}
