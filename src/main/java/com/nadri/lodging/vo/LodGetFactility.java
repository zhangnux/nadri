package com.nadri.lodging.vo;

import java.sql.Date;

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
public class LodGetFactility {

	private LodInformation lodInformation;			// 숙소번호
	private LodFactility lodFactility;				// 편의시설번호
}
