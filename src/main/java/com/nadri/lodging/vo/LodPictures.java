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
public class LodPictures {

	private LodInformation lodInformation;				// 숙소번호
	private String lodPicture;							// 숙소사진
}
