package org.velvet.domain;

import java.util.Arrays;

public class ProductVO 
{
	private String 	cat_id;		//카테고리아이디
	private String 	p_no;		//상품번호
	private int		p_seq;		//상품번호 시퀀스		
	private String 	p_name;		//상품명
	private int 	p_price;	//상품가격
	private int 	p_count;	//상품수량
	private String 	p_desc; 	//상품설명
	private String 	p_color;	//상품색상
	private String 	p_size;		//상품크기
	private String 	p_photo;	//상품사진
	private String 	p_regdate;	//상품등록날짜
	private String 	p_display;	//상품판매유무
	private String[] files;		//첨부파일의 이름(배열)
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public String getP_desc() {
		return p_desc;
	}
	public void setP_desc(String p_desc) {
		this.p_desc = p_desc;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_photo() {
		return p_photo;
	}
	public void setP_photo(String p_photo) {
		this.p_photo = p_photo;
	}
	public String getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}
	public String getP_display() {
		return p_display;
	}
	public void setP_display(String p_display) {
		this.p_display = p_display;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	
	@Override
	public String toString() 
	{
		return "ProductVO [cat_id=" + cat_id + ", p_no=" + p_no + ", p_seq=" + p_seq + ", p_name=" + p_name
				+ ", p_price=" + p_price + ", p_count=" + p_count + ", p_desc=" + p_desc + ", p_color=" + p_color
				+ ", p_size=" + p_size + ", p_photo=" + p_photo + ", p_regdate=" + p_regdate + ", p_display="
				+ p_display + ", files=" + Arrays.toString(files) + "]";
	}
}