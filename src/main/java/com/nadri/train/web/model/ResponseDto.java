package com.nadri.train.web.model;

import java.util.List;

public class ResponseDto<T> {
	// 성공 여부 "OK" or "FAIL"
	private String status;
	// 에러 메세지
	private String error;
	// 응답으로 전달할 data
	private List<T> items;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public List<T> getItems() {
		return items;
	}

	public void setItems(List<T> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "ResponseDto [status=" + status + ", error=" + error + ", items=" + items + "]";
	}
}
