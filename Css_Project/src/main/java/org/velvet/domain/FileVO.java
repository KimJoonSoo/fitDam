package org.velvet.domain;

public class FileVO 
{
	private int 	f_no;		//첨부파일번호
    private String 	f_file;     //첨부파일
    private int 	r_no;
	
    public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public String getF_file() {
		return f_file;
	}
	public void setF_file(String f_file) {
		this.f_file = f_file;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	
	
	@Override
	public String toString() 
	{
		return "FileVO [f_no=" + f_no + ", f_file=" + f_file + ", r_no=" + r_no + "]";
	}
}