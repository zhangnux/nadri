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
public class LodRoom {

	private int roomNo;                   // 룸번호
	private int lodNo;                    // 숙소번호
	private String roomName;              // 룸이름
	private int roomPerPerson;            // 룸 기준인원
	private int roommaxPerson;            // 룸 최대인원
	private int roomPrice;                // 룸 가격
	private int roomDiscountPrice;        // 룸 할인가격
	private int roomCategoryNo;           // 룸카테고리번호
	private int roomFormNo;               // 룸 유형번호
}
