package org.velvet.domain;

public class CategoryVO 
{
	private int level;
	private String cat_id;		 //카테고리아이디
	private String cat_name;  	 //카테고리명
	private String cat_parentid;	 //상위카테고리
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getCat_parentid() {
		return cat_parentid;
	}
	public void setCat_parentid(String cat_parentid) {
		this.cat_parentid = cat_parentid;
	}
	
	
	@Override
	public String toString() 
	{
		return "CategoryVO [level=" + level + ", cat_id=" + cat_id + ", cat_name=" + cat_name + ", cat_parentid="
				+ cat_parentid + "]";
	}
}