package com.nadri.coupon.form;

import java.util.Date;

public class CouponInsertForm {

	private int no;
	private String name;
	private int quantity;
	private int discountRate;
	private Date startDate;
	private Date endDate;
	private String category;	
	
	public CouponInsertForm() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "CouponInsertForm [no=" + no + ", name=" + name + ", quantity=" + quantity + ", discountRate="
				+ discountRate + ", startDate=" + startDate + ", endDate=" + endDate + ", category=" + category + "]";
	}

	
}
