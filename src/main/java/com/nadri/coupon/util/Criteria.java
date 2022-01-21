package com.nadri.coupon.util;

public class Criteria {

	private String opt;
	private String value;
	private int beginIndex;
	private int endIndex;
	private String menu;
	
	public Criteria() {}

	public String getOpt() {
		return opt;
	}

	public void setOpt(String opt) {
		this.opt = opt;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	public int getBeginIndex() {
		return beginIndex;
	}
	
	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}
	
	public int getEndIndex() {
		return endIndex;
	}
	
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	@Override
	public String toString() {
		return "Criteria [opt=" + opt + ", value=" + value + ", beginIndex=" + beginIndex + ", endIndex=" + endIndex
				+ "]";
	}

	
}
