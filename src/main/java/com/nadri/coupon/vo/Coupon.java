package com.nadri.coupon.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Coupon {

	private int no;
	private String name;
	private int quantity;
	private int discountRate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String category;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date issueDate;
	private String deleted;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date issueEndDate;
	
	public Coupon() {}
	
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

	public Date getIssueDate() {
		return issueDate;
	}
	
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	
	public String getDeleted() {
		return deleted;
	}
	
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	
	public Date getIssueEndDate() {
		return issueEndDate;
	}

	public void setIssueEndDate(Date issueEndDate) {
		this.issueEndDate = issueEndDate;
	}

	@Override
	public String toString() {
		return "Coupon [no=" + no + ", name=" + name + ", quantity=" + quantity + ", discountRate=" + discountRate
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", category=" + category + "]";
	}

	
}
