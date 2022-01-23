package com.nadri.air.dto;

import java.util.List;

import javax.annotation.Generated;

@Generated("jsonschema2pojo")
public class AirportDto {

	private Response response;

	public Response getResponse() {
		return response;
	}

	public void setResponse(Response response) {
		this.response = response;
	}

}

@Generated("jsonschema2pojo")
class Body {

	private Items items;
	private Integer numOfRows;
	private Integer pageNo;
	private Integer totalCount;

	public Items getItems() {
		return items;
	}

	public void setItems(Items items) {
		this.items = items;
	}

	public Integer getNumOfRows() {
		return numOfRows;
	}

	public void setNumOfRows(Integer numOfRows) {
		this.numOfRows = numOfRows;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

}

@Generated("jsonschema2pojo")
class Header {

	private String resultCode;
	private String resultMsg;

	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

}

@Generated("jsonschema2pojo")
class Item {

	private String airlineNm;
	private String arrAirportNm;
	private Long arrPlandTime;
	private String depAirportNm;
	private Long depPlandTime;
	private Integer economyCharge;
	private Integer prestigeCharge;
	private String vihicleId;

	public String getAirlineNm() {
		return airlineNm;
	}

	public void setAirlineNm(String airlineNm) {
		this.airlineNm = airlineNm;
	}

	public String getArrAirportNm() {
		return arrAirportNm;
	}

	public void setArrAirportNm(String arrAirportNm) {
		this.arrAirportNm = arrAirportNm;
	}

	public Long getArrPlandTime() {
		return arrPlandTime;
	}

	public void setArrPlandTime(Long arrPlandTime) {
		this.arrPlandTime = arrPlandTime;
	}

	public String getDepAirportNm() {
		return depAirportNm;
	}

	public void setDepAirportNm(String depAirportNm) {
		this.depAirportNm = depAirportNm;
	}

	public Long getDepPlandTime() {
		return depPlandTime;
	}

	public void setDepPlandTime(Long depPlandTime) {
		this.depPlandTime = depPlandTime;
	}

	public Integer getEconomyCharge() {
		return economyCharge;
	}

	public void setEconomyCharge(Integer economyCharge) {
		this.economyCharge = economyCharge;
	}

	public Integer getPrestigeCharge() {
		return prestigeCharge;
	}

	public void setPrestigeCharge(Integer prestigeCharge) {
		this.prestigeCharge = prestigeCharge;
	}

	public String getVihicleId() {
		return vihicleId;
	}

	public void setVihicleId(String vihicleId) {
		this.vihicleId = vihicleId;
	}

}

@Generated("jsonschema2pojo")
class Items {

	private List<Item> item = null;

	public List<Item> getItem() {
		return item;
	}

	public void setItem(List<Item> item) {
		this.item = item;
	}
}

@Generated("jsonschema2pojo")
class Response {

	private Header header;
	private Body body;

	public Header getHeader() {
		return header;
	}

	public void setHeader(Header header) {
		this.header = header;
	}

	public Body getBody() {
		return body;
	}

	public void setBody(Body body) {
		this.body = body;
	}

}