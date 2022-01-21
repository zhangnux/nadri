package com.nadri.lodging.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString	
public class LodCatagory {

	private LodInformation lodInformation ;			// 숙소vo 안에 카테고리번호
	private String categoryName;					// 숙소 카테고리 이름
}
